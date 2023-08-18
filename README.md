# SuperChic4.14

mkdir foo
cd foo

git clone https://github.com/scarrazza/apfel.git

wget https://superchic.hepforge.org/superchic4.2.tar.gz
tar -xvzf superchic4.2.tar.gz
cd superchic4.2

mkdir LHAPDFstuff
cd LHAPDFstuff
wget https://superchic.hepforge.org/SF_MSHT20qed_nnlo.tar.gz
tar -xvzf SF_MSHT20qed_nnlo.tar.gz

cd ../..
wget https://lhapdf.hepforge.org/downloads/?f=LHAPDF-6.2.3.tar.gz -O LHAPDF-6.2.3.tar.gz
tar xf LHAPDF-6.2.3.tar.gz
cd LHAPDF-6.2.3/
./configure --prefix=-path to LHAPDF folder-/install
make
make install
cd bin/
chmod +x lhapdf-config

cd ../../apfel
./configure --prefix=-path to apfel folder-/apfel/install/ --exec-prefix=-path to apfel folder-/apfel/install/
make 
make install

cd ../superchic4.2/

#edit makefile
#not edit LHAPDF is different
APFELLIB = -path to apfel folder-/apfel/install/lib

make 
make init
make superchic

cd .. 

## defining paths for bash
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:-path to apfel folder-/apfel/install/lib
export LHAPDF_DATA_PATH=${LHAPDF_DATA_PATH}:-path to superchic folder-/superchic4.2/LHAPDFstuff

cd superchic4.2/bin

## change input.DAT line 9 from MSHT20qed_nnlo to SF_MSHT20qed_nnlo

./init < input.DAT
./superchic < input.DAT

