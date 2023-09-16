syms x
f(x)=sin(x);
df=diff(f,x);
df
x=0:pi/10:2*pi;
y=eval(df)
plot(x,y)
