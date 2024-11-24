program simple_pendulum
implicit none
integer,parameter::ks=100000
integer,parameter::kf=1000
real,parameter::dt=0.0001
real,allocatable::v(:),ang(:)
allocate(v(ks),ang(ks))
v(:)=0.0
ang(:)=0.0
v(1)=1.0
ang(1)=0.4
call solver(ks,kf,dt,v,ang)
deallocate(v,ang)
end program simple_pendulum


subroutine solver(ks,kf,dt,v,ang)
implicit none
integer,intent(in)::ks,kf
real,intent(in)::dt
real,intent(inout)::v(ks),ang(ks)
integer::i,units
real::x,y,r
real::fn
character(len=200):: filename1,filename2
do i=1,ks-1
v(i+1)=(v(i)+(dt*fn(ang(i))))
ang(i+1)=ang(i)+(dt*v(i))
enddo
units=1
do i=1,kf
write(filename1,'(A,I5.5)')'file1_',i
open(unit=i,file=trim(filename1)//'.dat',status='unknown',action='write')
write(filename2,'(A,I5.5)')'file2_',i
open(unit=(i+kf),file=trim(filename2)//'.dat',status='unknown',action='write')
x=sin(ang(units+1))
y=(-1*cos(ang(units+1)))
r=sqrt((x*x)+(y*y))
write(i,*)i,x,y,v(units+1)
write((i+kf),*)i,0,0,v(units)
write((i+kf),*)i,x,y,v(units+1)
units=units+100
close(i)
close(i+kf)
enddo
end subroutine solver


real function fn(ang)
implicit none
real,parameter:: g=9.8
real,parameter:: m=10.0
real,parameter:: l=1.0
real,intent(in):: ang
real::y
y=((-1*m*(g/l))*sin(ang))
fn=y
end function
