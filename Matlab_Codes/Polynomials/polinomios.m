clear all
x=[-4*pi/2 -3*pi/2 0 3*pi/2 4*pi/2];
%x=linspace(-2*pi,2*pi,6);
y=sin(x)';
%c/p=coeficientes(x,p);
A=ecuaciones(x);
%c=eliminacion(A,y)
c=A\y;
xx=-2*pi:pi/100:2*pi;

yy=0;
exp=length(x)-2;
for k=1:length(x)-2; 

    yy=yy+c(k)*xx.^(exp);
    exp=exp-1;
end

ff=sin(xx);
clf
plot(xx,ff,'b')
hold on
plot(x,y,'or')
plot(xx,yy,'k')
