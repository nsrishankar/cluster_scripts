#!/usr/bin/env bash

ARGOSSOURCEPATH=$HOME/argos3
ARGOSBUNDLEPATH=$HOME/argos3bundle

# Get latest ARGoS sources
if [[ ! -e $ARGOSSOURCEPATH ]]; then
    git clone https://github.com/ilpincy/argos3.git
fi

cd $ARGOSSOURCEPATH
git stash save
git pull
git stash pop

# Compile ARGoS
mkdir -p $ARGOSSOURCEPATH/build
cd $ARGOSSOURCEPATH/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$ARGOSBUNDLEPATH -DARGOS_FORCE_NO_QTOPENGL=ON -DARGOS_DOCUMENTATION=OFF -DARGOS_INSTALL_LDSOCONF=OFF -DARGOS_BUILD_NATIVE=ON ../src
make

# Install ARGoS in bundle
mkdir -p $ARGOSBUNDLEPATH
make install