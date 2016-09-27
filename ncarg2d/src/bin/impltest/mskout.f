C
C	$Id: mskout.f,v 1.4 2008-07-27 00:59:03 haley Exp $
C                                                                      
C                Copyright (C)  2000
C        University Corporation for Atmospheric Research
C                All Rights Reserved
C
C The use of this Software is governed by a License Agreement.
C
      SUBROUTINE MSKOUT(CHARCN,NUM0F,NUM1,NUM0L,IOUT)
      CHARACTER*1 BLANK,ONE,ZERO
      CHARACTER*1 CHARCN
      CHARACTER*6 BINARY
      DATA MAXLEN/72/
      DATA BINARY/'BINARY'/,ONE/'1'/,ZERO/'0'/
      DATA BLANK/' '/
      IF (NUM0F.LT.0 .OR. NUM1.LT.0  .OR. NUM0L.LT.0) GOTO 108
      IF (1+NUM0F+NUM1+NUM0L+7 .GT. MAXLEN) GOTO 108
      LAB0F=0
      IF (NUM0F.NE.0) LAB0F=4
      LAB1=0
      IF (NUM1.NE.0) LAB1=2
      LAB0L=0
      IF (NUM0L.NE.0) LAB0L=1
      LABEL=LAB0F+LAB1+LAB0L
      IF (LABEL.LE.0) GOTO 108
      GOTO (101,102,103,104,105,106,107), LABEL
  101 WRITE (IOUT,109) CHARCN,(ZERO,J=1,NUM0L),BLANK,BINARY
      RETURN
  102 WRITE (IOUT,109) CHARCN,(ONE,J=1,NUM1),BLANK,BINARY
      RETURN
  103 WRITE (IOUT,109) CHARCN,(ONE,J=1,NUM1),(ZERO,J=1,NUM0L),BLANK,
     1    BINARY
      RETURN
  104 WRITE (IOUT,109) CHARCN,(ZERO,J=1,NUM0F),BLANK,BINARY
      RETURN
  105 WRITE (IOUT,109) CHARCN,(ZERO,J=1,NUM0F),(ZERO,J=1,NUM0L),BLANK,
     1    BINARY
      RETURN
  106 WRITE (IOUT,109) CHARCN,(ZERO,J=1,NUM0F),(ONE,J=1,NUM1),BLANK,
     1    BINARY
      RETURN
  107 WRITE (IOUT,109) CHARCN,(ZERO,J=1,NUM0F),(ONE,J=1,NUM1),(ZERO,
     1    J=1,NUM0L),BLANK,BINARY
      RETURN
  108 WRITE (IOUT,110) NUM0F,NUM1,NUM0L
      STOP
  109 FORMAT(72A1)
  110 FORMAT ('0ERROR IN TEST PACKAGE.  MSKOUT CALLED WITH ILLEGAL ',
     1       'NUMBER.  SEND OUTPUT'/
     2       ' TO AUTHOR.  NUM0F=',I16,'.  NUM1=',I16,'.'/
     3      ' NUM0L=',I16,'.')
      END