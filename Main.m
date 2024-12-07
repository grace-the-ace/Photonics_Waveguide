%Constants
nf = 3.5; %Silicon index of refraction
ns = 1.5; %SiO2
c = 3 *10^8;
epislon_0 = 8.854*10^-12; %F/m
miu_0 = 4*pi*10^-7; %H/m

%Laser
laserPower = 10e-3; %mW
laserAvgWaveLength = 1.5e-6; %microm
laserWavelengthRange = 100e-9; %nm

outputPowerMin = 1e-3; %mW
maxWaveguideArea = 1; %mm^2
areaVariation = 5e-9; %nm


%Laser into first Waveguide
k0 = 2*pi/laserAvgWaveLength;
k = k0*nf;
omega = k*c/nf;

%Amplitude of Laser
%Find amplitude of laser based on power
x0 = 5.0e-6;
E_0 = sqrt(laserPower*(miu_0/laserAvgWaveLength)*sqrt(2/((x0^2)*pi)));

%To find variables that allow us to calculate mode width, which lets use
%calc power coupling efficiency
b= 0.0017;
%b= 0.856;
V = 2*atan(sqrt(b/(1-b)))/sqrt(1-b);
h_taper = V/(k0*sqrt(nf^2-ns^2)); %nm
h_taper_saved = 6.23e-9; %nm 
%gamma = k0*sqrt(b*sqrt(nf^2-ns^2))
beta = k0*sqrt((nf^2-ns^2)*b+ns^2);
gamma = sqrt(beta^2-(k0^2)*(ns^2));
mode_width = 1/gamma;
kappa = sqrt(k^2-beta^2);

%Power efficiency
powerTransmitted = CouplingPowerEfficiency(1/gamma,x0)

%Percent under curve past cladding (loss from lack of cladding)
%Normalize to get probablity under curve is 1
%syms A
%eqn = 1==A*((1/gamma)+(2*sin(kappa*h_taper/2)/cos(kappa*h_taper/2)));
%s = solve(eqn,A);
%A = 36028797018963968/5095267110689141;
%Get percent of power past -3 microns
claddingDistance = 3e-6;
total = 2*sin(kappa*h_taper/2)/cos(kappa*h_taper/2)+(1/gamma);
outsideOfMain = exp(claddingDistance)/(2*gamma);
claddingLoss = (outsideOfMain)/(total);
modes = V/pi;
%Aim is to have the balance of the two above numbers be ideal so we get
%certain percent of power

%Get normalized amplitude


h_taper_saved = 6.23e-9; %nm 

%Next increase width

%Beam Splitter
powerAfterTransmission = laserPower*powerTransmitted - laserPower*powerTransmitted*claddingLoss;
b = 0.856;
hbeam = 0.47e-6; %microns
beta = k0*sqrt((nf^2-ns^2)*b+ns^2);
gamma = sqrt(beta^2-(k0^2)*(ns^2));
mode_width = 1/gamma;
kappa = sqrt(k^2-beta^2);

%Get amplitude
C=sqrt((2*powerAfterTransmission)/((1/gamma)+((hbeam)/(cos(kappa*hbeam/2)))))

PowerPercentage1 = 1;
PowerPercentage2 = 0;
PowerPercentage3 = 0;
PowerPercentage4 = 0;

%Assume I have h and Amplitude from part 1

%First pair 1-2
widthApart1 = 1;
lengthNext1 = 1;
joinTurn = 5; %minimum bending radius

%Second pairing 1-3
widthApart2 = 1;
lengthNext2 = 1;

%Third pairing 2-4


%Integral for non-degenerate coupling - change around to solve for
V = hbeam * k0 * sqrt(nf^2-ns^2);
neff1 = beta/k0;
length = 1e-3; %length of waveguides

%Check total area of waveguide
%Decided two microns was sufficent
hmax=2e-6;
Vmax=hmax*k0*sqrt(nf^2-ns^2)

V2 = 3*pi;
h2 = V2/(k0*sqrt(nf^2-ns^2));
syms b
eqn = V2==2*atan(sqrt(b/(1-b)))/sqrt(1-b);
b = vpasolve(eqn,b);
b=double(b)
beta2 = k0*sqrt((nf^2-ns^2)*b+ns^2);
neff2 = beta2/k0;

V3 = 5*pi;
h3 = V3/(k0*sqrt(nf^2-ns^2));
syms b
eqn = V3==2*atan(sqrt(b/(1-b)))/sqrt(1-b);
b = vpasolve(eqn,b);
b=double(b);
beta3 = k0*sqrt((nf^2-ns^2)*b+ns^2);
neff3 = beta3/k0;

V4 = 7*pi;
h4 = V3/(k0*sqrt(nf^2-ns^2));
syms b
eqn = V4==2*atan(sqrt(b/(1-b)))/sqrt(1-b);
b = vpasolve(eqn,b);
b=double(b);
beta4 = k0*sqrt((nf^2-ns^2)*b+ns^2);
neff4 = beta4/k0;

modes=V/pi;
Area = 4*(length*hmax);
%Use to get amplitude needed to get correct amplitude, 
% which then reverse to get width of original wave guide?

%Four channels and time delay

%TODO: Plot transmission of each channel with optimized geometry

%TODO: Plot transmission of each channel with non optimized geometry

%TODO: Draw system