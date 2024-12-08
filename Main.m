%Constants
clear;
nf = 3.5; %Silicon index of refraction
ns = 1.5; %SiO2
c = 3 *10^8;
epislon_0 = 8.854*10^-12; %F/m
miu_0 = 4*pi*10^-7; %H/m
claddingDistance = 3e-6;
%Laser
laserPower = 10e-3; %mW
laserAvgWaveLength = 1.5e-6; %microm
laserWavelengthRange = 100e-9; %nm

outputPowerMin = 1e-3; %mW
maxWaveguideArea = 1; %mm^2
areaVariation = 5e-9; %nm

laserWaveLengths = linspace(1.4e-6,1.6e-6,100);

%figure
%plot(laserWaveLengths,calc_k0(laserWaveLengths))

%Laser into first Waveguide
k0 = 2*pi/laserAvgWaveLength;
k = k0*nf;
omega = k0*c;

%Amplitude of Laser
%Find amplitude of laser based on power
x0 = 5.0e-6;
E_0 = sqrt(laserPower*(miu_0/laserAvgWaveLength)*sqrt(2/((x0^2)*pi)));

%To find variables that allow us to calculate mode width, which lets use
%calc power coupling efficiency
b= 0.0024;
%[h_taper,V_taper,gamma_taper,kappa_taper,beta_taper,neff_taper] = norm_params_from_b(b,0,k0,nf,ns);
h_taper = 4.5e-9;
[V_taper,gamma_taper,kappa_taper,beta_taper,neff_taper] = norm_params_from_h(h_taper,0,k0,nf,ns);
h_taper_saved = 2.23e-9; %nm 
%gamma = k0*sqrt(b*sqrt(nf^2-ns^2))

mode_width = 1/gamma_taper;


%Power efficiency
powerTransmitted = CouplingPowerEfficiency(1/gamma_taper,x0,nf,neff_taper);

%Percent under curve past cladding (loss from lack of cladding)
%Normalize to get probablity under curve is 1

total = 2*sin(kappa_taper*h_taper/2)/cos(kappa_taper*h_taper/2)+(1/gamma_taper);
outsideOfMain = exp(claddingDistance)/(2*gamma_taper);
claddingLoss = (outsideOfMain)/(total);

modes = V_taper/pi;
%Aim is to have the balance of the two above numbers be ideal so we get
%certain percent of power
 

%Next increase width

%Beam Splitter
powerAfterTransmission = laserPower*powerTransmitted - laserPower*powerTransmitted*claddingLoss;
b_beam = 0.856;
hbeam = 0.47e-6; %microns
[hbeam,V_beam,gamma_beam,kappa_beam,beta_beam,neff_beam] = norm_params_from_b(b_beam,0,k0,nf,ns);

mode_width_beam = 1/gamma_beam;

omega = k0*c;
%Get amplitude
C=sqrt((2*powerAfterTransmission)/((1/gamma_beam+((hbeam)/(cos(kappa_beam*hbeam/2))))));

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

length = 1e-3; %length of waveguides

%non-degenerate coupling coefficient

%Check total area of waveguide
%Decided two microns was sufficent
pert = perturbationConstant(omega, epislon_0,ns,nf);

%First increase to just below mode of order 2
V2 = 3*pi;
[h0,gamma0,kappa0,beta0,neff0] = norm_params_from_V(V2, 0, k0,nf,ns);
[h2,gamma2,kappa2,beta2,neff2] = norm_params_from_V(V2, 2, k0,nf,ns);

amp0 = findAmp(omega,miu_0,beta0,kappa0,gamma0,h0);
amp2 = findAmp(omega,miu_0,beta2,kappa2,gamma2,h2);

h1 = h2-(1e-8);
[V1,gamma1,kappa1,beta1,neff1] = norm_params_from_h(h1, 0, k0,nf,ns);
a1 = 0.00000993;
K02 = nondegenerateCouplingCoef(amp0,amp2,pert,h2,h1,kappa0,kappa2);
BA02 = BoverA(K02,beta0,beta2,a1);

hmax=1e-6;
Vmax1=hmax*k0*sqrt(nf^2-ns^2);
modes = Vmax1/pi;

[Vmax0,gammamax0,kappamax0,betamax0,neffmax0] = norm_params_from_h(hmax, 0, k0,nf,ns);
[Vmax2,gammamax2,kappamax2,betamax2,neffmax2] = norm_params_from_h(hmax, 2, k0,nf,ns);

ampmax0 = findAmp(omega,miu_0,betamax0,kappamax0,gammamax0,hmax);
ampmax2 = findAmp(omega,miu_0,betamax2,kappamax2,gammamax2,hmax);

a2 = 0.0000100417
Kmax02 = nondegenerateCouplingCoef(ampmax0,ampmax2,pert,hmax,h2,kappamax0,kappamax2);
BAmax02 = BoverA(Kmax02,betamax0,betamax2,a2);
%Vmax=4*pi;
%[hmax,gamma,kappa,beta,neff] = norm_params_from_V(Vmax, 0, k0,nf,ns)
Area = 4*(length*hmax);

powerFinal = 0.99*((powerAfterTransmission*powerTransmitted)/4.0);
a0 = 10e-6;
amax = (1e-3) - 2*(a0+a1+a2);
timeDelay = (2*a0*neff_beam+2*a1*neff1+2*a2*neff0+amax*neffmax0)/c;
%Use to get amplitude needed to get correct amplitude, 
% which then reverse to get width of original wave guide?

%Four channels and time delay

%TODO: Plot transmission of each channel with optimized geometry

%TODO: Plot transmission of each channel with non optimized geometry

%TODO: Draw system