program temp_co
    implicit none
    real    ::c, f(15), f1(15)
    integer ::i, j
    write(*,*)'Enter c :'
    read(*,*)c
    write(*,*)"Generated Data: "
    f(1) = 1000.00; f(15) = 100.00
    do i = 2, 14
        f(i) = 27.00
    enddo
100 format (I3,'.',2x, f7.2,2x,13(f7.2,2x),f7.2)
    do i = 1,999
        do j = 2, 14
            f1(j) = (f(j) + (c * (f(j+1) + f(j-1) - 2 * f(j))))
        enddo
        write(1,100)i,f(1), (f1(j), j = 2, 14), f(15)

        do j = 2, 14
            f(j) = f1(j)
        enddo
    enddo
end program temp_co