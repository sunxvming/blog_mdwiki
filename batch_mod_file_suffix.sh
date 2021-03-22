#!/bin/bash
# Change the filename extensions of all files in the directory $1 from $2 to $3
find $1 -name "*.$2" | sed "s/.$2\$//g" | xargs -i -t mv {}.$2 {}.$3
