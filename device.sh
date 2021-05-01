#!/usr/bin/env bash
cd mywork/aosp
echo starting clonning
git clone https://github.com/LineageOS/android_device_nokia_PL2.git device/nokia/PL2
git clone https://github.com/LineageOS/android_device_nokia_sdm660-common.git device/nokia/sdm660-common
git clone https://github.com/LineageOS/android_kernel_nokia_sdm660.git kernel/nokia/sdm660
git clone https://github.com/TheMuppets/proprietary_vendor_nokia.git vendor/nokia 
echo clonning completed
echo sync completed starting build
