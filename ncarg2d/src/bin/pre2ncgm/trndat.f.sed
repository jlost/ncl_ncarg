C
C	$Id: trndat.f.sed,v 1.3 2008-07-27 00:59:05 haley Exp $
C                                                                      
C                Copyright (C)  2000
C        University Corporation for Atmospheric Research
C                All Rights Reserved
C
C The use of this Software is governed by a License Agreement.
C
      SUBROUTINE TRNDAT
C
C Calling this do-nothing subroutine forces "ld" to load the following
C block data routine (but only if they are in the same ".f" file).
C
        RETURN
C
      END
CNOSPLIT
      BLOCKDATA TRNDATX
C
C  DEFINE ALL CONSTANT DATA FOR THE METAFILE TRANSLATOR
C
      COMMON/TREROR/ ALLOK, MFRCHK, MTOPER, METRDC, REDERR, TYPCHG
     1             ,INVTYP, MINVLD, TYPERR, FRMEND, ENCINT, IVDCDT
     2             ,GCOERR, GCRERR, GCCERR, FCOERR, FCRERR, FCCERR
     3             ,PLIDXG, PMIDXG, TXIDXG, PGIDXG, INVLMT, CELERR
     4             ,COIERR, COLNRM, UNKNOW, UNKOPC, ENDMTF, VNEROR
     5             ,BADRSZ, DEVOUT, NOVERS, BADFNT, PGMERR, FASERR
     6             ,HINERR, VDWERR, RDWERR, RIXLIM
      INTEGER        ALLOK, MFRCHK, MTOPER, METRDC, REDERR, TYPCHG
     1             ,INVTYP, MINVLD, TYPERR, FRMEND, ENCINT, IVDCDT
     2             ,GCOERR, GCRERR, GCCERR, FCOERR, FCRERR, FCCERR
     3             ,PLIDXG, PMIDXG, TXIDXG, PGIDXG, INVLMT, CELERR
     4             ,COIERR, COLNRM, UNKNOW, UNKOPC, ENDMTF, VNEROR
     5             ,BADRSZ, DEVOUT, NOVERS, BADFNT, PGMERR, FASERR
     6             ,HINERR, VDWERR, RDWERR, RIXLIM
      COMMON /PGKSCOM/ CLPDAT, CLPFLG, POLIDX, LINTYP, LINWTH, LINCOL,
     1                LINRGB, MARIDX, MARSIZ, MARCOL, MARRGB, TXTIDX,
     2                INTSTL, PATIDX, FILCOL, FILRGB, MARTYP, HORIZ ,
     3                VERT  , PATH  , CHIGHT, XU    , YU    , XB    ,
     4                YB    , TXTCOL, FINDEX, CEXPN , CSPACE, CURIDX,
     5                CURIMP, CURINT, COLMOD, FILIDX, TXTRGB, PROPN ,
     6                FIRSTX, FIRSTY, LASTX , LASTY , TRATIO, CBV   ,
     7                CUV   , CHP   , CVP   , CCSPAC, CHHORZ, CDV   ,
     8                PMRSIZ, CLPX  , CLPY  , CLPP  , DEFREP, DEFLEN,
     9                VDCECR, TRANVN, TXTPRE, HATIDX, FILRPT, ASFSRF,
     A                ASFSDF, MAPMOD, VERSOK, PCBFST, CPGLEN, CLPNUL,
     B                MTDLEN
      INTEGER         CMPMAX, ASFMAX
      PARAMETER      (CMPMAX=256    , ASFMAX=18)
      LOGICAL         CLPFLG, PROPN , CHHORZ, DEFREP, CLPNUL, MAPMOD,
     1                VERSOK, PCBFST
      REAL            LINWTH, MARSIZ, CEXPN , CSPACE, TRATIO, CBV(2),
     1                CUV(2), CDV(2), CCSPAC
      INTEGER         CLPDAT(4)     , POLIDX, LINTYP, LINCOL, LINRGB(3),
     1                MARIDX, MARCOL, MARRGB(3)     , TXTIDX, INTSTL,
     2                PATIDX, FILCOL, FILRGB(3)     , MARTYP, HORIZ ,
     3                VERT  , PATH  , XU    , YU    , XB    , YB    ,
     4                TXTCOL, FINDEX, CURIMP(CMPMAX), CURINT(CMPMAX*3),
     5                CHIGHT, COLMOD, FILIDX, TXTRGB(3)     , CURIDX,
     6                FIRSTX, FIRSTY, LASTX , LASTY , CHP   , CVP   ,
     7                PMRSIZ, CLPX  , CLPY  , CLPP  , DEFLEN, TRANVN,
     8                TXTPRE, HATIDX, FILRPT(2)     , VDCECR(4)     ,
     9                ASFSRF(ASFMAX), ASFSDF(ASFMAX), CPGLEN, MTDLEN
      COMMON /GKSCHR/ MTDESC
      CHARACTER*80    MTDESC
      COMMON/TRINOT/ IPTR, MBUFOT, MAXBYT, DEVUNT, METUNT,
     1          METIPT, ERRUNT, FNTUNT
      INTEGER MAXCNT
      PARAMETER (MAXCNT=200)
      INTEGER IPTR, MBUFOT(MAXCNT), MAXBYT, DEVUNT, METUNT, ERRUNT,
     1        FNTUNT
      LOGICAL METIPT
      COMMON /TRFRAM/ METALL, FRINIT, FRCNT
      LOGICAL METALL, FRINIT
      INTEGER  FRCNT
      COMMON/TRCHAR/ GRCAPN, FNCAPN
      CHARACTER*1 GRCAPN(80), FNCAPN(80)
      COMMON /PTRBUFR/ METBIT, MBUFER, MDTYPE, METREC, MRECLN,
     1                MCONTF, MOPRST, LNGFLG, MERGFL
      INTEGER MNWRDS, RECLOC, RECSIZ, DTLOC, DTSIZ, MBITST, MBUFOF,
     1        MINSBD, MERLOC, MERSIZ
#if defined(cray)
      PARAMETER (MNWRDS=180, RECLOC=0, RECSIZ=16, DTLOC=16, DTSIZ=4
#else
      PARAMETER (MNWRDS=360, RECLOC=0, RECSIZ=16, DTLOC=16, DTSIZ=4
#endif
     1          ,MBITST=32, MBUFOF=32, MINSBD=16, MERLOC=23, MERSIZ=1)
      INTEGER METBIT, MBUFER(MNWRDS), MDTYPE, METREC, MRECLN, MOPRST
      LOGICAL MCONTF, LNGFLG, MERGFL
      COMMON /TRTYPE/ METMIN, METEXT, METPRT, METHED, MIOPCL, MXOPCL,
     1                MIOPID, MXOPID, ASCDEC, ASCHEX, ASCOCT, BINARY,
     2                GAHNOR, GALEFT, GACENT, GARITE, GAVNOR, GATOP ,
     3                GACAP , GAHALF, GABASE, GABOTT, GRIGHT, GLEFT ,
     4                GUP   ,
     5                GDOWN , CINDEX, CDIRCT, PENUP , PENDN , FLAGVL,
     6                SEPRVL, ASCTEK, TYPRGB, TYPBGR,
     7                TYPHLS, TYPMON, SOLID , DASHED, INVSBL, SOLPAT,
     8                ASFIND, ASFBND, ASFLNT, ASFLNW, ASFLNC, ASFMRT,
     9                ASFMRS, ASFMRC, ASFFIS, ASFFHI, ASFFPI, ASFFCO,
     A                ASFFPT, ASFFPW, ASFFPC, ASFTFI, ASFTPR, ASFTCX,
     B                ASFTCS, ASFTCO, ASCFLT, PHOLLO, PSOLID, PPATTR,
     C                PHATCH, PEMPTY, HHORIZ, HVERTI, HPOSLP, HNESLP,
     D                HHOAVE, HPOANE
      INTEGER         METMIN, METEXT, METPRT, METHED, MIOPCL, MXOPCL,
     1                MIOPID, MXOPID, ASCDEC, ASCHEX, ASCOCT, BINARY,
     2                GAHNOR, GALEFT, GACENT, GARITE, GAVNOR, GATOP ,
     3                GACAP , GAHALF, GABASE, GABOTT, GRIGHT, GLEFT ,
     4                GUP   ,
     5                GDOWN , CINDEX, CDIRCT, PENUP , PENDN , FLAGVL,
     6                SEPRVL, ASCTEK, TYPRGB, TYPBGR,
     7                TYPHLS, TYPMON, SOLID , DASHED, INVSBL, SOLPAT,
     8                ASFIND, ASFBND, ASFLNT, ASFLNW, ASFLNC, ASFMRT,
     9                ASFMRS, ASFMRC, ASFFIS, ASFFHI, ASFFPI, ASFFCO,
     A                ASFFPT, ASFFPW, ASFFPC, ASFTFI, ASFTPR, ASFTCX,
     B                ASFTCS, ASFTCO, ASCFLT, PHOLLO, PSOLID, PPATTR,
     C                PHATCH, PEMPTY, HHORIZ, HVERTI, HPOSLP, HNESLP,
     D                HHOAVE, HPOANE
      COMMON /PTRPARS/  MOPLEN, MCICPR, MCDCPR, MFLCPR, MIXCPR, MWHCPR,
     1                 MOPDLN, MCIDPR, MCDDPR, MFLDPR, MIXDPR, MWHDPR,
     2                 BYTSIZ, CONFLG, MENDPR, MENCPR
      INTEGER MOPCLL, MOPIDL, MSCLEN, MLGFLG, MCOLEN, MLOLEN
      PARAMETER (MOPCLL=4, MOPIDL=7, MCOLEN=1, MSCLEN=5, MLOLEN=15,
     1           MLGFLG=31)
       INTEGER         MOPLEN, MCICPR, MCDCPR, MFLCPR, MIXCPR, MWHCPR,
     1                 MOPDLN, MCIDPR, MCDDPR, MFLDPR, MIXDPR, MWHDPR,
     2                 BYTSIZ, CONFLG, MENDPR, MENCPR
      COMMON /TRINST/ OPCL, OPID, LEN, CONT
      INTEGER OPCL, OPID, LEN
      LOGICAL CONT
      COMMON /TRBNDL/ PMRTYP
      INTEGER PTSIZE
      PARAMETER (PTSIZE=6)
      INTEGER PMRTYP(PTSIZE)
      COMMON /TRMTYP/ FOURBT, MULTBT, TWOBT, PTSFLG, CURCOL, IPWRIT,
     1                IFRAME, ISETOP, IRANG, IPTS, ICAS, IINT, IORNT,
     2                ISIZE, IFONT, IPAT, ISSIZ, ICENT, ICOLR,
     3                MCENT, MSIZE, MOR, OLDX, OLDY, MCASE, MINTEN,
     4                MFONT, MDASH, MSPOT, MCOLOR, MLIMIT, PTSYM,
     5                SAVX, SAVY
      INTEGER FOURBT, MULTBT, TWOBT, PTSFLG, CURCOL, IPWRIT,
     1                IFRAME, ISETOP, IRANG, IPTS, ICAS, IINT, IORNT,
     2                ISIZE, IFONT, IPAT, ISSIZ, ICENT, ICOLR,
     3                MCENT, MSIZE, MOR, OLDX, OLDY, MCASE, MINTEN,
     4                MFONT, MDASH, MSPOT, MCOLOR(3), MLIMIT(4), PTSYM,
     5                SAVX, SAVY
      COMMON /TRDASH/ PATFLG, DASPAT, PATBIT, DEFPAT, DASHX, DASHY,
     1                PATVDC
      INTEGER DPATSZ, PATSIZ, DFPTSZ
      PARAMETER (DPATSZ=16, PATSIZ=320, DFPTSZ=4)
      INTEGER PATFLG, DASPAT, PATBIT, DEFPAT(DFPTSZ), DASHX,
     1        DASHY, PATVDC
      COMMON /TRBFRS/ PLBUFR, PLBFPT, PLPRVX, PLPRVY
      INTEGER PLBFMX
      PARAMETER (PLBFMX=500)
      INTEGER PLBUFR(PLBFMX*2), PLBFPT, PLPRVX, PLPRVY
      COMMON /TPGSPC/ PGVTXS,  PGSPCR, PGSPCI
      INTEGER MAXPTS
      PARAMETER (MAXPTS=12000)
      REAL    PGVTXS(MAXPTS*2), PGSPCR(MAXPTS*2)
      INTEGER PGSPCI(MAXPTS*3)
      COMMON /TMPSPC/ TEMPSP
      INTEGER MAXTMP
      PARAMETER (MAXTMP=300)
      INTEGER TEMPSP(MAXTMP)
      COMMON/TRNMAR/MARSCL, MARX, MARY, MARP, MARPR
      INTEGER MARXYS, MARNUM
      PARAMETER (MARXYS=32, MARNUM=6)
      INTEGER MARX(MARXYS), MARY(MARXYS), MARP(MARXYS), MARPR(MARNUM+1)
      REAL MARSCL
C
C  COMMON TRCODE NOTES
C
C  ALL ELEMENT CODES BELONGING TO THE SAME ID MUST BE CONTIGUOUS
C  STORAGE
C
C  WHEN ADDING TO AN EXISTING ELEMENT CLASS INSERT AT THE END OF
C  THE ELEMENT CODE LIST FOR THE CLASS, CHANGE THE COUNT ON THE
C  ELEMENT CODE COUNT, AND ADD TO TRNDATX BLOCKDATA FOR DEFINITION
C
C  WHEN CREATING A NEW ELEMENT CODE YOU NEED TO:
C       1.  CREATE AN ELEMENT CODE VARIABLE
C       2.  CREATE THE LIST OF ELEMENT CODES
C       3.  CREATE AN ELEMENT CLASS PARAMETER VARIABLE WITH THE COUNT
C           OF ELEMENT CODES
C       4.  EQUIVALENCE A POINTER TO THE BEGINNING OF THE ELEMENT CLASS LIST
C       5.  GENERATE CODE IN SUBROUTINE MELCMP SIMILAR TO THAT WHICH EXISTS
C           FOR THE OTHER ELEMENT CODES
C       6.  ADD TO TRNDATX BLOCKDATA FOR DEFINITION
C
C       LIST OF VALID ELEMENT CODES AND CLASS VARIABLES
C
C       ECDELM - DELIMITER ELEMENTS
C               CLASS CODES DELMxx, FIRST DELMBM
C       ECMDES - METAFILE DESCRIPTOR ELEMENTS
C               CLASS CODES MDESxx, FIRST MDESMV
C       ECPDEL - PICTURE DESCRIPTOR ELEMENTS
C               CLASS CODES PDELxx  FIRST PDELCS
C       ECCELM - CONTROL ELEMENTS
C               CLASS CODES CELMxx  FIRST CELMVI
C       ECGPEL - GRAPHICAL PRIMITIVE ELEMENTS
C               CLASS CODES GPELxx  FIRST GPELPL
C       ECATEL - ATTRIBUTE ELEMENTS
C               CLASS CODES ATELxx  FIRST ATELLI
C
      COMMON /PTRCODE/ ECDELM, ECMDES, ECCELM, ECPDEL, ECGPEL,
     A                ECATEL, ECESEL, ECEXEL,
     O                DELMNO, DELMBM, DELMEM, DELMBP, DELMEP, DELMBB,
     1                MDESMV, MDESMD, MDESEL, MDESDR, MDESFL,
     2                PDELCS, PDELVE, PDELBC,
     3                CELMVI, CELMCR, CELMCI,
     4                GPELPL, GPELPM, GPELTX, GPELPG, GPELCA, GPELGP,
     5                ATELLI, ATELLT, ATELLW, ATELLC, ATELMB, ATELMT,
     5                ATELMZ, ATELMC, ATELTI, ATELTF, ATELTP, ATELCE,
     5                ATELCS, ATELTC, ATELCH, ATELCO, ATELTH, ATELTA,
     5                ATELFI, ATELIS, ATELHI, ATELPI, ATELFC, ATELFR,
     5                ATELPT, ATELPS, ATELCB, ATELAS
C
C  LIST OF ELEMENT CLASS COUNTS
C
      INTEGER DELMCT, MDESCT, PDELCT, CELMCT, GPELCT, ATELCT
      PARAMETER (DELMCT=6, MDESCT=5, PDELCT=3, CELMCT=3, GPELCT=6,
     1           ATELCT=28)
C
C  DEFINE THE TYPES OF THE COMMON DATA
C
      INTEGER ECDELM, ECMDES, ECCELM, ECPDEL, ECGPEL, ECATEL, ECESEL,
     A        ECEXEL,
     O        DELMNO, DELMBM, DELMEM, DELMBP, DELMEP, DELMBB,
     1        MDESMV, MDESMD, MDESEL, MDESDR, MDESFL,
     2        PDELCS, PDELVE, PDELBC,
     3        CELMVI, CELMCR, CELMCI,
     4        GPELPL, GPELPM, GPELTX, GPELPG, GPELCA, GPELGP,
     5        ATELLI, ATELLT, ATELLW, ATELLC, ATELMB, ATELMT, ATELMZ,
     5        ATELMC, ATELTI, ATELTF, ATELTP, ATELCE, ATELCS, ATELTC,
     5        ATELCH, ATELCO, ATELTH, ATELTA, ATELFI, ATELIS, ATELHI,
     5        ATELPI, ATELFC, ATELFR, ATELPT, ATELPS, ATELCB, ATELAS
C
C  DEFINE THE CLASS CODE LIST POINTERS
C
      INTEGER DELMST(DELMCT), MDESST(MDESCT), PDELST(PDELCT),
     1        CELMST(CELMCT), GPELST(GPELCT), ATELST(ATELCT)
      EQUIVALENCE (DELMST(1), DELMNO), (MDESST(1), MDESMV),
     1            (PDELST(1), PDELCS), (CELMST(1), CELMVI),
     2            (GPELST(1), GPELPL), (ATELST(1), ATELLI)
      COMMON /TRCNTL/ INPICT, INMETA, RECINT
      LOGICAL INPICT, INMETA
      INTEGER RECINT
      COMMON /PTRDEFL/ POLIDF, LINTDF, LINWDF, TLNCDF, MARIDF, MARTDF,
     1                MARSDF, TMRCDF, PMRSDF, HORIDF, VERTDF, PATHDF,
     2                CHIGDF, XUDF, YUDF, XBDF, YBDF, TXTIDF, TTXCDF,
     3                FINDDF, CEXPDF, CSPADF, FILIDF, INTSDF, PATIDF,
     4                TFLCDF, CLPDDF, VDCEDF, CLPFDF, HATIDF, FILRDF,
     5                TXTPDF
      LOGICAL CLPFDF
      REAL LINWDF, MARSDF, CEXPDF, CSPADF
      INTEGER VDCEDF(4), CLPDDF(4), POLIDF, LINTDF, TLNCDF, MARIDF,
     1        MARTDF, TMRCDF, PMRSDF, HORIDF, VERTDF, PATHDF, CHIGDF,
     2        XUDF, YUDF, XBDF, YBDF, TXTIDF, TTXCDF, FINDDF, FILIDF,
     3        INTSDF, PATIDF, TFLCDF, HATIDF, FILRDF(2), TXTPDF
      COMMON /CAPSPC/ DUMSPC,ENDDSP
      INTEGER     DUMSIZ,DUMSM1
      PARAMETER (DUMSIZ=327, DUMSM1=DUMSIZ-1)
      INTEGER     DUMSPC(DUMSM1),ENDDSP
      COMMON /CAPDEV/ DGISTR, DGISIZ, DGESTR, DGESIZ, DTISTR,
     1                DTISIZ, DCDLLX, DCDLLY, DCDURX, DCDURY,
     3                DCOAVL, CORFMT, CORFIN, BATCH , DHCSIZ,
     4                DHCSTR, CORXOF, CORYOF, DASBIT, CORXSC,
     5                CORYSC, VDWLLX, VDWLLY, VDWURX, VDWURY
      INTEGER         DGIMAX, DGEMAX, DTIMAX, DCFTMX, DHCMAX
      PARAMETER   (DGIMAX=300, DGEMAX=150, DTIMAX=100)
      PARAMETER   (DCFTMX=30 , DHCMAX=50)
      INTEGER         DGISTR(DGIMAX), DGISIZ, DGESTR(DGEMAX),
     1                DGESIZ, DTISTR(DTIMAX), DTISIZ, DCDLLX,
     2                DCDLLY, DCDURX, DCDURY, CORFMT(DCFTMX,4),
     3                CORFIN(8)     , DHCSIZ, DHCSTR(DHCMAX),
     4                CORXOF, CORYOF, DASBIT, VDWLLX, VDWLLY,
     5                VDWURX, VDWURY
      REAL            CORXSC, CORYSC, CORRIN(8)
      LOGICAL         DCOAVL, BATCH
C  Size of the COMMON
      INTEGER         LENDEV
      PARAMETER   (LENDEV=DGIMAX+1+DGEMAX+1+DTIMAX+1+4+1+4*DCFTMX+
     1                  8+2+DHCMAX+9)
      EQUIVALENCE (CORFIN,CORRIN)
      COMMON /CAPFNT/ CHRSTR, CHREND, CHRWDT, CHRSCH, FNTRHT,
     1                FNTTOP, FNTCAP, FNTHLF, FNTBAS, FNTBOT,
     2                FNTTYP, FNTSCH, CORXST, CORXLN, CORYST,
     3                CORYLN, CORPST, CORPLN, PBEGST, PBEGLN,
     4                PENDST, PENDLN, CORSCH, NEWCLS, CPNTRS,
     5                CPNLST, CSTRKS
      INTEGER         CHRSM1, CHRSM2
      PARAMETER       (CHRSM1=128, CHRSM2=5121)
      INTEGER         CHRSTR, CHREND, CHRWDT,
     1                CHRSCH(11)    , FNTRHT, FNTTOP,
     2                FNTCAP, FNTHLF, FNTBAS, FNTBOT, FNTTYP,
     3                FNTSCH(9)     , CORXST, CORXLN,
     4                CORYST, CORYLN, CORPST, CORPLN,
     5                PBEGST, PBEGLN, PENDST, PENDLN,
     6                CORSCH(10)    ,
     7                NEWCLS(300)   ,
     8                CPNTRS(CHRSM1), CPNLST        ,
     9                CSTRKS(CHRSM2)
C
C  XLCN   --  Bit offset to extract X coordinates from fontcap.
C  YLCN   --  Bit offset to extract Y coordinates from fontcap.
C  PLCN   --  Bit offset to extract PEN control bit from fontcap.
C  FNTMAX --  Number of fonts obtained from FONT LIST (defaults to 1).
C  FNTS   --  An array of pointers associating indices obtained from
C             FONT INDEX elements with the internally supported fonts.
C             Consult the documentation in BLOCKDATA TRNDATX for a
C             list of supported fonts.
C  FLEFT  --  An array of character left values for proportionally
C             spaced fonts.
C  FRIGHT --  An array of character right values for proportionally
C             spaced fonts.
C  MXFLST --  The maximum number of strings accepted in a FONT LIST
C             element.
C  NSFNTS --  The number of distinct fonts supported internally.
C
      PARAMETER (NSFNTS=20,MXFLST=300)
      COMMON /FNTCOM/ XLCN  , YLCN  , PLCN  , FNTMAX,
     1                FNTS  , FLEFT , FRIGHT, SFLENS
      INTEGER         FLEFT(CHRSM1) , FRIGHT(CHRSM1), FNTS(MXFLST)  ,
     1                XLCN, YLCN    , PLCN  , FNTMAX
      CHARACTER*30 SFONTS(NSFNTS)
      COMMON /SUPFNT/ SFONTS
C
C  Size of common CAPFNT in words.
C
      INTEGER WRLEN
      PARAMETER (WRLEN=5600)
      COMMON /CINFO/COLVLS,INTS,NUMI
      DIMENSION COLVLS(3,256),INTS(256)
C
C  INITIALIZE COLOR MAP DATA.
C
      DATA NUMI/1/
      DATA COLVLS(1,1),COLVLS(2,1),COLVLS(3,1)/ 0.8, 0.8, 0.8/
      DATA (COLVLS(1,II),II=2,256)/255*-1.0/
      DATA (COLVLS(2,II),II=2,256)/255*-1.0/
      DATA (COLVLS(3,II),II=2,256)/255*-1.0/
C
C  INITIALIZE BUFFER POINTER
C
      DATA IPTR /0/
C
C  DEFINE THE TRANSLATOR VERSION FOR COMPARISON WITH THE METAFILE VERSION
C
      DATA TRANVN, VERSOK /-32767, .FALSE./
C
C  DEFINE THE ERROR FLAGS
C
      DATA  ALLOK, MFRCHK, MTOPER, METRDC, REDERR / 0,  1,  2,  3,  4/
      DATA TYPCHG, INVTYP, MINVLD, TYPERR, FRMEND / 5,  6,  7,  8,  9/
      DATA ENCINT, IVDCDT                         /10, 11            /
      DATA GCOERR, GCRERR, GCCERR, FCOERR, FCRERR /12, 13, 14, 15, 16/
      DATA FCCERR, PLIDXG, PMIDXG, TXIDXG, PGIDXG /17, 18, 19, 20, 21/
      DATA INVLMT, CELERR, COIERR, COLNRM, UNKNOW /22, 23, 24, 25, 26/
      DATA UNKOPC, ENDMTF, VNEROR, BADRSZ, DEVOUT /27, 28, 29, 30, 31/
      DATA NOVERS, BADFNT, PGMERR, FASERR, HINERR /32, 33, 34, 35, 36/
      DATA VDWERR, RDWERR, RIXLIM                 /37, 38, 39        /
C
C  SET THE STATE OF POLYLINE START AND END VDC
C
      DATA FIRSTX, FIRSTY, LASTX, LASTY /0, 0, 0, 0/
C
C  DEFINE THE I/O GLOBAL DATA
C
      DATA DEVUNT, METUNT, ERRUNT, FNTUNT /1, 3, 2, 4/
C
C   PORTABLE FLAG  TRUE NO COMMAND LINE AVAILABLE
C
      DATA METIPT /.FALSE./
C
C  DEFINE THE FRAME INFORMATION
C
      DATA METALL, FRINIT, FRCNT /.TRUE., .TRUE., 0/
C
C  DEFINE THE GRAPHCAP AND FONTCAP NAMES
C
      DATA (GRCAPN(II),II=1,9) /'G','R','A','P','H','C','A','P',' '/
      DATA (FNCAPN(II),II=1,6) /'F','O','N','T','0',' '/
C
C  INITIALIZE THE RECORD POINTER
C
      DATA METREC /1/
C
C  DEFINE THE TRANSLATOR TYPE FLAGS
C
      DATA METMIN, METEXT, METPRT, METHED /2, 3, 8, 4/
      DATA MIOPCL, MXOPCL, MIOPID, MXOPID /0, 7, 0, 127/
      DATA BINARY, ASCDEC, ASCHEX, ASCOCT, ASCTEK /0, 1, 2, 3, 4/
      DATA ASCFLT /5/
      DATA GAHNOR, GALEFT, GACENT, GARITE /0, 1, 2, 3/
      DATA GAVNOR, GATOP, GACAP, GAHALF, GABASE, GABOTT
     1     /0, 1, 2, 3, 4, 5/
      DATA GRIGHT, GLEFT, GUP, GDOWN /0, 1, 2, 3/
      DATA SEPRVL, FLAGVL /-1, 0/
      DATA PENUP, PENDN /0, 1/
      DATA CINDEX, CDIRCT /0, 1/
      DATA TYPMON, TYPRGB, TYPBGR, TYPHLS /0, 1, 2, 3/
      DATA INVSBL, SOLID, DASHED, SOLPAT /0, 1, 2, 65535/
      DATA PHOLLO, PSOLID, PPATTR, PHATCH, PEMPTY /0, 1, 2, 3, 4/
      DATA HHORIZ, HVERTI, HPOSLP, HNESLP         /1, 2, 3, 4   /
      DATA HHOAVE, HPOANE                         /5, 6         /
      DATA ASFIND, ASFBND /0,1/
      DATA ASFLNT, ASFLNW, ASFLNC, ASFMRT, ASFMRS /0, 1, 2, 3, 4/
      DATA ASFMRC, ASFFIS, ASFFHI, ASFFPI, ASFFCO /5, 6, 7, 8, 9/
      DATA ASFFPT, ASFFPW, ASFFPC, ASFTFI, ASFTPR /10,11,12,13,14/
      DATA ASFTCX, ASFTCS, ASFTCO /15,16,17/
C
C  SET THE DEFAULTS REPLACMENT FLAG TO NO REPLACMENT AND LENGTH TO 0
C
      DATA DEFLEN /0/
      DATA DEFREP /.FALSE./
C
C  DEFINE THE DEFAULT VDC EXTENT
C
      DATA VDCEDF /0,0,32767,32767/
C
C  SET THE DEFAULT CLIPPING TO OFF AND DEFAULT CLIP RECTANGLE.
C  SET FLAG TO INDICATE A NULL CLIPPING RECTANGLE.
C
      DATA CLPFDF /.TRUE./
      DATA CLPDDF /0,0,32767,32767/
      DATA CLPNUL /.FALSE./
C
C  DEFAULT POLYLINE INFO
C
      DATA POLIDF, LINTDF, LINWDF, TLNCDF /1, 1, 1.0, 1/
C
C  DEFAULT MARKER INFO
C
      DATA MARIDF, MARTDF, MARSDF, TMRCDF, PMRSDF /1, 3, 1.0, 1, 320/
C
C  DEFAULT TEXT AND CHARACTER INFO
C
      DATA HORIDF, VERTDF, PATHDF, CHIGDF, XUDF, YUDF /0,0,0,320,0,1/
      DATA XBDF, YBDF, TXTIDF, TTXCDF, FINDDF, CEXPDF /1,0,1,1,1,1.0/
      DATA CSPADF, TXTPDF /0.0, 0/
C
C  DEFAULT FILL INFO
C
      DATA FILIDF, INTSDF, HATIDF, PATIDF, TFLCDF /1, 0, 1, 1, 1/
      DATA FILRDF /0,0/
C
C  DEFINE THE METACODE DATA FIELD DEFAULT BIT SIZES
C
      DATA MOPDLN, MCIDPR, MCDDPR, MFLDPR, MWHDPR /16, 8, 8, 16, 16/
      DATA MIXDPR, MENDPR /16,16/
      DATA BYTSIZ, CONFLG /8, 1/
C
C  SET THE CONTINUE INSTRUCTION PACKET TO FALSE
C
      DATA MCONTF /.FALSE./
C
C  SET THE COLOR SPECIFICATION MODE TO INDEXED
C
      DATA COLMOD /0/
C
C  SET THE POLYLINE OPEN STATE TO CLOSED
C
      DATA PROPN /.FALSE./
C
C  DEFINE THE DEFAULT MARKER CHARACTERS
C
      DATA (PMRTYP(II),II=1,5) /1, 2, 3, 4, 5/
C
C  DEFINE THE DEFAULT ASPECT SOURCE FLAGS
C
      DATA ASFSDF /ASFMAX*0/
C
C   DEFINE MINIMAL METACODE DATA
C
      DATA FOURBT, MULTBT, TWOBT /0, 1, 0/
      DATA IPWRIT, IFRAME, ISETOP, IRANG, IPTS /33, 34, 35, 39, 40/
      DATA ICAS, IINT, IORNT, ISIZE, IFONT, IPAT, ISSIZ, ICENT, ICOLR
     1     /1, 2, 3, 4, 5, 6, 7, 8, 9/
C
C  SET THE DEFAULT DASH PATTERNS
C  1 SOLID, 2 DASHED, 3 DOTTED, 4 DASH-DOTTED
C    HEX solid, fofo, aaaa, f838
      DATA DEFPAT / 1, 61680, 43690, 64824/
C
C  SET THE POLYLINE BUFFERS TO EMPTY, POLYGON LENGTH TO 0.
C
      DATA PLBFPT, CPGLEN /0,0/
C
C  Define the markers.  The MARX and MARY arrays define the stroke
C  coordinates for the markers.  The MARP array defines the PEN UP/DOWN
C  flag for the coordinate strokes.  The MARPR array defines where in
C  the MARK and MARY arrays the various markers start.  The final entry
C  in MARPR should be the dimension of MARX plus 1.
C
      DATA MARX /
     1           1, -1, -1, 1, 1,
     2           0, 0, -20, 20,
     3           0, 0, 17, -17, 17, -17,
     4           0, 12, 19, 19, 12, 0, -12, -19, -19, -12, 0,
     5           14, -14, -14, 14,
     6           0, 0
     Z          /
      DATA MARY /
     1           1,  1, -1,-1, 1,
     2           20, -20, 0, 0,
     3           20, -20, 10, -10, -10, 10,
     4           20, 16, 6, -6, -16, -20, -16, -6, 6, 16, 20,
     5           14, -14, 14, -14,
     6           0, 0
     Z          /
      DATA MARP /
     1           0, 1, 1, 1, 1,
     2           0, 1, 0, 1,
     3           0, 1, 0, 1, 0, 1,
     4           0, 10*1,
     5           0, 1, 0, 1,
     6           0, 1
     Z          /
      DATA MARPR /
     1          1,
     2          6,
     3          10,
     4          16,
     5          27,
     6          31,
     7          33
     Z          /
C
C  SET THE MARKERS MAPPING SCALE FACTOR (GET MARKER SCALE 1.0 TO BE THE RIGHT
C   SIZE)
C
      DATA MARSCL /6.4/
C
C  DEFINE THE ELEMENT CLASS CODES
C
      DATA ECDELM, ECMDES, ECPDEL, ECCELM, ECGPEL, ECATEL, ECESEL,
     1     ECEXEL /
     2          0, 1, 2, 3, 4, 5, 6, 7/
C
C       DELIMITER ELEMENT CODES
C
        DATA DELMNO, DELMBM, DELMEM, DELMBP, DELMBB, DELMEP
     1          / 0, 1, 2, 3, 4, 5/
C
C       DESCRIPTOR ELEMENT CODES
C
        DATA MDESMV, MDESMD, MDESEL, MDESDR, MDESFL /1, 2, 11, 12, 13/
C
C       PICTURE DESCRIPTOR ELEMENT CODES
C
        DATA PDELCS, PDELVE, PDELBC /2, 6, 7/
C
C       CONTROL ELEMENT CODES
C
        DATA CELMVI, CELMCR, CELMCI /1,5,6/
C
C       GRAPHICAL PRIMITIVE ELEMENT CODES
C
        DATA GPELPL, GPELPM, GPELTX, GPELPG, GPELCA, GPELGP
     1          /1, 3, 4, 7, 9, 10/
C
C       DEFINE THE ATTRIBUTE ELEMENT CODES
C
        DATA ATELLI, ATELLT, ATELLW, ATELLC /1, 2, 3, 4/
        DATA ATELMB, ATELMT, ATELMZ, ATELMC /5, 6, 7, 8/
        DATA ATELTI, ATELTF, ATELTP, ATELCE, ATELCS /9, 10, 11, 12, 13/
        DATA ATELTC, ATELCH, ATELCO, ATELTH, ATELTA /14,15,16,17,18/
        DATA ATELFI, ATELIS, ATELFC, ATELHI, ATELPI /21,22,23,24,25/
        DATA ATELFR, ATELPT, ATELPS, ATELCB, ATELAS /31,32,33,34,35/
C
C  SET THE BEGIN METAFILE TO FALSE, AND IN PICTURE TO FALSE
C
      DATA INMETA, INPICT /.FALSE. , .FALSE./
C
C  SET NOT IN POLY FUNCTION
C
      DATA PCBFST /.TRUE./
C
C  PRE-CGM DATA
C
      DATA MCENT,MSIZE,MOR,MCASE,MINTEN,MFONT/ 0, 128, 0, 0, 204, 1/
      DATA DASBIT/ 100/
C
C  VIRTUAL DEVICE WINDOW
C
      DATA VDWLLX,VDWLLY,VDWURX,VDWURY/0,0,32767,32767/
C
C  INITIALIZE POINTERS INTO THE FONT LIST.
C
      DATA FNTS/MXFLST*1/
C
C  MAXIMUM NUMBER OF FONTS (THIS IS RESET FROM PARSING THE FONT LIST
C  ELEMENT IF ONE IS IN THE METAFILE DESCRIPTOR).
C
      DATA FNTMAX/1/
C
C  SUPPORTED FONT NAMES
C
      DATA SFONTS( 1)/'DEFAULT                       '/
      DATA SFONTS( 2)/'HERSHEY:CARTOGRAPHIC_ROMAN    '/
      DATA SFONTS( 3)/'HERSHEY:CARTOGRAPHIC_GREEK    '/
      DATA SFONTS( 4)/'HERSHEY:SIMPLEX_ROMAN         '/
      DATA SFONTS( 5)/'HERSHEY:SIMPLEX_GREEK         '/
      DATA SFONTS( 6)/'HERSHEY:SIMPLEX_SCRIPT        '/
      DATA SFONTS( 7)/'HERSHEY:COMPLEX_ROMAN         '/
      DATA SFONTS( 8)/'HERSHEY:COMPLEX_GREEK         '/
      DATA SFONTS( 9)/'HERSHEY:COMPLEX_SCRIPT        '/
      DATA SFONTS(10)/'HERSHEY:COMPLEX_ITALIC        '/
      DATA SFONTS(11)/'HERSHEY:COMPLEX_CYRILLIC      '/
      DATA SFONTS(12)/'HERSHEY:DUPLEX_ROMAN          '/
      DATA SFONTS(13)/'HERSHEY:TRIPLEX_ROMAN         '/
      DATA SFONTS(14)/'HERSHEY:TRIPLEX_ITALIC        '/
      DATA SFONTS(15)/'HERSHEY:GOTHIC_GERMAN         '/
      DATA SFONTS(16)/'HERSHEY:GOTHIC_ENGLISH        '/
      DATA SFONTS(17)/'HERSHEY:GOTHIC_ITALIAN        '/
      DATA SFONTS(18)/'HERSHEY:MATH_SYMBOLS          '/
      DATA SFONTS(19)/'HERSHEY:SYMBOL_SET1           '/
      DATA SFONTS(20)/'HERSHEY:SYMBOL_SET2           '/
C
      END