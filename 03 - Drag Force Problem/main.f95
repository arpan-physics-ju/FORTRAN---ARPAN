PROGRAM real_projectile
    IMPLICIT NONE
    INTEGER :: i
    REAL    :: t,xx_t,xy_t,v,v1,theta,vx_t,vy_t,h
    OPEN(1,FILE="x.dat",STATUS="unknown")
    OPEN(2,FILE="y.dat",STATUS="unknown")
    !INITIAL VALUES
    t = 0
    xx_t = 0
    xy_t = 0
    v = 30
    theta = 0.872222222
    vx_t = (v * cos(theta))
    vy_t = (v * sin(theta))
    h = 0.001
    write(*,*)vx_t,vy_t
    ! X axis
    do i = 1, 10000
        t = t + h
		vx_t = (vx_t + (h * fx1(vx_t)))
        vy_t = (vy_t + (h * fy1(vy_t)))
        v = (((vx_t)**2 + (vy_t)**2)**(0.5))
		xx_t = (xx_t + (h * f2(vx_t)))
        xy_t = (xy_t + (h * f2(vy_t)))
        write(1,*)t,v,vx_t,vy_t
        write(2,*)xx_t,xy_t
        if (xy_t<0.0) then
        stop
        endif
    end do

contains
real function fx1(v)
		real	::v
		fx1 = (-1*v)
end function

real function fy1(v)
		real	::v
		fy1 = (-v - (9.8))
end function 

real function f2(v)
		real	::v
		f2 = v 
end function
END PROGRAM real_projectile



