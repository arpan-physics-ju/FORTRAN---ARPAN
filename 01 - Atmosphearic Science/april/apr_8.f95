program code
implicit none
integer	::n,j,i
real	::s,t,av
open(1,file='april.prn',status='unknown')
open(2,file='arpan.dat',status='unknown')
n=5

100	do i=1,n
	read(1,*)
	enddo
s=0.0
do i=1,480
read(1,50)t
50 format (39X,F5.2)
s=s+t
enddo
av=(s/480)
write(2,*)av
n=n+1
close(1)
if(n==13926)then
stop
else
open(1,file='april.prn',status='unknown')
goto 100
endif


end program code
