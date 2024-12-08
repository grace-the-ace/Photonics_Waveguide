function [V,gamma,kappa,beta,neff] = norm_params_from_h_range(h, mode, k0,nf,ns)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

V = h.*(k0.*sqrt(nf^2-ns^2)); %nm
b = zeros(size(V));
for i = 1:length(V)
    syms be
    eqn = V(i)==(2*atan(sqrt(be/(1-be)))+mode*pi)/sqrt(1-be);
    be = vpasolve(eqn,be);
    b(i)=double(be);
    


k = k0.*nf;
beta = k0.*sqrt((nf^2-ns^2).*b+ns^2);
gamma = sqrt(beta.^2-(k0.^2).*(ns^2));
kappa = sqrt(k.^2-beta.^2);
neff = beta./k0;
end

