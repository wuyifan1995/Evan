function x= GAUSS_CP( A,b,n,p,q )
%a(i,j)��Ӧ��ѹ�������е�A(i,j-i+p+1)
x=zeros(1,n);
%%��ȥ����
for k=1:n-1
    for i=k+1:min(k+p,n)%�ų�0ֵ��ֻ�������ݵ�ֵ,�ҿ��Ǳ߽�����⣬���ټ��㡣
        A(i,k-i+p+1)=A(i,k-i+p+1)./A(k,p+1);
        for j=k+1:min(k+q,n)%�ų�0ֵ��ֻ�������ݵ�ֵ,�ҿ��Ǳ߽�����⣬���ټ��㡣
            A(i,j-i+p+1)=A(i,j-i+p+1)-A(i,k-i+p+1).*A(k,j-k+p+1);
        end
        b(i)=b(i)-A(i,k-i+p+1).*b(k);
    end
end
%%�ش�
x(n)=b(n)./A(n,p+1);
for k=n-1:-1:1
    S=b(k);
    for j=k+1:min(k+q,n)%�ų�0ֵ��ֻ�������ݵ�ֵ,�ҿ��Ǳ߽�����⣬���ټ��㡣
    S=S-A(k,j-k+p+1).*x(j);
    end
    x(k)=S./A(k,p+1);
end

end

