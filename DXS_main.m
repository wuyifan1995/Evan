%%����¼�벢������ͼ
x=0:24;
y=[15 14 14 14 14 15 16 18 20 20 23 25 28 31 34 31 29 27 25 24 22 20 18 17 16];
m=max(size(x));
figure;
plot(x,y,'k *');
axis([0,25,5,45]);
%%�Ĵζ���ʽ
n=5;%n-1�εĶ���ʽ
G=DXS_G(x,y,n);
[a,e]=LSS(G,m,n);
xx=0:24;
yy=zeros(size(xx));
for i=0:n-1
    yy=yy+a(i+1)*xx.^(i);
end
hold on;
plot(xx,yy);

aver_temprature(3)=sum(yy)/max(size(xx));
p(3)=e;
%%���ζ���ʽ
n=4;%n-1�εĶ���ʽ
G=DXS_G(x,y,n);
[a,e]=LSS(G,m,n);
xx=0:24;
yy=zeros(size(xx));
for i=0:n-1
    yy=yy+a(i+1)*xx.^(i);
end
hold on;
plot(xx,yy);

aver_temprature(2)=sum(yy)/max(size(xx));
p(2)=e;
%%���ζ���ʽ
n=3;%n-1�εĶ���ʽ
G=DXS_G(x,y,n);
[a,e]=LSS(G,m,n);
xx=0:24;
yy=zeros(size(xx));
for i=0:n-1
    yy=yy+a(i+1)*xx.^(i);
end
hold on;
plot(xx,yy);
legend('ɢ��ͼ','�Ĵζ���ʽ','���ζ���ʽ','���ζ���ʽ');
aver_temprature(1)=sum(yy)/max(size(xx));
p(1)=e;
