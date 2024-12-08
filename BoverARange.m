function [ratio] = BoverARange(K,betaA,betaB, a)
%BOVERA Summary of this function goes here
%   Detailed explanation goes here
ratio = sin((betaA-betaB).*a).*-2.*K./(betaA-betaB);
end

