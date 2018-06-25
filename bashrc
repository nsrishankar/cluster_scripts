# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Modules to load
module load cmake
module load gcc
module load slurm

# Force new gcc version                                                                                                                                                   
export CC=gcc
export CXX=g++

# To execute ARGoS and compile your code that uses ARGoS
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/argos3bundle/lib/argos3
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/argos3bundle/lib/pkgconfig
export PATH=$PATH:$HOME/argos3bundle/bin
export CMAKE_MODULE_PATH="$CMAKE_MODULE_PATH;$HOME/argos3bundle/share/argos3/cmake"
export CMAKE_LIBRARY_PATH=$CMAKE_LIBRARY_PATH:$HOME/argos3bundle/lib/argos3
export CMAKE_INCLUDE_PATH=$CMAKE_INCLUDE_PATH:$HOME/argos3bundle/include

# To execute Buzz and compile your code that uses Buzz
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/buzzbundle/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/buzzbundle/lib/pkgconfig
export PATH=$PATH:$HOME/buzzbundle/bin
export CMAKE_MODULE_PATH="$CMAKE_MODULE_PATH;$HOME/buzzbundle/share/buzz/cmake"
export CMAKE_LIBRARY_PATH=$CMAKE_LIBRARY_PATH:$HOME/buzzbundle/lib
export CMAKE_INCLUDE_PATH=$CMAKE_INCLUDE_PATH:$HOME/buzzbundle/include:$HOME/buzzbundle/share/buzz/include

# User specific aliases and functions
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
