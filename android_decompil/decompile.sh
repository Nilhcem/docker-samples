#!/bin/bash

APKTOOL=/opt/apktool/apktool.jar
DEX2JAR=/opt/dex2jar-0.0.9.15/d2j-dex2jar.sh
UNZIP=/usr/bin/unzip
JAVA=/usr/bin/java
BASENAME=/usr/bin/basename
DEXFILE=classes.dex

# Check arguments
if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 file.apk"
    exit 1
fi

# Get filename and extension
filename=$(${BASENAME} $1)
extension=${filename##*.}
filename=${filename%.*}

# Check extension + file existence
if [ "${extension}" != "apk" ]; then
    echo "$1 is not an apk file"
    exit 1
fi
if [ ! -f "$1" ]; then
    echo "$1 doesn't exist"
    exit 1
fi

# Decompile
${JAVA} -jar ${APKTOOL} d $1 -o ${filename}
${UNZIP} $1 ${DEXFILE} -d ${filename}
${DEX2JAR} ${filename}/${DEXFILE} -o ${filename}/classes-dex2jar.jar

exit 0
