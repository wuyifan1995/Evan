function fx= f_int( x )
syms t%�������t
fun=@(t)(1/pi).*cos(x*sin(t));%�þ���ķ�ʽ�����巽��
fx=integral(fun,0,pi);%���þ���ķ�ʽ�����巽��������������fx��һ����ֵ����ֱ�����ڼ���Ƚϡ�
end

