program temp_co
!    implicit none
parameter (kx=30)
    real    ::c, f(kx), f1(kx)
    integer ::i, j, n
    character(len=20) :: filename


    write(*,*)'Enter c :'
    read(*,*)c
    write(*,*)"Generated Data: "
    f(1) = 1000.00; f(kx) = 1000.00
    do i = 2, kx-1
        f(i) = 27.00
    enddo

    open(1,file='file_001.txt',status='unknown')
    do j = 1, kx
        write(1,*) ((1.0*j)/10),1, f(j)
    end do
    
    n = 500  ! Modify this value to create more files

    do i = 2, n

        write(filename, '(A,I3.3)') 'file_', i
        open(unit=i, file=trim(filename)//'.txt', status='unknown', action='write')

        do j = 2, kx-1
            f1(j) = (f(j) + (c * (f(j+1) + f(j-1) - 2 * f(j))))
        enddo
        
        write(i, *) 0.1,0, f(1)
        write(i, *) 0.1,1, f(1)
        do j = 2, kx-1
            write(i,*) ((1.0*j)/10),0, f1(j)
            write(i,*) ((1.0*j)/10),1, f1(j)
        end do
        write(i, *) ((1.0*kx)/10),0, f(kx)
        write(i, *) ((1.0*kx)/10),1, f(kx)

        close(unit=i)

        do j = 2, kx-1
            f(j) = f1(j)
        enddo
    enddo

end program temp_co
