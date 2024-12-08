function [amp] = findAmp(omega,miu,beta,kappa,gamma,h)
%FINDAMP Summary of this function goes here
%   Detailed explanation goes here
fun1 = @(x) exp(-gamma.*(x-(h/2)));
int1 = integral(fun1,-Inf,-h/2);
fun2 = @(x) cos(kappa.*x).*cos(kappa.*x);
int2 = integral(fun2,-h/2,h/2);
fun3 = @(x) exp(gamma.*(x+(h/2)));
int3 = integral(fun3,h/2,Inf);

totalInt = int1+int2+int3;
amp=sqrt(2*omega*miu/(beta*totalInt));
end

