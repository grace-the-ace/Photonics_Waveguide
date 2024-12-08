function [K] = nondegenerateCouplingCoefRange(C1,C2,pert,upper,lower,kappa1,kappa2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
K = zeros(size(pert));
for i=1:length(pert)
    fun = @(x) cos(kappa1(i).*x).*cos(kappa2(i).*x);
    k = pert(i)*C1(i)*C2(i)*(1/(cos(kappa1(i)*upper/2)*cos(kappa2(i)*upper/2)))*integral(fun,lower,upper);
    K(i)=k;
end

