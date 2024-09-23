program oscillator
    implicit none
    integer::i
    real::gama,omgsq,h,t,x_t,v_t,f1,f2
    open(1, file="Damp1-ld.dat", status="unknown")
    ! Gamma and Ommega_sq
        gama = 0.5
        omgsq = 10.0
    ! Time increment
	    h = 0.01		!Sec
    ! Initial Cond^n
        t = 0			!Sec
        x_t = 0         !cm
        v_t = 1         !cm/sec
        write(1,*)t,x_t,v_t
        do i = 1, 10000
            t = t + h
            x_t = x_t + (h * (f1(v_t)))
            v_t = v_t + (h * (f2(x_t,v_t,gama,omgsq)))
            write(1,*)t,x_t,v_t
        enddo
end program oscillator


real function f1(v)
    real::v
    f1 = v
end function f1
real function f2(x,v,gama,omgsq)
    real::x,v,gama,omgsq
    f2 = (-1 * ((gama * v) + (omgsq * x)))
end function f2
