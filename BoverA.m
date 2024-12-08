function [ratio] = BoverA(K,betaA,betaB, a)
%BOVERA Summary of this function goes here
%   Detailed explanation goes here
ratio = -2*K/(betaA-betaB)*sin((betaA-betaB)*a);
end

