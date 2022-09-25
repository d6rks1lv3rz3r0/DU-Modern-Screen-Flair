function DrawArrow(arrowtype,glowtype,layer,font,r,g,b,st,sr,sg,sb,sa,fs,fr,fg,fb,fa,glowspeed)
    
    -- Internals --
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100   
    
    local CX = 50*vw
    local CY = 50*vh

    local RX = 25*vw
    local RY = 20*vh
    
    -- Glowing Effect -- 
    local t = getTime()
    local glowspeed = glowspeed or 100
    local glow = math.abs(math.fmod(glowspeed*t,200)-100)
    
    -- Mandatory Inputs --
    local layer = layer or createLayer()
    local font = font or loadFont(getAvailableFontName(5), 1) 
    local arrowtype = arrowtype or 1
    local glowtype = glowtype or 1
    
    -- Optional Color Inputs --
    
    -- Arrow Itself
    local r = r or 0
    local g = g or 0
    local b = b or 0

    -- Glow/Shadow
    local st = st or 10*vh
    local sr = sr or 1
    local sg = sg or 0.5
    local sb = sb or 0

    -- Font
    local fs = 20*vh
    local fr = 1
    local fg = 0
    local fb = 1
    setFontSize(font,fs)

    if glowtype == 1 then

        sa = glow/100
        fa = glow/100

    elseif glowtype == 2 then

        fa = fa or 1
        sa = sa or glow/100

    elseif glowtype == 3 then

        sa = sa or 1
        fa = fa or glow/100

    end

    if arrowtype == 1 then

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)
        addBox(layer,CX - 1.5*RX,CY - RY,2*RX,2*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)
        addTriangle(layer,CX + RX - RY*math.sqrt(3),CY + 2*RY,CX + RX - RY*math.sqrt(3),CY - 2*RY,CX + RX + 1.25*RY,CY)

        setNextFillColor(layer,r,g,b,1)
        addQuad(layer,CX - 0.5*RX,CY - RY,CX + 0.5*RX,CY - RY,CX + 0.5*RX,CY + RY,CX - 0.5*RX,CY + RY)

        setNextFillColor(layer,fr,fg,fb,fa)
        setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
        addText(layer, font, "Signage", 50*vw, 50*vh)

    elseif arrowtype == 2 then

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)
        addBox(layer,CX - 1.5*RX,CY - 0.75*RY,2*RX,1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)
        addTriangle(layer,CX + RX - 0.75*RY*math.sqrt(3),CY + 1.5*RY,CX + RX - 0.75*RY*math.sqrt(3),CY - 1.5*RY,CX + RX + 1.25*RY,CY)

        setNextFillColor(layer,r,g,b,1)
        addQuad(layer,CX - 0.5*RX,CY - 0.75*RY,CX + 0.5*RX,CY - 0.75*RY,CX + 0.5*RX,CY + 0.75*RY,CX - 0.5*RX,CY + 0.75*RY)

        setNextFillColor(layer,fr,fg,fb,fa)
        setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
        addText(layer, font, "Signage", 50*vw, 50*vh)

    elseif arrowtype == 3 then

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)        
        addQuad(layer,CX + 1.2*RX,CY,CX + 1.7*RX,CY,CX + 0.7*RX,CY - 1.5*RY,CX + 0.4*RX,CY - 1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa) 
        addQuad(layer,CX + 1.2*RX,CY,CX + 1.7*RX,CY,CX + 0.7*RX,CY + 1.5*RY,CX + 0.4*RX,CY + 1.5*RY)

        setNextFillColor(layer,r,g,b,1)      
        addQuad(layer,CX + 1.2*RX,CY,CX + 1.7*RX,CY,CX + 0.7*RX,CY - 1.5*RY,CX + 0.4*RX,CY - 1.5*RY)

        setNextFillColor(layer,fr,fg,fb,fa)
        setNextTextAlign(layer, AlignH_Center, AlignV_Middle)
        addText(layer, font, "Signage", 40*vw, 50*vh)


    elseif arrowtype == 4 then

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)        
        addQuad(layer,CX + 1.2*RX,CY,CX + 1.5*RX,CY,CX + 0.5*RX,CY - 1.5*RY,CX + 0.2*RX,CY - 1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa) 
        addQuad(layer,CX + 1.2*RX,CY,CX + 1.5*RX,CY,CX + 0.5*RX,CY + 1.5*RY,CX + 0.2*RX,CY + 1.5*RY)

        setNextFillColor(layer,r,g,b,1)      
        addQuad(layer,CX + 1.2*RX,CY,CX + 1.5*RX,CY,CX + 0.5*RX,CY - 1.5*RY,CX + 0.2*RX,CY - 1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)        
        addQuad(layer,CX + 0.4*RX,CY,CX + 0.7*RX,CY,CX - 0.3*RX,CY - 1.5*RY,CX - 0.6*RX,CY - 1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa) 
        addQuad(layer,CX + 0.4*RX,CY,CX + 0.7*RX,CY,CX - 0.3*RX,CY + 1.5*RY,CX - 0.6*RX,CY + 1.5*RY)

        setNextFillColor(layer,r,g,b,1)      
        addQuad(layer,CX + 0.4*RX,CY,CX + 0.7*RX,CY,CX - 0.3*RX,CY - 1.5*RY,CX - 0.6*RX,CY - 1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)        
        addQuad(layer,CX - 0.4*RX,CY,CX - 0.1*RX,CY,CX - 1.1*RX,CY - 1.5*RY,CX - 1.4*RX,CY - 1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa) 
        addQuad(layer,CX - 0.4*RX,CY,CX - 0.1*RX,CY,CX - 1.1*RX,CY + 1.5*RY,CX - 1.4*RX,CY + 1.5*RY)

        setNextFillColor(layer,r,g,b,1)      
        addQuad(layer,CX - 0.4*RX,CY,CX - 0.1*RX,CY,CX - 1.1*RX,CY - 1.5*RY,CX - 1.4*RX,CY - 1.5*RY)

    elseif arrowtype == 5 then

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)        
        addQuad(layer,CX + 0.5*RX,CY,CX + 1.5*RX,CY,CX + 0.5*RX,CY - 1.5*RY,CX + 0.2*RX,CY - 1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa) 
        addQuad(layer,CX + 0.5*RX,CY,CX + 1.5*RX,CY,CX + 0.5*RX,CY + 1.5*RY,CX + 0.2*RX,CY + 1.5*RY)

        setNextFillColor(layer,r,g,b,1)      
        addQuad(layer,CX + 0.5*RX,CY,CX + 1.5*RX,CY,CX + 0.5*RX,CY - 1.5*RY,CX + 0.2*RX,CY - 1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa)        
        addQuad(layer,CX - 1.1*RX,CY,CX - 0.1*RX,CY,CX - 1.1*RX,CY - 1.5*RY,CX - 1.4*RX,CY - 1.5*RY)

        setNextFillColor(layer,r,g,b,1)
        setNextShadow(layer,st,sr,sg,sb,sa) 
        addQuad(layer,CX - 1.1*RX,CY,CX - 0.1*RX,CY,CX - 1.1*RX,CY + 1.5*RY,CX - 1.4*RX,CY + 1.5*RY)

        setNextFillColor(layer,r,g,b,1)      
        addQuad(layer,CX - 1.1*RX,CY,CX - 0.1*RX,CY,CX - 1.1*RX,CY - 1.5*RY,CX - 1.4*RX,CY - 1.5*RY)

    end

end

DrawArrow(Count,1,layer)

requestAnimationFrame(1)
    