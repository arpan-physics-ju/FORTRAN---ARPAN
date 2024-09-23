program Shooting
    implicit none
    integer :: i
    real    :: range,iSpeed,pAngle,delAng,needAng
    real    :: pAnRed,t,h
    real    :: x_t,y_t,v_x,v_y,v

    range = 100.00  !KM
    
    pAngle = 50.00  !Degree
    pAnRed =  (pAngle * 0.0175)
    delAng = 0.0002
100 t = 0.0
    x_t = 0
    y_t = 0
    iSpeed = 20.0    !KM/s
    v_x = (iSpeed * cos(pAnRed))
    v_y = (iSpeed * sin(pAnRed))
    h = 0.02
    write(1,*) t, x_t,y_t,v_x,v_y,v
    
    do i = 1, 150
        t = t + h
        x_t = x_t + (h * v_x)
        y_t = y_t + (h * v_y)
        v_x = v_x + (h * fx(v_x))
        v_y = v_y + (h * fy(v_y))
        v = (((v_x)**2 + (v_y)**2 )**(0.5)) 
        !write(1,*) t, x_t,y_t,v_x,v_y,v
    end do



    if (abs(x_t - range) < 1) then 
        needAng = pAnRed
        goto 500
        else 
        if (x_t > range) then
            pAnRed = pAnRed - delAng
            goto 100
            else 
            if (x_t < range) then
                pAnRed = pAnRed + delAng
                goto 100
            endif
         endif
    endif

500 t = 0.0
    x_t = 0
    y_t = 0
    v_x = (iSpeed * cos(pAnRed))
    iSpeed = 20.0    !KM/s
    v_y = (iSpeed * sin(pAnRed))
    h = 0.02
    write(1,*) t, x_t,y_t,v_x,v_y,v

    do i = 1, 150
        t = t + h
        x_t = x_t + (h * v_x)
        y_t = y_t + (h * v_y)
        v_x = v_x + (h * fx(v_x))
        v_y = v_y + (h * fy(v_y))
        v = (((v_x)**2 + (v_y)**2 )**(0.5)) 
        write(1,*) t, x_t,y_t,v_x,v_y,v
    end do



    contains
    real function fx(v)
        real :: v
        real :: lam = 0.1
        fx = (-1 * lam * v)
    end function 
    real function fy(v)
        real :: v
        real :: lam = 0.1, g = 9.81
        fy = ((-1 * g) - (lam * v))
    end function 




end program Shooting