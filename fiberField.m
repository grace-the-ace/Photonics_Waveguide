function E = fiberField(x,E0, x0)
%The field amplitude of the fibers in the system
E = E0*exp((-1.0*x^2.0)/(x0^2.0));
end

