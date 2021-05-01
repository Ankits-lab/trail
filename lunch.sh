#!/usr/bin/env bash
cd mywork/aosp
source build/envsetup.sh
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
lunch lineage_PL2-userdebug
export SKIP_API_CHECKS=true
export SKIP_ABI_CHECKS=true
echo device lunched
make api-stubs-docs || echo no problem
make system-api-stubs-docs || echo no problem
make test-api-stubs-docs || echo no problem
echo make bacon time
make bacon
