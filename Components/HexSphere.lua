function HexagonBackground(HoneycombLayer,OutlineLayer,r,g,b,a,str,stg,stb,sta,strokewidth,EdgeLength)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100
    
    local r = r or 25/255
    local g = g or 255/255
    local b = b or 5/255
    local a = a or 1

    local str = str or 0/255
    local stg = stg or 0/255
    local stb = stb or 0/255
    local sta = sta or 1
    local strokewidth = strokewidth or 0.5*vh

    local EdgeLength = EdgeLength or 6;

    function addHexagon(HoneycombLayer,OutlineLayer,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,r,g,b,a,str,stg,stb,sta,strokewidth,EdgeLength)

        setDefaultFillColor(HoneycombLayer,Shape_Polygon,r,g,b,a)
        setDefaultStrokeColor(HoneycombLayer,Shape_Polygon,r,g,b,0)
        setDefaultStrokeWidth(HoneycombLayer,Shape_Polygon,0.1)         
        
        addQuad(HoneycombLayer,x6 - 0.55,y6,x1,y1,x2,y2,x3 - 0.55,y3)
        addQuad(HoneycombLayer,x3 + 0.55,y3,x4,y4,x5,y5,x6 + 0.55,y6)
        
        setDefaultStrokeColor(OutlineLayer,Shape_Line,str,stg,stb,sta)
        setDefaultStrokeWidth(OutlineLayer,Shape_Line,strokewidth)
        
        addLine(OutlineLayer,x1,y1,x2,y2)
        addLine(OutlineLayer,x2,y2,x3,y3)
        addLine(OutlineLayer,x3,y3,x4,y4)

    end
    
    function HemisphericalProjection(x,y,r)
        
        a0 = math.sqrt(x*x+y*y)/r
        z = r*math.cos(a0)
        
        if z >= 0 then
            a0 = r*math.sin(a0)/math.sqrt(x*x+y*y)
        else   
            z = 0
            a0 = r/math.sqrt(x*x+y*y);
        end
        
        x = x*a0
        y = y*a0
        
        return x ,y, z

    end
    
    local t = math.fmod (30*(getTime()), 2*(3*EdgeLength*vh)) --TimeMultiplier*getTime() 

    for ii = -15,170,EdgeLength*3 do
        for jj = -15,115,EdgeLength*math.sqrt(3) do
            grayvar = 1
            
            X1 = t + (ii - EdgeLength/2)*vh
            Y1 = (jj - EdgeLength*math.sqrt(3)/2)*vh
            X2 = t + (ii - EdgeLength)*vh
            Y2 = (jj - 0)*vh
            X3 = t + (ii - EdgeLength/2)*vh
            Y3 = (jj + EdgeLength*math.sqrt(3)/2)*vh
            X4 = t + (ii + EdgeLength/2)*vh
            Y4 = (jj + EdgeLength*math.sqrt(3)/2)*vh
            X5 = t + (ii + EdgeLength)*vh
            Y5 = (jj - 0)*vh
            X6 = t + (ii + EdgeLength/2)*vh
            Y6 = (jj - EdgeLength*math.sqrt(3)/2)*vh
            
            CX = rx/2
            CY = ry/2
            r0 = 40*vh
            
            X1,Y1 = HemisphericalProjection(X1-CX,Y1-CY,r0)
            X2,Y2 = HemisphericalProjection(X2-CX,Y2-CY,r0)
            X3,Y3 = HemisphericalProjection(X3-CX,Y3-CY,r0)
            X4,Y4 = HemisphericalProjection(X4-CX,Y4-CY,r0)
            X5,Y5 = HemisphericalProjection(X5-CX,Y5-CY,r0)
            X6,Y6 = HemisphericalProjection(X6-CX,Y6-CY,r0)
            
            CX1,CY1,Z = HemisphericalProjection((X2+X5)/2,(Y2+Y5)/2,r0)
            
            X1 = X1 + CX
            Y1 = Y1 + CY
            X2 = X2 + CX
            Y2 = Y2 + CY
            X3 = X3 + CX
            Y3 = Y3 + CY
            X4 = X4 + CX
            Y4 = Y4 + CY
            X5 = X5 + CX
            Y5 = Y5 + CY
            X6 = X6 + CX
            Y6 = Y6 + CY
         
            Z = Z/r0
                                
            addHexagon(HoneycombLayer,OutlineLayer,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,grayvar*r,grayvar*g,grayvar*b,1-Z,str,stg,stb,sta,strokewidth,EdgeLength)
        end
    end
    
    for ii = -15+EdgeLength*1.5,170,EdgeLength*3 do
        
        for jj = -15+EdgeLength*math.sqrt(3)/2,115,EdgeLength*math.sqrt(3) do
            
            grayvar = 1
            
            X1 = t + (ii - EdgeLength/2)*vh
            Y1 = (jj - EdgeLength*math.sqrt(3)/2)*vh
            X2 = t + (ii - EdgeLength)*vh
            Y2 = (jj - 0)*vh
            X3 = t + (ii - EdgeLength/2)*vh
            Y3 = (jj + EdgeLength*math.sqrt(3)/2)*vh
            X4 = t + (ii + EdgeLength/2)*vh
            Y4 = (jj + EdgeLength*math.sqrt(3)/2)*vh
            X5 = t + (ii + EdgeLength)*vh
            Y5 = (jj - 0)*vh
            X6 = t + (ii + EdgeLength/2)*vh
            Y6 = (jj - EdgeLength*math.sqrt(3)/2)*vh
            
            CX = rx/2
            CY = ry/2
            r0 = 40*vh
            
            X1,Y1 = HemisphericalProjection(X1-CX,Y1-CY,r0)
            X2,Y2 = HemisphericalProjection(X2-CX,Y2-CY,r0)
            X3,Y3 = HemisphericalProjection(X3-CX,Y3-CY,r0)
            X4,Y4 = HemisphericalProjection(X4-CX,Y4-CY,r0)
            X5,Y5 = HemisphericalProjection(X5-CX,Y5-CY,r0)
            X6,Y6 = HemisphericalProjection(X6-CX,Y6-CY,r0)
            
            CX1,CY1,Z = HemisphericalProjection((X2+X5)/2,(Y2+Y5)/2,r0)
            
            X1 = X1 + CX
            Y1 = Y1 + CY
            X2 = X2 + CX
            Y2 = Y2 + CY
            X3 = X3 + CX
            Y3 = Y3 + CY
            X4 = X4 + CX
            Y4 = Y4 + CY
            X5 = X5 + CX
            Y5 = Y5 + CY
            X6 = X6 + CX
            Y6 = Y6 + CY
            
            Z = Z/r0
                                           
            addHexagon(HoneycombLayer,OutlineLayer,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,grayvar*r,grayvar*g,grayvar*b,1-Z,str,stg,stb,sta,strokewidth,EdgeLength)
        end
    end

    setNextStrokeColor(OutlineLayer,str,stg,stb,a)
    setNextStrokeWidth(OutlineLayer,strokewidth)
    --addLine()
    
end

local HoneycombLayer = createLayer()
local OutlineLayer = createLayer()

HexagonBackground(HoneycombLayer,OutlineLayer,r,g,b,a,str,stg,stb,sta,strokewidth,6)

requestAnimationFrame(1)




