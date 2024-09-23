!..


program moving
implicit none
integer	::	i,j
integer	::	n,m
real	::	temp
real,dimension(:),allocatable	::t
open(1,file="april.prn",status="unknown")
open(2,file="new.dat",status="unknown")
n=480
allocate(t(n))

do i=1,5
read(1,*)
enddo
m=14400/n
do j=1,m
do i=1,n
read(1,5)t(i)
5	format (39X,F5.2)
enddo
temp=((sum(t(:)))/n)
write(2,*)j,temp
enddo
end program moving
