-- Color Presets --
local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100
R = {1,0.2,0.2,1,1,0,1,0.5}
G = {0.2,1,0.2,1,0,1,0.5,0.2}
B = {0.2,0.2,1,0,1,1,0.2,1}

---------------------------------------------------------    QUICK CUSTOMIZATION    ----------------------------------------------------------------

-- Label --
HubLabel = "Tier 1 Ore"
FontSize = 25*vh

-- Color Theme --
r, g, b = R[1], G[1], B[1]

----------------------------------------------------------------------------------------------------------------------------------------------------

local function Background(Logo,Aura0,Aura1,r,g,b,ar,ag,ab)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100

    --- Main Color ---
    local r = r or 0.4
    local g = g or 0.4
    local b = b or 0.4
    
    --- Accent Color ---
    local ar = ar or 0.8
    local ag = ag or 0.8
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
    local PY = {0.04,0.04}

    for ii = 1,#PX-1,1 do
        setNextStrokeWidth(Aura1,2*vh)
        setNextStrokeColor(Aura1,ar,ag,ab, 1) 
        addLine(Aura1, PX[ii]*rx, PY[ii]*ry, PX[ii+1]*rx, PY[ii+1]*ry) 
    end

end

function DrawHub(layer,backlayer,r,g,b,CX,CY,scale)

    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100

    local PX = {-0.1715,
        -0.1715,-0.1735,-0.1735,-0.1535,
        0,
        0.1535,0.1735,0.1735,0.1715,
        0.1715,
        0.1715,0.1735,0.1735,0.1535,
        0,
        -0.1535,-0.1735,-0.1735,-0.1715,
        -0.1715}
    local PY = {0,
        -0.055,-0.057,-0.08,-0.128,
        -0.128,
        -0.128,-0.08,-0.057,-0.055,
        0,
        0.055,0.057,0.08,0.128,
        0.128,
        0.128,0.08,0.057,0.055,
        0}

    local r = r or R[1]
    local g = g or G[1]
    local b = b or B[1]

    local CX = CX or 0.5*rx
    local CY = CY or 0.5*ry
    local scale = scale or 2

    setDefaultStrokeWidth(layer,Shape_Line,scale*0.5*vh)
    setDefaultStrokeColor(layer,Shape_Line,r,g,b, 1) 

    setDefaultFillColor(backlayer,Shape_Polygon,r + 1,g + 1,b + 1, 1) 

    for ii = 1,#PX-1,1 do
        addLine(layer, scale*PX[ii]*rx + CX, scale*PY[ii]*ry + CY, scale*PX[ii+1]*rx + CX, scale*PY[ii+1]*ry + CY) 
    end

    addTriangle(backlayer, 
        scale*PX[2]*rx + CX, scale*PY[2]*ry + CY, 
        scale*PX[#PX-1]*rx + CX, scale*PY[#PX-1]*ry + CY, 
        CX, CY)

    addTriangle(backlayer, 
        -scale*PX[2]*rx + CX, scale*PY[2]*ry + CY, 
        -scale*PX[#PX-1]*rx + CX, scale*PY[#PX-1]*ry + CY, 
        CX, CY)

    for ii = 1,#PX-1,1 do
        addTriangle(backlayer, 
            -scale*PX[ii]*rx + CX, scale*PY[ii]*ry + CY, 
            -scale*PX[ii+1]*rx + CX, scale*PY[ii+1]*ry + CY, 
            CX, CY)
    end

end

local Logo = createLayer()
local Aura0 = createLayer()
local Aura1 = createLayer()
local backlayer = createLayer()
local layer = createLayer()

local Font = loadFont(getAvailableFontName(5), FontSize)

Background(Logo,Aura0,Aura1,r + 0.4,g + 0.4,b + 0.4,r,g,b)

DrawHub(layer,backlayer,r,g,b,CX,0.71*ry,2)

setNextTextAlign(Aura1, AlignH_Center, AlignV_Middle)
setNextFillColor(Aura1,r,g,b,1)
addText(Aura1,Font,HubLabel,50*vw,25*vh)