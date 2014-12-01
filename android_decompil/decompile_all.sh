#!/bin/sh
cd /apks
find . -name '*.apk' -exec /bin/decompile.sh {} \;
cd -
