clear all
x=0:pi/10:4*pi;
y1=sin(x);
y2=sin(x)+2*rand(size(x))-1;
clf
plot(x,y1,'k',x,y2,'b')