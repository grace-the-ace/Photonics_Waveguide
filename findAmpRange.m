function [amp] = findAmpRange(omega,miu,beta,kappa,gamma,h)
%FINDAMP Summary of this function goes here
%   Detailed explanation goes here
    amp = zeros(size(omega));
    for i = 1:length(omega)
        fun1 = @(x) exp(gamma(i).*(x+(h/2)));
        int1 = integral(fun1,-Inf,-h/2);
        fun2 = @(x) cos(kappa(i).*x).*cos(kappa(i).*x);
        int2 = integral(fun2,-h/2,h/2);
        fun3 = @(x) exp(-gamma(i).*(x-(h/2)));
        int3 = integral(fun3,h/2,Inf);
        
        totalInt = int1+int2+int3;
        a=sqrt((2*omega(i)*miu)/(beta(i)*totalInt));
        amp(i) = a;
    end
end

