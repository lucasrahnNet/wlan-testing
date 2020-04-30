#!/bin/bash

# Example usage of this script
# DUT_SW_VER=my-build-id ./run_basic.bash
#
# Other DUT variables in test_bed_cfg.bash may also be over-ridden,
# including those below.  See LANforge 'add_dut' CLI command for
# details on what these variables are for.

# DUT_FLAGS DUT_FLAGS_MASK DUT_SW_VER DUT_HW_VER DUT_MODEL
# DUT_SERIAL DUT_SSID1 DUT_SSID2 DUT_SSID3
# DUT_PASSWD1 DUT_PASSWD2 DUT_PASSWD3
# DUT_BSSID1 DUT_BSSID2 DUT_BSSID3

# Source config file
. test_bed_cfg.bash

# TODO:  Copy config file to cloud controller and restart it
# and/or do other config to make it work.

# Change to scripts dir
cd ../../lanforge/lanforge-scripts/gui

# Where to place results.  basic_regression.bash will use this variable.
RSLTS_DIR=/tmp/ben-basic-regression-fast
export RSLTS_DIR

# Clean any existing data from the results dir
rm -fr $RSLTS_DIR

# Run a subset of available tests
# See 'Tests to run' comment in basic_regression.bash for available options.

DEFAULT_ENABLE=0 WCT_DURATION=20s DO_SHORT_AP_BASIC_CX=1 DO_WCT_BI=1 ./basic_regression.bash


# Run all tests
#./basic_regression.bash

cd -

if [ ! -d $RSLTS_DIR ]
then
    echo "Test did not run as expected, $RSLTS_DIR not found."
    mkdir -p $RSLTS_DIR
fi

if [ -f ${MY_TMPDIR}/basic_regression_log.txt ]
then
    echo "Found ${MY_TMPDIR}/basic_regression_log.txt, moving into $RSLTS_DIR"
    mv ${MY_TMPDIR}/basic_regression_log.txt $RSLTS_DIR/
fi

echo "See results in $RSLTS_DIR"