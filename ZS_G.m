function G = ZS_G( x,y,n )
%����ָ�����ƺ�����G����
%����n-1��ָ������������һ�д��y��ֵ
m=max(size(x));
G=zeros(m,n+1);
for i=1:n
G(:,i)=x.^(i-1);
end
G(:,n+1)=log(y);% ����Ҫ��Y������
end

