ccc   integrates bare + screened amplitude over k_t 
ccc   (two-photon induced processes)
      subroutine schimcgamion(p1x,p1y,p2x,p2y,outg)
      implicit double precision(a-y)
      implicit complex*16(z)
      integer jx,jy,i1,i2,p,i,nphi,nqt,jqt,jphi
      complex*16 out(4,10),x0(10),x00(10),outg(10)
      complex*16 screen(2,2)
      integer nni,nk
      complex*16 outt(0:200,0:10)

      include 'ppamp.f'
      include 'nchan.f'
      include 'surv.f'
      include 'vars.f'
      include 'survpars.f'
      include 'polarization.f'
      include 'photo.f'
      include 'bpsi.f'
      include 'proc.f'
      include 'zi.f'
      include 'mandelstam.f'
      include 'pi.f'
      include 'nsurv.f'
      include 'inparticle.f'
      include 'zarr.f'
      include 'beam.f'
      include 'gaussvars.f'
      
      nphi=s2int*2

      del=0.5d0
      
      qtmax=0.5d0
      xggmin=1d-2
      ypmax=dlog(xggmin**2+qtmax**2)
      ypmin=dlog(xggmin**2)
      
      hphi=2d0*pi/dble(nphi)

      nk=s2int*2
      
      hy=(ypmax-ypmin)/dble(nk)
      hqt=qtmax/dble(nk)
      
      zoutg=0d0
      
      do i1=0,nk
         do p=0,10
            outt(i1,p)=0d0
         enddo
      enddo

      do p=1,pol
         outg(p)=0d0
         do i=1,4
            out(i,p)=0d0
         enddo
      enddo

      call wtgengam
 
      if(sfac)then

         do jqt=1,nk

            yp=((ypmax-ypmin)*xikt(jqt)+ypmax+ypmin)/2d0
            
            qt=dexp(yp)-xggmin**2
            tp2=qt
            qt=dsqrt(dabs(qt))
           
            sc=screeningionint(qt)
        
            do jphi=1,nphi
               
               phiq=pi*(xiphi(jphi)+1d0)
               
               tpx=qt*dcos(phiq)
               tpy=qt*dsin(phiq)

               wt=(tp2+xggmin**2)/2d0*(ypmax-ypmin)/2d0*pi
               wt=wt*wiphi(jphi)*wikt(jqt)
               
               p1xp=p1x-tpx
               p1yp=p1y-tpy
               t12=p1xp**2+p1yp**2
               p2xp=tpx+p2x
               p2yp=tpy+p2y
               t22=p2xp**2+p2yp**2

               if(beam.eq.'ion')then
                  call formfacgamion(t12,t22,x00p)
               elseif(beam.eq.'ionp')then
                  call formfacgamionp(1,t12,t22,x00p)
                  call formfacgamionp(2,t12,t22,x00p2)
               endif
               
           do p=1,pol
                    
              x0(p)=x00p
              
              zout=-0.5d0*(ppa(p)+mma(p))*(p1xp*p2xp+p1yp*p2yp)
     &             -0.5d0*zi*(ppa(p)-mma(p))*(p1xp*p2yp-p2xp*p1yp)
     &             +0.5d0*(p1xp*p2xp-p1yp*p2yp
     &             +zi*(p1xp*p2yp+p1yp*p2xp))*mpa(p)
     &             +0.5d0*(p1xp*p2xp-p1yp*p2yp
     &             -zi*(p1xp*p2yp+p1yp*p2xp))*pma(p)
                     
              zout=zout*2d0

              outg(p)=outg(p)+x0(p)*wt
     &             *sc*zout

              if(p.eq.1)then
                 zoutg=zoutg+x00p2*wt*sc
              endif
              
           enddo
        enddo
     
      enddo
      
      endif

      t11=p1x**2+p1y**2
      t22=p2x**2+p2y**2

      if(beam.eq.'ion')then
         call formfacgamion(t11,t22,x00p)
         x00p2=0d0
      elseif(beam.eq.'ionp')then
         call formfacgamionp(1,t11,t22,x00p)
         call formfacgamionp(2,t11,t22,x00p2)
      endif
         
      do p=1,pol
         zout=-0.5d0*(ppa(p)+mma(p))*(p1x*p2x+p1y*p2y)
     &        -0.5d0*zi*(ppa(p)-mma(p))*(p1x*p2y-p2x*p1y)
     &        +0.5d0*(p1x*p2x-p1y*p2y+zi*(p1x*p2y+p1y*p2x))*mpa(p)
     &        +0.5d0*(p1x*p2x-p1y*p2y-zi*(p1x*p2y+p1y*p2x))*pma(p)

         outg(p)=outg(p)+zout*x00p*2d0

         if(cdabs(zout*x00p*2d0).lt.cdabs(outg(p))*del)
     &        outg(p)=zout*x00p*2d0

         dbl=cdabs(outg(p))
         if(dabs(x00p2).lt.cdabs(zoutg)*del)zoutg=x00p2
         dbl=dsqrt(dbl**2+cdabs(zoutg+x00p2)**2*pincarr(p))
         outg(p)=dbl
         
      enddo

      return
      end
