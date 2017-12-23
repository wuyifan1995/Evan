function [ a e ] = LSS( G,m,n )
%% 算法正文
w=zeros(m,1);
for k=1:n
    %% 形成矩阵Q_k
    z0=0;
    for i=k:m
        z0=z0+G(i,k)^2;
    end
    sgm=-sign(G(k,k))*sqrt(z0);
    w(k)=G(k,k)-sgm;
    for j=k+1:m
        w(j)=G(j,k);
    end
    beta=sgm*w(k);
    %% 变换G_k-1到G_k
    G(k,k)=sgm;
    for j=k+1:n+1
        z1=0;
        for i=k:m
            z1=z1+w(i)*G(i,j);
        end
        t=z1/beta;
    
       for i=k:m
            G(i,j)=G(i,j)+t*w(i);
       end  
    end
end
%% 解三角方程Rx=h
a=zeros(n,1);
a(n)=G(n,n+1)/G(n,n);


for i=n-1:-1:1
    z2=0;
    for j=i+1:n
      z2=z2+G(i,j)*a(j);
    end
    a(i)=(G(i,n+1)-z2)/G(i,i);
end
%% 计算误差
e=0;
for i=n+1:m
   e=e+G(i,n+1)^2;
end
end



