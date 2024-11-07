!Main Program
program strings
implicit none
integer :: n,i
real :: T,rho,del_t,del_x,l,r,Length
real,allocatable :: p(:),past1(:),past2(:)

T=80;rho=0.01;del_t=0.00001;del_x=0.001;Length=1
r=(T/rho)*((del_t/del_x)**2)
!write(*,*)r
!stop
n=30    !Chance number of Grid Points
allocate(p(n),past1(n),past2(n))

call euler(n,del_x,r,Length,p,past1,past2)

deallocate(p,past1,past2)
end program strings


!Algorithm - hyperbolic PDE
subroutine euler(n,del_x,r,Length,p,past1,past2)
implicit none
integer,intent(in)::n
real,intent(in)::del_x,r,Length
real,intent(inout)::p(n),past1(n),past2(n)
integer::i,j
real::l
real::fn
open(1,file="string_data.dat",status="unknown")

l=0.0
do i=1,n
l=(Length/n)*i
p(i)=fn(l)
end do
past1(:) = p(:)
past2(:) = p(:)
write(1,*)(past1(i),i=1,n)

do j=1,50  !time
do i=2,n-1   !space
past1(i) = p(i)
p(i) = (r*(p(i+1) - 2*p(i) + p(i-1)) + 2*p(i) - past2(i))    !Algorithm
past2(i) = p(i)
p(i) = (r*(p(i+1) - 2*p(i) + p(i-1)) + 2*p(i) - past1(i))    !Algorithm
enddo
!write(1,*)p(1),(past1(i),i=2,n-1),p(n)
!write(1,*)p(1),(past2(i),i=2,n-1),p(n)
enddo 

close(1)
end subroutine euler


!Gaussian Function - Initial shape of the wire
real function fn(l)
real,intent(in)::l
real::y,x0,k
k=1000
x0=0.5
y=0.01*exp(-k*(l-x0)**2)
fn=y
end function
