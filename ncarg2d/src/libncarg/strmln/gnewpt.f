C
C       $Id: gnewpt.f,v 1.5 2008-07-27 00:17:27 haley Exp $
C                                                                      
C                Copyright (C)  2000
C        University Corporation for Atmospheric Research
C                All Rights Reserved
C
C The use of this Software is governed by a License Agreement.
C
      SUBROUTINE GNEWPT (UX,VY,IMAX,JPTSY)
C
C INTERPOLATION ROUTINE TO CALCULATE THE DISPLACEMANT COMPONENTS
C .   THE PHILOSPHY HERE IS TO UTILIZE AS MANY POINTS AS POSSIBLE
C .   (WITHIN REASON) IN ORDER TO OBTAIN A PLEASING AND ACCURATE PLOT.
C .   INTERPOLATION SCHEMES DESIRED BY OTHER USERS MAY EASILY BE
C .   SUBSTITUTED IF DESIRED.
C
      DIMENSION       UX(IMAX,JPTSY)        ,VY(IMAX,JPTSY)
      COMMON /STR01/  IS         ,IEND      ,JS        ,JEND
     1             ,  IEND1      ,JEND1     ,I         ,J
     2             ,  X          ,Y         ,DELX      ,DELY
     3             ,  ICYC1      ,IMSG1     ,IGFL1
      COMMON /STR03/  INITA , INITB , AROWL , ITERP , ITERC , IGFLG
     1             ,  IMSG , UVMSG , ICYC , DISPL , DISPC , CSTOP
C
      SAVE
C
C FDLI - DOUBLE LINEAR INTERPOLATION FORMULA
C FBESL - BESSEL 16 PT INTERPOLATION FORMULA ( MOST USED FORMULA )
C FQUAD - QUADRATIC INTERPOLATION FORMULA
C
      FDLI(Z,Z1,Z2,Z3,DX,DY) = (1.-DX)*((1.-DY)*Z +DY*Z1)
     1                         +     DX *((1.-DY)*Z2+DY*Z3)
      FBESL(Z,ZP1,ZP2,ZM1,DZ)=Z+DZ*(ZP1-Z+0.25*(DZ-1.)*((ZP2-ZP1-Z+ZM1)
     1                        +0.666667*(DZ-0.5)*(ZP2-3.*ZP1+3.*Z-ZM1)))
      FQUAD(Z,ZP1,ZM1,DZ)=Z+0.5*DZ*(ZP1-ZM1+DZ*(ZP1-2.*Z+ZM1))
C
      DX = X-AINT(X)
      DY = Y-AINT(Y)
C
      IF( IMSG.NE.0.OR.IGFLG.NE.0) GO TO 20
C
      IM1 = I-1
      IP2 = I+2
C
C DETERMINE WHICH INTERPOLATION FORMULA TO USE DEPENDING ON I,J LOCATION
C .   THE FIRST CHECK IS FOR I,J IN THE GRID INTERIOR.
C
      IF (J.GT.JS .AND. J.LT.JEND1 .AND. I.GT.IS .AND. I.LT.IEND1)
     1    GO TO 30
      IF (J.EQ.JEND1 .AND. I.GT.IS .AND. I.LT.IEND1) GO TO  40
      IF (J.EQ.JS) GO TO 20
C
      IF (ICYC1.EQ.1) GO TO 10
C
C MUST NOT BE CYCLIC
C
      IF (I.EQ.IS) GO TO 20
      IF (I.EQ.IEND1) GO TO  50
      GO TO 20
   10 CONTINUE
C
C MUST BE CYCLIC IN THE X DIRECTION
C
      IF (I.EQ.IS .AND. J.LT.JEND1) GO TO 12
      IF (I.EQ.IEND1 .AND. J.LT.JEND1) GO TO 14
      IF (J.EQ.JEND1 .AND. I.EQ.IS) GO TO 16
      IF (J.EQ.JEND1 .AND. I.EQ.IEND1) GO TO 18
      GO TO 20
   12 IM1 = IEND1
      GO TO 30
   14 IP2 = IS+1
      GO TO 30
   16 IM1 = IEND1
      GO TO 40
   18 IP2 = IS+1
      GO TO 40
C
   20 CONTINUE
C
C DOUBLE LINEAR INTERPOLATION FORMULA. THIS SCHEME WORKS AT ALL POINTS
C .   BUT THE RESULTING STREAMLINES ARE NOT AS PLEASING AS THOSE DRAWN
C .   BY FBESL OR FQUAD. CURRENTLY THIS IS USED AT THIS IS UTILIZED
C .   ONLY AT CERTAIN BOUNDARY POINTS OR IF IGFLG IS NOT EQUAL TO ZERO.
C
      DELX = FDLI (UX(I,J),UX(I,J+1),UX(I+1,J),UX(I+1,J+1),DX,DY)
      DELY = FDLI (VY(I,J),VY(I,J+1),VY(I+1,J),VY(I+1,J+1),DX,DY)
      RETURN
   30 CONTINUE
C
C USE A 16 POINT BESSEL INTERPOLATION SCHEME
C
      UJM1 = FBESL (UX(I,J-1),UX(I+1,J-1),UX(IP2,J-1),UX(IM1,J-1),DX)
      UJ   = FBESL (UX(I,J),UX(I+1,J),UX(IP2,J),UX(IM1,J),DX)
      UJP1 = FBESL (UX(I,J+1),UX(I+1,J+1),UX(IP2,J+1),UX(IM1,J+1),DX)
      UJP2 = FBESL (UX(I,J+2),UX(I+1,J+2),UX(IP2,J+2),UX(IM1,J+2),DX)
      DELX = FBESL (UJ,UJP1,UJP2,UJM1,DY)
      VJM1 = FBESL (VY(I,J-1),VY(I+1,J-1),VY(IP2,J-1),VY(IM1,J-1),DX)
      VJ   = FBESL (VY(I,J),VY(I+1,J),VY(IP2,J),VY(IM1,J),DX)
      VJP1 = FBESL (VY(I,J+1),VY(I+1,J+1),VY(IP2,J+1),VY(IM1,J+1),DX)
      VJP2 = FBESL (VY(I,J+2),VY(I+1,J+2),VY(IP2,J+2),VY(IM1,J+2),DX)
      DELY = FBESL (VJ,VJP1,VJP2,VJM1,DY)
      RETURN
   40 CONTINUE
C
C 12 POINT INTERPOLATION SCHEME APPLICABLE TO ONE ROW FROM TOP BOUNDARY
C
      UJM1 = FBESL (UX(I,J-1),UX(I+1,J-1),UX(IP2,J-1),UX(IM1,J-1),DX)
      UJ   = FBESL (UX(I,J),UX(I+1,J),UX(IP2,J),UX(IM1,J),DX)
      UJP1 = FBESL (UX(I,J+1),UX(I+1,J+1),UX(IP2,J+1),UX(IM1,J+1),DX)
      DELX = FQUAD (UJ,UJP1,UJM1,DY)
      VJM1 = FBESL (VY(I,J-1),VY(I+1,J-1),VY(IP2,J-1),VY(IM1,J-1),DX)
      VJ   = FBESL (VY(I,J),VY(I+1,J),VY(IP2,J),VY(IM1,J),DX)
      VJP1 = FBESL (VY(I,J+1),VY(I+1,J+1),VY(IP2,J+1),VY(IM1,J+1),DX)
      DELY = FQUAD (VJ,VJP1,VJM1,DY)
      RETURN
   50 CONTINUE
C
C 9 POINT INTERPOLATION SCHEME FOR USE IN THE NON-CYCLIC CASE
C .   AT I=IEND1 ; JS.LT.J AND J.LE.JEND1
C
      UJP1 = FQUAD (UX(I,J+1),UX(I+1,J+1),UX(IM1,J+1),DX)
      UJ   = FQUAD (UX(I,J),UX(I+1,J),UX(IM1,J),DX)
      UJM1 = FQUAD (UX(I,J-1),UX(I+1,J-1),UX(IM1,J-1),DX)
      DELX = FQUAD (UJ,UJP1,UJM1,DY)
      VJP1 = FQUAD (VY(I,J+1),VY(I+1,J+1),VY(IM1,J+1),DX)
      VJ   = FQUAD (VY(I,J),VY(I+1,J),VY(IM1,J),DX)
      VJM1 = FQUAD (VY(I,J-1),VY(I+1,J-1),VY(IM1,J-1),DX)
      DELY = FQUAD (VJ,VJP1,VJM1,DY)
      RETURN
      END
