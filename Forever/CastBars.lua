-- Cast bars: dark border, spell icon hidden. Called by the unit frame files.

local _, ns = ...

function ns.SkinCastBar(bar)
    if not bar then return end
    ns.color(bar.Border, ns.C.darkColor)
    ns.hideArt(bar.Icon)
end
