#!/usr/bin/env bash
cd mywork/aosp
source build/envsetup.sh
lunch aosp_PL2-userdebug
export SKIP_API_CHECKS=true
export SKIP_ABI_CHECKS=true
echo device lunched
make bacon
