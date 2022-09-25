local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100

local Pie = createLayer()

x1 = 0.5
x2 = 0.6
y1 = 25
y2 = 30

Data = 100 * math.random()

for ii = 0,360*Data/100,7.2 do
    
    theta = 180 + ii
    
    setNextFillColor(Pie,0.2,0.7,1,1)
    addQuad(Pie,
        50*vw - (-x2*vw*math.cos(math.rad(theta))+y2*vh*math.sin(math.rad(theta))),
        50*vh - (-x2*vw*math.sin(math.rad(theta))-y2*vh*math.cos(math.rad(theta))),
        50*vw - (x2*vw*math.cos(math.rad(theta))+y2*vh*math.sin(math.rad(theta))),
        50*vh - (x2*vw*math.sin(math.rad(theta))-y2*vh*math.cos(math.rad(theta))),
        50*vw - (x1*vw*math.cos(math.rad(theta))+y1*vh*math.sin(math.rad(theta))),
        50*vh - (x1*vw*math.sin(math.rad(theta))-y1*vh*math.cos(math.rad(theta))),
        50*vw - (-x1*vw*math.cos(math.rad(theta))+y1*vh*math.sin(math.rad(theta))),
        50*vh - (-x1*vw*math.sin(math.rad(theta))-y1*vh*math.cos(math.rad(theta)))
    )
      
    
end

for ii = math.floor(360*Data/(7.2*100))*7.2,359,7.2 do
    
    theta = 180 + ii
    
    setNextFillColor(Pie,0.2,0.7,1,0.1)
    addQuad(Pie,
        50*vw - (-x2*vw*math.cos(math.rad(theta))+y2*vh*math.sin(math.rad(theta))),
        50*vh - (-x2*vw*math.sin(math.rad(theta))-y2*vh*math.cos(math.rad(theta))),
        50*vw - (x2*vw*math.cos(math.rad(theta))+y2*vh*math.sin(math.rad(theta))),
        50*vh - (x2*vw*math.sin(math.rad(theta))-y2*vh*math.cos(math.rad(theta))),
        50*vw - (x1*vw*math.cos(math.rad(theta))+y1*vh*math.sin(math.rad(theta))),
        50*vh - (x1*vw*math.sin(math.rad(theta))-y1*vh*math.cos(math.rad(theta))),
        50*vw - (-x1*vw*math.cos(math.rad(theta))+y1*vh*math.sin(math.rad(theta))),
        50*vh - (-x1*vw*math.sin(math.rad(theta))-y1*vh*math.cos(math.rad(theta)))
    )
      
    
end

setNextFillColor(Pie,0,0,0,0)
setNextStrokeColor(Pie,0.2,0.7,1,1)
setNextStrokeWidth(Pie,0.5*vh)
addCircle(Pie,50*vw,50*vh,23*vh)

setNextFillColor(Pie,0,0,0,0)
setNextStrokeColor(Pie,0.2,0.7,1,1)
setNextStrokeWidth(Pie,0.5*vh)
addCircle(Pie,50*vw,50*vh,31.5*vh)

requestAnimationFrame(10)