#!/bin/sh

size_mb=$1
fname_eicar="eicar_${size_mb}mb.com"

## Decode eicar code.
eicar_b64="WDVPIVAlQEFQWzRcUFpYNTQoUF4pN0NDKTd9JEVJQ0FSLVNUQU5EQVJELUFOVElWSVJVUy1URVNULUZJTEUhJEgrSCo="
echo -n "$eicar_b64" | base64 -d > $fname_eicar
echo -en "\n" >> $fname_eicar

## Random character size to append.
append_bytes=`expr 1024 \* 1024 \* $size_mb - 69`

## Append.
cat /dev/urandom | base64 | head -c $append_bytes >> $fname_eicar
ls -l $fname_eicar

exit 0
