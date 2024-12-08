function [V,gamma,kappa,beta,neff] = norm_params_from_h(b, mode, k0,nf,ns)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

V = h*(k0*sqrt(nf^2-ns^2)); %nm
syms b
eqn = V==(2*atan(sqrt(b/(1-b)))+mode*pi)/sqrt(1-b);
b = vpasolve(eqn,b);
b=double(b)

k = k0*nf;
beta = k0*sqrt((nf^2-ns^2)*b+ns^2);
gamma = sqrt(beta^2-(k0^2)*(ns^2));
kappa = sqrt(k^2-beta^2);
neff = beta/k0;
end

