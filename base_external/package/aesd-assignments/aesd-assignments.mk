##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = 8083a98ef1d018fa17f49f7efaa36b4794c19f4a
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-mennaelzahar.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
    # Build finder-app components
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
    
    # Build aesdsocket
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server aesdsocket
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    # Install finder-app components
    $(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf/
    $(INSTALL) -m 0644 $(@D)/finder-app/conf/username.txt $(TARGET_DIR)/etc/finder-app/conf/
    $(INSTALL) -m 0644 $(@D)/finder-app/conf/assignment.txt $(TARGET_DIR)/etc/finder-app/conf/
    
    $(INSTALL) -d 0755 $(TARGET_DIR)/usr/bin
    $(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/finder
    $(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test

    # Install aesdsocket
    $(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/
    
    # Install init script
    $(INSTALL) -d 0755 $(TARGET_DIR)/etc/init.d
    $(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
    
    # Install assignment-autotest files
    $(INSTALL) -d 0755 $(TARGET_DIR)/bin
    $(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
