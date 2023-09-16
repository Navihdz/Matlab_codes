clear a l l ;

 %Data
 y_0 = 100;
 v_0 = 50 ;
 g = -9.81;

 %Ci c lo modela e l proceso p a r a b o l i c o en e l e j e y
 dt =0.1; clf ; subplot (1,2,1)

 for k=1:363;
 t=(k-1)*dt ;
 y=(.5* g*dt ^2)+(v_0*dt )+y_0 ;
 v=(g*dt)+v_0;
 y_0=y ;
 v_0=v ;

 subplot ( 2 , 1 , 1 )
 plot ( t , y , ' o ' )
 axis ([-5 40 -50 250 ] ) ;
 grid ( 'on' ) ;

 subplot ( 2 , 1 , 2 )
 plot ( t , v , ' o ' )
 axis ([-5 40 -100 75 ] ) ;
 grid ( 'on' )
 drawnow;

 %Condi cional que permi te a l a b o l a r e p e t i r e l proceso .
 if y<0; v_0=-v_0 ; end
 end
     