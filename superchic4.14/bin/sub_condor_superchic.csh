#!/bin/tcsh

### Replace the following lines according to your setup.
set EXEC=/afs/cern.ch/user/m/malvesga/Generator/superchic4.14/bin
set OUTPUT=/eos/home-m/malvesga/SWAN_projects/pylhe
###

set option1="$1"
#set option2="$2"
#set option3="$3"
#set option4="$4"
echo "option: "$option1
#echo "option: "$option2
#echo "option: "$option3
#echo "option: "$option4

echo $EXEC
echo $OUTPUT

#export PATH=${PATH}:/afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/bin
#export LHAPDF_DATA_PATH=${LHAPDF_DATA_PATH}:/afs/cern.ch/user/m/malvesga/Generator/superchic4.14/LHAPDFstuff
#cd /afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/install/bin
#chmod +x lhapdf-config
#cd -
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/afs/cern.ch/user/m/malvesga/Generator/apfel/install/lib
#export PATH=${PATH}:/afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/bin
#export LHAPDF_DATA_PATH=${LHAPDF_DATA_PATH}:/afs/cern.ch/user/m/malvesga/Generator/superchic4.14/LHAPDFstuff
#cd /afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/install/bin
#chmod +x lhapdf-config
#cd -
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/afs/cern.ch/user/m/malvesga/Generator/LHAPDF-6.2.3/install/lib

set currentdir=`pwd`
cd $EXEC
echo $EXEC
source set_condor.csh
cd $currentdir
echo $currentdir
ls

env

echo 'Running...'
cd $EXEC
echo ./superchic < $EXEC/$option1 
./superchic < $EXEC/$option1
cp *.dat $OUTPUT
