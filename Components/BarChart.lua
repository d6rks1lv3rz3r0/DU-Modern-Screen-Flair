local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100

local Bar = createLayer()

Data = {100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random(),100*math.random()}

for ii = 1,#Data,1 do
    Offset = (#Data*0.04 - 0.01)/2
    Margin = (0.5 - Offset)*rx
    Height = math.ceil(Data[ii]/10)
    for jj = 1,Height,1 do
        setNextFillColor(Bar,0.2,0.7,1,1)
        addQuad(Bar,
            Margin + (ii-1)*0.04*rx,
            0.77*ry - (jj-1)*0.05*ry,
            Margin + (ii-1)*0.04*rx,
            0.77*ry - (jj-1)*0.05*ry - 0.04*ry,
            Margin + (ii-1)*0.04*rx + 0.03*rx,
            0.77*ry - (jj-1)*0.05*ry - 0.04*ry,
            Margin + (ii-1)*0.04*rx + 0.03*rx,
            0.77*ry - (jj-1)*0.05*ry)
    end
    for jj = Height+1,11,1 do
        setNextFillColor(Bar,0.2,0.7,1,0.1)
        addQuad(Bar,
            Margin + (ii-1)*0.04*rx,
            0.77*ry - (jj-1)*0.05*ry,
            Margin + (ii-1)*0.04*rx,
            0.77*ry - (jj-1)*0.05*ry - 0.04*ry,
            Margin + (ii-1)*0.04*rx + 0.03*rx,
            0.77*ry - (jj-1)*0.05*ry - 0.04*ry,
            Margin + (ii-1)*0.04*rx + 0.03*rx,
            0.77*ry - (jj-1)*0.05*ry)
    end
end

requestAnimationFrame(10)
    
    





