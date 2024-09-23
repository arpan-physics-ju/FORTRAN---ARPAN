real function f(x)
implicit none
real::x
f=((x**2)-2)
end function

program fx
implicit none
real	::	x1,x2,x3,n,m
real	::	f
real	::	root
	x1=
1	x2=x1+0.1
	n=0
	m=0
	if((f(x1)*f(x2))>0.0)then
		x1=x2
		goto 1
		else
2		x3=((x1+x2)/2)
		n=n+1
		if(n==1000000)then
			write(*,*)"Infinite loop"
			stop
		endif
		if(abs(f(x3))<0.1)then
			root=x3
			write(*,*)"Root 2 =",root
			x1=x3+0.1
			goto 6
			else
			if(f(x3)<0)then
				x2=x3
				goto 2
				else
				x1=x3
				goto 2
			endif
		endif
	endif


6	continue
end program fx
