function G = ZS_G( x,y,n )
%生成指数近似函数的G矩阵
%采用n-1次指数进行拟合最后一列存放y的值
m=max(size(x));
G=zeros(m,n+1);
for i=1:n
G(:,i)=x.^(i-1);
end
G(:,n+1)=log(y);% 这里要将Y对数化
end

