function A=ecuaciones(x)
n=length(x);
j=n-2;
for i=1:n-1
A(:,i)=x.^j;
j=j-1;
end
