A=[-4,1,1,0;1,-4,0 ,1;1,0,-3,1;0 ,1,1,-3];
b=[-70 -50 -15 -10];
n=max(size(A));
%%��ȥ����
for k=1:n-1
    for i=k+1:n
        A(i,k)=A(i,k)/A(k,k);
        for j=k+1:n
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
            
        end
        b(i)=b(i)-A(i,k)*b(k);
    end
end
%%�ش�
x(n)=b(n)/A(n,n);
for k=n-1:-1:1
    S=b(k);
    for j=k+1:n
    S=S-A(k,j)*x(j);
    end
    x(k)=S/A(k,k);
end
disp(['���Ľ��Ϊ��',num2str(x)]);