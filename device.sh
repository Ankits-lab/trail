#!/usr/bin/env bash
cd mywork/aosp
echo starting clonning 
git clone https://github.com/keneankit01/hycon_PL2.git device/nokia/PL2
git clone https://github.com/keneankit01/hycon-common-sdm660.git device/nokia/sdm660-common
git clone https://github.com/keneankit01/hycon-DRG.git device/nokia/DRG/sprout
git clone https://github.com/keneankit01/proprietary_vendor_nokia.git vendor/nokia
git clone https://github.com/keneankit01/vendor_nokia_DRG_sprout.git -b eleven vendor/nokia/DRG_sprout
git clone https://github.com/LineageOS/android_kernel_nokia_sdm660.git kernel/nokia/sdm660
echo clonning completed
echo sync completed starting build
