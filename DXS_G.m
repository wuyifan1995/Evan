function G = DXS_G( x,y,n)
%���ɶ���ʽ���ƺ�����G����
%����n-1�ζ���ʽ����������һ�д��y��ֵ
m=max(size(x));
G=zeros(m,n+1);
for i=1:n
G(:,i)=x.^(i-1);
end
G(:,n+1)=y;
end

