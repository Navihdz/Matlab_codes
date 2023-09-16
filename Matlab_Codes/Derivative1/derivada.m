clear all
dx=pi/10;
x=0:dx:4*pi;
y=sin(x);
clf; subplot(3,1,1); plot(x,y,'k')
grid on
legend('sin(x)')
ylabel('eje y')
xlabel('eje x')
yp=deriva(x,y);
ypp=deriva(x,yp);
subplot(3,1,2); plot(x,yp,'r')
grid on
legend('yp','cos(x)')
ylabel('eje y')
xlabel('eje x')
subplot(3,1,3); plot(x,ypp,'b')
grid on
legend('ypp','-sin(x)')
ylabel('eje y')
xlabel('eje x')







