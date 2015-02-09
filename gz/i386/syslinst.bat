set USB=F:

dir %USB%
echo "check drive"
pause

unzip -jn syslinux-6.03.zip bios/win32/syslinux.exe
mkdir %USB%\syslinux
syslinux.exe -m -i -d syslinux %USB%
copy syslinux.cfg %USB%\syslinux\
move *.c32 %USB%\syslinux\
copy memtest.krn %USB%\syslinux\
pause
