#!/bin/bash

# usage:
# 
#     $0 FILE
# 
#     or
# 
#     cat FILE | $0
# 
# EOF

convert_func()
{
	awk -F, 'ORS="___" {print $2}' | sed -e 's/___//g' -e "s/' '/ /g" -e 's/\\r\\n/\n/g' -e "s/'248'//g" -e "s/COMMA//" -e "s/\\r/\n/"
}

if [ $# -eq 1 ]; then cat $1 | convert_func; fi
if [ $# -eq 0 ]; then convert_func; fi
