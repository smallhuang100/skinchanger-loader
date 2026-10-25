--[[
===============================================================================
  SKC V3 · AutoExecute 載入器（金鑰 + 秒注入）
===============================================================================

  安裝：把「這個檔案」放進執行器的 autoexec 資料夾就好。

  流程：
    1. 金鑰驗證 —— 第一次會跳出輸入框，驗證通過後記在 workspace/SKCV3/key.txt，
       之後開遊戲自動驗證，不用再輸入。金鑰失效時會再跳出輸入框。
    2. 秒注入 —— 等遊戲真的準備好才往下走。AutoExecute 執行的時間點太早，
       那時候跑大量程式碼、掛 hook 會把客戶端凍住，所以這裡只做輕量輪詢，
       每次之間都 task.wait 讓出執行緒。
    3. 本體 —— 向伺服器出示金鑰換取本體，本體不公開，沒有金鑰拿不到。
===============================================================================
]]

local WORKER_URL      = "https://skinchanger-hwid.smallvmware.workers.dev"
local DATA_FOLDER     = "SKCV3"
local KEY_FILE        = "SKCV3/key.txt"
local GAME_ID         = 6035872082  -- RIVALS
local READY_TIMEOUT   = 120
local POST_READY_WAIT = 10

-- 冷開機（剛打開 Roblox）跟傳送（打完一場回大廳）需要的緩衝差很多。
-- 用檔案時間戳記分辨，不用 getgenv（部分執行器的 getgenv 身分不穩定）。
local WARM_SETTLE         = 3
local COLD_SETTLE         = 12
local WARM_WINDOW_SECONDS = 90
local BOOT_STAMP_FILE     = "SKCV3/boot_stamp.txt"

local has_fs = type(isfile) == "function" and type(readfile) == "function"
    and type(writefile) == "function"

local http_request = request or http_request or (syn and syn.request)

local function log(msg) print("[SKC V3 Loader] " .. msg) end

local function ensure_folder()
    pcall(function()
        if type(isfolder) == "function" and type(makefolder) == "function"
            and not isfolder(DATA_FOLDER) then
            makefolder(DATA_FOLDER)
        end
    end)
end

local settle = COLD_SETTLE
if has_fs then
    pcall(function()
        ensure_folder()
        local now = os.time()
        if isfile(BOOT_STAMP_FILE) then
            local last = tonumber(readfile(BOOT_STAMP_FILE))
            if last and now >= last and (now - last) < WARM_WINDOW_SECONDS then
                settle = WARM_SETTLE
            end
        end
        writefile(BOOT_STAMP_FILE, tostring(now))
    end)
end

--=============================================================================
-- 伺服器溝通
--=============================================================================

local function get_hwid()
    local ok, id = pcall(function()
        if type(gethwid) == "function" then return gethwid() end
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    return ok and id and tostring(id) or nil
end

local function post(path, payload)
    local ok, res = pcall(http_request, {
        Url = WORKER_URL .. path,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = game:GetService("HttpService"):JSONEncode(payload),
    })
    if not ok or type(res) ~= "table" then return nil, nil end
    return res.StatusCode, res.Body
end

local function decode(body)
    local ok, data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(body)
    end)
    return ok and type(data) == "table" and data or nil
end

local REASON_TEXT = {
    not_found     = "Invalid key.",
    hwid_mismatch = "This key is already used on another device.",
    expired       = "This key has expired.",
    no_time       = "This key has not been activated yet.",
    banned        = "This device is banned.",
    network       = "Could not reach the server. Try again.",
}

local function redeem(key, hwid)
    local status, body = post("/key/redeem", { key = key, hwid = hwid })
    local data = status and decode(body)
    if not data then return false, "network" end
    if data.ok then return true end
    if data.reason == "expired" and data.expiresAt == nil then return false, "no_time" end
    return false, data.reason or "not_found"
end

local function read_saved_key()
    if not has_fs then return nil end
    local ok, key = pcall(function()
        return isfile(KEY_FILE) and readfile(KEY_FILE) or nil
    end)
    if ok and type(key) == "string" then
        key = key:gsub("%s", "")
        if #key > 0 then return key end
    end
    return nil
end

local function save_key(key)
    if not has_fs then return end
    pcall(function()
        ensure_folder()
        writefile(KEY_FILE, key)
    end)
end

--=============================================================================
-- 金鑰輸入框
--=============================================================================

local function prompt_key(hwid, message)
    local gui = Instance.new("ScreenGui")
    gui.Name = "SKCKey"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.DisplayOrder = 1000
    local parented = pcall(function()
        gui.Parent = (type(gethui) == "function" and gethui()) or game:GetService("CoreGui")
    end)
    if not parented then
        gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end

    local frame = Instance.new("Frame")
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.fromScale(0.5, 0.5)
    frame.Size = UDim2.fromOffset(340, 180)
    frame.BackgroundColor3 = Color3.fromRGB(23, 26, 35)
    frame.BorderSizePixel = 0
    frame.Parent = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(42, 46, 58)

    local function label(text, y, size, color)
        local l = Instance.new("TextLabel")
        l.BackgroundTransparency = 1
        l.Position = UDim2.fromOffset(20, y)
        l.Size = UDim2.new(1, -40, 0, size + 4)
        l.Font = Enum.Font.GothamMedium
        l.TextSize = size
        l.TextColor3 = color
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.TextWrapped = true
        l.Text = text
        l.Parent = frame
        return l
    end

    label("Skin Changer V3", 16, 18, Color3.fromRGB(230, 232, 238))
    local status = label(message or "Enter your key to continue.", 42, 13, Color3.fromRGB(139, 144, 160))

    local box = Instance.new("TextBox")
    box.Position = UDim2.fromOffset(20, 78)
    box.Size = UDim2.new(1, -40, 0, 34)
    box.BackgroundColor3 = Color3.fromRGB(16, 18, 26)
    box.BorderSizePixel = 0
    box.Font = Enum.Font.Code
    box.TextSize = 14
    box.TextColor3 = Color3.fromRGB(230, 232, 238)
    box.PlaceholderText = "SKC-XXXXX-XXXXX-XXXXX-XXXXX"
    box.PlaceholderColor3 = Color3.fromRGB(90, 95, 110)
    box.Text = ""
    box.ClearTextOnFocus = false
    box.Parent = frame
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)

    local button = Instance.new("TextButton")
    button.Position = UDim2.fromOffset(20, 124)
    button.Size = UDim2.new(1, -40, 0, 36)
    button.BackgroundColor3 = Color3.fromRGB(124, 140, 255)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(15, 17, 23)
    button.Text = "Verify"
    button.AutoButtonColor = true
    button.Parent = frame
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

    local result
    local busy = false

    local function submit()
        if busy then return end
        local key = box.Text:gsub("%s", "")
        if #key == 0 then return end

        busy = true
        button.Text = "Checking..."
        status.TextColor3 = Color3.fromRGB(139, 144, 160)
        status.Text = "Verifying key..."

        local ok, reason = redeem(key, hwid)
        if ok then
            result = key
            return
        end

        busy = false
        button.Text = "Verify"
        status.TextColor3 = Color3.fromRGB(255, 107, 107)
        status.Text = REASON_TEXT[reason] or ("Rejected: " .. tostring(reason))
    end

    button.MouseButton1Click:Connect(submit)
    box.FocusLost:Connect(function(enter) if enter then submit() end end)

    while not result do task.wait(0.1) end
    gui:Destroy()
    return result
end

--=============================================================================
-- 遊戲就緒判斷
--=============================================================================

local function ready()
    local ok, result = pcall(function()
        if not game:IsLoaded() then return false end
        local lp = game:GetService("Players").LocalPlayer
        if not lp or not lp.Character then return false end
        if time() < settle then return false end
        return true
    end)
    return ok and result == true
end

--=============================================================================
-- 主流程
--=============================================================================

local LOADER_T0 = os.clock()
local function elapsed() return ("+%.2fs"):format(os.clock() - LOADER_T0) end

task.spawn(function()
    -- 0. autoexec 每個遊戲都會跑，先確認是 RIVALS 再做任何事
    local function loaded()
        local ok, r = pcall(function()
            return game:IsLoaded() and game:GetService("Players").LocalPlayer ~= nil
        end)
        return ok and r
    end

    local deadline = os.clock() + READY_TIMEOUT
    while not loaded() do
        if os.clock() > deadline then return end
        task.wait(0.5)
    end
    if game.GameId ~= GAME_ID then return end

    if not http_request then
        return warn("[SKC V3 Loader] 這個執行器不支援 request()，沒辦法驗證金鑰。")
    end

    local hwid = get_hwid()
    if not hwid then
        return warn("[SKC V3 Loader] 拿不到裝置識別碼，沒辦法驗證金鑰。")
    end

    -- 1. 金鑰驗證
    log("> 金鑰驗證（" .. elapsed() .. "）")
    local key = read_saved_key()
    local message
    if key then
        local ok, reason = redeem(key, hwid)
        if not ok then
            message = REASON_TEXT[reason] or tostring(reason)
            log("已存的金鑰無效：" .. tostring(reason))
            key = nil
        end
    end
    if not key then
        key = prompt_key(hwid, message)
        save_key(key)
    end
    log("OK 金鑰驗證通過（" .. elapsed() .. "）")

    -- 2. 秒注入：等遊戲真的準備好
    local ticks = 0
    deadline = os.clock() + READY_TIMEOUT
    while not ready() do
        if os.clock() > deadline then
            return warn(("[SKC V3 Loader] 等待遊戲就緒逾時（%ds），放棄自動載入。"):format(READY_TIMEOUT))
        end
        ticks += 1
        task.wait(0.5)
    end
    log(("OK 遊戲就緒（%s，輪詢 %d 次，settle=%ds）"):format(elapsed(), ticks, settle))

    if POST_READY_WAIT > 0 then
        log(("> 就緒後再等 %ds..."):format(POST_READY_WAIT))
        local wait_until = os.clock() + POST_READY_WAIT
        while os.clock() < wait_until do task.wait(0.5) end
    end

    -- 3. 用金鑰換本體
    log("> 下載本體（" .. elapsed() .. "）")
    local status, body = post("/script", { key = key, hwid = hwid })
    if status ~= 200 or type(body) ~= "string" or #body == 0 then
        local data = body and decode(body)
        return warn("[SKC V3 Loader] 拿不到本體：" .. tostring(data and data.reason or status))
    end

    local chunk, compile_err = loadstring(body, "@SkinChanger.luau")
    if not chunk then
        return warn("[SKC V3 Loader] 本體編譯失敗：" .. tostring(compile_err))
    end

    log("> 開始執行本體（" .. elapsed() .. "）")
    local ok_run, run_err = pcall(chunk)
    if not ok_run then
        warn("[SKC V3 Loader] 本體執行失敗：" .. tostring(run_err))
    end
end)
