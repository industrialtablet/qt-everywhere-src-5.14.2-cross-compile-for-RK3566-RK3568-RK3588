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
./configure -release -opensource -confirm-license -gstreamer 1.0  will show 
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



# How Order
Send your message to sales team: **<export8@we-signage.com>**

# Contacts
- Website: www.we-signage.com
- https://we-signage.en.made-in-china.com/
- E-mail: dennis@we-signage.com
- MP/Whatsapp/Wechat: + 86 13349909990
- Skype: solled686