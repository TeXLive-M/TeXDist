#!/bin/bash

# We're going to run this in the MacTeXDVD working directory...
WORKPATH=$(cd -P -- "$(dirname -- "$SCRIPTPATH")" && pwd -P)

BUILDPATH="${WORKPATH}/build"
LIBRARYPATH="${BUILDPATH}/Library/TeX"

echo "Removing old file tree at ${BUILDPATH}"
rm -rf "${BUILDPATH}"

# Copy files to root
mkdir -p "${LIBRARYPATH}/.scripts" || exit 1
rsync -a "${WORKPATH}/scripts/texdist" "${LIBRARYPATH}/.scripts/"
rsync -a "${WORKPATH}/media/Choosing a TeX Distribution.rtf" "${LIBRARYPATH}"

chmod -R 755 "${BUILDPATH}"
chgrp -R wheel "${BUILDPATH}"
chown -R root "${BUILDPATH}"
