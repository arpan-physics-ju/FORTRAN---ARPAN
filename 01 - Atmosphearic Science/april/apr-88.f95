program arpan
implicit none
integer::i
real::t,d,t1
open(1,file="arpan.dat",status='unknown')
open(2,file="temp.dat",status='unknown')
open(3,file="moving_av.dat",status='unknown')
do i=1,13921
	read(1,*)t
	read(2,50)d,t1
50	format(F11.8,5X,F5.2)
	write(3,60)d,t1,t
60	format(F11.8,5X,F5.2,5X,F5.2)
enddo
end
