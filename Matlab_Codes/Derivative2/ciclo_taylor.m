clear all
syms x
f=sin(x);
x=3*pi/4;

for k=1:5;
    fp=diff(f,k);
    fp0=eval(fp)
end
