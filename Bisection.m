x0=2;x1=3;%��ʼ����ֵ
l=zeros(1,2);
I=[x0,x1];%��ʼ����
f0= f_int(x0);f1= f_int(x1);%��function����������ֵ�ֵ���ڱȽ�
k=0;%�����Ĵ���
e=0.0001;%���10e-4
if abs(f0)<e
   x=x0;        
elseif abs(f1)<e
   x=x1;
else
   x=(x0+x1)/2;
   while(abs(x1-x)>=e*abs(x1))
         k=k+1;
         fx=f_int(x);
         if abs(fx)<e
             break  %�Ѿ�����f(x)<e����ֹ��������
         end
         if f1*fx<0
            x0=x;
            f0=fx;
         else
            x1=x;
            f1=fx;
         end        
         x=(x0+x1)/2;      
    end    
end
I=[x0,x1];%��������
%%������
fprintf('���̵ĸ� x :%7.5f\n������ֵΪ%.10f\n��������Ϊ%4.0f\n',x,fx,k);
