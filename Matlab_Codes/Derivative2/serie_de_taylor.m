clear all
clf

syms x;
f=cos(x);              %f=input('INGRESE FUNCION: ','s');
a=-4;         %a=input('INGRESE intervalo inferior:  ','s');
b=4;           %b=input('INGRESE intervalo superior:  ','s');
x0=0;          %b=input('INGRESE intervalo superior:  ','s');
n=7;           %grado de serie de taylor
dx=0.01;       %b=input('INGRESE intervalo superior:  ','s');
%-------------------------------------------------------------
x=a:dx:b;
y=eval(f);

%-------------------------------------------------------------
x=x0;
F=eval(f);

for k=1:n
    syms x
    fp=diff(f,x,k);
    x=x0;
    fp0=eval(fp);
    x=a:dx:b;
   
    F=F+(fp0*(x-x0).^(k))/factorial(k);
    
    plot(x,F,'r')
    axis([-4 4 -4 4])
    hold on
    plot(x,y,'b')
    grid on
plot([-4 4],[0 0],'k') %genera la linea que representa el eje de las abscisas (x)
plot([0 0 ],[ -4 4],'k') %genera la línea que representa el eje de las ordenadas (y)
end
