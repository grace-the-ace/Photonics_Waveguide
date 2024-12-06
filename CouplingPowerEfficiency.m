function [powerPercent] = CouplingPowerEfficiency(mode_width_i,mode_width_t)
%COUPLINGPOWEREFFICIENCY Summary of this function goes here
%   Detailed explanation goes here
powerPercent = 4*(((mode_width_i^2)*(mode_width_t^2))/(mode_width_i^2+mode_width_t^2)^2);
end

