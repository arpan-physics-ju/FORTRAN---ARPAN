program temp_co
    implicit none

    real    ::c, f(15), f1(15)
    integer ::i, j, n
    character(len=20) :: filename


    write(*,*)'Enter c :'
    read(*,*)c
    write(*,*)"Generated Data: "
    f(1) = 1000.00; f(15) = 1000.00
    do i = 2, 14
        f(i) = 27.00
    enddo

    open(1,file='file_001.txt',status='unknown')
    do j = 1, 15
        write(1,*) j, f(j)
    end do
    
    n = 500  ! Modify this value to create more files

    do i = 2, n

        write(filename, '(A,I3.3)') 'file_', i
        open(unit=i, file=trim(filename)//'.txt', status='unknown', action='write')

        do j = 2, 14
            f1(j) = (f(j) + (c * (f(j+1) + f(j-1) - 2 * f(j))))
        enddo

        write(i, *) 1, f(1)
        do j = 2, 14
            write(i,*) j, f1(j)
        end do
        write(i, *) 15, f(15)

        close(unit=i)

        do j = 2, 14
            f(j) = f1(j)
        enddo
    enddo

end program temp_co