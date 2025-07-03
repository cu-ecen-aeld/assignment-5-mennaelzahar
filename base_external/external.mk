################################################################################
#
# project_base external package
#
################################################################################

# Include all package .mk files from your external tree
include $(sort $(wildcard $(BR2_EXTERNAL_project_base_PATH)/package/*/*.mk))