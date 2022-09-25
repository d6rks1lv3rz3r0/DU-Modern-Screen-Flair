local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100
local layer = createLayer()

Data = 100*math.random()
X = 50*vw
Y = 50*vh
SX = 4*vw
SY = 40*vh
n = 10
r = 0.2
g = 0.7
b = 1
BarType = math.ceil(math.random(6))
Flair = math.ceil(math.random(3))

function VerticalGauge(Data,X,Y,SX,SY,n,r,g,b,BarType,Flair)

    Height = math.ceil(Data/(100/n))

    if BarType == 1 then

        for jj = 1,Height,1 do
            setNextFillColor(layer,r,g,b,0.2+(jj^3)*(0.8/(Height^3)))
            addQuad(layer,
                X - SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.2,
                X - SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.8,
                X + SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.8,
                X + SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.2)
        end

    elseif BarType == 2 then

        setNextFillColor(layer,r,g,b,1)
        addQuad(layer,
            X - SX/2,
            Y+SY/2,
            X - SX/2,
            Y+SY/2 - SY*Data/100,
            X + SX/2,
            Y+SY/2 - SY*Data/100,
            X + SX/2,
            Y+SY/2)    

    elseif BarType == 3 then

        setNextFillColor(layer,r,g,b,1)
        addQuad(layer,
            X - SX/2 - vh,
            Y+SY/2 - SY*Data/100 + vh,
            X - SX/2 - vh,
            Y+SY/2 - SY*Data/100 - vh,
            X + SX/2 + vh,
            Y+SY/2 - SY*Data/100 - vh,
            X + SX/2 + vh,
            Y+SY/2 - SY*Data/100 + vh) 

    elseif BarType == 4 then

        setNextFillColor(layer,r,g,b,1)
        addQuad(layer,
            X - SX/2 - vh,
            Y+SY/2 - SY*Data/100 + vh,
            X - SX/2 - vh,
            Y+SY/2 - SY*Data/100 - vh,
            X + SX/2 + vh,
            Y+SY/2 - SY*Data/100 + vh,
            X + SX/2 + vh,
            Y+SY/2 - SY*Data/100 - vh)  

    elseif BarType == 5 then

        for jj = 1,Height,1 do
            setNextFillColor(layer,r,g,b,0.2+(jj^3)*(0.8/(Height^3)))
            addQuad(layer,
                X - SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.1,
                X - SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.6,
                X + SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*1.1,
                X + SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.6)
        end
        
    elseif BarType == 6 then
        
        for jj = 1,Height,1 do
            setNextFillColor(layer,r,g,b,0.2+(jj^3)*(0.8/(Height^3)))
            addQuad(layer,
                X - SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.1,
                X - SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.6,
                X - 1,
                Y+SY/2 - (jj-1)*SY/n - SY/n*1.1,
                X - 1,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.6)
            setNextFillColor(layer,r,g,b,0.2+(jj^3)*(0.8/(Height^3)))
            addQuad(layer,
                X,
                Y+SY/2 - (jj-1)*SY/n - SY/n*1.1,
                X,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.6,
                X + SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.1,
                X + SX/2,
                Y+SY/2 - (jj-1)*SY/n - SY/n*0.6)

        end

    end

    


    -- Flair --

    if Flair == 1 then

        setNextStrokeColor(layer,r,g,b,1)
        setNextStrokeWidth(layer,0.5*vh)
        setNextFillColor(layer,0,0,0,0)
        addBoxRounded(layer, X - SX/2 - vh, Y - SY/2 - vh, SX + 2*vh, SY + 2*vh, 1*vh)

    elseif Flair == 2 then

        setNextStrokeColor(layer,r,g,b,1)
        setNextStrokeWidth(layer,0.5*vh)
        addLine(layer, X - SX/2 - vh, Y - SY/2 - vh, X - SX/2 - vh, Y - SY/2 - vh + SY*0.3 )

        setNextStrokeColor(layer,r,g,b,1)
        setNextStrokeWidth(layer,0.5*vh)
        addLine(layer, X - SX/2 - vh, Y - SY/2 - vh, X - SX/2 - vh + SX*0.4, Y - SY/2 - vh )

        setNextFillColor(layer,r,g,b,1)
        addCircle(layer,X - SX/2 - vh, Y - SY/2 - vh, 1*vh)

        setNextStrokeColor(layer,r,g,b,0.5)
        setNextStrokeWidth(layer,0.25*vh)
        addLine(layer, X + SX/2 + vh, Y + SY/2 + vh, X + SX/2 + vh, Y + SY/2 + vh - SY*0.2 )

        setNextStrokeColor(layer,r,g,b,0.5)
        setNextStrokeWidth(layer,0.25*vh)
        addLine(layer, X + SX/2 + vh, Y + SY/2 + vh, X + SX/2 + vh - SX*0.4, Y + SY/2 + vh )

        setNextFillColor(layer,r,g,b,1)
        addCircle(layer,X + SX/2 + vh, Y + SY/2 + vh, 0.5*vh)

    elseif Flair == 3 then  

        setNextFillColor(layer,r,g,b,0.1)
        addBox(layer, X - SX/2, Y - SY/2, SX, SY, 1*vh)

    end
end

VerticalGauge(Data,X,Y,SX,SY,n,r,g,b,BarType,Flair)

logMessage(getRenderCost())

requestAnimationFrame(30) 




