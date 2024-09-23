program clock
implicit none
integer	::date,hour,minutes,second,i,j,d,h,m,s
real	::temp,time_p,time_d
open(1,file='april.prn',status='unknown')
open(2,file='newdat.dat',status='unknown')
!....FALSE READ FOR HEADER SECTION....!
do i=1,5
read(1,*)
enddo
!....PROGRAMMER'S CLOCK....!
d=1
h=0
m=-3
s=0
	j=0
do
		
		read(1,3,iostat=j)date,hour,minutes,second,temp               !..iostat..!
3		format (14X, I2, 1X, I2, 1X, I2, 1X, I2, 14X, F5.2)
		!time_d=((date-1)+((hour+(minutes/60)+(second/3600))/24))
				!..CLOCK..!	
4		m=m+3
		if(m==60)then
		m=0
		h=h+1
		endif
		if(h==24)then
		h=0
		d=d+1
		endif
		!time_p=((d-1)+((h+(m/60)+(s/3600))/24))
	if(minutes==m)then
	write(2,*)date,hour,minutes,second,temp
	else
	write(2,*)d,h,m,s,"Missing"
	if(d==31)then
	stop
	endif
	goto 4
	endif
	if(j/=0)then
	if(j==-1)then
	exit
	else
	print *, "Error"
	stop
	endif
	endif
enddo

end program clock
