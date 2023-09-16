clear all
a=1;               %limite a
b=4;            %limite b
c=200;              %numero de subintervalos
dx=(b-a)/(c);      %tama�o de base de rect�ngulo (dx necesario para que n sea impar y tener mejor aproximacion)
x=a:dx:b;
y=x.^4+3*x.^3+1;          %funcion a integrar
fun='x.^4+3*x.^3+1';      %escribir misma funci� que arriba, pero entre comillas
n=length(x);   %calcula el numero de rectangulos(es impar) 
%------------------%c�lculo de integral por medio de rect�ngulos 
I1=sum(y*dx);      
%------------------%c�lculo de integral por medio de trapecios
I2=0.5*y(1)*dx+sum(y(2:n-1)*dx)+0.5*y(n)*dx;

%------------------%metodo de simpson
f=inline(fun);
h=dx;

sumai=0;           %se establece un punto inicial para las sumatoria
sumap=0;

for i=1:2:n-1                   %suma los impares
    sumai=sumai+feval(f,h*i+a);
end
for i=2:2:n-2                   %suma los pares
    sumap=sumap+feval(f,h*i+a);
end
                                %forma del metodo de Simpson
I3=(h/3)*(feval(f,a)+4*sumai+2*sumap+feval(f,b));

%---------------------------------------------
%%%---esta parte se encarga de la sal�da de los datos que observa el usuario

fprintf(['El valor num�rico de la integral de la funcion desde ' ,...
num2str(a),' hasta ',num2str(b),' es: ','con n=', num2str(n),...
'\n','M�todo de triangulos: ',num2str(I1),'\n','M�todo de trapecios: ',...
num2str(I1),'\n', 'M�todo de Simpson: ',num2str(I3),'\n'])
