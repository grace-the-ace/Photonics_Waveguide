function [powerPercent] = CouplingPowerEfficiency(mode_width_i,mode_width_t)
%COUPLINGPOWEREFFICIENCY Summary of this function goes here
%   Detailed explanation goes here
num = (mode_width_i^2)*(mode_width_t^2);
den = (mode_width_i^2+mode_width_t^2)^2;
powerPercent = 4*(num/den);
end

