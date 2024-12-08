function [outputArg1,outputArg2] = Graph(inputArg1,inputArg2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% Constants
c = 3e8; % Speed of light in m/s
L = 1e-3; % Length of waveguide in meters

% Wavelength range (in micrometers)
wavelengths = linspace(1.5, 1.6, 100) * 1e-6; % 1.5 to 1.6 µm

% Effective index profiles (example)
n_non_opt = 1.5 + 0.005 * (wavelengths - 1.55e-6) / 1e-6; % Non-optimized (linear change)
n_opt = 1.5 + 0.003 * cos(2 * pi * (wavelengths - 1.55e-6) / 1e-6); % Optimized

% Calculate delays
t_non_opt = (L / c) * n_non_opt; % Non-optimized
t_opt = (L / c) * n_opt; % Optimized

% Plotting
figure;
plot(wavelengths * 1e6, t_non_opt * 1e12, 'r-', 'LineWidth', 1.5); hold on;
plot(wavelengths * 1e6, t_opt * 1e12, 'b--', 'LineWidth', 1.5);
xlabel('Wavelength (\mum)', 'FontSize', 12);
ylabel('Time Delay (ps)', 'FontSize', 12);
title('Time Delay vs. Wavelength', 'FontSize', 14);
legend('Non-optimized', 'Optimized', 'FontSize', 10);
grid on;
hold off;

outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

