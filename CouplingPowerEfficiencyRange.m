function [powerPercent] = CouplingPowerEfficiencyRange(mode_width_i,mode_width_t,neffi,nefft)
%COUPLINGPOWEREFFICIENCY Summary of this function goes here
%   Detailed explanation goes here
num = (mode_width_i.^2).*(mode_width_t.^2);
den = (mode_width_i.^2+mode_width_t.^2).^2;
%neff = 2.*(neffi.*nefft)./(neffi+nefft);
powerPercent = 4.*(num./den);
end

