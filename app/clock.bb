#
# Automatically generated make config: don't edit
# Busybox version: 1.23.2
# Wed Oct  7 13:34:56 2015
#
CONFIG_HAVE_DOT_CONFIG=y

#
# Busybox Settings
#

#
# General Configuration
#
# CONFIG_DESKTOP is not set
# CONFIG_EXTRA_COMPAT is not set
# CONFIG_INCLUDE_SUSv2 is not set
# CONFIG_USE_PORTABLE_CODE is not set
CONFIG_PLATFORM_LINUX=y
CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
CONFIG_SHOW_USAGE=y
CONFIG_FEATURE_VERBOSE_USAGE=y
CONFIG_FEATURE_COMPRESS_USAGE=y
# CONFIG_FEATURE_INSTALLER is not set
CONFIG_INSTALL_NO_USR=y
# CONFIG_LOCALE_SUPPORT is not set
# CONFIG_UNICODE_SUPPORT is not set
# CONFIG_UNICODE_USING_LOCALE is not set
# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
CONFIG_SUBST_WCHAR=0
CONFIG_LAST_SUPPORTED_WCHAR=0
# CONFIG_UNICODE_COMBINING_WCHARS is not set
# CONFIG_UNICODE_WIDE_WCHARS is not set
# CONFIG_UNICODE_BIDI_SUPPORT is not set
# CONFIG_UNICODE_NEUTRAL_TABLE is not set
# CONFIG_UNICODE_PRESERVE_BROKEN is not set
# CONFIG_PAM is not set
CONFIG_FEATURE_USE_SENDFILE=y
# CONFIG_LONG_OPTS is not set
# CONFIG_FEATURE_DEVPTS is not set
# CONFIG_FEATURE_CLEAN_UP is not set
# CONFIG_FEATURE_UTMP is not set
# CONFIG_FEATURE_WTMP is not set
# CONFIG_FEATURE_PIDFILE is not set
CONFIG_PID_FILE_PATH=""
# CONFIG_FEATURE_SUID is not set
# CONFIG_FEATURE_SUID_CONFIG is not set
# CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
# CONFIG_SELINUX is not set
# CONFIG_FEATURE_PREFER_APPLETS is not set
CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
CONFIG_FEATURE_SYSLOG=y
# CONFIG_FEATURE_HAVE_RPC is not set

#
# Build Options
#
# CONFIG_STATIC is not set
# CONFIG_PIE is not set
# CONFIG_NOMMU is not set
# CONFIG_BUILD_LIBBUSYBOX is not set
# CONFIG_FEATURE_INDIVIDUAL is not set
# CONFIG_FEATURE_SHARED_BUSYBOX is not set
CONFIG_LFS=y
CONFIG_CROSS_COMPILER_PREFIX=""
CONFIG_SYSROOT=""
CONFIG_EXTRA_CFLAGS=""
CONFIG_EXTRA_LDFLAGS=""
CONFIG_EXTRA_LDLIBS=""

#
# Debugging Options
#
# CONFIG_DEBUG is not set
# CONFIG_DEBUG_PESSIMIZE is not set
# CONFIG_UNIT_TEST is not set
# CONFIG_WERROR is not set
CONFIG_NO_DEBUG_LIB=y
# CONFIG_DMALLOC is not set
# CONFIG_EFENCE is not set

#
# Installation Options ("make install" behavior)
#
CONFIG_INSTALL_APPLET_SYMLINKS=y
# CONFIG_INSTALL_APPLET_HARDLINKS is not set
# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
# CONFIG_INSTALL_APPLET_DONT is not set
# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
CONFIG_PREFIX="./_install"

#
# Busybox Library Tuning
#
# CONFIG_FEATURE_SYSTEMD is not set
# CONFIG_FEATURE_RTMINMAX is not set
CONFIG_PASSWORD_MINLEN=6
CONFIG_MD5_SMALL=1
CONFIG_SHA3_SMALL=1
CONFIG_FEATURE_FAST_TOP=y
# CONFIG_FEATURE_ETC_NETWORKS is not set
CONFIG_FEATURE_USE_TERMIOS=y
CONFIG_FEATURE_EDITING=y
CONFIG_FEATURE_EDITING_MAX_LEN=1024
# CONFIG_FEATURE_EDITING_VI is not set
CONFIG_FEATURE_EDITING_HISTORY=255
CONFIG_FEATURE_EDITING_SAVEHISTORY=y
# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set
CONFIG_FEATURE_REVERSE_SEARCH=y
CONFIG_FEATURE_TAB_COMPLETION=y
# CONFIG_FEATURE_USERNAME_COMPLETION is not set
# CONFIG_FEATURE_EDITING_FANCY_PROMPT is not set
CONFIG_FEATURE_EDITING_ASK_TERMINAL=y
# CONFIG_FEATURE_NON_POSIX_CP is not set
# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
CONFIG_FEATURE_COPYBUF_KB=4
# CONFIG_FEATURE_SKIP_ROOTFS is not set
# CONFIG_MONOTONIC_SYSCALL is not set
# CONFIG_IOCTL_HEX2STR_ERROR is not set
# CONFIG_FEATURE_HWIB is not set

#
# Applets
#

#
# Archival Utilities
#
# CONFIG_FEATURE_SEAMLESS_XZ is not set
# CONFIG_FEATURE_SEAMLESS_LZMA is not set
# CONFIG_FEATURE_SEAMLESS_BZ2 is not set
# CONFIG_FEATURE_SEAMLESS_GZ is not set
# CONFIG_FEATURE_SEAMLESS_Z is not set
# CONFIG_AR is not set
# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
# CONFIG_FEATURE_AR_CREATE is not set
# CONFIG_UNCOMPRESS is not set
# CONFIG_GUNZIP is not set
# CONFIG_BUNZIP2 is not set
# CONFIG_UNLZMA is not set
# CONFIG_FEATURE_LZMA_FAST is not set
# CONFIG_LZMA is not set
# CONFIG_UNXZ is not set
# CONFIG_XZ is not set
# CONFIG_BZIP2 is not set
# CONFIG_CPIO is not set
# CONFIG_FEATURE_CPIO_O is not set
# CONFIG_FEATURE_CPIO_P is not set
# CONFIG_DPKG is not set
# CONFIG_DPKG_DEB is not set
# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
# CONFIG_GZIP is not set
# CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
CONFIG_GZIP_FAST=0
# CONFIG_LZOP is not set
# CONFIG_LZOP_COMPR_HIGH is not set
# CONFIG_RPM is not set
# CONFIG_RPM2CPIO is not set
# CONFIG_TAR is not set
# CONFIG_FEATURE_TAR_CREATE is not set
# CONFIG_FEATURE_TAR_AUTODETECT is not set
# CONFIG_FEATURE_TAR_FROM is not set
# CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY is not set
# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
# CONFIG_FEATURE_TAR_GNU_EXTENSIONS is not set
# CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
# CONFIG_FEATURE_TAR_TO_COMMAND is not set
# CONFIG_FEATURE_TAR_UNAME_GNAME is not set
# CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
# CONFIG_FEATURE_TAR_SELINUX is not set
# CONFIG_UNZIP is not set

#
# Coreutils
#
# CONFIG_BASENAME is not set
CONFIG_CAT=y
CONFIG_DATE=y
# CONFIG_FEATURE_DATE_ISOFMT is not set
# CONFIG_FEATURE_DATE_NANO is not set
# CONFIG_FEATURE_DATE_COMPAT is not set
# CONFIG_HOSTID is not set
# CONFIG_ID is not set
# CONFIG_GROUPS is not set
CONFIG_SHUF=y
# CONFIG_TEST is not set
CONFIG_FEATURE_TEST_64=y
CONFIG_TOUCH=y
# CONFIG_FEATURE_TOUCH_NODEREF is not set
# CONFIG_FEATURE_TOUCH_SUSV3 is not set
# CONFIG_TR is not set
# CONFIG_FEATURE_TR_CLASSES is not set
# CONFIG_FEATURE_TR_EQUIV is not set
CONFIG_UNLINK=y
# CONFIG_BASE64 is not set
# CONFIG_WHO is not set
# CONFIG_USERS is not set
CONFIG_CAL=y
# CONFIG_CATV is not set
# CONFIG_CHGRP is not set
CONFIG_CHMOD=y
# CONFIG_CHOWN is not set
# CONFIG_FEATURE_CHOWN_LONG_OPTIONS is not set
# CONFIG_CHROOT is not set
# CONFIG_CKSUM is not set
# CONFIG_COMM is not set
CONFIG_CP=y
# CONFIG_FEATURE_CP_LONG_OPTIONS is not set
# CONFIG_CUT is not set
CONFIG_DD=y
# CONFIG_FEATURE_DD_SIGNAL_HANDLING is not set
# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
# CONFIG_FEATURE_DD_IBS_OBS is not set
CONFIG_DF=y
CONFIG_FEATURE_DF_FANCY=y
# CONFIG_DIRNAME is not set
CONFIG_DOS2UNIX=y
CONFIG_UNIX2DOS=y
CONFIG_DU=y
CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
CONFIG_ECHO=y
CONFIG_FEATURE_FANCY_ECHO=y
CONFIG_ENV=y
# CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
# CONFIG_EXPAND is not set
# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
# CONFIG_EXPR is not set
# CONFIG_EXPR_MATH_SUPPORT_64 is not set
# CONFIG_FALSE is not set
# CONFIG_FOLD is not set
# CONFIG_FSYNC is not set
CONFIG_HEAD=y
# CONFIG_FEATURE_FANCY_HEAD is not set
# CONFIG_INSTALL is not set
# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
CONFIG_LN=y
# CONFIG_LOGNAME is not set
CONFIG_LS=y
# CONFIG_FEATURE_LS_FILETYPES is not set
# CONFIG_FEATURE_LS_FOLLOWLINKS is not set
# CONFIG_FEATURE_LS_RECURSIVE is not set
# CONFIG_FEATURE_LS_SORTFILES is not set
# CONFIG_FEATURE_LS_TIMESTAMPS is not set
# CONFIG_FEATURE_LS_USERNAME is not set
# CONFIG_FEATURE_LS_COLOR is not set
# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
# CONFIG_MD5SUM is not set
CONFIG_MKDIR=y
# CONFIG_FEATURE_MKDIR_LONG_OPTIONS is not set
CONFIG_MKFIFO=y
# CONFIG_MKNOD is not set
CONFIG_MV=y
# CONFIG_FEATURE_MV_LONG_OPTIONS is not set
# CONFIG_NICE is not set
# CONFIG_NOHUP is not set
CONFIG_OD=y
# CONFIG_PRINTENV is not set
# CONFIG_PRINTF is not set
CONFIG_PWD=y
# CONFIG_READLINK is not set
# CONFIG_FEATURE_READLINK_FOLLOW is not set
# CONFIG_REALPATH is not set
CONFIG_RM=y
# CONFIG_RMDIR is not set
# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
# CONFIG_SEQ is not set
# CONFIG_SHA1SUM is not set
# CONFIG_SHA256SUM is not set
# CONFIG_SHA512SUM is not set
# CONFIG_SHA3SUM is not set
CONFIG_SLEEP=y
CONFIG_FEATURE_FANCY_SLEEP=y
# CONFIG_FEATURE_FLOAT_SLEEP is not set
CONFIG_SORT=y
# CONFIG_FEATURE_SORT_BIG is not set
CONFIG_SPLIT=y
CONFIG_FEATURE_SPLIT_FANCY=y
# CONFIG_STAT is not set
# CONFIG_FEATURE_STAT_FORMAT is not set
# CONFIG_STTY is not set
# CONFIG_SUM is not set
CONFIG_SYNC=y
# CONFIG_TAC is not set
CONFIG_TAIL=y
# CONFIG_FEATURE_FANCY_TAIL is not set
# CONFIG_TEE is not set
# CONFIG_FEATURE_TEE_USE_BLOCK_IO is not set
# CONFIG_TRUE is not set
# CONFIG_TTY is not set
CONFIG_UNAME=y
# CONFIG_UNEXPAND is not set
# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
# CONFIG_UNIQ is not set
# CONFIG_USLEEP is not set
# CONFIG_UUDECODE is not set
# CONFIG_UUENCODE is not set
# CONFIG_WC is not set
# CONFIG_FEATURE_WC_LARGE is not set
# CONFIG_WHOAMI is not set
# CONFIG_YES is not set

#
# Common options
#
CONFIG_FEATURE_VERBOSE=y

#
# Common options for cp and mv
#
CONFIG_FEATURE_PRESERVE_HARDLINKS=y

#
# Common options for ls, more and telnet
#
CONFIG_FEATURE_AUTOWIDTH=y

#
# Common options for df, du, ls
#
CONFIG_FEATURE_HUMAN_READABLE=y
# CONFIG_FEATURE_MD5_SHA1_SUM_CHECK is not set

#
# Console Utilities
#
# CONFIG_CHVT is not set
# CONFIG_FGCONSOLE is not set
CONFIG_CLEAR=y
# CONFIG_DEALLOCVT is not set
# CONFIG_DUMPKMAP is not set
# CONFIG_KBD_MODE is not set
# CONFIG_LOADFONT is not set
# CONFIG_LOADKMAP is not set
# CONFIG_OPENVT is not set
# CONFIG_RESET is not set
# CONFIG_RESIZE is not set
# CONFIG_FEATURE_RESIZE_PRINT is not set
# CONFIG_SETCONSOLE is not set
# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
# CONFIG_SETFONT is not set
# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not set
CONFIG_DEFAULT_SETFONT_DIR=""
# CONFIG_SETKEYCODES is not set
# CONFIG_SETLOGCONS is not set
# CONFIG_SHOWKEY is not set
# CONFIG_FEATURE_LOADFONT_PSF2 is not set
# CONFIG_FEATURE_LOADFONT_RAW is not set

#
# Debian Utilities
#
# CONFIG_MKTEMP is not set
# CONFIG_PIPE_PROGRESS is not set
# CONFIG_RUN_PARTS is not set
# CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS is not set
# CONFIG_FEATURE_RUN_PARTS_FANCY is not set
# CONFIG_START_STOP_DAEMON is not set
# CONFIG_FEATURE_START_STOP_DAEMON_FANCY is not set
# CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS is not set
CONFIG_WHICH=y

#
# Editors
#
# CONFIG_AWK is not set
# CONFIG_FEATURE_AWK_LIBM is not set
# CONFIG_FEATURE_AWK_GNU_EXTENSIONS is not set
# CONFIG_CMP is not set
# CONFIG_DIFF is not set
# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
# CONFIG_FEATURE_DIFF_DIR is not set
# CONFIG_ED is not set
# CONFIG_PATCH is not set
# CONFIG_SED is not set
CONFIG_VI=y
CONFIG_FEATURE_VI_MAX_LEN=4096
CONFIG_FEATURE_VI_8BIT=y
CONFIG_FEATURE_VI_COLON=y
CONFIG_FEATURE_VI_YANKMARK=y
CONFIG_FEATURE_VI_SEARCH=y
# CONFIG_FEATURE_VI_REGEX_SEARCH is not set
CONFIG_FEATURE_VI_USE_SIGNALS=y
CONFIG_FEATURE_VI_DOT_CMD=y
CONFIG_FEATURE_VI_READONLY=y
CONFIG_FEATURE_VI_SETOPTS=y
CONFIG_FEATURE_VI_SET=y
CONFIG_FEATURE_VI_WIN_RESIZE=y
CONFIG_FEATURE_VI_ASK_TERMINAL=y
CONFIG_FEATURE_VI_UNDO=y
CONFIG_FEATURE_VI_UNDO_QUEUE=y
CONFIG_FEATURE_VI_UNDO_QUEUE_MAX=256
CONFIG_FEATURE_ALLOW_EXEC=y

#
# Finding Utilities
#
CONFIG_FIND=y
# CONFIG_FEATURE_FIND_PRINT0 is not set
# CONFIG_FEATURE_FIND_MTIME is not set
# CONFIG_FEATURE_FIND_MMIN is not set
# CONFIG_FEATURE_FIND_PERM is not set
CONFIG_FEATURE_FIND_TYPE=y
CONFIG_FEATURE_FIND_XDEV=y
CONFIG_FEATURE_FIND_MAXDEPTH=y
# CONFIG_FEATURE_FIND_NEWER is not set
# CONFIG_FEATURE_FIND_INUM is not set
# CONFIG_FEATURE_FIND_EXEC is not set
# CONFIG_FEATURE_FIND_EXEC_PLUS is not set
# CONFIG_FEATURE_FIND_USER is not set
# CONFIG_FEATURE_FIND_GROUP is not set
CONFIG_FEATURE_FIND_NOT=y
CONFIG_FEATURE_FIND_DEPTH=y
# CONFIG_FEATURE_FIND_PAREN is not set
CONFIG_FEATURE_FIND_SIZE=y
# CONFIG_FEATURE_FIND_PRUNE is not set
CONFIG_FEATURE_FIND_DELETE=y
# CONFIG_FEATURE_FIND_PATH is not set
CONFIG_FEATURE_FIND_REGEX=y
# CONFIG_FEATURE_FIND_CONTEXT is not set
# CONFIG_FEATURE_FIND_LINKS is not set
CONFIG_GREP=y
CONFIG_FEATURE_GREP_EGREP_ALIAS=y
CONFIG_FEATURE_GREP_FGREP_ALIAS=y
# CONFIG_FEATURE_GREP_CONTEXT is not set
# CONFIG_XARGS is not set
# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
# CONFIG_FEATURE_XARGS_SUPPORT_QUOTES is not set
# CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT is not set
# CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM is not set
# CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR is not set

#
# Init Utilities
#
# CONFIG_BOOTCHARTD is not set
# CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER is not set
# CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
CONFIG_HALT=y
# CONFIG_FEATURE_CALL_TELINIT is not set
CONFIG_TELINIT_PATH=""
CONFIG_INIT=y
CONFIG_FEATURE_USE_INITTAB=y
# CONFIG_FEATURE_KILL_REMOVED is not set
CONFIG_FEATURE_KILL_DELAY=0
# CONFIG_FEATURE_INIT_SCTTY is not set
# CONFIG_FEATURE_INIT_SYSLOG is not set
# CONFIG_FEATURE_EXTRA_QUIET is not set
# CONFIG_FEATURE_INIT_COREDUMPS is not set
# CONFIG_FEATURE_INITRD is not set
CONFIG_INIT_TERMINAL_TYPE="linux"
# CONFIG_MESG is not set
# CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP is not set

#
# Login/Password Management Utilities
#
# CONFIG_ADD_SHELL is not set
# CONFIG_REMOVE_SHELL is not set
# CONFIG_FEATURE_SHADOWPASSWDS is not set
# CONFIG_USE_BB_PWD_GRP is not set
# CONFIG_USE_BB_SHADOW is not set
# CONFIG_USE_BB_CRYPT is not set
# CONFIG_USE_BB_CRYPT_SHA is not set
# CONFIG_ADDUSER is not set
# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
# CONFIG_FEATURE_CHECK_NAMES is not set
CONFIG_LAST_ID=0
CONFIG_FIRST_SYSTEM_ID=0
CONFIG_LAST_SYSTEM_ID=0
# CONFIG_ADDGROUP is not set
# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
# CONFIG_DELUSER is not set
# CONFIG_DELGROUP is not set
# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
# CONFIG_GETTY is not set
# CONFIG_LOGIN is not set
# CONFIG_LOGIN_SESSION_AS_CHILD is not set
# CONFIG_LOGIN_SCRIPTS is not set
# CONFIG_FEATURE_NOLOGIN is not set
# CONFIG_FEATURE_SECURETTY is not set
# CONFIG_PASSWD is not set
# CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
# CONFIG_CRYPTPW is not set
# CONFIG_CHPASSWD is not set
CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
# CONFIG_SU is not set
# CONFIG_FEATURE_SU_SYSLOG is not set
# CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
# CONFIG_SULOGIN is not set
# CONFIG_VLOCK is not set

#
# Linux Ext2 FS Progs
#
# CONFIG_CHATTR is not set
# CONFIG_FSCK is not set
# CONFIG_LSATTR is not set
# CONFIG_TUNE2FS is not set

#
# Linux Module Utilities
#
# CONFIG_MODINFO is not set
# CONFIG_MODPROBE_SMALL is not set
# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
CONFIG_INSMOD=y
# CONFIG_RMMOD is not set
CONFIG_LSMOD=y
# CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT is not set
# CONFIG_MODPROBE is not set
# CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
# CONFIG_DEPMOD is not set

#
# Options common to multiple modutils
#
# CONFIG_FEATURE_2_4_MODULES is not set
# CONFIG_FEATURE_INSMOD_TRY_MMAP is not set
# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
# CONFIG_FEATURE_MODUTILS_ALIAS is not set
# CONFIG_FEATURE_MODUTILS_SYMBOLS is not set
CONFIG_DEFAULT_MODULES_DIR=""
CONFIG_DEFAULT_DEPMOD_FILE=""

#
# Linux System Utilities
#
# CONFIG_BLOCKDEV is not set
CONFIG_FATATTR=y
# CONFIG_FSTRIM is not set
CONFIG_MDEV=y
CONFIG_FEATURE_MDEV_CONF=y
CONFIG_FEATURE_MDEV_RENAME=y
CONFIG_FEATURE_MDEV_RENAME_REGEXP=y
CONFIG_FEATURE_MDEV_EXEC=y
# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
# CONFIG_REV is not set
# CONFIG_ACPID is not set
# CONFIG_FEATURE_ACPID_COMPAT is not set
# CONFIG_BLKID is not set
# CONFIG_FEATURE_BLKID_TYPE is not set
CONFIG_DMESG=y
CONFIG_FEATURE_DMESG_PRETTY=y
# CONFIG_FBSET is not set
# CONFIG_FEATURE_FBSET_FANCY is not set
# CONFIG_FEATURE_FBSET_READMODE is not set
# CONFIG_FDFLUSH is not set
# CONFIG_FDFORMAT is not set
# CONFIG_FDISK is not set
# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
# CONFIG_FEATURE_FDISK_WRITABLE is not set
# CONFIG_FEATURE_AIX_LABEL is not set
# CONFIG_FEATURE_SGI_LABEL is not set
# CONFIG_FEATURE_SUN_LABEL is not set
# CONFIG_FEATURE_OSF_LABEL is not set
# CONFIG_FEATURE_GPT_LABEL is not set
# CONFIG_FEATURE_FDISK_ADVANCED is not set
# CONFIG_FINDFS is not set
# CONFIG_FLOCK is not set
# CONFIG_FREERAMDISK is not set
# CONFIG_FSCK_MINIX is not set
# CONFIG_MKFS_EXT2 is not set
# CONFIG_MKFS_MINIX is not set
# CONFIG_FEATURE_MINIX2 is not set
# CONFIG_MKFS_REISER is not set
# CONFIG_MKFS_VFAT is not set
# CONFIG_GETOPT is not set
# CONFIG_FEATURE_GETOPT_LONG is not set
# CONFIG_HEXDUMP is not set
# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
# CONFIG_HD is not set
CONFIG_HWCLOCK=y
# CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS is not set
# CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS is not set
# CONFIG_IPCRM is not set
# CONFIG_IPCS is not set
# CONFIG_LOSETUP is not set
CONFIG_LSPCI=y
CONFIG_LSUSB=y
# CONFIG_MKSWAP is not set
# CONFIG_FEATURE_MKSWAP_UUID is not set
CONFIG_MORE=y
CONFIG_MOUNT=y
# CONFIG_FEATURE_MOUNT_FAKE is not set
CONFIG_FEATURE_MOUNT_VERBOSE=y
# CONFIG_FEATURE_MOUNT_HELPERS is not set
CONFIG_FEATURE_MOUNT_LABEL=y
# CONFIG_FEATURE_MOUNT_NFS is not set
# CONFIG_FEATURE_MOUNT_CIFS is not set
CONFIG_FEATURE_MOUNT_FLAGS=y
CONFIG_FEATURE_MOUNT_FSTAB=y
# CONFIG_PIVOT_ROOT is not set
# CONFIG_RDATE is not set
# CONFIG_RDEV is not set
# CONFIG_READPROFILE is not set
# CONFIG_RTCWAKE is not set
# CONFIG_SCRIPT is not set
# CONFIG_SCRIPTREPLAY is not set
# CONFIG_SETARCH is not set
# CONFIG_SWAPONOFF is not set
# CONFIG_FEATURE_SWAPON_DISCARD is not set
# CONFIG_FEATURE_SWAPON_PRI is not set
# CONFIG_SWITCH_ROOT is not set
CONFIG_UMOUNT=y
CONFIG_FEATURE_UMOUNT_ALL=y

#
# Common options for mount/umount
#
CONFIG_FEATURE_MOUNT_LOOP=y
CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
# CONFIG_FEATURE_MTAB_SUPPORT is not set
CONFIG_VOLUMEID=y

#
# Filesystem/Volume identification
#
CONFIG_FEATURE_VOLUMEID_BTRFS=y
CONFIG_FEATURE_VOLUMEID_CRAMFS=y
CONFIG_FEATURE_VOLUMEID_EXFAT=y
CONFIG_FEATURE_VOLUMEID_EXT=y
CONFIG_FEATURE_VOLUMEID_F2FS=y
CONFIG_FEATURE_VOLUMEID_FAT=y
CONFIG_FEATURE_VOLUMEID_HFS=y
CONFIG_FEATURE_VOLUMEID_ISO9660=y
CONFIG_FEATURE_VOLUMEID_JFS=y
CONFIG_FEATURE_VOLUMEID_LINUXRAID=y
CONFIG_FEATURE_VOLUMEID_LINUXSWAP=y
CONFIG_FEATURE_VOLUMEID_LUKS=y
CONFIG_FEATURE_VOLUMEID_NILFS=y
CONFIG_FEATURE_VOLUMEID_NTFS=y
CONFIG_FEATURE_VOLUMEID_OCFS2=y
CONFIG_FEATURE_VOLUMEID_REISERFS=y
CONFIG_FEATURE_VOLUMEID_ROMFS=y
# CONFIG_FEATURE_VOLUMEID_SQUASHFS is not set
CONFIG_FEATURE_VOLUMEID_SYSV=y
CONFIG_FEATURE_VOLUMEID_UDF=y
CONFIG_FEATURE_VOLUMEID_XFS=y

#
# Miscellaneous Utilities
#
# CONFIG_CONSPY is not set
# CONFIG_CROND is not set
# CONFIG_FEATURE_CROND_D is not set
# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
CONFIG_FEATURE_CROND_DIR=""
CONFIG_LESS=y
CONFIG_FEATURE_LESS_MAXLINES=9999999
# CONFIG_FEATURE_LESS_BRACKETS is not set
# CONFIG_FEATURE_LESS_FLAGS is not set
# CONFIG_FEATURE_LESS_MARKS is not set
# CONFIG_FEATURE_LESS_REGEXP is not set
# CONFIG_FEATURE_LESS_WINCH is not set
# CONFIG_FEATURE_LESS_ASK_TERMINAL is not set
# CONFIG_FEATURE_LESS_DASHCMD is not set
# CONFIG_FEATURE_LESS_LINENUMS is not set
# CONFIG_NANDWRITE is not set
# CONFIG_NANDDUMP is not set
# CONFIG_RFKILL is not set
CONFIG_SETSERIAL=y
# CONFIG_TASKSET is not set
# CONFIG_FEATURE_TASKSET_FANCY is not set
# CONFIG_UBIATTACH is not set
# CONFIG_UBIDETACH is not set
# CONFIG_UBIMKVOL is not set
# CONFIG_UBIRMVOL is not set
# CONFIG_UBIRSVOL is not set
# CONFIG_UBIUPDATEVOL is not set
# CONFIG_WALL is not set
# CONFIG_ADJTIMEX is not set
# CONFIG_BBCONFIG is not set
# CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
# CONFIG_BEEP is not set
CONFIG_FEATURE_BEEP_FREQ=0
CONFIG_FEATURE_BEEP_LENGTH_MS=0
# CONFIG_CHAT is not set
# CONFIG_FEATURE_CHAT_NOFAIL is not set
# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
# CONFIG_CHRT is not set
# CONFIG_CRONTAB is not set
# CONFIG_DC is not set
# CONFIG_FEATURE_DC_LIBM is not set
# CONFIG_DEVFSD is not set
# CONFIG_DEVFSD_MODLOAD is not set
# CONFIG_DEVFSD_FG_NP is not set
# CONFIG_DEVFSD_VERBOSE is not set
# CONFIG_FEATURE_DEVFS is not set
# CONFIG_DEVMEM is not set
# CONFIG_EJECT is not set
# CONFIG_FEATURE_EJECT_SCSI is not set
# CONFIG_FBSPLASH is not set
# CONFIG_FLASHCP is not set
# CONFIG_FLASH_LOCK is not set
# CONFIG_FLASH_UNLOCK is not set
# CONFIG_FLASH_ERASEALL is not set
# CONFIG_IONICE is not set
# CONFIG_INOTIFYD is not set
# CONFIG_LAST is not set
# CONFIG_FEATURE_LAST_SMALL is not set
# CONFIG_FEATURE_LAST_FANCY is not set
# CONFIG_HDPARM is not set
# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
# CONFIG_MAKEDEVS is not set
# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
# CONFIG_FEATURE_MAKEDEVS_TABLE is not set
# CONFIG_MAN is not set
# CONFIG_MICROCOM is not set
# CONFIG_MOUNTPOINT is not set
# CONFIG_MT is not set
# CONFIG_RAIDAUTORUN is not set
# CONFIG_READAHEAD is not set
# CONFIG_RUNLEVEL is not set
# CONFIG_RX is not set
# CONFIG_SETSID is not set
# CONFIG_STRINGS is not set
CONFIG_TIME=y
# CONFIG_TIMEOUT is not set
# CONFIG_TTYSIZE is not set
# CONFIG_VOLNAME is not set
# CONFIG_WATCHDOG is not set

#
# Networking Utilities
#
# CONFIG_NAMEIF is not set
# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
# CONFIG_NBDCLIENT is not set
CONFIG_NC=y
CONFIG_NC_SERVER=y
CONFIG_NC_EXTRA=y
# CONFIG_NC_110_COMPAT is not set
CONFIG_PING=y
# CONFIG_PING6 is not set
CONFIG_FEATURE_FANCY_PING=y
# CONFIG_WHOIS is not set
# CONFIG_FEATURE_IPV6 is not set
# CONFIG_FEATURE_UNIX_LOCAL is not set
# CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
# CONFIG_ARP is not set
# CONFIG_ARPING is not set
# CONFIG_BRCTL is not set
# CONFIG_FEATURE_BRCTL_FANCY is not set
# CONFIG_FEATURE_BRCTL_SHOW is not set
# CONFIG_DNSD is not set
# CONFIG_ETHER_WAKE is not set
# CONFIG_FAKEIDENTD is not set
# CONFIG_FTPD is not set
# CONFIG_FEATURE_FTP_WRITE is not set
# CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST is not set
# CONFIG_FEATURE_FTP_AUTHENTICATION is not set
# CONFIG_FTPGET is not set
# CONFIG_FTPPUT is not set
# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
# CONFIG_HOSTNAME is not set
CONFIG_HTTPD=y
CONFIG_FEATURE_HTTPD_RANGES=y
# CONFIG_FEATURE_HTTPD_SETUID is not set
# CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
# CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
CONFIG_FEATURE_HTTPD_CGI=y
CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=y
# CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not set
CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=y
# CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
# CONFIG_FEATURE_HTTPD_PROXY is not set
# CONFIG_FEATURE_HTTPD_GZIP is not set
CONFIG_IFCONFIG=y
CONFIG_FEATURE_IFCONFIG_STATUS=y
# CONFIG_FEATURE_IFCONFIG_SLIP is not set
# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
# CONFIG_FEATURE_IFCONFIG_HW is not set
# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
# CONFIG_IFENSLAVE is not set
# CONFIG_IFPLUGD is not set
# CONFIG_IFUPDOWN is not set
CONFIG_IFUPDOWN_IFSTATE_PATH=""
# CONFIG_FEATURE_IFUPDOWN_IP is not set
# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
# CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
# CONFIG_FEATURE_IFUPDOWN_IPV4 is not set
# CONFIG_FEATURE_IFUPDOWN_IPV6 is not set
# CONFIG_FEATURE_IFUPDOWN_MAPPING is not set
# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
# CONFIG_INETD is not set
# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
# CONFIG_FEATURE_INETD_RPC is not set
# CONFIG_IP is not set
# CONFIG_FEATURE_IP_ADDRESS is not set
# CONFIG_FEATURE_IP_LINK is not set
# CONFIG_FEATURE_IP_ROUTE is not set
# CONFIG_FEATURE_IP_TUNNEL is not set
# CONFIG_FEATURE_IP_RULE is not set
# CONFIG_FEATURE_IP_SHORT_FORMS is not set
# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
# CONFIG_IPADDR is not set
# CONFIG_IPLINK is not set
# CONFIG_IPROUTE is not set
# CONFIG_IPTUNNEL is not set
# CONFIG_IPRULE is not set
# CONFIG_IPCALC is not set
# CONFIG_FEATURE_IPCALC_FANCY is not set
# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
# CONFIG_NETSTAT is not set
# CONFIG_FEATURE_NETSTAT_WIDE is not set
# CONFIG_FEATURE_NETSTAT_PRG is not set
CONFIG_NSLOOKUP=y
CONFIG_NTPD=y
CONFIG_FEATURE_NTPD_SERVER=y
CONFIG_FEATURE_NTPD_CONF=y
# CONFIG_PSCAN is not set
CONFIG_ROUTE=y
# CONFIG_SLATTACH is not set
# CONFIG_TCPSVD is not set
# CONFIG_TELNET is not set
# CONFIG_FEATURE_TELNET_TTYPE is not set
# CONFIG_FEATURE_TELNET_AUTOLOGIN is not set
CONFIG_TELNETD=y
CONFIG_FEATURE_TELNETD_STANDALONE=y
CONFIG_FEATURE_TELNETD_INETD_WAIT=y
# CONFIG_TFTP is not set
# CONFIG_TFTPD is not set
# CONFIG_FEATURE_TFTP_GET is not set
# CONFIG_FEATURE_TFTP_PUT is not set
# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
# CONFIG_TFTP_DEBUG is not set
# CONFIG_TRACEROUTE is not set
# CONFIG_TRACEROUTE6 is not set
# CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
# CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
# CONFIG_TUNCTL is not set
# CONFIG_FEATURE_TUNCTL_UG is not set
# CONFIG_UDHCPC6 is not set
# CONFIG_UDHCPD is not set
# CONFIG_DHCPRELAY is not set
# CONFIG_DUMPLEASES is not set
# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
# CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
CONFIG_DHCPD_LEASES_FILE=""
CONFIG_UDHCPC=y
CONFIG_FEATURE_UDHCPC_ARPING=y
CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
# CONFIG_FEATURE_UDHCP_PORT is not set
CONFIG_UDHCP_DEBUG=9
CONFIG_FEATURE_UDHCP_RFC3397=y
CONFIG_FEATURE_UDHCP_8021Q=y
CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=""
# CONFIG_UDPSVD is not set
# CONFIG_VCONFIG is not set
CONFIG_WGET=y
CONFIG_FEATURE_WGET_STATUSBAR=y
CONFIG_FEATURE_WGET_AUTHENTICATION=y
# CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
CONFIG_FEATURE_WGET_TIMEOUT=y
# CONFIG_ZCIP is not set

#
# Print Utilities
#
# CONFIG_LPD is not set
# CONFIG_LPR is not set
# CONFIG_LPQ is not set

#
# Mail Utilities
#
# CONFIG_MAKEMIME is not set
CONFIG_FEATURE_MIME_CHARSET=""
# CONFIG_POPMAILDIR is not set
# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
# CONFIG_REFORMIME is not set
# CONFIG_FEATURE_REFORMIME_COMPAT is not set
# CONFIG_SENDMAIL is not set

#
# Process Utilities
#
# CONFIG_IOSTAT is not set
# CONFIG_LSOF is not set
# CONFIG_MPSTAT is not set
# CONFIG_NMETER is not set
# CONFIG_PMAP is not set
# CONFIG_POWERTOP is not set
CONFIG_PSTREE=y
# CONFIG_PWDX is not set
# CONFIG_SMEMCAP is not set
CONFIG_TOP=y
CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
CONFIG_FEATURE_TOP_SMP_CPU=y
# CONFIG_FEATURE_TOP_DECIMALS is not set
CONFIG_FEATURE_TOP_SMP_PROCESS=y
CONFIG_FEATURE_TOPMEM=y
CONFIG_UPTIME=y
# CONFIG_FEATURE_UPTIME_UTMP_SUPPORT is not set
CONFIG_FREE=y
# CONFIG_FUSER is not set
CONFIG_KILL=y
CONFIG_KILLALL=y
CONFIG_KILLALL5=y
# CONFIG_PGREP is not set
# CONFIG_PIDOF is not set
# CONFIG_FEATURE_PIDOF_SINGLE is not set
# CONFIG_FEATURE_PIDOF_OMIT is not set
# CONFIG_PKILL is not set
CONFIG_PS=y
# CONFIG_FEATURE_PS_WIDE is not set
# CONFIG_FEATURE_PS_LONG is not set
# CONFIG_FEATURE_PS_TIME is not set
# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
# CONFIG_RENICE is not set
# CONFIG_BB_SYSCTL is not set
CONFIG_FEATURE_SHOW_THREADS=y
CONFIG_WATCH=y

#
# Runit Utilities
#
# CONFIG_RUNSV is not set
# CONFIG_RUNSVDIR is not set
# CONFIG_FEATURE_RUNSVDIR_LOG is not set
# CONFIG_SV is not set
CONFIG_SV_DEFAULT_SERVICE_DIR=""
# CONFIG_SVLOGD is not set
# CONFIG_CHPST is not set
# CONFIG_SETUIDGID is not set
# CONFIG_ENVUIDGID is not set
# CONFIG_ENVDIR is not set
# CONFIG_SOFTLIMIT is not set
# CONFIG_CHCON is not set
# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
# CONFIG_GETENFORCE is not set
# CONFIG_GETSEBOOL is not set
# CONFIG_LOAD_POLICY is not set
# CONFIG_MATCHPATHCON is not set
# CONFIG_RESTORECON is not set
# CONFIG_RUNCON is not set
# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
# CONFIG_SELINUXENABLED is not set
# CONFIG_SETENFORCE is not set
# CONFIG_SETFILES is not set
# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
# CONFIG_SETSEBOOL is not set
# CONFIG_SESTATUS is not set

#
# Shells
#
# CONFIG_ASH is not set
# CONFIG_ASH_BASH_COMPAT is not set
# CONFIG_ASH_IDLE_TIMEOUT is not set
# CONFIG_ASH_JOB_CONTROL is not set
# CONFIG_ASH_ALIAS is not set
# CONFIG_ASH_GETOPTS is not set
# CONFIG_ASH_BUILTIN_ECHO is not set
# CONFIG_ASH_BUILTIN_PRINTF is not set
# CONFIG_ASH_BUILTIN_TEST is not set
# CONFIG_ASH_HELP is not set
# CONFIG_ASH_CMDCMD is not set
# CONFIG_ASH_MAIL is not set
# CONFIG_ASH_OPTIMIZE_FOR_SIZE is not set
# CONFIG_ASH_RANDOM_SUPPORT is not set
# CONFIG_ASH_EXPAND_PRMT is not set
# CONFIG_CTTYHACK is not set
CONFIG_HUSH=y
# CONFIG_HUSH_BASH_COMPAT is not set
# CONFIG_HUSH_BRACE_EXPANSION is not set
CONFIG_HUSH_HELP=y
CONFIG_HUSH_INTERACTIVE=y
CONFIG_HUSH_SAVEHISTORY=y
CONFIG_HUSH_JOB=y
CONFIG_HUSH_TICK=y
CONFIG_HUSH_IF=y
CONFIG_HUSH_LOOPS=y
CONFIG_HUSH_CASE=y
# CONFIG_HUSH_FUNCTIONS is not set
# CONFIG_HUSH_LOCAL is not set
# CONFIG_HUSH_RANDOM_SUPPORT is not set
# CONFIG_HUSH_EXPORT_N is not set
# CONFIG_HUSH_MODE_X is not set
# CONFIG_MSH is not set
# CONFIG_FEATURE_SH_IS_ASH is not set
CONFIG_FEATURE_SH_IS_HUSH=y
# CONFIG_FEATURE_SH_IS_NONE is not set
# CONFIG_FEATURE_BASH_IS_ASH is not set
CONFIG_FEATURE_BASH_IS_HUSH=y
# CONFIG_FEATURE_BASH_IS_NONE is not set
# CONFIG_SH_MATH_SUPPORT is not set
# CONFIG_SH_MATH_SUPPORT_64 is not set
# CONFIG_FEATURE_SH_EXTRA_QUIET is not set
# CONFIG_FEATURE_SH_STANDALONE is not set
# CONFIG_FEATURE_SH_NOFORK is not set
# CONFIG_FEATURE_SH_HISTFILESIZE is not set

#
# System Logging Utilities
#
# CONFIG_SYSLOGD is not set
# CONFIG_FEATURE_ROTATE_LOGFILE is not set
# CONFIG_FEATURE_REMOTE_LOG is not set
# CONFIG_FEATURE_SYSLOGD_DUP is not set
# CONFIG_FEATURE_SYSLOGD_CFG is not set
CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=0
# CONFIG_FEATURE_IPC_SYSLOG is not set
CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
# CONFIG_LOGREAD is not set
# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
# CONFIG_FEATURE_KMSG_SYSLOG is not set
# CONFIG_KLOGD is not set
# CONFIG_FEATURE_KLOGD_KLOGCTL is not set
# CONFIG_LOGGER is not set
