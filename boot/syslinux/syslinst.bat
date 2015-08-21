set USB=F:

dir %USB%
echo "check drive"
pause

unzip -jn syslinux-6.03.zip bios\win32\syslinux.exe
unzip -jn syslinux-6.03.zip bios\com32\chain\chain.c32
unzip -jn syslinux-6.03.zip bios\com32\lib\libcom32.c32
unzip -jn syslinux-6.03.zip bios\com32\libutil\libutil.c32
unzip -jn syslinux-6.03.zip bios\com32\menu\menu.c32
unzip -jn syslinux-6.03.zip bios\com32\menu\vesamenu.c32

mkdir %USB%\syslinux
mkdir %USB%\x86linuxola
syslinux.exe -m -i -d syslinux %USB%
copy syslinux.cfg %USB%\syslinux\
copy *.c32 %USB%\syslinux\
copy memtest.krn %USB%\syslinux\
copy ..\..\share\splash640x480.png %USB%\x86linuxola\
copy ..\..\x86linuxola\boot\x86linuxola.kernel %USB%\x86linuxola\
copy ..\..\x86linuxola\boot\x86linuxola.rootfs %USB%\x86linuxola\
pause
