function x= GAUSS_CP( A,b,n,p,q )
%a(i,j)对应于压缩矩阵中的A(i,j-i+p+1)
x=zeros(1,n);
%%消去过程
for k=1:n-1
    for i=k+1:min(k+p,n)%排除0值，只算有数据的值,且考虑边界的问题，减少计算。
        A(i,k-i+p+1)=A(i,k-i+p+1)./A(k,p+1);
        for j=k+1:min(k+q,n)%排除0值，只算有数据的值,且考虑边界的问题，减少计算。
            A(i,j-i+p+1)=A(i,j-i+p+1)-A(i,k-i+p+1).*A(k,j-k+p+1);
        end
        b(i)=b(i)-A(i,k-i+p+1).*b(k);
    end
end
%%回代
x(n)=b(n)./A(n,p+1);
for k=n-1:-1:1
    S=b(k);
    for j=k+1:min(k+q,n)%排除0值，只算有数据的值,且考虑边界的问题，减少计算。
    S=S-A(k,j-k+p+1).*x(j);
    end
    x(k)=S./A(k,p+1);
end

end

