program butterfly
implicit none
integer,parameter:: ks=50000
integer,parameter:: kf=10000
real,parameter::    dt=0.01
real,allocatable::t(:),x(:),y(:),z(:)
allocate(t(ks),x(ks),y(ks),z(ks))
t(:)=0.0;x(:)=0.0;y(:)=0.0;z(:)=0.0
! Inital Condition
t(1) = 0.000
x(1) = 0.001
y(1) = 0.001
z(1) = 0.001
call solver(ks,kf,dt,t,x,y,z)
deallocate(t,x,y,z)
end program butterfly


subroutine solver(ks,kf,dt,t,x,y,z)
implicit none
integer,intent(in)::ks,kf
real,intent(in)::dt
real,intent(inout)::t(ks),x(ks),y(ks),z(ks)
integer::i,j,units
real::fx
real::fy
real::fz
character(len=200):: filename1,filename2
do i = 1,ks-1
x(i+1)=x(i)+dt*fx(x(i),y(i),z(i))
y(i+1)=y(i)+dt*fy(x(i),y(i),z(i))
z(i+1)=z(i)+dt*fz(x(i),y(i),z(i))
t(i+1)=t(i)+dt
enddo

units=5
do i=1,kf
write(filename1,'(A,I5.5)')'/home/arpan/Programming/FORTRAN/10-NLD/Lorentz equations/Butterfly Model/DataFile/file_',i
open(unit=i,file=trim(filename1)//'.dat',status='unknown',action='write')
do j=1,units
write(i,*)t(j+1),x(j+1),y(j+1),z(j+1)
enddo
j=i+kf
write(filename2,'(A,I5.5)')'/home/arpan/Programming/FORTRAN/10-NLD/Lorentz equations/Butterfly Model/DataFile/point_',i
open(unit=(j),file=trim(filename2)//'.dat',status='unknown',action='write')
write(j,*)t(units),x(units),y(units),z(units)
units=units+5
close(i)
close(j)
enddo


end subroutine solver


real function fx(x,y,z)
implicit none
real,parameter:: alpha=10.00
real,intent(in):: x,y,z
fx=alpha*(y-x)
end function

real function fy(x,y,z)
implicit none
real,parameter:: r=28.00
real,intent(in):: x,y,z
fy=((r*x)-y-(x*z))
end function

real function fz(x,y,z)
implicit none
real,parameter:: b=2.6
real,intent(in)::x,y,z
fz=((x*y)-(b*z))
end function
