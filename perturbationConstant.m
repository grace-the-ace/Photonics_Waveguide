function [pert] = perturbationConstant(omega, epi,n2,n1)
%PERTURBATIONCONSTANT Summary of this function goes here
%   Detailed explanation goes here
pert = omega*epi*(n2^2-n1^2)/4;
end

