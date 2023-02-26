
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 'ce0ecf33e9345f4088205dbc3d7849d6bee84b5c'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-Schievel1.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	CROSS_COMPILE="aarch64-buildroot-linux-uclibc-" $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app default
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server
#	CROSS_COMPILE="/home/pascal/dev/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-" $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app default
#	CROSS_COMPILE="/home/pascal/dev/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-" $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server
#	CROSS_COMPILE="/__w/assignment-5-Schievel1/assignment-5-Schievel1/buildroot/output/host/bin/aarch64-buildroot-linux-uclibc-" $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app default
#	CROSS_COMPILE="/__w/assignment-5-Schievel1/assignment-5-Schievel1/buildroot/output/host/bin/aarch64-buildroot-linux-uclibc-" $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
