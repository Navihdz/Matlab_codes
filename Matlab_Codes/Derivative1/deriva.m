function yp=deriva(x,y) 
%
% x es el intervalo donde realizaremos la derivación; 
% y es la función que se va a derivar
%
% fp=(x,f) dará como resultado la derivada de los puntos x, usando el
% método de diferencia progresiva para el primer punto, el método de
% diferencia central para los puntos desde 2 hasta n-1. Y para el último
% punto se utiliza el método de diferencia regresiva.

n=length(x);
yp(1)=(y(2)-y(1))/(x(2)-x(1));

for k=2:n-1
    yp(k)=(y(k+1)-y(k-1))/(2*(x(k)-x(k-1)));
end
yp(n)=(y(n)-y(n-1))/(x(n)-x(n-1));