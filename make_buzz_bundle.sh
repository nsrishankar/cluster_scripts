#!/bin/env bash

BUZZSOURCEPATH=$HOME/buzz
BUZZBUNDLEPATH=$HOME/buzzbundle

# Get latest Buzz sources
if [[ ! -e $BUZZSOURCEPATH ]]; then
    git clone https://github.com/NESTLab/Buzz.git buzz
    pushd $BUZZSOURCEPATH
    git apply -v <<'EOF'
diff --git a/src/cmake/BuzzBuildChecks.cmake b/src/cmake/BuzzBuildChecks.cmake
index a5c9d80..14a5f83 100644
--- a/src/cmake/BuzzBuildChecks.cmake
+++ b/src/cmake/BuzzBuildChecks.cmake
@@ -12,7 +12,4 @@ if(ARGOS_FOUND)
   link_directories(${ARGOS_LIBRARY_DIRS})
   set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ARGOS_PREFIX}/share/argos3/cmake)
   include(ARGoSCheckQTOpenGL)
-  # Look for Lua52
-  find_package(Lua52 REQUIRED)
-  include_directories(${LUA_INCLUDE_DIR})
 endif(ARGOS_FOUND)
EOF
    popd
fi

cd $BUZZSOURCEPATH
git stash save
git pull
git stash pop

# Compile Buzz
mkdir -p $BUZZSOURCEPATH/build
cd $BUZZSOURCEPATH/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$BUZZBUNDLEPATH -DBUZZ_SYMLINK_CMAKE_SCRIPTS=OFF ../src
make

# Install Buzz in bundle
mkdir -p $BUZZBUNDLEPATH
make install