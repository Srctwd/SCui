-- Action bars: square, cropped icons; button and bar art hidden.

local _, ns = ...
local C, get, hideArt = ns.C, ns.get, ns.hideArt

local BAR_PREFIXES = {
    "ActionButton", "MultiBarBottomLeftButton", "MultiBarBottomRightButton",
    "MultiBarRightButton", "MultiBarLeftButton",
    "MultiBar5Button", "MultiBar6Button", "MultiBar7Button",
    "PetActionButton", "StanceButton",
}

local function SkinButton(b)
    if not b or b.ScUISkinned then return end
    local icon = b.icon or b.Icon
    if icon then
        if b.IconMask and icon.RemoveMaskTexture then
            icon:RemoveMaskTexture(b.IconMask)   -- square icons instead of rounded
        end
        local k = C.iconCrop
        icon:SetTexCoord(k, 1 - k, k, 1 - k)
    end
    hideArt(b.NormalTexture or (b.GetNormalTexture and b:GetNormalTexture()))
    hideArt(b.SlotArt)
    hideArt(b.SlotBackground)
    hideArt(b.FloatingBG)
    b.ScUISkinned = true
end

function ns.SkinActionBars()
    local bar = get("MainActionBar", "MainMenuBar")   -- renamed in 12.x
    if bar then
        hideArt(bar.BorderArt)
        if bar.EndCaps then
            hideArt(bar.EndCaps.LeftEndCap)
            hideArt(bar.EndCaps.RightEndCap)
        end
        hideArt(bar.ActionBarPageNumber)
    end
    for _, prefix in ipairs(BAR_PREFIXES) do
        for i = 1, 12 do
            SkinButton(_G[prefix .. i])
        end
    end
end
