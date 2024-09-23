program create_files
    implicit none
    integer :: i, n
    character(len=20) :: filename

    ! Define the number of files to create
    n = 999  ! Modify this value to create more files

    do i = 1, n
        ! Create a filename using the index i
        write(filename, '(A,I3.3)') 'file_', i

        ! Open the file with the dynamically created filename
        open(unit=i, file=trim(filename)//'.txt', status='unknown', action='write')

        ! Write some data into the file (example data)
        write(i, *) 'This is file number ', i

        ! Close the file
        close(unit=i)
    end do

end program create_files
