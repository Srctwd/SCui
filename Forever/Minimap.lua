-- Minimap: border/zone/clock/zoom art hidden, compass and day/night ring tinted.

local _, ns = ...
local ScUI, C, get, color, hideArt = ns.ScUI, ns.C, ns.get, ns.color, ns.hideArt

function ns.SkinMinimap()
    hideArt(get("MinimapCluster.BorderTop"))
    hideArt(get("MinimapCluster.ZoneTextButton"))
    hideArt(get("GameTimeFrame"))
    hideArt(get("Minimap.ZoomIn"))
    hideArt(get("Minimap.ZoomOut"))
    color(get("MinimapCompassTexture"), C.darkColor)

    -- Forever's day/night ring around the minimap: tint its border texture.
    local diel = get("MinimapCluster.DielFrame")
    if diel and not ScUI.dielBorder then
        for _, region in ipairs({ diel:GetRegions() }) do
            local atlas = region.GetAtlas and region:GetAtlas()
            if atlas and atlas:lower() == "ui-hud-minimap-frame-cycle" then
                ScUI.dielBorder = region
                break
            end
        end
    end
    color(ScUI.dielBorder, C.darkColor)

    -- The clock sits inside BorderTop, which is faded out above; keep it visible.
    -- Blizzard_TimeManager is load-on-demand, so this also runs on ADDON_LOADED.
    local clock = get("TimeManagerClockButton")
    if clock and clock.SetIgnoreParentAlpha then clock:SetIgnoreParentAlpha(true) end
end

-- Buff frame: hide the collapse/expand toggle (Blizzard re-Shows it as auras change).
function ns.SkinBuffs()
    ns.forceHide(get("BuffFrame.CollapseAndExpandButton"))
end
