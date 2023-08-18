source setup.csh
setenv PATH /afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/bin:${PATH} 
setenv LHAPDF_DATA_PATH /afs/cern.ch/user/m/malvesga/Generator/superchic4.14/LHAPDFstuff:${LHAPDF_DATA_PATH}
cd /afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/install/bin
chmod +x lhapdf-config
cd -
setenv LD_LIBRARY_PATH /afs/cern.ch/user/m/malvesga/Generator/apfel/install/lib:${LD_LIBRARY_PATH}
setenv PATH /afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/bin:${PATH} 
setenv LHAPDF_DATA_PATH /afs/cern.ch/user/m/malvesga/Generator/superchic4.14/LHAPDFstuff:${LHAPDF_DATA_PATH}
cd /afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/install/bin
chmod +x lhapdf-config
cd -
setenv LD_LIBRARY_PATH /afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/install/lib:${LD_LIBRARY_PATH}
