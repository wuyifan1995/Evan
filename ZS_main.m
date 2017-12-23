x=0:24;
y=[15 14 14 14 14 15 16 18 20 20 23 25 28 31 34 31 29 27 25 24 22 20 18 17 16];
m=max(size(x));
figure;
plot(x,y,'k *');
axis([0,25,5,45]);
%%三次指数
n=4;%n-1次的指数
G=ZS_G(x,y,n);
[a,e]=LSS(G,m,n);
xx=0:24;
yy=ones(size(xx));
for i=0:n-1
    yy=yy.*exp(a(i+1)*xx.^(i));
end

hold on;
plot(xx,yy);

aver_temprature(2)=sum(yy)/max(size(xx));
p(2)=e;
%%二次指数
n=3;
G=ZS_G(x,y,n);
[a,e]=LSS(G,m,n);
xx=0:24;
yy=ones(size(xx));
for i=0:n-1
    yy=yy.*exp(a(i+1)*xx.^(i));
end
hold on;
plot(xx,yy);
legend('散点图','三次指数','二次指数');
aver_temprature(1)=sum(yy)/max(size(xx));
p(1)=e;
