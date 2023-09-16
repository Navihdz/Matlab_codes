 function r=raiz2 (y1, a, b)
global g v0y y0 v0x 
    e=0.01;
    for k=1E+3
c=(a+b)/2; t=c;
        fc= eval(y1);
        if abs(fc)<e; r=c; return;end
        t=a;fa=eval(y1);
        t=b; fb=eval(y1);
        if fa*fc<0; b=c; end
        if fb*fc<0; a=c; end
    end
    
r=c;