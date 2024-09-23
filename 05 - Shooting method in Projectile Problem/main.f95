PROGRAM real_projectile
    IMPLICIT NONE
    INTEGER :: i
    REAL    :: t,xx_t,xy_t,v,v1,ang,theta,vx_t,vy_t,h,R,ans
    OPEN(1,FILE="x.dat",STATUS="unknown")
    OPEN(2,FILE="y.dat",STATUS="unknown")
    !write(*,*)"Range"
    !read(*,*)R
    R = 676000
    write(*,*)"Ang"
    read(*,*)ang
    theta = ((ang * 3.14)/180.0)
    !INITIAL VALUES
100 t = 0
    xx_t = 0
    xy_t = 0
    v = 1715
    vx_t = (v * cos(theta))
    vy_t = (v * sin(theta))
    h = 1
    !write(*,*)vx_t,vy_t
    ! X axis
    do i = 1, 1000000000
        t = t + h
		vx_t = (vx_t + (h * fx1(vx_t)))
        vy_t = (vy_t + (h * fy1(vy_t)))
        v = (((vx_t)**2 + (vy_t)**2)**(0.5))
		xx_t = (xx_t + (h * f2(vx_t)))
        xy_t = (xy_t + (h * f2(vy_t)))
        write(1,*)t,v,vx_t,vy_t
        write(2,*)xx_t,xy_t
        if (xy_t<0.0) then
        goto 200
        endif
    end do
    
200 if(abs(xx_t - R) < 0.1)then
    ans = ((theta * 180.0) /3.14)
    write(*,*) t,ans
    stop
    endif
    theta = theta + 0.0001
    goto 100
    


contains
real function fx1(v)
		real	::v
		fx1 = (-1*v-1*v**2)
end function

real function fy1(v)
		real	::v
		fy1 = (-v-(v**2) - (9.8))
end function 

real function f2(v)
		real	::v
		f2 = v 
end function
END PROGRAM real_projectile



