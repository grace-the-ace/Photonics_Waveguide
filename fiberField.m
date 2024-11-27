function E = fiberField(x,E0)
%The field amplitude of the fibers in the system
x0 = 5.0e-6;
E = E0*exp((-1.0*x^2.0)/(x0^2.0));
end

