rem wget -c https://raw.githubusercontent.com/ponyatov/L/linuxola/x86linuxola/boot/x86linuxola.iso
rem wget -c http://192.168.0.128/~ponyatov/x86linuxola.iso
C:\QEMU\qemu-system-i386w -m 32M -boot d -cdrom x86linuxola.iso -soundhw sb16,es1370,hda
pause
