#!/bin/sh

echo;echo "- Start HMMER installation"
WD=$PWD

tar xzf hmmer-2.3.2.tar.gz
cd ./hmmer-2.3.2
echo;echo "- Configuring HMMER installation"
./configure -enable-treads
echo;echo "- Building HMMER installation"
make

export PATH=$PATH:$PWD/hmmer/src

echo "End of HMMER installation"

echo "-----------------"
echo "HMMMER EXECUTION"
echo "-----------------"

cd src/
echo ./hmmsearch $WD/secuenciah.hmm $WD/secuencia.fasta >${WD}/results.txt
./hmmsearch $WD/secuenciah.hmm $WD/secuencia.fasta >${WD}/results.txt

cd ${WD}
tar zcf g-hmmer-Files.tar.gz secuenciah.hmm secuencia.fasta results.txt
