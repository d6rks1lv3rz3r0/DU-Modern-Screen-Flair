function cosh (x)
    local exp = math.exp
    if x == 0.0 then return 1.0 end
    if x < 0.0 then x = -x end
    x = exp(x)
    x = x / 2.0 + 0.5 / x
    return x
end

function sinh (x)
    local exp = math.exp
    if x == 0 then return 0.0 end
    local neg = false
    if x < 0 then x = -x; neg = true end
    if x < 1.0 then
        local y = x * x
        x = x + x * y *
        (((-0.78966127417357099479e0  * y +
                    -0.16375798202630751372e3) * y +
                -0.11563521196851768270e5) * y +
            -0.35181283430177117881e6) /
        ((( 0.10000000000000000000e1  * y +
                    -0.27773523119650701667e3) * y +
                0.36162723109421836460e5) * y +
            -0.21108770058106271242e7)
    else
        x =  exp(x)
        x = x / 2.0 - 0.5 / x
    end
    if neg then x = -x end
    return x
end

local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100

local Logo = createLayer()
local HoneycombLayer = createLayer()
local OutlineLayer = createLayer()
local Aura0 = createLayer()
local Aura1 = createLayer()



local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100

local r = r or 1/255
local g = g or 104/255
local b = b or 255/255
local a = a or 1

local str = str or 0/255
local stg = stg or 0/255
local stb = stb or 0/255
local sta = sta or 1
local strokewidth = strokewidth or 0.25*vh

setDefaultStrokeColor(OutlineLayer,Shape_Line,0.2,0.2,0.2,1)
setDefaultStrokeWidth(OutlineLayer,Shape_Line,0.05*vh) 

sx = 42
sy = 106
CX = 50*vw
CY = 50*vh

a = 4
b = 4
c = 1

ey = 0.4
ex = math.pi/32

local t = math.fmod(0.25*(getTime()),2) --TimeMultiplier*getTime() 

for jj = 1,9,1 do

    for ii = 1,31,1 do
        
        v1 = -1.8 + (jj-1)*ey
        theta1 = 0 + (ii-1)*ex
        
        v2 = -1.8 + (jj)*ey
        theta2 = 0 + (ii)*ex

        X1 = sx*a*cosh(v1)*math.cos(math.fmod(theta1+t,math.pi)) + CX
        Y1 = sy*c*sinh(v1) + CY
        X2 = sx*a*cosh(v2)*math.cos(math.fmod(theta1+t,math.pi)) + CX
        Y2 = sy*c*sinh(v2) + CY
        X3 = sx*a*cosh(v2)*math.cos(math.fmod(theta2+t,math.pi)) + CX
        Y3 = sy*c*sinh(v2) + CY
        X4 = sx*a*cosh(v1)*math.cos(math.fmod(theta2+t,math.pi)) + CX
        Y4 = sy*c*sinh(v1) + CY

        addLine(OutlineLayer,X1,Y1,X2,Y2)
        addLine(OutlineLayer,X2,Y2,X3,Y3)
        addLine(OutlineLayer,X3,Y3,X4,Y4)
        addLine(OutlineLayer,X4,Y4,X1,Y1)

    end
end

logMessage(getRenderCost())

requestAnimationFrame(1)







