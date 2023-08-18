C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     P(3,1)*Metric(1,2) - P(3,2)*Metric(1,2) - P(2,1)*Metric(1,3) +
C      P(2,3)*Metric(1,3) + P(1,2)*Metric(2,3) - P(1,3)*Metric(2,3)
C     
      SUBROUTINE VVV1_1(V2, V3, COUP, M1, W1,V1)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 COUP
      REAL*8 M1
      REAL*8 OM1
      REAL*8 P1(0:3)
      REAL*8 P2(0:3)
      REAL*8 P3(0:3)
      COMPLEX*16 TMP11
      COMPLEX*16 TMP12
      COMPLEX*16 TMP13
      COMPLEX*16 TMP14
      COMPLEX*16 TMP17
      COMPLEX*16 TMP18
      COMPLEX*16 TMP7
      COMPLEX*16 V1(6)
      COMPLEX*16 V2(*)
      COMPLEX*16 V3(*)
      REAL*8 W1
      COMPLEX*16 DENOM
      OM1 = 0D0
      IF (M1.NE.0D0) OM1=1D0/M1**2
      P2(0) = DBLE(V2(1))
      P2(1) = DBLE(V2(2))
      P2(2) = DIMAG(V2(2))
      P2(3) = DIMAG(V2(1))
      P3(0) = DBLE(V3(1))
      P3(1) = DBLE(V3(2))
      P3(2) = DIMAG(V3(2))
      P3(3) = DIMAG(V3(1))
      V1(1) = +V2(1)+V3(1)
      V1(2) = +V2(2)+V3(2)
      P1(0) = -DBLE(V1(1))
      P1(1) = -DBLE(V1(2))
      P1(2) = -DIMAG(V1(2))
      P1(3) = -DIMAG(V1(1))
      TMP11 = (V3(3)*P1(0)-V3(4)*P1(1)-V3(5)*P1(2)-V3(6)*P1(3))
      TMP12 = (V3(3)*P2(0)-V3(4)*P2(1)-V3(5)*P2(2)-V3(6)*P2(3))
      TMP13 = (P1(0)*V2(3)-P1(1)*V2(4)-P1(2)*V2(5)-P1(3)*V2(6))
      TMP14 = (P3(0)*V2(3)-P3(1)*V2(4)-P3(2)*V2(5)-P3(3)*V2(6))
      TMP17 = (P1(0)*P2(0)-P1(1)*P2(1)-P1(2)*P2(2)-P1(3)*P2(3))
      TMP18 = (P1(0)*P3(0)-P1(1)*P3(1)-P1(2)*P3(2)-P1(3)*P3(3))
      TMP7 = (V3(3)*V2(3)-V3(4)*V2(4)-V3(5)*V2(5)-V3(6)*V2(6))
      DENOM = COUP/(P1(0)**2-P1(1)**2-P1(2)**2-P1(3)**2 - M1 * (M1 -CI
     $ * W1))
      V1(3)= DENOM*(OM1*P1(0)*(TMP7*(+CI*(TMP17)-CI*(TMP18))+(-CI
     $ *(TMP12*TMP13)+CI*(TMP11*TMP14)))+(TMP7*(-CI*(P2(0))+CI*(P3(0)))
     $ +(V2(3)*(-CI*(TMP11)+CI*(TMP12))+V3(3)*(+CI*(TMP13)-CI*(TMP14)))
     $ ))
      V1(4)= DENOM*(OM1*P1(1)*(TMP7*(+CI*(TMP17)-CI*(TMP18))+(-CI
     $ *(TMP12*TMP13)+CI*(TMP11*TMP14)))+(TMP7*(-CI*(P2(1))+CI*(P3(1)))
     $ +(V2(4)*(-CI*(TMP11)+CI*(TMP12))+V3(4)*(+CI*(TMP13)-CI*(TMP14)))
     $ ))
      V1(5)= DENOM*(OM1*P1(2)*(TMP7*(+CI*(TMP17)-CI*(TMP18))+(-CI
     $ *(TMP12*TMP13)+CI*(TMP11*TMP14)))+(TMP7*(-CI*(P2(2))+CI*(P3(2)))
     $ +(V2(5)*(-CI*(TMP11)+CI*(TMP12))+V3(5)*(+CI*(TMP13)-CI*(TMP14)))
     $ ))
      V1(6)= DENOM*(OM1*P1(3)*(TMP7*(+CI*(TMP17)-CI*(TMP18))+(-CI
     $ *(TMP12*TMP13)+CI*(TMP11*TMP14)))+(TMP7*(-CI*(P2(3))+CI*(P3(3)))
     $ +(V2(6)*(-CI*(TMP11)+CI*(TMP12))+V3(6)*(+CI*(TMP13)-CI*(TMP14)))
     $ ))
      END

