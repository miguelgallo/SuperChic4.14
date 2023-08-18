      SUBROUTINE SMATRIX_CUB(P,ANS)
C     
C     Generated by MadGraph5_aMC@NLO v. 3.1.1, 2021-05-28
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     MadGraph5_aMC@NLO StandAlone Version
C     
C     Returns amplitude squared summed/avg over colors
C     and helicities
C     for the point in phase space P(0:3,NEXTERNAL)
C     
C     Process: c u~ > u~ c w+ w- QCD=0 @12
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER    NINITIAL
      PARAMETER (NINITIAL=2)
      INTEGER NPOLENTRIES
      PARAMETER (NPOLENTRIES=(NEXTERNAL+1)*6)
      INTEGER                 NCOMB
      PARAMETER (             NCOMB=144)
      INTEGER HELAVGFACTOR
      PARAMETER (HELAVGFACTOR=4)
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
CF2PY INTENT(OUT) :: ANS
CF2PY INTENT(IN) :: P(0:3,NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER NHEL(NEXTERNAL,NCOMB),NTRY
C     put in common block to expose this variable to python interface
      COMMON/PROCESS_NHEL_CUB/NHEL
      REAL*8 T
      REAL*8 MATRIX_CUB
      INTEGER IHEL,IDEN, I, J
C     For a 1>N process, them BEAMTWO_HELAVGFACTOR would be set to 1.
      INTEGER BEAMS_HELAVGFACTOR(2)
      DATA (BEAMS_HELAVGFACTOR(I),I=1,2)/2,2/
      INTEGER JC(NEXTERNAL)
      LOGICAL GOODHEL(NCOMB)
      DATA NTRY/0/
      DATA GOODHEL/NCOMB*.FALSE./

C     
C     GLOBAL VARIABLES
C     
      INTEGER USERHEL
      COMMON/HELUSERCHOICE_CUB/USERHEL
      DATA USERHEL/-1/
      LOGICAL HELRESET_CUB
      COMMON/HELRESET_CUB/HELRESET_CUB
      DATA HELRESET_CUB/.TRUE./

      DATA (NHEL(I,   1),I=1,6) / 1,-1, 1,-1,-1, 1/
      DATA (NHEL(I,   2),I=1,6) / 1,-1, 1,-1,-1, 0/
      DATA (NHEL(I,   3),I=1,6) / 1,-1, 1,-1,-1,-1/
      DATA (NHEL(I,   4),I=1,6) / 1,-1, 1,-1, 0, 1/
      DATA (NHEL(I,   5),I=1,6) / 1,-1, 1,-1, 0, 0/
      DATA (NHEL(I,   6),I=1,6) / 1,-1, 1,-1, 0,-1/
      DATA (NHEL(I,   7),I=1,6) / 1,-1, 1,-1, 1, 1/
      DATA (NHEL(I,   8),I=1,6) / 1,-1, 1,-1, 1, 0/
      DATA (NHEL(I,   9),I=1,6) / 1,-1, 1,-1, 1,-1/
      DATA (NHEL(I,  10),I=1,6) / 1,-1, 1, 1,-1, 1/
      DATA (NHEL(I,  11),I=1,6) / 1,-1, 1, 1,-1, 0/
      DATA (NHEL(I,  12),I=1,6) / 1,-1, 1, 1,-1,-1/
      DATA (NHEL(I,  13),I=1,6) / 1,-1, 1, 1, 0, 1/
      DATA (NHEL(I,  14),I=1,6) / 1,-1, 1, 1, 0, 0/
      DATA (NHEL(I,  15),I=1,6) / 1,-1, 1, 1, 0,-1/
      DATA (NHEL(I,  16),I=1,6) / 1,-1, 1, 1, 1, 1/
      DATA (NHEL(I,  17),I=1,6) / 1,-1, 1, 1, 1, 0/
      DATA (NHEL(I,  18),I=1,6) / 1,-1, 1, 1, 1,-1/
      DATA (NHEL(I,  19),I=1,6) / 1,-1,-1,-1,-1, 1/
      DATA (NHEL(I,  20),I=1,6) / 1,-1,-1,-1,-1, 0/
      DATA (NHEL(I,  21),I=1,6) / 1,-1,-1,-1,-1,-1/
      DATA (NHEL(I,  22),I=1,6) / 1,-1,-1,-1, 0, 1/
      DATA (NHEL(I,  23),I=1,6) / 1,-1,-1,-1, 0, 0/
      DATA (NHEL(I,  24),I=1,6) / 1,-1,-1,-1, 0,-1/
      DATA (NHEL(I,  25),I=1,6) / 1,-1,-1,-1, 1, 1/
      DATA (NHEL(I,  26),I=1,6) / 1,-1,-1,-1, 1, 0/
      DATA (NHEL(I,  27),I=1,6) / 1,-1,-1,-1, 1,-1/
      DATA (NHEL(I,  28),I=1,6) / 1,-1,-1, 1,-1, 1/
      DATA (NHEL(I,  29),I=1,6) / 1,-1,-1, 1,-1, 0/
      DATA (NHEL(I,  30),I=1,6) / 1,-1,-1, 1,-1,-1/
      DATA (NHEL(I,  31),I=1,6) / 1,-1,-1, 1, 0, 1/
      DATA (NHEL(I,  32),I=1,6) / 1,-1,-1, 1, 0, 0/
      DATA (NHEL(I,  33),I=1,6) / 1,-1,-1, 1, 0,-1/
      DATA (NHEL(I,  34),I=1,6) / 1,-1,-1, 1, 1, 1/
      DATA (NHEL(I,  35),I=1,6) / 1,-1,-1, 1, 1, 0/
      DATA (NHEL(I,  36),I=1,6) / 1,-1,-1, 1, 1,-1/
      DATA (NHEL(I,  37),I=1,6) / 1, 1, 1,-1,-1, 1/
      DATA (NHEL(I,  38),I=1,6) / 1, 1, 1,-1,-1, 0/
      DATA (NHEL(I,  39),I=1,6) / 1, 1, 1,-1,-1,-1/
      DATA (NHEL(I,  40),I=1,6) / 1, 1, 1,-1, 0, 1/
      DATA (NHEL(I,  41),I=1,6) / 1, 1, 1,-1, 0, 0/
      DATA (NHEL(I,  42),I=1,6) / 1, 1, 1,-1, 0,-1/
      DATA (NHEL(I,  43),I=1,6) / 1, 1, 1,-1, 1, 1/
      DATA (NHEL(I,  44),I=1,6) / 1, 1, 1,-1, 1, 0/
      DATA (NHEL(I,  45),I=1,6) / 1, 1, 1,-1, 1,-1/
      DATA (NHEL(I,  46),I=1,6) / 1, 1, 1, 1,-1, 1/
      DATA (NHEL(I,  47),I=1,6) / 1, 1, 1, 1,-1, 0/
      DATA (NHEL(I,  48),I=1,6) / 1, 1, 1, 1,-1,-1/
      DATA (NHEL(I,  49),I=1,6) / 1, 1, 1, 1, 0, 1/
      DATA (NHEL(I,  50),I=1,6) / 1, 1, 1, 1, 0, 0/
      DATA (NHEL(I,  51),I=1,6) / 1, 1, 1, 1, 0,-1/
      DATA (NHEL(I,  52),I=1,6) / 1, 1, 1, 1, 1, 1/
      DATA (NHEL(I,  53),I=1,6) / 1, 1, 1, 1, 1, 0/
      DATA (NHEL(I,  54),I=1,6) / 1, 1, 1, 1, 1,-1/
      DATA (NHEL(I,  55),I=1,6) / 1, 1,-1,-1,-1, 1/
      DATA (NHEL(I,  56),I=1,6) / 1, 1,-1,-1,-1, 0/
      DATA (NHEL(I,  57),I=1,6) / 1, 1,-1,-1,-1,-1/
      DATA (NHEL(I,  58),I=1,6) / 1, 1,-1,-1, 0, 1/
      DATA (NHEL(I,  59),I=1,6) / 1, 1,-1,-1, 0, 0/
      DATA (NHEL(I,  60),I=1,6) / 1, 1,-1,-1, 0,-1/
      DATA (NHEL(I,  61),I=1,6) / 1, 1,-1,-1, 1, 1/
      DATA (NHEL(I,  62),I=1,6) / 1, 1,-1,-1, 1, 0/
      DATA (NHEL(I,  63),I=1,6) / 1, 1,-1,-1, 1,-1/
      DATA (NHEL(I,  64),I=1,6) / 1, 1,-1, 1,-1, 1/
      DATA (NHEL(I,  65),I=1,6) / 1, 1,-1, 1,-1, 0/
      DATA (NHEL(I,  66),I=1,6) / 1, 1,-1, 1,-1,-1/
      DATA (NHEL(I,  67),I=1,6) / 1, 1,-1, 1, 0, 1/
      DATA (NHEL(I,  68),I=1,6) / 1, 1,-1, 1, 0, 0/
      DATA (NHEL(I,  69),I=1,6) / 1, 1,-1, 1, 0,-1/
      DATA (NHEL(I,  70),I=1,6) / 1, 1,-1, 1, 1, 1/
      DATA (NHEL(I,  71),I=1,6) / 1, 1,-1, 1, 1, 0/
      DATA (NHEL(I,  72),I=1,6) / 1, 1,-1, 1, 1,-1/
      DATA (NHEL(I,  73),I=1,6) /-1,-1, 1,-1,-1, 1/
      DATA (NHEL(I,  74),I=1,6) /-1,-1, 1,-1,-1, 0/
      DATA (NHEL(I,  75),I=1,6) /-1,-1, 1,-1,-1,-1/
      DATA (NHEL(I,  76),I=1,6) /-1,-1, 1,-1, 0, 1/
      DATA (NHEL(I,  77),I=1,6) /-1,-1, 1,-1, 0, 0/
      DATA (NHEL(I,  78),I=1,6) /-1,-1, 1,-1, 0,-1/
      DATA (NHEL(I,  79),I=1,6) /-1,-1, 1,-1, 1, 1/
      DATA (NHEL(I,  80),I=1,6) /-1,-1, 1,-1, 1, 0/
      DATA (NHEL(I,  81),I=1,6) /-1,-1, 1,-1, 1,-1/
      DATA (NHEL(I,  82),I=1,6) /-1,-1, 1, 1,-1, 1/
      DATA (NHEL(I,  83),I=1,6) /-1,-1, 1, 1,-1, 0/
      DATA (NHEL(I,  84),I=1,6) /-1,-1, 1, 1,-1,-1/
      DATA (NHEL(I,  85),I=1,6) /-1,-1, 1, 1, 0, 1/
      DATA (NHEL(I,  86),I=1,6) /-1,-1, 1, 1, 0, 0/
      DATA (NHEL(I,  87),I=1,6) /-1,-1, 1, 1, 0,-1/
      DATA (NHEL(I,  88),I=1,6) /-1,-1, 1, 1, 1, 1/
      DATA (NHEL(I,  89),I=1,6) /-1,-1, 1, 1, 1, 0/
      DATA (NHEL(I,  90),I=1,6) /-1,-1, 1, 1, 1,-1/
      DATA (NHEL(I,  91),I=1,6) /-1,-1,-1,-1,-1, 1/
      DATA (NHEL(I,  92),I=1,6) /-1,-1,-1,-1,-1, 0/
      DATA (NHEL(I,  93),I=1,6) /-1,-1,-1,-1,-1,-1/
      DATA (NHEL(I,  94),I=1,6) /-1,-1,-1,-1, 0, 1/
      DATA (NHEL(I,  95),I=1,6) /-1,-1,-1,-1, 0, 0/
      DATA (NHEL(I,  96),I=1,6) /-1,-1,-1,-1, 0,-1/
      DATA (NHEL(I,  97),I=1,6) /-1,-1,-1,-1, 1, 1/
      DATA (NHEL(I,  98),I=1,6) /-1,-1,-1,-1, 1, 0/
      DATA (NHEL(I,  99),I=1,6) /-1,-1,-1,-1, 1,-1/
      DATA (NHEL(I, 100),I=1,6) /-1,-1,-1, 1,-1, 1/
      DATA (NHEL(I, 101),I=1,6) /-1,-1,-1, 1,-1, 0/
      DATA (NHEL(I, 102),I=1,6) /-1,-1,-1, 1,-1,-1/
      DATA (NHEL(I, 103),I=1,6) /-1,-1,-1, 1, 0, 1/
      DATA (NHEL(I, 104),I=1,6) /-1,-1,-1, 1, 0, 0/
      DATA (NHEL(I, 105),I=1,6) /-1,-1,-1, 1, 0,-1/
      DATA (NHEL(I, 106),I=1,6) /-1,-1,-1, 1, 1, 1/
      DATA (NHEL(I, 107),I=1,6) /-1,-1,-1, 1, 1, 0/
      DATA (NHEL(I, 108),I=1,6) /-1,-1,-1, 1, 1,-1/
      DATA (NHEL(I, 109),I=1,6) /-1, 1, 1,-1,-1, 1/
      DATA (NHEL(I, 110),I=1,6) /-1, 1, 1,-1,-1, 0/
      DATA (NHEL(I, 111),I=1,6) /-1, 1, 1,-1,-1,-1/
      DATA (NHEL(I, 112),I=1,6) /-1, 1, 1,-1, 0, 1/
      DATA (NHEL(I, 113),I=1,6) /-1, 1, 1,-1, 0, 0/
      DATA (NHEL(I, 114),I=1,6) /-1, 1, 1,-1, 0,-1/
      DATA (NHEL(I, 115),I=1,6) /-1, 1, 1,-1, 1, 1/
      DATA (NHEL(I, 116),I=1,6) /-1, 1, 1,-1, 1, 0/
      DATA (NHEL(I, 117),I=1,6) /-1, 1, 1,-1, 1,-1/
      DATA (NHEL(I, 118),I=1,6) /-1, 1, 1, 1,-1, 1/
      DATA (NHEL(I, 119),I=1,6) /-1, 1, 1, 1,-1, 0/
      DATA (NHEL(I, 120),I=1,6) /-1, 1, 1, 1,-1,-1/
      DATA (NHEL(I, 121),I=1,6) /-1, 1, 1, 1, 0, 1/
      DATA (NHEL(I, 122),I=1,6) /-1, 1, 1, 1, 0, 0/
      DATA (NHEL(I, 123),I=1,6) /-1, 1, 1, 1, 0,-1/
      DATA (NHEL(I, 124),I=1,6) /-1, 1, 1, 1, 1, 1/
      DATA (NHEL(I, 125),I=1,6) /-1, 1, 1, 1, 1, 0/
      DATA (NHEL(I, 126),I=1,6) /-1, 1, 1, 1, 1,-1/
      DATA (NHEL(I, 127),I=1,6) /-1, 1,-1,-1,-1, 1/
      DATA (NHEL(I, 128),I=1,6) /-1, 1,-1,-1,-1, 0/
      DATA (NHEL(I, 129),I=1,6) /-1, 1,-1,-1,-1,-1/
      DATA (NHEL(I, 130),I=1,6) /-1, 1,-1,-1, 0, 1/
      DATA (NHEL(I, 131),I=1,6) /-1, 1,-1,-1, 0, 0/
      DATA (NHEL(I, 132),I=1,6) /-1, 1,-1,-1, 0,-1/
      DATA (NHEL(I, 133),I=1,6) /-1, 1,-1,-1, 1, 1/
      DATA (NHEL(I, 134),I=1,6) /-1, 1,-1,-1, 1, 0/
      DATA (NHEL(I, 135),I=1,6) /-1, 1,-1,-1, 1,-1/
      DATA (NHEL(I, 136),I=1,6) /-1, 1,-1, 1,-1, 1/
      DATA (NHEL(I, 137),I=1,6) /-1, 1,-1, 1,-1, 0/
      DATA (NHEL(I, 138),I=1,6) /-1, 1,-1, 1,-1,-1/
      DATA (NHEL(I, 139),I=1,6) /-1, 1,-1, 1, 0, 1/
      DATA (NHEL(I, 140),I=1,6) /-1, 1,-1, 1, 0, 0/
      DATA (NHEL(I, 141),I=1,6) /-1, 1,-1, 1, 0,-1/
      DATA (NHEL(I, 142),I=1,6) /-1, 1,-1, 1, 1, 1/
      DATA (NHEL(I, 143),I=1,6) /-1, 1,-1, 1, 1, 0/
      DATA (NHEL(I, 144),I=1,6) /-1, 1,-1, 1, 1,-1/
      DATA IDEN/36/

      INTEGER POLARIZATIONS(0:NEXTERNAL,0:5)
      COMMON/BORN_BEAM_POL_CUB/POLARIZATIONS
      DATA ((POLARIZATIONS(I,J),I=0,NEXTERNAL),J=0,5)/NPOLENTRIES*-1/

C     
C     FUNCTIONS
C     
      LOGICAL IS_BORN_HEL_SELECTED

C     ----------
C     Check if helreset mode is on
C     ---------
      IF (HELRESET_CUB) THEN
        NTRY = 0
        DO I=1,NCOMB
          GOODHEL(I) = .FALSE.
        ENDDO
        HELRESET_CUB = .FALSE.
      ENDIF

C     ----------
C     BEGIN CODE
C     ----------
      IF(USERHEL.EQ.-1) NTRY=NTRY+1
      DO IHEL=1,NEXTERNAL
        JC(IHEL) = +1
      ENDDO
C     When spin-2 particles are involved, the Helicity filtering is
C      dangerous for the 2->1 topology.
C     This is because depending on the MC setup the initial PS points
C      have back-to-back initial states
C     for which some of the spin-2 helicity configurations are zero.
C      But they are no longer zero
C     if the point is boosted on the z-axis. Remember that HELAS
C      helicity amplitudes are no longer
C     lorentz invariant with expternal spin-2 particles (only the
C      helicity sum is).
C     For this reason, we simply remove the filterin when there is
C      only three external particles.
      IF (NEXTERNAL.LE.3) THEN
        DO IHEL=1,NCOMB
          GOODHEL(IHEL)=.TRUE.
        ENDDO
      ENDIF
      ANS = 0D0
      DO IHEL=1,NCOMB
        IF (USERHEL.EQ.-1.OR.USERHEL.EQ.IHEL) THEN
          IF (GOODHEL(IHEL) .OR. NTRY .LT. 20.OR.USERHEL.NE.-1) THEN
            IF(NTRY.GE.2.AND.POLARIZATIONS(0,0).NE.
     $       -1.AND.(.NOT.IS_BORN_HEL_SELECTED(IHEL))) THEN
              CYCLE
            ENDIF
            T=MATRIX_CUB(P ,NHEL(1,IHEL),JC(1))
            IF(POLARIZATIONS(0,0).EQ.-1.OR.IS_BORN_HEL_SELECTED(IHEL))
     $        THEN
              ANS=ANS+T
            ENDIF
            IF (T .NE. 0D0 .AND. .NOT.    GOODHEL(IHEL)) THEN
              GOODHEL(IHEL)=.TRUE.
            ENDIF
          ENDIF
        ENDIF
      ENDDO
      ANS=ANS/DBLE(IDEN)
      IF(USERHEL.NE.-1) THEN
        ANS=ANS*HELAVGFACTOR
      ELSE
        DO J=1,NINITIAL
          IF (POLARIZATIONS(J,0).NE.-1) THEN
            ANS=ANS*BEAMS_HELAVGFACTOR(J)
            ANS=ANS/POLARIZATIONS(J,0)
          ENDIF
        ENDDO
      ENDIF
      END


      REAL*8 FUNCTION MATRIX_CUB(P,NHEL,IC)
C     
C     Generated by MadGraph5_aMC@NLO v. 3.1.1, 2021-05-28
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     Returns amplitude squared -- no average over initial
C      state/symmetry factor
C     for the point with external lines W(0:6,NEXTERNAL)
C     
C     Process: c u~ > u~ c w+ w- QCD=0 @12
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NGRAPHS
      PARAMETER (NGRAPHS=51)
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER    NWAVEFUNCS, NCOLOR
      PARAMETER (NWAVEFUNCS=17, NCOLOR=1)
      REAL*8     ZERO
      PARAMETER (ZERO=0D0)
      COMPLEX*16 IMAG1
      PARAMETER (IMAG1=(0D0,1D0))
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL)
      INTEGER NHEL(NEXTERNAL), IC(NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER I,J
      COMPLEX*16 ZTEMP
      REAL*8 CF(NCOLOR,NCOLOR)
      COMPLEX*16 AMP(NGRAPHS), JAMP(NCOLOR), TMP_JAMP(0)
      COMPLEX*16 W(20,NWAVEFUNCS)
      COMPLEX*16 DUM0,DUM1
      DATA DUM0, DUM1/(0D0, 0D0), (1D0, 0D0)/
      double precision mdl_ww0,mdl_wz0
      logical match
C     
C     GLOBAL VARIABLES
C     
      INCLUDE 'coupl.inc'
      include 'wwpars.f'
      include 'pol.f'
      
      mdl_ww0=mdl_ww
      mdl_wz0=mdl_wz
      mdl_ww=0d0
      mdl_wz=0d0

      call wwpol_match(pol,nhel(5),nhel(6),match)
      if(match.eqv..false.)then
         matrix_cub=0d0
         return
      endif


      if(nhel(1)/nhel(4).lt.0)then ! helicity conservation along line - speed things up
         matrix_cub=0d0
         return
      endif

      if(nhel(2)/nhel(3).lt.0)then
         matrix_cub=0d0
         return
      endif
      

C     
C     COLOR DATA
C     
      DATA (CF(I,  1),I=  1,  1) /9.000000000000000D+00/
C     1 T(2,3) T(4,1)
C     ----------
C     BEGIN CODE
C     ----------
      CALL IXXXXX(P(0,1),ZERO,NHEL(1),+1*IC(1),W(1,1))
      CALL OXXXXX(P(0,2),ZERO,NHEL(2),-1*IC(2),W(1,2))
      CALL IXXXXX(P(0,3),ZERO,NHEL(3),-1*IC(3),W(1,3))
      CALL OXXXXX(P(0,4),ZERO,NHEL(4),+1*IC(4),W(1,4))
      CALL VXXXXX(P(0,5),MDL_MW,NHEL(5),+1*IC(5),W(1,5))
      CALL VXXXXX(P(0,6),MDL_MW,NHEL(6),+1*IC(6),W(1,6))
      CALL FFV1P0_3(W(1,1),W(1,4),GC_2,ZERO,ZERO,W(1,7))
      CALL FFV1P0_3(W(1,3),W(1,2),GC_2,ZERO,ZERO,W(1,8))
C     Amplitude(s) for diagram number 1
      CALL VVVV2_0(W(1,7),W(1,8),W(1,6),W(1,5),GC_5,AMP(1))
      CALL VVV1_2(W(1,7),W(1,5),-GC_3,MDL_MW,MDL_WW,W(1,9))
C     Amplitude(s) for diagram number 2
      CALL VVV1_0(W(1,8),W(1,6),W(1,9),-GC_3,AMP(2))
      CALL VVV1_3(W(1,7),W(1,6),-GC_3,MDL_MW,MDL_WW,W(1,10))
C     Amplitude(s) for diagram number 3
      CALL VVV1_0(W(1,8),W(1,10),W(1,5),-GC_3,AMP(3))
      CALL FFV2_5_3(W(1,3),W(1,2),-GC_50,GC_58,MDL_MZ,MDL_WZ,W(1,11))
C     Amplitude(s) for diagram number 4
      CALL VVVV5_0(W(1,7),W(1,6),W(1,5),W(1,11),GC_57,AMP(4))
C     Amplitude(s) for diagram number 5
      CALL VVV1_0(W(1,6),W(1,9),W(1,11),GC_53,AMP(5))
C     Amplitude(s) for diagram number 6
      CALL VVV1_0(W(1,10),W(1,5),W(1,11),GC_53,AMP(6))
      CALL FFV2_5_3(W(1,1),W(1,4),-GC_50,GC_58,MDL_MZ,MDL_WZ,W(1,12))
C     Amplitude(s) for diagram number 7
      CALL VVVV5_0(W(1,8),W(1,6),W(1,5),W(1,12),GC_57,AMP(7))
      CALL VVV1_1(W(1,5),W(1,12),GC_53,MDL_MW,MDL_WW,W(1,13))
C     Amplitude(s) for diagram number 8
      CALL VVV1_0(W(1,8),W(1,6),W(1,13),-GC_3,AMP(8))
      CALL VVV1_2(W(1,6),W(1,12),GC_53,MDL_MW,MDL_WW,W(1,14))
C     Amplitude(s) for diagram number 9
      CALL VVV1_0(W(1,8),W(1,14),W(1,5),-GC_3,AMP(9))
C     Amplitude(s) for diagram number 10
      CALL VVVV2_0(W(1,6),W(1,5),W(1,12),W(1,11),GC_36,AMP(10))
C     Amplitude(s) for diagram number 11
      CALL VVV1_0(W(1,6),W(1,13),W(1,11),GC_53,AMP(11))
C     Amplitude(s) for diagram number 12
      CALL VVV1_0(W(1,14),W(1,5),W(1,11),GC_53,AMP(12))
      CALL VVS1_3(W(1,6),W(1,5),GC_72,MDL_MH,MDL_WH,W(1,15))
C     Amplitude(s) for diagram number 13
      CALL VVS1_0(W(1,12),W(1,11),W(1,15),GC_81,AMP(13))
      CALL FFV2_1(W(1,2),W(1,6),GC_100,ZERO,ZERO,W(1,15))
      CALL FFV1_2(W(1,3),W(1,7),GC_2,ZERO,ZERO,W(1,16))
C     Amplitude(s) for diagram number 14
      CALL FFV2_0(W(1,16),W(1,15),W(1,5),GC_100,AMP(14))
C     Amplitude(s) for diagram number 15
      CALL FFV2_0(W(1,3),W(1,15),W(1,9),GC_100,AMP(15))
      CALL FFV2_5_2(W(1,3),W(1,12),-GC_50,GC_58,ZERO,ZERO,W(1,9))
C     Amplitude(s) for diagram number 16
      CALL FFV2_0(W(1,9),W(1,15),W(1,5),GC_100,AMP(16))
C     Amplitude(s) for diagram number 17
      CALL FFV2_0(W(1,3),W(1,15),W(1,13),GC_100,AMP(17))
      CALL FFV2_2(W(1,3),W(1,5),GC_100,ZERO,ZERO,W(1,13))
C     Amplitude(s) for diagram number 18
      CALL FFV1_0(W(1,13),W(1,15),W(1,7),GC_1,AMP(18))
C     Amplitude(s) for diagram number 19
      CALL FFV2_3_0(W(1,13),W(1,15),W(1,12),GC_50,GC_58,AMP(19))
      CALL FFV1_1(W(1,2),W(1,7),GC_2,ZERO,ZERO,W(1,17))
C     Amplitude(s) for diagram number 20
      CALL FFV2_0(W(1,13),W(1,17),W(1,6),GC_100,AMP(20))
C     Amplitude(s) for diagram number 21
      CALL FFV2_0(W(1,13),W(1,2),W(1,10),GC_100,AMP(21))
      CALL FFV2_5_1(W(1,2),W(1,12),-GC_50,GC_58,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 22
      CALL FFV2_0(W(1,13),W(1,10),W(1,6),GC_100,AMP(22))
C     Amplitude(s) for diagram number 23
      CALL FFV2_0(W(1,13),W(1,2),W(1,14),GC_100,AMP(23))
      CALL VVV1P0_1(W(1,6),W(1,5),-GC_3,ZERO,ZERO,W(1,14))
C     Amplitude(s) for diagram number 24
      CALL FFV1_0(W(1,3),W(1,17),W(1,14),GC_2,AMP(24))
C     Amplitude(s) for diagram number 25
      CALL FFV1_0(W(1,16),W(1,2),W(1,14),GC_2,AMP(25))
      CALL VVV1_3(W(1,6),W(1,5),GC_53,MDL_MZ,MDL_WZ,W(1,12))
C     Amplitude(s) for diagram number 26
      CALL FFV2_5_0(W(1,3),W(1,17),W(1,12),-GC_50,GC_58,AMP(26))
C     Amplitude(s) for diagram number 27
      CALL FFV2_5_0(W(1,16),W(1,2),W(1,12),-GC_50,GC_58,AMP(27))
C     Amplitude(s) for diagram number 28
      CALL FFV1_0(W(1,3),W(1,10),W(1,14),GC_2,AMP(28))
C     Amplitude(s) for diagram number 29
      CALL FFV1_0(W(1,9),W(1,2),W(1,14),GC_2,AMP(29))
C     Amplitude(s) for diagram number 30
      CALL FFV2_5_0(W(1,3),W(1,10),W(1,12),-GC_50,GC_58,AMP(30))
C     Amplitude(s) for diagram number 31
      CALL FFV2_5_0(W(1,9),W(1,2),W(1,12),-GC_50,GC_58,AMP(31))
      CALL FFV2_2(W(1,1),W(1,5),GC_100,ZERO,ZERO,W(1,9))
      CALL FFV2_3(W(1,9),W(1,4),GC_100,MDL_MW,MDL_WW,W(1,10))
C     Amplitude(s) for diagram number 32
      CALL VVV1_0(W(1,8),W(1,6),W(1,10),-GC_3,AMP(32))
      CALL FFV2_2(W(1,9),W(1,6),GC_100,ZERO,ZERO,W(1,16))
C     Amplitude(s) for diagram number 33
      CALL FFV1_0(W(1,16),W(1,4),W(1,8),GC_2,AMP(33))
C     Amplitude(s) for diagram number 34
      CALL VVV1_0(W(1,6),W(1,10),W(1,11),GC_53,AMP(34))
C     Amplitude(s) for diagram number 35
      CALL FFV2_5_0(W(1,16),W(1,4),W(1,11),-GC_50,GC_58,AMP(35))
      CALL FFV2_1(W(1,4),W(1,6),GC_100,ZERO,ZERO,W(1,16))
C     Amplitude(s) for diagram number 36
      CALL FFV1_0(W(1,9),W(1,16),W(1,8),GC_1,AMP(36))
C     Amplitude(s) for diagram number 37
      CALL FFV2_3_0(W(1,9),W(1,16),W(1,11),GC_50,GC_58,AMP(37))
C     Amplitude(s) for diagram number 38
      CALL FFV2_0(W(1,3),W(1,15),W(1,10),GC_100,AMP(38))
      CALL FFV1_2(W(1,1),W(1,8),GC_2,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 39
      CALL FFV2_0(W(1,10),W(1,16),W(1,5),GC_100,AMP(39))
      CALL FFV2_3(W(1,1),W(1,16),GC_100,MDL_MW,MDL_WW,W(1,15))
C     Amplitude(s) for diagram number 40
      CALL VVV1_0(W(1,8),W(1,15),W(1,5),-GC_3,AMP(40))
      CALL FFV2_5_2(W(1,1),W(1,11),-GC_50,GC_58,ZERO,ZERO,W(1,3))
C     Amplitude(s) for diagram number 41
      CALL FFV2_0(W(1,3),W(1,16),W(1,5),GC_100,AMP(41))
C     Amplitude(s) for diagram number 42
      CALL VVV1_0(W(1,15),W(1,5),W(1,11),GC_53,AMP(42))
C     Amplitude(s) for diagram number 43
      CALL FFV1_0(W(1,10),W(1,4),W(1,14),GC_2,AMP(43))
      CALL FFV1_2(W(1,1),W(1,14),GC_2,ZERO,ZERO,W(1,5))
C     Amplitude(s) for diagram number 44
      CALL FFV1_0(W(1,5),W(1,4),W(1,8),GC_2,AMP(44))
C     Amplitude(s) for diagram number 45
      CALL FFV2_5_0(W(1,10),W(1,4),W(1,12),-GC_50,GC_58,AMP(45))
      CALL FFV2_5_2(W(1,1),W(1,12),-GC_50,GC_58,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 46
      CALL FFV1_0(W(1,10),W(1,4),W(1,8),GC_2,AMP(46))
C     Amplitude(s) for diagram number 47
      CALL FFV1_0(W(1,3),W(1,4),W(1,14),GC_2,AMP(47))
C     Amplitude(s) for diagram number 48
      CALL FFV2_5_0(W(1,5),W(1,4),W(1,11),-GC_50,GC_58,AMP(48))
C     Amplitude(s) for diagram number 49
      CALL FFV2_5_0(W(1,3),W(1,4),W(1,12),-GC_50,GC_58,AMP(49))
C     Amplitude(s) for diagram number 50
      CALL FFV2_5_0(W(1,10),W(1,4),W(1,11),-GC_50,GC_58,AMP(50))
C     Amplitude(s) for diagram number 51
      CALL FFV2_0(W(1,13),W(1,2),W(1,15),GC_100,AMP(51))
      JAMP(1)=-AMP(1)-AMP(2)-AMP(3)-AMP(4)-AMP(5)-AMP(6)-AMP(7)-AMP(8)
     $ -AMP(9)-AMP(10)-AMP(11)-AMP(12)-AMP(13)-AMP(14)-AMP(15)-AMP(16)
     $ -AMP(17)-AMP(18)-AMP(19)-AMP(20)-AMP(21)-AMP(22)-AMP(23)-AMP(24)
     $ -AMP(25)-AMP(26)-AMP(27)-AMP(28)-AMP(29)-AMP(30)-AMP(31)-AMP(32)
     $ -AMP(33)-AMP(34)-AMP(35)-AMP(36)-AMP(37)-AMP(38)-AMP(39)-AMP(40)
     $ -AMP(41)-AMP(42)-AMP(43)-AMP(44)-AMP(45)-AMP(46)-AMP(47)-AMP(48)
     $ -AMP(49)-AMP(50)-AMP(51)

      if(sfonly)then
         JAMP(1)=-AMP(1)-AMP(2)-AMP(3)
      else
        JAMP(1)=-AMP(1)-AMP(2)-AMP(3)-AMP(4)-AMP(5)-AMP(6)-AMP(7)-AMP(8)
     $        -AMP(9)-AMP(10)-AMP(11)-AMP(12)
         if(higgs)then
            JAMP(1)=JAMP(1)-AMP(13)
         endif
      endif
      
      if(addnsf)then
       JAMP(1)=-AMP(1)-AMP(2)-AMP(3)-AMP(4)-AMP(5)-AMP(6)-AMP(7)-AMP(8)
     $ -AMP(9)-AMP(10)-AMP(11)-AMP(12)-AMP(13)-AMP(14)-AMP(15)-AMP(16)
     $ -AMP(17)-AMP(18)-AMP(19)-AMP(20)-AMP(21)-AMP(22)-AMP(23)-AMP(24)
     $ -AMP(25)-AMP(26)-AMP(27)-AMP(28)-AMP(29)-AMP(30)-AMP(31)-AMP(32)
     $ -AMP(33)-AMP(34)-AMP(35)-AMP(36)-AMP(37)-AMP(38)-AMP(39)-AMP(40)
     $ -AMP(41)-AMP(42)-AMP(43)-AMP(44)-AMP(45)-AMP(46)-AMP(47)-AMP(48)
     $ -AMP(49)-AMP(50)-AMP(51)
      endif

      if(nSFonly)then
         JAMP(1)=-AMP(14)-AMP(15)-AMP(16)
     $ -AMP(17)-AMP(18)-AMP(19)-AMP(20)-AMP(21)-AMP(22)-AMP(23)-AMP(24)
     $ -AMP(25)-AMP(26)-AMP(27)-AMP(28)-AMP(29)-AMP(30)-AMP(31)-AMP(32)
     $ -AMP(33)-AMP(34)-AMP(35)-AMP(36)-AMP(37)-AMP(38)-AMP(39)-AMP(40)
     $ -AMP(41)-AMP(42)-AMP(43)-AMP(44)-AMP(45)-AMP(46)-AMP(47)-AMP(48)
     $ -AMP(49)-AMP(50)-AMP(51)
      endif
      
      MATRIX_CUB = 0.D0
      DO I = 1, NCOLOR
        ZTEMP = (0.D0,0.D0)
        DO J = 1, NCOLOR
          ZTEMP = ZTEMP + CF(J,I)*JAMP(J)
        ENDDO
        MATRIX_CUB = MATRIX_CUB+ZTEMP*DCONJG(JAMP(I))
      ENDDO


      if(ftype.eq.'RH')then
         if(nhel(1).eq.-1)matrix_cub=0d0 ! set to zero if LH                                                               
         if(nhel(2).eq.1)matrix_cub=0d0 ! set to zero if LH                                                                
      elseif(ftype.eq.'LH')then
         if(nhel(1).eq.1)matrix_cub=0d0 ! set to zero if RH                                                                
         if(nhel(2).eq.-1)matrix_cub=0d0 ! set to zero if RH                                                               
      elseif(ftype.eq.'mixed')then
         if(nhel(1).eq.1)matrix_cub=0d0 ! set to zero if RH                                                                
         if(nhel(2).eq.1)matrix_cub=0d0 ! set to zero if LH                                                                
      endif

      if(wpol.eq.'tot')then
      elseif(wpol.eq.'tran')then
         if(nhel(6).eq.0)matrix_cub=0d0
         if(nhel(5).eq.0)matrix_cub=0d0
      elseif(wpol.eq.'long')then
         if(nhel(6).eq.1)matrix_cub=0d0
         if(nhel(5).eq.1)matrix_cub=0d0
         if(nhel(6).eq.-1)matrix_cub=0d0
         if(nhel(5).eq.-1)matrix_cub=0d0
      endif
      
      mdl_ww=mdl_ww0
      mdl_wz=mdl_wz0
      
      END


