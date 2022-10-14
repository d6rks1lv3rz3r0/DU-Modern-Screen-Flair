ItemName = "Uncommon Manuever Atmospheric Engine L"
Price = "50,000,000 ħ"
url = "resources_generated/elements/adjusters/adjuster_001_l/icons/env_adjuster_001_l_icon.png"

BackgroundR, BackgroundG, BackgroundB = 0.75, 0.2, 0.8
TextR, TextG, TextB = 1,1,1

--------------------------------------------------------------------------------------------------------------------------------------------------

local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100
local Aura0 = createLayer()
local Aura1 = createLayer()

setBackgroundColor(0.05*BackgroundR,0.05*BackgroundG,0.05*BackgroundB)

for ii = 3,165,8 do
    setNextStrokeColor(Aura0,BackgroundR, BackgroundG, BackgroundB,0.05)
    setNextStrokeWidth(Aura0,0.05*vh)
    addLine(Aura0,ii*vh,0,ii*vh,ry)
end

for ii = 6,98,8 do
    setNextStrokeColor(Aura0,BackgroundR, BackgroundG, BackgroundB,0.05)
    setNextStrokeWidth(Aura0,0.05*vh)
    addLine(Aura0,0,ii*vh,rx,ii*vh)
end

PX = {0,0.2,0.23,0.77,0.8,1}
PY = {0.03,0.03,0.07,0.07,0.03,0.03}
    
for ii = 1,#PX-1,1 do
    setNextStrokeColor(Aura1, BackgroundR, BackgroundG + 0.2, BackgroundB, 1 - ii*0.15) 
    addLine(Aura1, PX[ii]*rx, PY[ii]*ry, PX[ii+1]*rx, PY[ii+1]*ry) 
end

for ii = 1,#PX-1,1 do
    setNextStrokeColor(Aura1, BackgroundR, BackgroundG + 0.2, BackgroundB, 1 - ii*0.15) 
    addLine(Aura1, PX[ii]*rx, ry-PY[ii]*ry, PX[ii+1]*rx, ry-PY[ii+1]*ry) 
end

---------------------

local ShadowLayer = createLayer()
local layer = createLayer()

X = 75*vw
Y = 50*vh

SX = 60*vh
SY = 60*vh

BT = 1*vh

setDefaultFillColor(layer,Shape_Polygon,BackgroundR, BackgroundG + 0.2, BackgroundB,0.5)

addQuad(layer, X - SX/2, Y - SY/2 - BT, 
    X - SX/2 - BT, Y - SY/2 - BT,  
    X - SX/2 - BT, Y + SY/2, 
    X - SX/2,  Y + SY/2 )

addQuad(layer, X + SX/2, Y - SY/2, 
    X + SX/2 + BT, Y - SY/2,  
    X + SX/2 + BT, Y - 3*SY/8 + BT, 
    X + SX/2,  Y + BT )

addQuad(layer, X + SX/2, Y, 
    X + SX/2 + BT, Y + 3*SY/8,  
    X + SX/2 + BT, Y + SY/2 + BT, 
    X + SX/2,  Y + SY/2 + BT )

addQuad(layer, X - SX/8, Y + SY/2, 
    X + 3*SX/8 - BT, Y + SY/2 + BT,  
    X + SX/2, Y + SY/2 + BT,  
    X + SX/2, Y + SY/2 )

addQuad(layer, X - SX/2 - BT, Y + SY/2, 
    X - SX/2 - BT, Y + SY/2 + BT,  
    X + SX/8, Y + SY/2 + BT,  
    X - 3*SX/8, Y + SY/2 )

addQuad(layer, X, Y - SY/2, 
    X - 3*SX/8, Y - SY/2 - BT,  
    X + SX/2 + BT, Y - SY/2 - BT,  
    X + SX/2 + BT, Y - SY/2 )

addQuad(layer, X - SX/2, Y - SY/2, 
    X - SX/2, Y - SY/2 - BT,  
    X - 4*SX/8 + BT, Y - SY/2 - BT,  
    X - 2*SX/8 + BT, Y - SY/2 )

image = loadImage(url)
addImage(layer, image, X - SX/2, Y - SY/2, SX, SY)

setNextFillColor(ShadowLayer,0,0,0,0.25)
addBox(ShadowLayer, X - SX/2, Y - SY/2, SX, SY)


local function wrap(str, limit)
    local Lines, here, limit = {}, 1, limit or 72
    local Lim = (str:find("(%s+)()(%S+)()")) 
    if Lim == nil then Lim = string.len(str) else Lim = Lim -1 end
    Lines[1] = string.sub(str,1,Lim)  -- Put the first word of the string in the first index of the table.

    str:gsub("(%s+)()(%S+)()",
        function(sp, st, word, fi)  -- Function gets called once for every space found.
            if fi-here > limit then
                here = st
                Lines[#Lines+1] = word                                             -- If at the end of a line, start a new table index...
            else Lines[#Lines] = Lines[#Lines].." "..word end  -- ... otherwise add to the current table index.
        end)

    return Lines
end

WrappedText = wrap(ItemName,16)

local Font = loadFont(getAvailableFontName(5), 10*vh) 

X = 18*vw

if #WrappedText == 1 then
    
    Y = 23*vh
    
    setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
    setNextFillColor(layer, TextR, TextG, TextB , 1)
    addText(layer, Font, WrappedText[ii], X+1*vh+17*vh, Y + 1*vh + (ii-1)*10*vh)

elseif #WrappedText == 2 then
    
    Y = 23*vh
    for ii = 1,math.min(#WrappedText,2) do
        setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
        setNextFillColor(layer, TextR, TextG, TextB , 1)
        addText(layer, Font, WrappedText[ii], X+1*vh+17*vh, Y + 1*vh + (ii-1)*10*vh)
    end
elseif #WrappedText == 3 then
    Y = 23*vh
    
    for ii = 1,math.min(#WrappedText,3) do
        setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
        setNextFillColor(layer, TextR, TextG, TextB , 1)
        addText(layer, Font, WrappedText[ii], X+1*vh+17*vh, Y + 1*vh + (ii-1)*10*vh)
    end
elseif #WrappedText == 4 then
    
    Y = 23*vh
    
    for ii = 1,math.min(#WrappedText,4) do
        setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
        setNextFillColor(layer, TextR, TextG, TextB , 1)
        addText(layer, Font, WrappedText[ii], X+1*vh+17*vh, Y + 1*vh + (ii-1)*10*vh)
    end
end

Y = 75*vh

setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
setNextFillColor(layer, 232/255, 218/255, 150/255, 1)
setFontSize(Font,12*vh)
addText(layer, Font, Price, X+1*vh+17*vh, Y + 1*vh)





requestAnimationFrame(1)













