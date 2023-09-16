clear all
x=linspace(-3*pi/2,3*pi/2,3);
y=sin(x)';

A=ecuaciones(x);
c=A\y;
xx=-2*pi:pi/100:2*pi;

yy=0;
ex=length(c)-1;
for k=1:length(c)-1
  yy=yy+c(k)*xx.^(ex);
  ex=ex-1;
end

ff=sin(xx);

clf
plot(xx,ff,'b')
hold on 
plot(x,y,'or')
plot(xx,yy,'k')