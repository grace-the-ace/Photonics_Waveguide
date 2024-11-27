function [E] = waveGuideField(width,x,gamma,kappa, E0)
%WAVEGUIDEFIELD Summary of this function goes here
%   Detailed explanation goes here
if x<=(-1.0*width/2.0)
    E = E0*exp(gamma*(x+(width/2.0)));
elseif x>=(width/2.0)
    E = E0*exp(-1*gamma*(x-(width/2.0)));
else
    E = E0*cos(kappa*x)/cos(kappa*(width/2.0));
end

