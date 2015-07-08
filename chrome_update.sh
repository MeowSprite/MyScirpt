#!/bin/sh
DesktopPath='/usr/share/applications/google-chrome.desktop'
if [ ! -f $DesktopPath ];then
	echo 'No google-chrome.desktop found'
	exit
fi
line=`sed -n '/Icon=/=' $DesktopPath | tail -n1`
StartupExists=`sed -n '/StartupWMClass=Google-chrome-stable/=' $DesktopPath | tail -n1`
if [ $StartupExists ];then
	echo 'already exists'
	exit
fi
if [ ! $line ];then
	echo 'Icon is not found'
else
	echo 'Rewrite desktop file'
	sed -i "${line}a StartupWMClass=Google-chrome-stable" $DesktopPath
fi