local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100
local Web = createLayer()

local numNodes = 36
local numEdges = 50

local X = {}
local Y = {}
for i = 1, numNodes, 1 do
    X[i] = math.random()*1.4-0.2
    Y[i] = math.random()*1.4-0.2
end

for i = 1, numNodes, 1 do
    setNextFillColor(Web, math.random(), math.random(), math.random(), 0.5)
    addCircle(Web, X[i]*rx, Y[i]*ry, 2*math.random()*vh + 0.5*vh)
end

local case = math.random()

if case > 0.5 then

    for i = 1, numNodes, 1 do

        for j = 1, 3 + math.ceil(math.random()*3), 1 do
            C = math.ceil(math.random()*numNodes)

            setNextStrokeColor(Web, math.random(), math.random(), math.random(), 0.5)
            setNextStrokeWidth(Web, 2*math.random()*vh)
            addLine(Web, X[i]*rx, Y[i]*ry, X[C]*rx, Y[C]*ry)
        end

    end    
    
else
    
    for i = 1, numEdges, 1 do
        C1 = math.ceil(math.random()*(numNodes -1)+1)
        C2 = math.ceil(math.random()*(numNodes -1)+1)

        setNextStrokeColor(Web, math.random(), math.random(), math.random(), 0.5)
        setNextStrokeWidth(Web, 2*math.random()*vh)
        addLine(Web, X[C1]*rx, Y[C1]*ry, X[C2]*rx, Y[C2]*ry)
    end
    
end


    
requestAnimationFrame(60)