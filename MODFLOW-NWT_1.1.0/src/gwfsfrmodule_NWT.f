      MODULE GWFSFRMODULE
        CHARACTER(LEN=64), SAVE :: Version_sfr
        DOUBLE PRECISION,PARAMETER :: NEARZERO=1.0D-30
        DOUBLE PRECISION,SAVE :: THETAB, FLUXB, FLUXHLD2
        REAL,PARAMETER :: CLOSEZERO=1.0E-15
        INTEGER, SAVE :: Nfoldflbt, NUMTAB, MAXVAL
        INTEGER,SAVE,                 POINTER:: IDVFLG   !diverison recharge is active flag
        INTEGER,SAVE,  DIMENSION(:),  POINTER:: DVRCH   !(diverted recharge flag; then reharge cell count)
        INTEGER,SAVE,  DIMENSION(:,:,:),POINTER:: DVRCELL !(store cells to apply diverted recharge)
        REAL,   SAVE,  DIMENSION(:,:),POINTER:: RECHSAVE  !(store original recharge values)
        REAL,   SAVE,  DIMENSION(:,:),POINTER:: DVRPERC  !(Percentage of diversion applied to each cell)
        REAL,   SAVE,  DIMENSION(:),POINTER:: DVEFF  !(store efficiency factor)
        INTEGER,SAVE,POINTER:: NSS, NSTRM, NSFRPAR, ISTCB1, ISTCB2
        INTEGER,SAVE,POINTER:: IUZT, MAXPTS, IRTFLG, NUMTIM, NSEGDIM
        INTEGER,SAVE,POINTER:: ISFROPT, NSTRAIL, ISUZN, NSFRSETS
        INTEGER,SAVE,POINTER:: NUZST, NSTOTRL, NUMAVE
        INTEGER,SAVE,POINTER:: ITMP, IRDFLG, IPTFLG, NP
        REAL,   SAVE,POINTER:: CONST, DLEAK, WEIGHT, SFRRATIN, SFRRATOUT
        REAL   ,SAVE,POINTER:: FLWTOL, STRMDELSTOR_CUM, STRMDELSTOR_RATE
        DOUBLE PRECISION,SAVE,POINTER:: TOTSPFLOW
        INTEGER,SAVE,  DIMENSION(:),  POINTER:: IOTSG, NSEGCK
        INTEGER,SAVE,  DIMENSION(:),  POINTER:: ITRLSTH
        INTEGER,SAVE,  DIMENSION(:,:),POINTER:: ISEG, IDIVAR, ISTRM
        INTEGER,SAVE,  DIMENSION(:,:),POINTER:: LTRLIT, LTRLST
        INTEGER,SAVE,  DIMENSION(:,:),POINTER:: ITRLIT, ITRLST, NWAVST
        REAL,   SAVE,  DIMENSION(:),  POINTER:: STRIN, STROUT, FXLKOT
        REAL,   SAVE,  DIMENSION(:),  POINTER:: UHC, SGOTFLW, DVRSFLW
        REAL,   SAVE,  DIMENSION(:),  POINTER:: SFRUZBD
        REAL,   SAVE,  DIMENSION(:,:),POINTER:: SEG, STRM, SFRQ
        REAL,   SAVE,  DIMENSION(:,:),POINTER:: HWDTH, HWTPRM
        REAL,   SAVE,  DIMENSION(:,:),POINTER:: QSTAGE, XSEC
        REAL,   SAVE,  DIMENSION(:,:),POINTER:: AVDPT, AVWAT, WAT1
        REAL,   SAVE,  DIMENSION(:,:),POINTER:: CONCQ, CONCRUN, CONCPPT
        REAL,   SAVE,  DIMENSION(:,:),POINTER:: TABFLOW, TABTIME   !Reading Spedified inflow
        REAL,   SAVE,  DIMENSION(:,:),POINTER:: FNETSEEP           !writing net seepage in UZF
        INTEGER,SAVE,  DIMENSION(:,:),POINTER:: ISFRLIST           !Reading Spedified inflow
        INTEGER,SAVE,                 POINTER:: NINTOT,ITRFLG      !for LMT, total # of possible inflows edm 7/30/13
C        INTEGER,SAVE,                 POINTER:: NFLOWTYPE          !edm
        DOUBLE PRECISION,SAVE,DIMENSION(:),  POINTER:: THTS,THTR,EPS
        DOUBLE PRECISION,SAVE,DIMENSION(:),  POINTER:: FOLDFLBT, THTI
        DOUBLE PRECISION,SAVE,DIMENSION(:),  POINTER:: SUMLEAK,SUMRCH
        DOUBLE PRECISION,SAVE,DIMENSION(:),  POINTER:: HLDSFR
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: UZFLWT, UZSTOR
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: UZWDTH, UZSEEP
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: DELSTOR, WETPER
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: UZDPIT, UZDPST
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: UZTHIT, UZTHST
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: UZSPIT, UZSPST
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: UZFLIT, UZFLST
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: UZOLSFLX, HSTRM
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: QSTRM, SLKOTFLW
        DOUBLE PRECISION,SAVE,DIMENSION(:,:),POINTER:: DLKOTFLW,DLKSTAGE
      TYPE GWFSFRTYPE
        INTEGER,                      POINTER:: IDVFLG   !diverison recharge is active flag
        INTEGER,       DIMENSION(:),  POINTER:: DVRCH      !Diversions to recharge
        INTEGER,       DIMENSION(:,:,:),  POINTER:: DVRCELL  !Diversions to recharge
        REAL,          DIMENSION(:,:),POINTER:: RECHSAVE  !Diversions to recharge
        REAL,          DIMENSION(:,:),POINTER:: DVRPERC  !Diversions to recharge
        REAL,          DIMENSION(:),POINTER:: DVEFF  !Diversions to recharge
        INTEGER,     POINTER:: NSS, NSTRM, NSFRPAR, ISTCB1, ISTCB2
        INTEGER,     POINTER:: IUZT, MAXPTS, IRTFLG, NUMTIM, NSEGDIM
        INTEGER,     POINTER:: ISFROPT, NSTRAIL, ISUZN, NSFRSETS
        INTEGER,     POINTER:: NUZST, NSTOTRL, NUMAVE
        INTEGER,     POINTER:: ITMP, IRDFLG, IPTFLG, NP
        REAL,        POINTER:: CONST, DLEAK, WEIGHT, SFRRATIN, SFRRATOUT
        REAL,        POINTER:: FLWTOL, STRMDELSTOR_CUM, STRMDELSTOR_RATE
        DOUBLE PRECISION, POINTER:: TOTSPFLOW
        INTEGER,       DIMENSION(:),  POINTER:: IOTSG, NSEGCK
        INTEGER,       DIMENSION(:),  POINTER:: ITRLSTH
        INTEGER,       DIMENSION(:,:),POINTER:: ISEG, IDIVAR, ISTRM
        INTEGER,       DIMENSION(:,:),POINTER:: LTRLIT, LTRLST
        INTEGER,       DIMENSION(:,:),POINTER:: ITRLIT, ITRLST, NWAVST
        REAL,          DIMENSION(:),  POINTER:: STRIN, STROUT, FXLKOT
        REAL,          DIMENSION(:),  POINTER:: UHC, SGOTFLW, DVRSFLW
        REAL,          DIMENSION(:),  POINTER:: SFRUZBD
        REAL,          DIMENSION(:,:),POINTER:: SEG, STRM, SFRQ
        REAL,          DIMENSION(:,:),POINTER:: HWDTH, HWTPRM
        REAL,          DIMENSION(:,:),POINTER:: QSTAGE, XSEC
        REAL,          DIMENSION(:,:),POINTER:: AVDPT, AVWAT, WAT1
        REAL,          DIMENSION(:,:),POINTER:: CONCQ, CONCRUN, CONCPPT
        REAL,          DIMENSION(:,:),POINTER:: TABFLOW, TABTIME  ! Reading SPecified inflow
        REAL,          DIMENSION(:,:),POINTER:: FNETSEEP          !writing net seepage in UZF
        INTEGER,       DIMENSION(:,:),POINTER:: ISFRLIST
        INTEGER,                      POINTER:: NINTOT            !for LMT, total # of possible inflows edm 7/30/13
        DOUBLE PRECISION,     DIMENSION(:),  POINTER:: THTS,THTR,EPS
        DOUBLE PRECISION,     DIMENSION(:),  POINTER:: FOLDFLBT, THTI
        DOUBLE PRECISION,     DIMENSION(:),  POINTER:: SUMLEAK, SUMRCH
        DOUBLE PRECISION,     DIMENSION(:),  POINTER:: HLDSFR
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: UZFLWT, UZSTOR
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: UZWDTH, UZSEEP
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: DELSTOR, WETPER
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: UZDPIT, UZDPST
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: UZTHIT, UZTHST
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: UZSPIT, UZSPST
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: UZFLIT, UZFLST
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: UZOLSFLX, HSTRM
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: QSTRM, SLKOTFLW
        DOUBLE PRECISION,     DIMENSION(:,:),POINTER:: DLKOTFLW,DLKSTAGE
      END TYPE
      TYPE(GWFSFRTYPE), SAVE:: GWFSFRDAT(10)
      END MODULE GWFSFRMODULE
