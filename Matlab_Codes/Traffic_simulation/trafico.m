function trafico

ao=[1+rand(1,3)];
uo=[ zeros(1,3)];
xo=[ zeros(1,3)];

L1=2000; d1=100;
L2=4000; d2=100;

y=[1 2 3];

dt=1.0;
TS=80;

n1=1; rv1=(-1)^n1;
n2=1; rv2=(-1)^n2; 

for k=1:800

    t=k*dt;
    x=0.5*ao.*dt.^2 + uo.*dt + xo;
    u=    ao.*dt    + uo ;
    
    uo=u; xo=x;
    
%    if t==6; ao=[0 0 0]; end
    ao(u>60*10/36)=0;
%%%% cambio semaforo------------------------------------
if mod(t,TS)==0;
   [rv1]=inter(n1); %cambia el estado del semaforo 1
end
if mod(t,TS)==0;
   [rv2]=inter(n2); %cambia el estado del semaforo 2
end
  %  if mod(t,TS)==0; n1=n1+1; rv1=(-1)^n1; end
  % if mod(t,TS)==0; n2=n2+1; rv2=(-1)^n2; end
    
    clf
    subplot 211
    plot(x,y,'sk','MarkerSize',16);axis([-10 6000 0 4])
    text(500,3.7,[num2str(t) 'seg'],'fontsize',16)
    hold on
    
    if rv1>0; plot(L1,0.5,'.g','MarkerSize',20); end
    if rv1<0; plot(L1,0.5,'.r','MarkerSize',20); end
    
    if rv2>0; plot(L2,0.5,'.g','MarkerSize',20); end
    if rv2<0; plot(L2,0.5,'.r','MarkerSize',20); end
    
    if rv1<0
        ao(xo>L1-d1 & xo<=L1)=0;
        uo(xo>L1-d1 & xo<=L1)=0;
        xo(xo>L1-d1 & xo<=L1)=L1;
    else
        ao(uo==0)=1+rand(size(ao(uo==0)));
    end
    if rv2<0
        ao(xo>L2-d2 & xo<=L2)=0;
        uo(xo>L2-d2 & xo<=L2)=0;
        xo(xo>L2-d2 & xo<=L2)=L2;
    else
        ao(uo==0)=1+rand(size(ao(uo==0)));
    end
    
    subplot 413; hist(x(:),[250:500:5750]); axis([0 6000 0 50]); title('pos')
    subplot 414; hist(u(:),[  5: 10: 100]); axis([0  100 0 50]); title('vel')
    
    drawnow
    
     if mod(t,40)==0;
         ao=[ao; 1+rand(1,3)];
         uo=[uo;  zeros(1,3)];
         xo=[xo;  zeros(1,3)];
     end
     
     ao(x>6010)=NaN;
     uo(x>6010)=NaN;
     xo(x>6010)=NaN;
end

%
%funciones
%-----------------------------
function [rv,n]=inter(n)

     n=n+1;
     rv=(-1)^n; 

