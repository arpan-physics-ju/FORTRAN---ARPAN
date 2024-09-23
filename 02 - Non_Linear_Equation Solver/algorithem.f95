subroutine solution_of_non_linear_equation(n,interval,x1,x2,x3,root)
integer	::n
real	::x1,x2,x3,root
1	x2=x1+interval
	n=0
	if ((f(x1)*f(x2))>0.0)then
		x1=x2
		goto 1
		else
2		x3=((x1+x2)/2)
		n=n+1
		if(n==100)then
			write(*,*)"Infinite loop"
			stop
		endif
		if(abs(f(x3))<0.000001)then
			root=x3
			goto 3
			else
			if(f(x3)>0)then
				x2=x3
				goto 2
				else
				x1=x3
				goto 2
			endif
		endif
	endif
3	continue



end subroutine
