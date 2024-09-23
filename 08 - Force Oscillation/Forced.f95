program Force_Oscillation
implicit none
integer::n
real:: m,b,k,F,w0,w,gama,F0,t,x,v,h,t_final

m=1.0; b=1.0; k=80.0; F=80.0
w0=sqrt(k/m);w=2*sqrt(w0*w0-b*b);gama=b/m;F0=F/m

t=0;x=0.5;v=0.0;h=0.01;t_final=20.0
n=int(t_final/h)
call euler(n,t,h,x,v,f0,w,gama,w0)
end program Force_Oscillation


subroutine euler(n,t,h,x,v,f0,w,gama,w0)
implicit none
integer::i,n
real::t,h,x,f,v,g,f0,w,gama,w0
open(1,file="FO.dat",status="unknown")
write(1,*)t,x,v
do i=1,n
t=t+h
x=x+h*f(v)
v=v+h*g(f0,w,t,gama,v,w0,x)
write(1,*)t,x,v
enddo
endsubroutine euler


real function f(xdot)
real::xdot
f=xdot
endfunction f


real function g(f0,w,t,gama,xdot,w0,x)
real::f0,w,t,gama,xdot,w0,x
g=(f0*cos(w*t)-gama*xdot-w0*w0*x)
endfunction g



