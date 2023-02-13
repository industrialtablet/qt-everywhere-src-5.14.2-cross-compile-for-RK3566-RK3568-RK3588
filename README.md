# This is qt5.14.2 cross-compile package for HYY RK3566 RK3568 RK3588 device with Ubuntu OS

This is the documentation for RK3568 14inch Tablet products, written by RSD Team of HYY Technology Co.,Ltd.

# How we config qt5.14.2
see config file [here](auto_config.sh)

# How we config build support gstreamer 1.0
1. install build tools on target board
```
sudo apt-get install g++-aarch64-linux-gnu on target board
```

2. Downloard QT qt-everywhere-src-5.14.2.tar.xz and uncompress
```
tar xvf qt-everywhere-src-5.14.2.tar.xz
```
3. install gstreamer packages on target board
```
sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools
sudo apt-get install libunwind-dev
```
4. Check gstreamer installed
```
pkg-config gstreamer-1.0 --cflags
-pthread -I/usr/include/gstreamer-1.0 -I/usr/include/aarch64-linux-gnu -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include
```
```
pkg-config gstreamer-1.0 --libs
-lgstreamer-1.0 -lgobject-2.0 -lglib-2.0
``` 
5. configure check gstreamer 1.0 will failed if have no libgstreamer-plugins-base1.0-dev
``` 
sudo apt install libgstreamer-plugins-base1.0-dev
``` 
7. Do config check as below:
``` 
./configure -release -opensource -confirm-license -gstreamer 1.0
``` 
will show as below:
``` 
Qt Multimedia:
  ALSA ................................... no
  GStreamer 1.0 .......................... yes
  GStreamer 0.10 ......................... no
  Video for Linux ........................ yes
  OpenAL ................................. no
  PulseAudio ............................. no
  Resource Policy (libresourceqt5) ....... no
  Windows Audio Services ................. no
  DirectShow ............................. no
  Windows Media Foundation ............... no
``` 
8. sync sysroot to Host for compile
``` 
mkdir sysroot sysroot/usr sysroot/opt
rsync -avz hyy@hyytarget:/lib sysroot
rsync -avz hyy@hyytarget:/usr/include sysroot/usr
rsync -avz hyy@hyytarget:/usr/lib sysroot/usr
``` 
9. How we config qmake.conf
```
cd /media/admin_/RK3568SDK/shadow_build_qt_5.14.2/qtbase/mkspecs/
mkdir linux-arm-som-rk3568
cp linux-aarch64-gnu-g++/* linux-arm-som-rk3568/
```
Modefied qmake.conf
```
#
# qmake configuration for building with aarch64-linux-gnu-g++
#

MAKEFILE_GENERATOR      = UNIX
CONFIG                 += incremental
QMAKE_INCREMENTAL_STYLE = sublib

QT_QPA_DEFAULT_PLATFORM = linuxfb
QMAKE_CFLAGS_RELEASE += -O2 -march=armv8-a -lts
QMAKE_CXXFLAGS_RELEASE += -O2 -march=armv8-a -lts

include(../common/linux.conf)
include(../common/gcc-base-unix.conf)
include(../common/g++-unix.conf)

QMAKE_INCDIR_OPENGL_ES2 = /media/admin_/RK3568SDK/openGL/mesa-12.0.5/install/include
QMAKE_LIBDIR_OPENGL_ES2 = /media/admin_/RK3568SDK/openGL/mesa-12.0.5/install/lib
QMAKE_LIBS_OPENGL_ES2 = -lglapi -lGLESv2

QMAKE_INCDIR = $$[QT_SYSROOT]/usr/include                             #指定sysroot头文件
QMAKE_LIBDIR = $$[QT_SYSROOT]/usr/lib                                 #指定sysroot库文件
QMAKE_LIBDIR += $$[QT_SYSROOT]/usr/lib/aarch64-linux-gnu              #指定sysroot库文件
QMAKE_LIBDIR += $$[QT_SYSROOT]/lib                                    #指定sysroot库文件

QMAKE_CXXFLAGS += -ludev -lffi -std=c++11                                 #链接选项
QMAKE_LFLAGS += -Wl,-rpath-link,$$[QT_SYSROOT]/usr/lib                    #链接sysroot库文件
QMAKE_LFLAGS += -Wl,-rpath-link $$[QT_SYSROOT]/usr/lib/aarch64-linux-gnu  #链接sysroot库文件
QMAKE_LFLAGS += -Wl,-rpath-link $$[QT_SYSROOT]/lib                        #链接sysroot库文件



# modifications to g++.conf
QMAKE_CC                = aarch64-linux-gnu-gcc
QMAKE_CXX               = aarch64-linux-gnu-g++
QMAKE_LINK              = aarch64-linux-gnu-g++
QMAKE_LINK_SHLIB        = aarch64-linux-gnu-g++

# modifications to linux.conf
QMAKE_AR                = aarch64-linux-gnu-ar cqs
QMAKE_OBJCOPY           = aarch64-linux-gnu-objcopy
QMAKE_NM                = aarch64-linux-gnu-nm -P
QMAKE_STRIP             = aarch64-linux-gnu-strip
load(qt_config)
```

# How Order
Send your message to sales team: **<export8@we-signage.com>**

# Contacts
- Website: www.we-signage.com
- https://we-signage.en.made-in-china.com/
- E-mail: dennis@we-signage.com
- MP/Whatsapp/Wechat: + 86 13349909990
- Skype: solled686