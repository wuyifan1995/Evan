tic;%��ʱ����ʼ��־
file_id = fopen('dat20174.dat', 'rb');
Id       = fread(file_id, 1, 'int32');
ver    = fread(file_id, 1, 'int32');
n      = fread(file_id,1,'int32');
p       = fread(file_id,1,'int32');
q       =  fread(file_id,1,'int32');
%��ver��ֵ 258�����ѹ����ʽ��514 ����ѹ����ʽ
if ver==258
    A=zeros(n,n);%��ѹ����ʽ��������С��n*n
    for i=1:n  %��Ϊ�����ǰ��д洢�ģ�����ʹ������ѭ������ȡ�������������и�ֵ
        for j=1:n
            A(i,j)=fread(file_id,1,'float');
        end
    end
    b=fread(file_id,n,'float');%�����Ҷ˵�ϵ��
    x1=GAUSS(A,b,n,p,q);%�����ѹ���ĸ�ʽ
end
if ver==514  %514��ʾѹ����ʽ��������С��n*��p+q-1��
    A=zeros(n,p+q+1);
    for i=1:n
        for j=1:p+q+1
            A(i,j)=fread(file_id,1,'float');
        end
    end
    b=fread(file_id,n,'float');%�����Ҷ˵�ϵ��
    x2=GAUSS_CP(A,b,n,p,q);%����ѹ���ĸ�ʽ
end
toc;

fclose(file_id);