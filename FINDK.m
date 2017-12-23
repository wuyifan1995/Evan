function  k=FINDK(x,n,xv)
k=1;
for i=1:n-1
    if xv<=x(i+1)
        k=i;
        break
    else
        k=i+1;
    end
end