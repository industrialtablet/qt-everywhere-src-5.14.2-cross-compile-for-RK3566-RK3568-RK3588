#!/bin/bash

../qt-everywhere-src-5.14.2/configure \
	-xplatform linux-arm-som-rk3568 \
	-prefix /media/admin_/RK3568SDK/shadow_build_qt_5.14.2/sysbase/qt5.14.2_install \
	-sysroot /media/admin_/RK3568SDK/rk3588_sysroot \
	-I ~/sysroot/usr/include \
	-L ~/sysroot/usr/lib \
	-L ~/sysroot/usr/lib/aarch64-linux-gnu \
	-L ~/sysroot/lib \
	-release -opensource -confirm-license \
	-opengl es2 \
	-gstreamer 1.0 \
	-skip qtmacextras  -skip qtandroidextras -skip qtlocation -skip qtscxml -skip qtxmlpatterns \
	-skip qtactiveqt -skip qtsensors -skip qtconnectivity -skip webview -skip qtandroidextras \
	-skip qtwebchannel -skip qtpurchasing -skip qtwebglplugin -skip qtwebengine -skip qtremoteobjects \
	-skip qtspeech -skip qtnetworkauth -skip qt3d -skip qtcharts -skip qtgamepad -skip qtdoc \
	-skip qttools -skip qtdatavis3d -skip qtlottie -skip qtmacextras -skip qtquick3d -skip qtwayland -skip qtwinextras \
	-nomake tests -nomake examples \
	-make libs \
	-pch \
	-qt-libjpeg \
	-qt-libpng \
	-qt-zlib \
	-no-sse2 \
	-no-openssl \
	-no-cups \
	-no-glib \
	-no-separate-debug-info \
