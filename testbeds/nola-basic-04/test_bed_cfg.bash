# Example test-bed configuration

# Scripts should source this file to set the default environment variables
# and then override the variables specific to their test case (and it can be done
# in opposite order for same results
#
# After the env variables are set,
# call the 'lanforge/lanforge-scripts/gui/basic_regression.bash'
# from the directory in which it resides.

PWD=`pwd`
AP_SERIAL=${AP_SERIAL:-/dev/ttyAP4}
LF_SERIAL=${LF_SERIAL:-/dev/ttyLF4}
LFPASSWD=${LFPASSWD:-lanforge}  # Root password on LANforge machine
AP_AUTO_CFG_FILE=${AP_AUTO_CFG_FILE:-$PWD/ap-auto.txt}
WCT_CFG_FILE=${WCT_CFG_FILE:-$PWD/wct.txt}
DPT_CFG_FILE=${DPT_CFG_FILE:-$PWD/dpt-pkt-sz.txt}
SCENARIO_CFG_FILE=${SCENARIO_CFG_FILE:-$PWD/scenario.txt}

# Default to enable cloud-sdk for this testbed, cloud-sdk is at IP addr below
#USE_CLOUD_SDK=${USE_CLOUD_SDK:-192.168.100.164}

# LANforge target machine
LFMANAGER=${LFMANAGER:-lf4}

# LANforge GUI machine (may often be same as target)
GMANAGER=${GMANAGER:-lf4}
GMPORT=${GMPORT:-3990}
MY_TMPDIR=${MY_TMPDIR:-/tmp}

# Test configuration (10 minutes by default, in interest of time)
STABILITY_DURATION=${STABILITY_DURATION:-600}
TEST_RIG_ID=${TEST_RIG_ID:-NOLA-04-Basic}

# DUT configuration
DUT_FLAGS=${DUT_FLAGS:-0x22}  # AP, WPA-PSK
#DUT_FLAGS=${DUT_FLAGS:-0x2}  # AP, Open
DUT_FLAGS_MASK=${DUT_FLAGS_MASK:-0xFFFF}
DUT_SW_VER=${DUT_SW_VER:-OpenWrt-TIP}
DUT_HW_VER=Edgecore-ECW5410
DUT_MODEL=Edgecore-ECW5410
DUT_SERIAL=${DUT_SERIAL:-NA}
DUT_SSID1=${DUT_SSID1:-Default-SSID-2g}
DUT_SSID2=${DUT_SSID2:-Default-SSID-5gl}
DUT_PASSWD1=${DUT_PASSWD1:-12345678}
DUT_PASSWD2=${DUT_PASSWD2:-12345678}
# 2.4 radio
DUT_BSSID1=68:21:5F:9D:0C:1B
# 5Ghz radio
DUT_BSSID2=68:21:5F:9D:0C:1C

export LF_SERIAL AP_SERIAL LFPASSWD
export AP_AUTO_CFG_FILE WCT_CFG_FILE DPT_CFG_FILE SCENARIO_CFG_FILE
export LFMANAGER GMANAGER GMPORT MY_TMPDIR
export STABILITY_DURATION TEST_RIG_ID
export DUT_FLAGS DUT_FLAGS_MASK DUT_SW_VER DUT_HW_VER DUT_MODEL
export DUT_SERIAL DUT_SSID1 DUT_SSID2 DUT_SSID3
export DUT_PASSWD1 DUT_PASSWD2 DUT_PASSWD3
export DUT_BSSID1 DUT_BSSID2 DUT_BSSID3
export USE_CLOUD_SDK
