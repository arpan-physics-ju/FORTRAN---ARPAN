PROGRAM APRIL
IMPLICIT NONE
INTEGER	::i
INTEGER	::hr,mi,sec,d,dprime
REAL	::temp,day
OPEN(1,FILE='april.prn',STATUS='unknown')
OPEN(2,FILE='temp.dat',STATUS='unknown')

DO i=1,5
READ(1,*)
ENDDO

DO i=1,14400
READ(1,3)d,hr, mi, sec, temp
3	FORMAT (14X, I2, 1X, I2, 1X, I2, 1X, I2, 14X, F5.2)
dprime=d-1
day=(((((((1.0*sec)/60)+mi)/60)+hr)/24)+dprime)
WRITE(2,7)day,temp
7	FORMAT	(F11.8, 5X, F5.2)
ENDDO

END PROGRAM APRIL
