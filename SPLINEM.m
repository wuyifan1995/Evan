function [M]=SPLINEM(x,y,n)
%%三次样条编程
a=zeros(1,n);
l=zeros(1,n);
u=zeros(1,n);
v=zeros(1,n);
b=zeros(1,n);
c=zeros(1,n);
m=zeros(1,n);
M=zeros(1,n);
h=zeros(1,n);
d=zeros(1,n);
%% DD算法
for i=1:n
    m(i)=y(i);
end
for k=1:2
    for i=n:-1:k+1
       m(i)= (m(i)-m(i-1))./(x(i)-x(i-k));
    end
end
h(1)=x(2)-x(1);
for i=2:n-1
    h(i)=x(i+1)-x(i);
    c(i)=h(i)./(h(i)+h(i-1));
    a(i)=1-c(i);
    b(i)=2;
    d(i)=6*m(i+1);
end
%% 补齐其他值 采用第一类边界条件
d(1)=0;
d(n)=0;
c(1)=0;
b(1)=2;
b(n)=2;
a(n)=0;
u(1)=b(1);
v(1)=d(1);
%% 追赶法
for k=2:n
    l(k)=a(k)./u(k-1);
    u(k)=b(k)-l(k).*c(k-1);
    v(k)=d(k)-l(k).*v(k-1);
end
M(n)=v(n)./u(n);
for  k=(n-1):-1:1
    M(k)=(v(k)-c(k).*M(k+1))./u(k);
end
%%
end