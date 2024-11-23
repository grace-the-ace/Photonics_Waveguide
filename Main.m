%Variables
nf = 3.5; %Silicon index of refraction
ns = 1.5; %SiO2
laserPower = 10; %mW
laserAvgWaveLength = 1500; %nm
laserWavelengthRange = 100; %nm
outputPowerMin = 1; %mW
maxWaveguideArea = 1; %mm^2
areaVariation = 5; %nm
startingWidth; %nm

%Laser into first Waveguide
k0 = 2*pi/laserAvgWaveLength;
beta = k0*nf;
h = 0; %TODO determine width to get what we want
%Beam Splitter

%Four channels and tiem delay

%TODO: Plot transmission of each channel with optimized geometry

%TODO: Plot transmission of each channel with non optimized geometry

%TODO: Draw system