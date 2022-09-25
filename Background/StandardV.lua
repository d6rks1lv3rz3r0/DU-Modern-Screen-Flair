local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100
local Aura0 = createLayer()
local Aura1 = createLayer()

setBackgroundColor(0.05*0,0.05*0.2,0.05*0.8)

for ii = 3,165,8 do
    setNextStrokeColor(Aura0,0,0.2,0.8,0.05)
    setNextStrokeWidth(Aura0,0.05*vh)
    addLine(Aura0,ii*vh,0,ii*vh,ry)
end

for ii = 6,98,8 do
    setNextStrokeColor(Aura0,0,0.2,0.8,0.05)
    setNextStrokeWidth(Aura0,0.05*vh)
    addLine(Aura0,0,ii*vh,rx,ii*vh)
end

PX = {0,0.2,0.23,0.77,0.8,1}
PY = {0.03,0.03,0.07,0.07,0.03,0.03}
    
for ii = 1,#PX-1,1 do
    setNextStrokeColor(Aura1, 0,0.4,0.8, 1 - ii*0.15) 
    addLine(Aura1, PX[ii]*rx, PY[ii]*ry, PX[ii+1]*rx, PY[ii+1]*ry) 
end

for ii = 1,#PX-1,1 do
    setNextStrokeColor(Aura1, 0,0.4,0.8, 1 - ii*0.15) 
    addLine(Aura1, PX[ii]*rx, ry-PY[ii]*ry, PX[ii+1]*rx, ry-PY[ii+1]*ry) 
end

logMessage(getRenderCost())