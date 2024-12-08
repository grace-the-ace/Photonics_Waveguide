function [K] = nondegenerateCouplingCoef(C1,C2,pert,upper,lower,kappa1,kappa2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fun = @(x) cos(kappa1.*x).*cos(kappa2.*x);
K = pert*C1*C2*(1/(cos(kappa1*upper/2)*cos(kappa2*upper/2)))*integral(fun,lower,upper);
end

