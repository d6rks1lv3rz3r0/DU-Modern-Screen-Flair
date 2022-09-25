-- Initialize --
local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100

local Hits = createLayer()
local Sweep = createLayer()
local Radar = createLayer()
local Radarfont = loadFont(getAvailableFontName(9), 4*vh)

for ii = 1,4 do
    setNextFillColor(Radar, 255/255, 255/255, 255/255, 0)
    setNextStrokeColor(Radar, 153/255, 202/255, 255/255, 1)
    setNextStrokeWidth(Radar, 0.1*vh)
    addCircle(Radar, rx/2, ry/2, 10*ii*vh)
end

setNextFillColor(Radar, 255/255, 255/255, 255/255, 0)
setNextStrokeColor(Radar, 0/255, 0/255, 0/255, 1)
setNextStrokeWidth(Radar, 1.5*vh)
addCircle(Radar, rx/2, ry/2, 40.25*vh)

setNextFillColor(Radar, 153/255, 202/255, 255/255, 1)
addCircle(Radar, rx/2, ry/2, 1.5*vh)


for ii = 0,330,30 do
    
    theta = 90 - ii

    setNextStrokeColor(Radar, 255/255, 255/255, 255/255, 0)
    setNextShadow(Radar, 0.25*vh, 153/255, 202/255, 255/255, 1)
    setNextStrokeWidth(Radar, 0.1*vh)
    addLine(Radar, rx/2, ry/2, rx/2 + 40*vh*math.cos(math.rad(theta)), ry/2 - 40*vh*math.sin(math.rad(theta)))

    setNextStrokeColor(Radar, 153/255, 202/255, 255/255, 1)
    setNextStrokeWidth(Radar, 0.1*vh)
    addLine(Radar, rx/2 + 42*vh*math.cos(math.rad(theta)), ry/2 - 42*vh*math.sin(math.rad(theta)), rx/2 + 45*vh*math.cos(math.rad(theta)), ry/2 - 45*vh*math.sin(math.rad(theta)))
    
    if ii == 0 or ii == 90 or ii == 180 or ii == 270 then
        for jj = 1,4,1 do
            setNextFillColor(Radar, 153/255, 202/255, 255/255, 1)
            addCircle(Radar, rx/2 + jj*10*vh*math.cos(math.rad(theta)), ry/2 - jj*10*vh*math.sin(math.rad(theta)), 0.75*vh)
        end
    end
      
    if ii == 0 or ii == 330 or ii == 30 then
        setNextTextAlign(Radar, AlignH_Center, AlignV_Bottom)
    end
    if ii == 210 or ii == 180 or ii == 150 then
        setNextTextAlign(Radar, AlignH_Center, AlignV_Top)
    end
    if ii == 60 or ii == 90 or ii == 120 then
        setNextTextAlign(Radar, AlignH_Left, AlignV_Middle)
    end
    if ii == 240 or ii == 270 or ii == 300 then
        setNextTextAlign(Radar, AlignH_Right, AlignV_Middle)
    end
    
    if ii == 0 then
        RadarAngleString = "000"
    elseif ii == 30 or ii == 60 or ii == 90 then
        RadarAngleString = "0" .. tostring(ii)
    else
        RadarAngleString = tostring(ii)
    end
    
    setNextFillColor(Radar, 153/255, 202/255, 255/255, 0.4)
    addText(Radar, Radarfont, RadarAngleString, rx/2 + 46*vh*math.cos(math.rad(theta)), ry/2 - 46*vh*math.sin(math.rad(theta)))
 
    
end

local t = getTime() 

SweepAngle = 90 - t*180

setNextStrokeColor(Radar, 153/255, 202/255, 255/255, 1)
setNextStrokeWidth(Radar, 0.3*vh)
addLine(Radar, rx/2, ry/2, rx/2 + 40*vh*math.cos(math.rad(SweepAngle)), ry/2 - 40*vh*math.sin(math.rad(SweepAngle)))

setNextStrokeColor(Sweep, 255/255, 255/255, 255/255, 0)
setNextFillColor(Sweep, 153/255, 202/255, 255/255, 0.25)
addTriangle(Sweep, rx/2, ry/2,rx/2 + 41.5*vh*math.cos(math.rad(SweepAngle)), ry/2 - 41.5*vh*math.sin(math.rad(SweepAngle)), rx/2 + 41.5*vh*math.cos(math.rad(SweepAngle + 20)), ry/2 - 41.5*vh*math.sin(math.rad(SweepAngle + 20)))

setNextStrokeColor(Sweep, 255/255, 255/255, 255/255, 0)
setNextFillColor(Sweep, 153/255, 202/255, 255/255, 0.2)
addTriangle(Sweep, rx/2, ry/2, rx/2 + 41.5*vh*math.cos(math.rad(SweepAngle + 20)), ry/2 - 41.5*vh*math.sin(math.rad(SweepAngle + 20)), rx/2 + 41.5*vh*math.cos(math.rad(SweepAngle + 40)), ry/2 - 41.5*vh*math.sin(math.rad(SweepAngle + 40)))

setNextStrokeColor(Sweep, 255/255, 255/255, 255/255, 0)
setNextFillColor(Sweep, 153/255, 202/255, 255/255, 0.15)
addTriangle(Sweep, rx/2, ry/2, rx/2 + 41.5*vh*math.cos(math.rad(SweepAngle + 40)), ry/2 - 41.5*vh*math.sin(math.rad(SweepAngle + 40)), rx/2 + 41.5*vh*math.cos(math.rad(SweepAngle + 60)), ry/2 - 41.5*vh*math.sin(math.rad(SweepAngle + 60)))

setNextStrokeColor(Sweep, 255/255, 255/255, 255/255, 0)
setNextFillColor(Sweep, 153/255, 202/255, 255/255, 0.10)
addTriangle(Sweep, rx/2, ry/2, rx/2 + 41.5*vh*math.cos(math.rad(SweepAngle + 60)), ry/2 - 41.5*vh*math.sin(math.rad(SweepAngle + 60)), rx/2 + 41.5*vh*math.cos(math.rad(SweepAngle + 80)), ry/2 - 41.5*vh*math.sin(math.rad(SweepAngle + 80)))




setNextStrokeWidth(Radar, 0.1*vh)
setNextStrokeColor(Sweep, 255/255, 0/255, 0/255, 0.25)
addBezier(Sweep, rx/2 - 20*vh, ry/2 - 15*vh, rx/2 - 24*vh, ry/2 - 10*vh, rx/2 - 30*vh, ry/2 - 10*vh)

setNextFillColor(Hits, 255/255, 0/255, 0/255, 0.1)
addCircle(Hits, rx/2 - 20*vh, ry/2 - 15*vh, 2*vh + 2*math.fmod(t,2)*vh)
setNextFillColor(Hits, 255/255, 0/255, 0/255, 0.1)
addCircle(Hits, rx/2 - 20*vh, ry/2 - 15*vh, 1*vh + 1*math.fmod(t,2)*vh)
setNextFillColor(Hits, 255/255, 0/255, 0/255, 0.5)
addCircle(Hits, rx/2 - 20*vh, ry/2 - 15*vh, 1*vh)



setNextStrokeWidth(Radar, 0.1*vh)
setNextStrokeColor(Sweep, 0/255, 255/255, 0/255, 0.25)
addBezier(Sweep, rx/2 + 5*vh, ry/2 + 5*vh, rx/2 + 15*vh, ry/2 + 15*vh, rx/2 + 30*vh, ry/2 + 10*vh)

setNextFillColor(Hits, 0/255, 255/255, 0/255, 0.1)
addCircle(Hits, rx/2 + 5*vh, ry/2 + 5*vh, 1*vh + 1*math.fmod(t,2)*vh)
setNextFillColor(Hits, 0/255, 255/255, 0/255, 0.1)
addCircle(Hits, rx/2 + 5*vh, ry/2 + 5*vh, 0.5*vh + 0.5*math.fmod(t,2)*vh)
setNextFillColor(Hits, 0/255, 255/255, 0/255, 0.5)
addCircle(Hits, rx/2 + 5*vh, ry/2 + 5*vh, 0.5*vh)




requestAnimationFrame(1)

--logMessage(string.format("%f",getRenderCost()/getRenderCostMax()))



