#!/bin/env python2

import platform

blackList = ['web.sanguosha.com']
redirectTarget = '127.0.0.1'

machinePlatform = platform.system()
version = 0
hostsPath = ''
if machinePlatform=='Windows':
	version = platform.win32_ver()
	hostsPath = "C:\Windows\System32\drivers\etc\hosts"


if not hostsPath== '':
	hostsFile = open(hostsPath, 'a')
	for website in blackList:
		hostsFile.write("%s %s\n"%(redirectTarget, website))
	hostsFile.close()

