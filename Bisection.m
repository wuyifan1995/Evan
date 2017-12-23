x0=2;x1=3;%初始近似值
l=zeros(1,2);
I=[x0,x1];%初始区间
f0= f_int(x0);f1= f_int(x1);%用function函数算出积分的值用于比较
k=0;%迭代的次数
e=0.0001;%误差10e-4
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
             break  %已经满足f(x)<e，终止迭代过程
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
I=[x0,x1];%最终区间
%%输出结果
fprintf('方程的根 x :%7.5f\n函数的值为%.10f\n迭代次数为%4.0f\n',x,fx,k);
