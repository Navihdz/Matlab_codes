 function r=raiz (fun, a, b)
    global g v0 y0 
    e=0.01;
    for k=1E+3
        c=(a+b)/2; t=c;
        fc=eval(fun)
        if abs(fc)<e; r=c; return;end
        t=a;fa=eval(fun);
        t=b; fb=eval(fun);
        if fa*fc<0; b=c; end
        if fb*fc<0; a=c; end
    end
    

r=c;