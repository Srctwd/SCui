-- Bags bar: hidden, fades in on hover.
-- Combined backpack window: dark border, like the minimap / cast bar.

local _, ns = ...

-- Tint every texture of the window's NineSlice border. Re-run on show:
-- the layout (and its pieces) can be (re)applied when the window opens.
local function DarkenBorder(frame)
    local slice = frame and frame.NineSlice
    if not slice then return end
    for _, region in ipairs({ slice:GetRegions() }) do
        if region:IsObjectType("Texture") then
            ns.lockColor(region, ns.C.darkColor)
        end
    end
end

function ns.SkinBags()
    ns.FadeOnHover(ns.get("BagsBar"))

    local combined = ns.get("ContainerFrameCombinedBags")
    if combined and not combined.scuiDark then
        combined.scuiDark = true
        DarkenBorder(combined)
        combined:HookScript("OnShow", DarkenBorder)
    end
end
