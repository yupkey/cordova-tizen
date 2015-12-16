GREP = /usr/bin/grep
CUT = /usr/bin/cut
SHELL = /bin/sh
CHMOD = chmod
CP = cp
MV = mv
NOOP = $(SHELL) -c true
RM_F = rm -f
RM_RF = rm -rf
TEST_F = test -f
TOUCH = touch
UMASK_NULL = umask 0
DEV_NULL = > /dev/null 2>&1
MKPATH = mkdir -p
CAT = cat
MAKE = make
OPEN = open
ECHO = echo
ECHO_N = echo -n
JAVA = java
PGVERSION = 2.9.0

all :: js copy_js

clean :: clean_libs

clean_libs:
	$(RM_RF) cordova-lib

copy_js: js
	$(CP) cordova-lib/cordova.js framework/cordova-$(PGVERSION).js

js: cordova-lib/cordova.js

cordova-lib/cordova.js: js/cordova.tizen.js js/native.js
	$(MKPATH) cordova-lib
	$(RM_F) $@
	$(CAT) js/native.js >> $@
	$(CAT) js/cordova.tizen.js >> $@
