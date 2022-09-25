local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100

local Line = createLayer()


Data = {50,50,100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),50,50}

for ii = 1,#Data,1 do
    
    Offset = (#Data*0.04 - 0.01)/2
    Margin = (0.5 - Offset)*rx

    setNextStrokeColor(Line,0.2,0.7,1,0.5)
    setNextStrokeWidth(Line,0.1*vh)
    addLine(Line,Margin+(ii-1)*0.04*rx,0.2*ry,Margin+(ii-1)*0.04*rx,0.8*ry)
    setNextFillColor(Line,0.2,0.7,1,0.5)
    addCircle(Line,Margin+(ii-1)*0.04*rx,0.2*ry,0.5*vh)
    setNextFillColor(Line,0.2,0.7,1,0.5)
    addCircle(Line,Margin+(ii-1)*0.04*rx,0.8*ry,0.5*vh)
    
end


for ii = 1,#Data-1,1 do
    
    Offset = (#Data*0.04 - 0.01)/2
    Margin = (0.5 - Offset)*rx
    
    setNextStrokeColor(Line,0.5,0.8,1,1)
    setNextStrokeWidth(Line,0.2*vh)
    addLine(Line,
        Margin+(ii-1)*0.04*rx, 
        0.8*ry - 0.6*ry*Data[ii]/100,
        Margin+(ii)*0.04*rx, 
        0.8*ry - 0.6*ry*Data[ii+1]/100)
        
       
end

requestAnimationFrame(5) 






