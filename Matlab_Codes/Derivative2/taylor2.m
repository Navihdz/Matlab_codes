clear all
syms x
x0=3*pi/4;
x1=0:pi/50:2*pi;
f=sin(x);
n=4;
col=['g';'b';'k';'y'];
style=['--';'-.';' :';'--'];
%---------------------------------------------------------
x=x1;
y1=eval(f);
%--------------------------------------------------------
clf
plot(x1,y1,'r')
%--------------------------------------------------------
x=x0;
y0=eval(f);
hold on
%opcion 1---------------------------
plot(x0,y0,'*r')
%opcion 2-------------------------------------------------------
% x2=x0-pi/4:pi/50:x0+pi/4;
% plot(x2,y0,'or')
% %opcion3-------------------------------------------------------
% plot(x1,y0,'.b')

%------------------------------------------------------------------
% syms x
% f=sin(x);
% x=x0;
% for k=1:n;
%     fp=diff(f,n);
%     fp0=eval(fp)
% end

%--------------------------------------------------------------
x=x0;
F=eval(f);

for k=1:n
    syms x
    fp=diff(f,x,k);
    x=x0;
    fp0=eval(fp);
%     x=0:pi/50:2*pi;
x=x1;
   
    F=F+(fp0*(x-x0).^(k))/factorial(k);
    
    plot(x,F,'color',col(k,:),'linestyle',style(k,:))
    %plot(x,F,'linestyle',style(k,:))
    axis([0 6 -5 5])
    %legend('Primero', 'Segundo', 'Tercero','Location', 'NortEastOutside');
   % hold on
    grid on
    legend('Función','x0','1° aproximaxión','2° aproximación','3° aproximación','4° aproximación','Location','northeast')
%plot([1 6],[0 0],'k') %genera la linea que representa el eje de las abscisas (x)
%plot([0 0 ],[ 1 6],'k') %genera la línea que representa el eje de las ordenadas (y)
end



 