clear all
global g v0y y0 t x 
t0=0; tf=20; dt=0.1;
v0x =7;
v0y=10;
y0=10;
g=-9.81;
%las variables del codigo anterior cambiaron a y1=fun     fv=vy1     v=vy
%-----------------------------------------------------
t=t0:dt:tf;
y1='0.5*g*t.^2+v0y*t+y0';
vy1 ='g*t+v0y';
x1='v0x*t';
vx1='v0x';

y= eval(y1); vy= eval(vy1);
x= eval(x1); vx= eval(vx1);

%--------------------------------------------------------

% %--------------------------------------------------------
n=length(x);
for k=2:n
 if  v0x==0
    if y(k-1)*y(k)<0
        xmn=raiz2(y1,t(k-1),t(k));
    end
    if vy(k-1)*vy(k)<0
        xmx=raiz2(vy1,t(k-1),t(k));
   end
    
 else   
    %---------------------------------
     if y(k-1)*y(k)<0
         xmn=raiz2(y1,x(k-1),x(k));
     end
    if vy(k-1)*vy(k)<0
        xmx=raiz2(vy1,x(k-1),x(k));
    end
    
  end   
  
    %-------------------------------------------

   
end

if v0x==0
    t=xmx ; ymx=eval(y1); xmx=0;
    t=xmn ; ymn=eval(y1); xmn=0;
else
    t=(xmx)/v0x ; ymx=eval(y1);
    t=(xmn)/v0x ; ymn=eval(y1);
end
%--------------------------------------------------------------------

%    
% 

% clf
% t=0:0.01:xmn;
% y1='0.5*g*t.^2+v0y*t+y0';
% y=eval(y1);
 clf
 plot(x,y,'k')
 axis([0 (xmx+15) (ymn-10) (ymx+10)])

 hold on
 plot(xmx,ymx,'ob')
 plot(xmn,ymn,'or')
 ylabel('Altura [m]')
 xlabel('Posición en x [m]')
 fprintf('la altura max es %4.2f m y la el tiempo en llegar al piso es de%8.3f segundos \n',ymx,2*t) 
