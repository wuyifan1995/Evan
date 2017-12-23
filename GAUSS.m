function x=GAUSS(A,b,n,p,q)

x=zeros(1,n);
%%��ȥ����
for k=1:n-1
    for i=k+1:min(k+p,n)
        A(i,k)=A(i,k)/A(k,k);
        for j=k+1:min(k+p,n)
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
            
        end
        b(i)=b(i)-A(i,k)*b(k);
    end
end
%%�ش�
x(n)=b(n)/A(n,n);
for k=n-1:-1:1
    S=b(k);
    for j=k+1:min(k+q,n)
    S=S-A(k,j)*x(j);
    end
    x(k)=S/A(k,k);
end

end