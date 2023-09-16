clear all
global g v0 y0 t
t0=0; tf=10; dt=0.1;
y0=50;
v0=30;
%-----------------------------------------------------
g=-9.81;
t=t0:dt:tf;
fun='0.5*g*t.^2+v0*t+y0';
fv ='g*t+v0';

y= eval(fun); v=eval(fv);

%--------------------------------------------------------
clf
subplot 121; plot(0,y0,'ok',0*y,y,'k')
subplot 222; plot(t,y,'k')
subplot 224; plot(t,v,'k')

%--------------------------------------------------------
n=length(t);
for k=2:n
    if y(k-1)*y(k)<0
        tmn=raiz(fun,t(k-1),t(k));
    end
    if v(k-1)*v(k)<0
        tmx=raiz(fv,t(k-1),t(k));
    end
end
t=tmx; ymx=eval(fun);
t=tmn; ymn=eval(fun);
   
%    subplot 222; hold on; plot(tmn,0,'or')
%     subplot 224; hold on; plot(tmx,0,'or')
%     %----------------------------------------------
%    subplot (2,2,2); hold on; plot(tmx,ymx,'or')

clf
t=0:0.001:tmn;
fun='0.5*g*t.^2+v0*t+y0';
y=eval(fun);

plot(t,y,'k'); hold on
plot(tmx,ymx,'ob')
plot(tmn,ymn,'or')
   
% %    subplot 222; hold on; plot(t,y,'or')
% %     subplot 224; hold on; plot(tmx,ymx,'or')
% %     %----------------------------------------------
% %    subplot (2,2,2); hold on; plot(tmx,ymx,'or')