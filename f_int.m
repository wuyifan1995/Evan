function fx= f_int( x )
syms t%定义变量t
fun=@(t)(1/pi).*cos(x*sin(t));%用句柄的方式来定义方程
fx=integral(fun,0,pi);%利用句柄的方式来定义方程这样求解出来的fx是一个数值，可直接用于计算比较。
end

