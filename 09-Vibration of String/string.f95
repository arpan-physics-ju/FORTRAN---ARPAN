program string
implicit none
integer,parameter:: kx=100
integer,parameter:: ks=999
real,parameter::    T=80.00
real,parameter::    rho=0.01
real,parameter::    del_t=0.00001
real,parameter::    del_x=0.001
real,parameter::    Length=1.00
real,allocatable:: y(:,:)
real:: r
r=((T/rho)*((del_t/del_x)**2))
write(*,*)"r = ",r
allocate(y(kx,ks))
call solver(kx,ks,r,Length,y)
deallocate(y)
end program string


subroutine solver(kx,ks,r,Length,y)
implicit none
integer,intent(in):: kx,ks
real,intent(in):: r,Length
real,intent(inout):: y(kx,ks)
integer:: i,j
real:: l
real:: fn
character(len=20):: filename
l=0.0
y(1,:)=0.00
y(kx,:)=0.00
do j=2,kx-1
l=((Length/kx)*j)
y(j,1)=fn(l)
y(j,2)=fn(l)
enddo
do i=1,ks-1
write(filename,'(A,I3.3)')'file_',i
open(unit=i,file=trim(filename)//'.dat',status='unknown',action='write')
if(i==1 .or. i==2)then
do j=1,kx
write(i,*)((Length/kx)*j),y(j,i)
enddo
else
write(i,*)(Length/kx),y(1,i)
do j=2,kx-1
y(j,i+1)=((r*y(j+1,i))+((2*(1-r))*y(j,i))+(r*y(j-1,i))-y(j,i-1))    !Algorithm
write(i,*)((Length/kx)*j),y(j,i)
enddo
write(i,*)Length,y(kx,i)
endif
close(unit=i)
enddo
end subroutine solver


!Gaussian Function - Initial shape of the wire
real function fn(l)
real,parameter::    a=0.05
real,parameter::    k=1000.00
real,parameter::    x0=0.5
real,intent(in):: l
real:: y
y=a*exp(-k*(l-x0)**2)
fn=y
end function
