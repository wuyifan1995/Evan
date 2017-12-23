tic;%计时器开始标志
file_id = fopen('dat20174.dat', 'rb');
Id       = fread(file_id, 1, 'int32');
ver    = fread(file_id, 1, 'int32');
n      = fread(file_id,1,'int32');
p       = fread(file_id,1,'int32');
q       =  fread(file_id,1,'int32');
%看ver的值 258代表非压缩格式，514 代表压缩格式
if ver==258
    A=zeros(n,n);%非压缩格式，其矩阵大小是n*n
    for i=1:n  %因为数据是按行存储的，所以使用两层循环，将取出来的数据逐行赋值
        for j=1:n
            A(i,j)=fread(file_id,1,'float');
        end
    end
    b=fread(file_id,n,'float');%读出右端的系数
    x1=GAUSS(A,b,n,p,q);%处理非压缩的格式
end
if ver==514  %514表示压缩格式，其矩阵大小是n*（p+q-1）
    A=zeros(n,p+q+1);
    for i=1:n
        for j=1:p+q+1
            A(i,j)=fread(file_id,1,'float');
        end
    end
    b=fread(file_id,n,'float');%读出右端的系数
    x2=GAUSS_CP(A,b,n,p,q);%处理压缩的格式
end
toc;

fclose(file_id);