%Variables
nf = 3.5; %Silicon index of refraction
ns = 1.5; %SiO2

%Laser
laserPower = 10; %mW
laserAvgWaveLength = 1500; %nm
laserWavelengthRange = 100; %nm

outputPowerMin = 1; %mW
maxWaveguideArea = 1; %mm^2
areaVariation = 5; %nm
startingWidth; %nm

%Laser into first Waveguide
k0 = 2*pi/laserAvgWaveLength;
h = 0; %TODO determine width to get what we want

%Normalized plus graph?
gamma = 0;
kappa = 0;
beta = 0;

%Set Fiber field guide equal to waveguide field to get...

%Area formula

%Beam Splitter
PowerPercentage1 = 1;
PowerPercentage2 = 0;
PowerPercentage3 = 0;
PowerPercentage4 = 0;
omega = 0; %What is omega?
miu = 0; %Calc miu

%Assume I have h and Amplitude from part 1

%First pair 1-2
widthApart1 = 1;
lengthNext1 = 1;
joinTurn = 5; %minimum bending radius

%Second pairing 1-3
widthApart2 = 1;
lengthNext2 = 1;

%Third pairing 2-4


%Integral for non-degenerate coupling - chang around to solve for
%amplitude?
%insert waveguide functions
%

%Use to get amplitude needed to get correct amplitude, 
% which then reverse to get width of original wave guide?

%Four channels and time delay

%TODO: Plot transmission of each channel with optimized geometry

%TODO: Plot transmission of each channel with non optimized geometry

%TODO: Draw system