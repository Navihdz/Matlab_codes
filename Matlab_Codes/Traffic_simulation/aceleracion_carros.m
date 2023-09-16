clear all
a=[2.0 2.2 2.8];   % a=2.8  %(m s^2)
u0=[0.0 0.0 0.0]; %u0=0.0; %(ms^-1)
x0=[0.0  0.0 0.0]; %x0=0.0; %
dt=1.0; %(s)
y=[1 2 3];
l1=2000;
l2=4000;
d1=200;


%------------------------------------------
clf
plot(x0,y,'sk')
axis([-10 6000 0 4])
  
drawnow
n=2;
for k=1:230
   rv=(-1)^n;
%for k=1:300;
    if mod(k,60)==0;
        n=n+1; rv=(-1)^n;
    end
%end

hold on
if rv<0; plot(2000,.5,'or'); end;
if rv>0; plot(2000,.5,'og'); end ;  
drawnow 


 
    t=k*dt;
    x=0.5*a*dt.^2+u0*dt+x0;
    u=a*dt+u0;
    clf;
    plot(x,y,'sk');axis([-10 6000 0 4]); 
    title(num2str(k))
    drawnow
   
    x0=x;
    u0=u;
%-------------------distancia para velocidad constante-----
    if t>8 %(s)
        a=[0 0 0];
    end
%-------------------para frenar----------------------------
    
%     if k<210
% a(x>2590 & x<2610)=-0.5*u(x>2590& x<2610).^2/400;
% a(x>2990)=0.0;
% u0(x>2990)=0.0;
%     end

if rv<0;
    a(x>l1-d1)=(-0.5*u(x>l1-d1).^2)/(2*d1);
     %a(x>l1-d1)=0.0;
     u0(x>l1-d1)=0.0;
end
    
  
%------------------para volver a acelerar--------------------
if rv>0;
    a=[1 1 1];
end



end

    