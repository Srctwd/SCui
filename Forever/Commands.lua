-- Slash commands: /scui [debug], /clear.

local _, ns = ...
local ScUI = ns.ScUI

local TAG = "|cff6b6bd6ScUI|r: "

SLASH_SCUICLEAR1 = "/clear"
SlashCmdList["SCUICLEAR"] = function()
    local cf = SELECTED_CHAT_FRAME or DEFAULT_CHAT_FRAME
    if cf and cf.Clear then cf:Clear() end
end

SLASH_SCUI1 = "/scui"
SlashCmdList["SCUI"] = function(msg)
    ScUI.Apply()
    if msg == "debug" then
        local list = {}
        for path in pairs(ScUI.missing) do list[#list + 1] = path end
        table.sort(list)
        if #list == 0 then
            print(TAG .. "all frames found.")
        else
            print(TAG .. #list .. " frame(s) not found in this client:")
            for _, path in ipairs(list) do print("   " .. path) end
        end
    else
        print(TAG .. "re-applied. Type /scui debug to list missing frames.")
    end
end
