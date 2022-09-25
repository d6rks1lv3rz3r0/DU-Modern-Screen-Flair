PX = {0.53,0.87,0.92,0.66,0.90,0.32,-0.70,-0.25,-0.18,-0.57,-0.66,-0.18,-0.02,-0.71,-0.42,-0.46,-0.70,-0.70,0.00,-1.00,-0.66,-0.82,-0.81,-1.00,-0.99,0.54,-0.09,0.00,0.32,0.23,-0.04,0.27,0.84,0.70,0.67,0.86,-0.06,0.26,0.10,-0.03,0.35,0.61,0.70,0.97,-0.78,-0.29,-0.38,-0.24,-0.77,0.29,-0.31,0.57,0.66,0.65,0.48,0.83,0.45,-0.56,-0.37,0.60,0.16,-0.61,-0.79,-0.79,-0.44,-0.40,-0.64,-0.72,0.41,0.17,0.46,-0.91,-0.09,-0.21,-0.13,-0.68,-0.49,0.28,0.18,0.25,-0.06,-0.05,-0.07,-0.22,-0.44,-0.06,0.02,0.53,0.96,0.86,0.96,0.49,0.57,-0.79,-0.69,-0.78}

PY = {0.78,0.44,0.35,0.65,0.39,0.94,0.32,0.97,0.98,0.78,0.72,0.84,0.63,0.21,0.06,0.05,0.20,0.19,0.75,0.05,0.72,-0.12,0.29,0.01,0.10,0.08,0.63,-0.03,-0.12,0.67,0.05,-0.15,-0.42,-0.64,0.10,-0.25,-0.55,-0.57,-0.08,-0.62,-0.23,-0.75,-0.69,-0.25,-0.63,-0.90,-0.86,-0.97,-0.63,0.79,0.65,-0.73,-0.22,-0.70,-0.70,-0.15,-0.65,-0.14,0.32,-0.76,-0.46,-0.57,-0.61,-0.36,0.35,0.37,-0.17,-0.16,0.30,0.23,0.64,-0.32,-0.68,-0.87,-0.85,-0.62,-0.48,-0.93,-0.98,-0.94,-0.84,-0.67,-0.70,-0.97,-0.11,-0.87,0.03,-0.17,0.19,-0.09,0.13,0.21,0.21,-0.16,-0.62,-0.60}

PZ = {1,1,0,0,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0}

K = {{1,2,3,5,4,6},{7,11,10,8,9,12},{7,12,19,13,15,16,18,17,14},{20,24,22,23,21,25},{26,30,27,31,28,32,29},{26,29,34,33,36,35},{37,39,41,38,40},{33,34,42,43,44},{45,49,48,46,47},{8,10,51,27,30,50},{52,55,57,53,56,54},{28,31,59,58},{29,32,61,60,42,34},{45,47,62,64,63},{58,59,66,65,68,67},{13,19,71,69,70},{1,6,9,8,50},{14,17,72,20,25},{1,50,30,26,35,2},{73,75,74,76,77},{42,60,78,79,80,52,54,43},{60,61,82,83,81,78},{46,48,84,79,78,81},{37,40,73,77,85},{74,75,86,80,79,84},{46,81,83,62,47},{10,11,21,23,65,66,51},{27,51,66,59,31},{13,70,87,15},{38,41,88,53,57},{2,35,36,89,3},{15,87,39,37,85,16},{43,54,56,90,91,44},{52,80,86,55},{4,5,93,92,69,71},{22,24,63,64,94},{53,88,92,93,90,56},{38,57,55,86,75,73,40},{48,49,96,95,76,74,84},{17,18,95,96,72},{28,58,67,82,61,32},{39,87,70,69,92,88,41},{62,83,82,67,68,94,64},{3,89,91,90,93,5},{22,94,68,65,23},{20,72,96,49,45,63,24},{7,14,25,21,11},{33,44,91,89,36},{16,85,77,76,95,18},{4,71,19,12,9,6}}

local rx, ry = getResolution()
local vw = rx/100
local vh = ry/100
local Canvas = createLayer()
local ShieldPrior = createLayer()
local ShieldGlow = createLayer()
local ShieldInterior = createLayer()
local ShieldShip = createLayer()
local ShieldPosterior = createLayer()

for ii = 1, #PX, 1 do 
    if PZ[ii] > 0 then
        setNextFillColor(ShieldPosterior, 0/255, 75/255, 255/255, 1)       
        addCircle(ShieldPosterior, PX[ii]*ry/2 + rx/2, PY[ii]*ry/2 + ry/2, vh/2)
    end
    if PZ[ii] < 1 then
        setNextFillColor(ShieldPrior, 0/255, 75/255, 255/255, 1)       
        addCircle(ShieldPrior, PX[ii]*ry/2 + rx/2, PY[ii]*ry/2 + ry/2, vh/2)
    end
end

for ii = 1, #K, 1 do 
    CurrentFace = K[ii]
    for jj = 1, #CurrentFace - 1, 1 do 
        if PZ[CurrentFace[jj]]*PZ[CurrentFace[jj+1]] > 0 then
            setNextStrokeColor(ShieldPosterior, 0/255, 75/255, 255/255, 1) 
            addLine(ShieldPosterior, PX[CurrentFace[jj]]*ry/2 + rx/2, PY[CurrentFace[jj]]*ry/2 + ry/2, PX[CurrentFace[jj+1]]*ry/2 + rx/2, PY[CurrentFace[jj+1]]*ry/2 + ry/2)
        else
            setNextStrokeColor(ShieldPrior, 0/255, 75/255, 255/255, 1) 
            addLine(ShieldPrior, PX[CurrentFace[jj]]*ry/2 + rx/2, PY[CurrentFace[jj]]*ry/2 + ry/2, PX[CurrentFace[jj+1]]*ry/2 + rx/2, PY[CurrentFace[jj+1]]*ry/2 + ry/2)
        end
    end
    if PZ[CurrentFace[1]]*PZ[CurrentFace[#CurrentFace]] > 0 then
        setNextStrokeColor(ShieldPosterior, 0/255, 75/255, 255/255, 1) 
        addLine(ShieldPosterior, PX[CurrentFace[1]]*ry/2 + rx/2, PY[CurrentFace[1]]*ry/2 + ry/2, PX[CurrentFace[#CurrentFace]]*ry/2 + rx/2, PY[CurrentFace[#CurrentFace]]*ry/2 + ry/2)
    else
        setNextStrokeColor(ShieldPrior, 0/255, 75/255, 255/255, 1) 
        addLine(ShieldPrior, PX[CurrentFace[1]]*ry/2 + rx/2, PY[CurrentFace[1]]*ry/2 + ry/2, PX[CurrentFace[#CurrentFace]]*ry/2 + rx/2, PY[CurrentFace[#CurrentFace]]*ry/2 + ry/2)
    end
end
   
setNextFillColor(ShieldGlow, 25/255, 38/255, 240/255, 0.4)
setNextShadow(ShieldGlow, 5*vh, 25/255, 125/255, 240/255, 0.6)
addCircle(ShieldGlow, rx/2, ry/2, ry/2)

setNextFillColor(ShieldInterior, 0/255, 0/255, 0/255, 0.9)
setNextShadow(ShieldInterior, 10*vh, 0/255, 0/255, 0/255, 1)
addCircle(ShieldInterior, rx/2, ry/2, ry/2 - 5*vh)

setLayerOrigin(ShieldShip, 0.5*rx, 0.5*ry)
setLayerScale(ShieldShip, 0.5, 0.5)
--setLayerScale(ShieldShip, 0.25, 0.25)
--setLayerTranslation(ShieldShip, -0.25*rx, 0)   
        
--setLayerScale(ShieldPrior, 0.5, 0.5)
--setLayerScale(ShieldGlow, 0.5, 0.5)
--setLayerScale(ShieldInterior, 0.5, 0.5)  
--setLayerScale(ShieldPosterior, 0.5, 0.5)        
        
--setLayerTranslation(ShieldPrior, 0, ry/4)
--setLayerTranslation(ShieldGlow, 0, ry/4)  
--setLayerTranslation(ShieldInterior, 0, ry/4)     
--setLayerTranslation(ShieldPosterior, 0, ry/4)      
        

        
        
        
        
        
        
        
        
        
        
        
        


