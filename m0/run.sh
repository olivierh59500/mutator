./mutator-lvl0 --jsonout ./report.json --xmlout ./report.xml --mutagenout ./mutagen.xml -MCEA -MCD=" 5.1 5.2 5.3 5.4 5.5 5.6 5.7 " -SysHeader=false -MainOnly=true -MCV=C2 -mutagen ../test/testFuncs1.c ../test/testFuncs2.c ../test/testFuncs3.c ../test/testFuncs3.h ../test/testFuncs2.h ../test/testFuncs1.h -- -std=c90 -I/lib/gcc/x86_64-redhat-linux/9/include -Wall > ./misra-log
