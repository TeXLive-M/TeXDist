#!/bin/bash


# We're going to run this in the MacTeXDVD working directory...
WORK=`pwd`


echo "Removing old file tree at ${WORK}/root"
rm -rf ${WORK}/root

# Copy files to root
mkdir -p ${WORK}/root/Library/TeX/.scripts
cp ${WORK}/texdist ${WORK}/root/Library/TeX/.scripts/texdist
cp ${WORK}/"Choosing a TeX Distribution.rtf" ${WORK}/root/Library/TeX


chmod -R 755 ${WORK}/root
chgrp -R wheel ${WORK}/root
chown -R root ${WORK}/root





