function [h,V,gamma,kappa,beta,neff] = norm_params_from_b(b, mode, k0,nf,ns)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

V = (2*atan(sqrt(b/(1-b)))+mode*pi)/sqrt(1-b);
h = V/(k0*sqrt(nf^2-ns^2)); %nm
k = k0*nf;
beta = k0*sqrt((nf^2-ns^2)*b+ns^2);
gamma = sqrt(beta^2-(k0^2)*(ns^2));
kappa = sqrt(k^2-beta^2);
neff = beta/k0;
end

