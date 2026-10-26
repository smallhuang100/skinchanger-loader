local WORKER_URL = "https://skinchanger-hwid.smallvmware.workers.dev"
local KEY_FILE   = "SKCV3/key.txt"
local GAME_ID    = 6035872082

local has_fs = type(isfile) == "function" and type(readfile) == "function"
    and type(writefile) == "function"

local http_request = (syn and syn.request) or request or http_request
    or (http and http.request) or (fluxus and fluxus.request)

local function log(msg) print("[SKC V3] " .. msg) end

local function ensure_folder()
    pcall(function()
        if type(isfolder) == "function" and type(makefolder) == "function"
            and not isfolder("SKCV3") then
            makefolder("SKCV3")
        end
    end)
end

local function get_hwid()
    local ok, id = pcall(function()
        if type(gethwid) == "function" then return gethwid() end
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    return ok and id and tostring(id) or nil
end

local function post(path, payload)
    if not http_request then return nil, "no request() API" end

    local ok, res = pcall(http_request, {
        Url     = WORKER_URL .. path,
        Method  = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body    = game:GetService("HttpService"):JSONEncode(payload),
    })
    if not ok then return nil, "pcall: " .. tostring(res) end
    if type(res) ~= "table" then return nil, "non-table response: " .. type(res) end

    local status = res.StatusCode or res.Status or res.status_code or res.status
    local body   = res.Body or res.body or res.data
    if not status then return nil, "no status field (keys: " .. table.concat(
        (function() local t={} for k in pairs(res) do t[#t+1]=tostring(k) end return t end)(), ",") .. ")" end

    return status, body
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
    if not status then
        log("redeem HTTP fail: " .. tostring(body))
        return false, "network"
    end
    local data = decode(body)
    if not data then
        log("redeem decode fail, status=" .. tostring(status) .. " body=" .. tostring(body):sub(1, 200))
        return false, "network"
    end
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
    pcall(function() ensure_folder(); writefile(KEY_FILE, key) end)
end

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
        status.Text = "Verifying..."

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

task.spawn(function()
    if game.GameId ~= GAME_ID then
        return warn("[SKC V3] Wrong game. Only works in RIVALS.")
    end

    if not game:IsLoaded() then game.Loaded:Wait() end
    local lp = game:GetService("Players").LocalPlayer
    if not lp then
        repeat task.wait() until game:GetService("Players").LocalPlayer
        lp = game:GetService("Players").LocalPlayer
    end

    if not http_request then
        return warn("[SKC V3] This executor has no request() API.")
    end

    local hwid = get_hwid()
    if not hwid then
        return warn("[SKC V3] Could not get hwid.")
    end

    log("http_request type: " .. type(http_request))
    log("hwid: " .. hwid:sub(1, 20) .. "...")

    local key = read_saved_key()
    local message
    if key then
        log("trying saved key...")
        local ok, reason = redeem(key, hwid)
        if not ok then
            message = REASON_TEXT[reason] or tostring(reason)
            log("saved key invalid: " .. tostring(reason))
            key = nil
        end
    end
    if not key then
        key = prompt_key(hwid, message)
        save_key(key)
    end
    log("OK key verified")

    log("fetching body...")
    local status, body = post("/script", { key = key, hwid = hwid })
    if status ~= 200 or type(body) ~= "string" or #body == 0 then
        local data = type(body) == "string" and decode(body)
        return warn("[SKC V3] Body unavailable: status=" .. tostring(status)
            .. " reason=" .. tostring(data and data.reason or body))
    end

    local chunk, err = loadstring(body, "@SkinChanger.luau")
    if not chunk then return warn("[SKC V3] Compile failed: " .. tostring(err)) end

    log("running body...")
    local ok, err2 = pcall(chunk)
    if not ok then warn("[SKC V3] Run failed: " .. tostring(err2)) end
end)
