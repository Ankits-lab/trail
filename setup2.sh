#!/usr/bin/env bash

echo -e "number of cores?"
nproc --all

mkdir hycon 
cd hycon
apt install -y curl
echo "setting time"
apt-get update && DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get install -y tzdata
echo "done now moving forward"
echo -e "Installing tools"
sudo apt install -y \
    adb autoconf automake axel bc bison build-essential \
    ccache clang cmake expat fastboot flex g++ \
    g++-multilib gawk gcc gcc-multilib git gnupg gperf \
    htop imagemagick lib32ncurses5-dev lib32z1-dev libtinfo5 libc6-dev libcap-dev \
    libexpat1-dev libgmp-dev '^liblz4-.*' '^liblzma.*' libmpc-dev libmpfr-dev libncurses5-dev \
    libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils '^lzma.*' lzop \
    maven ncftp ncurses-dev patch patchelf pkg-config pngcrush \
    pngquant python2.7 python-all-dev re2c schedtool squashfs-tools subversion \
    texinfo unzip w3m xsltproc zip zlib1g-dev lzip \
    libxml-simple-perl apt-utils gh \

apt install -y openjdk-8-jdk apache2 bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip python libncurses5

git clone https://github.com/dustxyz/scripts
cd scripts
chmod +x setup/android_build_env.sh
bash setup/android_build_env.sh
cd ..
echo "install repo"
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

echo "done time sync"

echo "Repo sync"
repo init -u https://github.com/HyconOS/manifest -b eleven
echo "repo init done"
repo sync -c -j12 --force-sync --no-clone-bundle --no-tags
echo "just to check everything is synced we do re sync"
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo "resync done"
echo take some rest this script will handle rest
echo starting clonning 
git clone https://github.com/keneankit01/hycon_PL2.git device/nokia/PL2
git clone https://github.com/keneankit01/hycon-common-sdm660.git device/nokia/sdm660-common
git clone https://github.com/keneankit01/hycon-DRG.git device/nokia/DRG/sprout
git clone https://github.com/keneankit01/proprietary_vendor_nokia.git vendor/nokia
git clone https://github.com/keneankit01/vendor_nokia_DRG_sprout.git -b eleven vendor/nokia/DRG_sprout
git clone https://github.com/LineageOS/android_kernel_nokia_sdm660.git kernel/nokia/sdm660
echo clonning completed
echo sync completed starting build