%Constants
nf = 3.5; %Silicon index of refraction
ns = 1.5; %SiO2
c = 3 *10^8;
epislon_0 = 8.854*10^-12; %F/m
miu_0 = 4*pi*10^-7; %H/m

%Laser
laserPower = 10; %mW
laserAvgWaveLength = 1.5; %microm
laserWavelengthRange = 100; %nm

outputPowerMin = 1; %mW
maxWaveguideArea = 1; %mm^2
areaVariation = 5; %nm
startingWidth = 0; %nm

%Laser into first Waveguide
k0 = 2*pi/laserAvgWaveLength;
k = k0*nf;
omega = k*c/nf;

%Amplitude of Laser
x0 = 5.0e-6;
E_0 = sqrt((20*10^-3)/(c*epislon_0*sqrt((pi*x0^2)/(2.0))));

gamma = (-3);
beta = sqrt((1/gamma)^2+(k0^2*nf^2));
%initial taper size
h_taper = 0; %TODO determine width to get what we want
neff = 0;
%gamma = k0 * sqrt(neff^2+nc^2);
kappa = sqrt(k^2-beta^2);
beta = 0;
%Normalized plus graph?


%Set Fiber field guide equal to waveguide field to get...

%Area formula

%Beam Splitter
PowerPercentage1 = 1;
PowerPercentage2 = 0;
PowerPercentage3 = 0;
PowerPercentage4 = 0;
 %What is omega?
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