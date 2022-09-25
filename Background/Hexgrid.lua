local HoneycombLayer = createLayer()
local OutlineLayer = createLayer()

function HexagonBackground(HoneycombLayer,OutlineLayer,r,g,b,a,str,stg,stb,sta,strokewidth,EdgeLength)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100
    
    local r = r or 25/255
    local g = g or 5/255
    local b = b or 5/255
    local a = a or 1

    local str = str or 0/255
    local stg = stg or 0/255
    local stb = stb or 0/255
    local sta = sta or 1
    local strokewidth = strokewidth or 0.5*vh

    local EdgeLength = EdgeLength or 6;

    function addHexagon(HoneycombLayer,OutlineLayer,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,r,g,b,a,str,stg,stb,sta,strokewidth)

        setDefaultFillColor(HoneycombLayer,Shape_Polygon,r,g,b,a)
        setDefaultStrokeColor(OutlineLayer,Shape_Line,str,stg,stb,a)
        setDefaultStrokeWidth(OutlineLayer,Shape_Line,strokewidth)
     
        addTriangle(HoneycombLayer,x1,y1,x2,y2,x3,y3)
        addTriangle(HoneycombLayer,x4,y4,x5,y5,x6,y6)
        addQuad(HoneycombLayer,x3,y3,x4,y4,x6,y6,x1,y1)

        addLine(OutlineLayer,x1,y1,x2,y2)
        addLine(OutlineLayer,x2,y2,x3,y3)
        addLine(OutlineLayer,x3,y3,x4,y4)

    end

    for ii = -5,170,EdgeLength*3 do
        for jj = -5,105,EdgeLength*math.sqrt(3) do
            grayvar = math.random()
            addHexagon(HoneycombLayer,OutlineLayer,(ii - EdgeLength/2)*vh,(jj - EdgeLength*math.sqrt(3)/2)*vh,(ii - EdgeLength)*vh,(jj - 0)*vh,(ii - EdgeLength/2)*vh,(jj + EdgeLength*math.sqrt(3)/2)*vh,(ii + EdgeLength/2)*vh,(jj + EdgeLength*math.sqrt(3)/2)*vh,(ii + EdgeLength)*vh,(jj - 0)*vh,(ii + EdgeLength/2)*vh,(jj - EdgeLength*math.sqrt(3)/2)*vh,grayvar*r,grayvar*g,grayvar*b,a,str,stg,stb,sta,strokewidth)
        end
    end

    for ii = -5+EdgeLength*1.5,170,EdgeLength*3 do
        for jj = -5+EdgeLength*math.sqrt(3)/2,105,EdgeLength*math.sqrt(3) do
            grayvar = math.random()
            addHexagon(HoneycombLayer,OutlineLayer,(ii - EdgeLength/2)*vh,(jj - EdgeLength*math.sqrt(3)/2)*vh,(ii - EdgeLength)*vh,(jj - 0)*vh,(ii - EdgeLength/2)*vh,(jj + EdgeLength*math.sqrt(3)/2)*vh,(ii + EdgeLength/2)*vh,(jj + EdgeLength*math.sqrt(3)/2)*vh,(ii + EdgeLength)*vh,(jj - 0)*vh,(ii + EdgeLength/2)*vh,(jj - EdgeLength*math.sqrt(3)/2)*vh,grayvar*r,grayvar*g,grayvar*b,a,str,stg,str,sta,strokewidth)
        end
    end
    
end

HexagonBackground(HoneycombLayer,OutlineLayer,r,g,b,a,str,stg,stb,sta,strokewidth,EdgeLength)