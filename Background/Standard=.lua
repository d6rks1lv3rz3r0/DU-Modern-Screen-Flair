local function Background(Logo,Aura0,Aura1,r,g,b,ar,ag,ab)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100

    --- Main Color ---
    local r = r or 0
    local g = g or 0.2
    local b = b or 0.8
    
    --- Accent Color ---
    local ar = ar or 0
    local ag = ag or 0.4
    local ab = ab or 0.8

    setBackgroundColor(0.05*r,0.05*g,0.05*b)

    for ii = 3,165,8 do
        setNextStrokeColor(Aura0,r,g,b,0.05)
        setNextStrokeWidth(Aura0,0.05*vh)
        addLine(Aura0,ii*vh,0,ii*vh,ry)
    end

    for ii = 6,98,8 do
        setNextStrokeColor(Aura0,r,g,b,0.05)
        setNextStrokeWidth(Aura0,0.05*vh)
        addLine(Aura0,0,ii*vh,rx,ii*vh)
    end

    local PX = {0,1}
    local PY = {0.03,0.03}

    for ii = 1,#PX-1,1 do
        setNextStrokeColor(Aura1,ar,ag,ab, 1) 
        addLine(Aura1, PX[ii]*rx, PY[ii]*ry, PX[ii+1]*rx, PY[ii+1]*ry) 
    end

    for ii = 1,#PX-1,1 do
        setNextStrokeColor(Aura1,ar,ag,ab, 1) 
        addLine(Aura1, PX[ii]*rx, ry-PY[ii]*ry, PX[ii+1]*rx, ry-PY[ii+1]*ry) 
    end

end

local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100

local Logo = createLayer()
local Aura0 = createLayer()
local Aura1 = createLayer()

Background(Logo,Aura0,Aura1,r,g,b,ar,ag,ab)

logMessage(getRenderCost())