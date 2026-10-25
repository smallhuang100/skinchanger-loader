# Rivals · Skin Changer V3

RIVALS 用的客戶端換膚腳本。全部都是客戶端假資料，伺服器看不到、不會存檔。

**需要金鑰才能使用。**

## 安裝（開遊戲自動注入）

1. 下載 [`autoexec.lua`](https://raw.githubusercontent.com/smallhuang100/skinchanger-loader/main/autoexec.lua)
2. 放進執行器的 `autoexec` 資料夾
3. 打開 RIVALS，第一次會跳出金鑰輸入框，輸入你的金鑰按 **Verify**
4. 驗證通過後等大約 15 秒，選單就會自己出現

金鑰會記在 `workspace/SKCV3/key.txt`，之後開遊戲會自動驗證，不用再輸入。
金鑰第一次使用時會綁定你的裝置，換電腦請聯絡作者解除綁定。

## 手動執行

已經在遊戲裡的話，執行器貼這一行：

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/smallhuang100/skinchanger-loader/main/autoexec.lua"))()
```

## 金鑰錯誤訊息

| 訊息 | 意思 |
|---|---|
| Invalid key | 金鑰打錯了 |
| This key is already used on another device | 金鑰已綁定別台裝置 |
| This key has expired | 金鑰時間到了 |
| This key has not been activated yet | 金鑰還沒開通時數 |
| This device is banned | 裝置被封鎖 |

## 疑難排解

按 **F9** 看 Output 裡 `[SKC V3 Loader]` 開頭的訊息。
