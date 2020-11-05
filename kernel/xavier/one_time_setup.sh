#!/bin/bash
# Run this script as "bash <script-name>" otherwise it can make the calling
# shell terminate if it encounters an error
#
# Estimated runtime on 12-core Intel Haswell with Gigabit Ethernet = ~15-mins

R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
N='\033[0m'

REMOVE_ARCHIVES="NO"
REQUIRED_SHELL_UTILS=("aria2" "bc" "build-essential" "git-core" "kmod" "lbzip2"
"python" "sudo" "xxd")

DL_TOOLCHAIN="https://developer.nvidia.com/embedded/dlc/l4t-gcc-7-3-1-toolchain-64-bit"
DL_JETPACK="https://developer.nvidia.com/embedded/dlc/Jetson_Linux_R32.2.1"
DL_ROOTFS="https://developer.nvidia.com/embedded/dlc/r32-2-1_Release_v1.0/TX2-AGX/Tegra_Linux_Sample-Root-Filesystem_R32.2.1_aarch64.tbz2"

TOOLCHAIN_ARCHIVE="gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz"
JETPACK_ARCHIVE="Jetson_Linux_R32.2.1_aarch64.tbz2"
ROOTFS_ARCHIVE="Tegra_Linux_Sample-Root-Filesystem_R32.2.1_aarch64.tbz2"

KERNEL_SRC_TAG="tegra-l4t-r32.2.1"

# This script must be executed as sudo
if [ "`whoami`" != "root" ]; then
	echo -e "${R}[ERROR] Must be root!${N}"
	return
fi

download_and_check () {
	archive_name="$1"
	download_link="$2"
	archive_file="$3"

	if [ -f ${archive_file} ]; then
		echo -e "${G}Reusing ${archive_name} archive${N}"
		return
	fi

	echo -e "${G}Downloading ${archive_name}${N}"
	aria2c -x 10 ${2} ${download_link} &>> output.log
	echo >> output.log

	if [ ! -f ${archive_file} ]; then
		echo -e "${R}[ERROR] ${archive_name} archive not found. Please check output.log!${N}"
		exit
	fi

}

echo -e "${G}Updating APT..."
apt update &>> output.log
echo >> output.log

printf "Installing packages:"
for package in ${REQUIRED_SHELL_UTILS[@]}; do
	printf " ${package}"
	apt install -y ${package} &>> output.log
	echo >> output.log
done
echo

download_and_check "toolcahin" ${DL_TOOLCHAIN} ${TOOLCHAIN_ARCHIVE}
download_and_check "Jetpack" ${DL_JETPACK} ${JETPACK_ARCHIVE}
download_and_check "rootfs" ${DL_ROOTFS} ${ROOTFS_ARCHIVE}

echo -e "${G}Extracting toolchain${N}"
tar xvf ${TOOLCHAIN_ARCHIVE} &>> output.log
echo >> output.log

echo -e "${G}Extracting Jetpack${N}"
tar xvpf ${JETPACK_ARCHIVE} &>> output.log
echo >> output.log

echo -e "${G}Extracting rootfs (~5-min)${N}"
cd Linux_for_Tegra/rootfs
tar xvpf ../../${ROOTFS_ARCHIVE} &>> ../../output.log
echo >> ../../output.log
cd ../../

echo -e "${G}Downloading kernel source (~5-min @ 20MBps)${N}"
cd Linux_for_Tegra
time ./source_sync.sh -k ${KERNEL_SRC_TAG} &>> ../output.log
echo >> ../output.log

if [ "${REMOVE_ARCHIVES}" == "YES" ]; then
	echo -e "${G}Removing archives${N}"
	rm -f ${TOOLCHAIN_ARCHIVE} &>> output.log
	rm -f ${JETPACK_ARCHIVE} &>> output.log
	rm -f ${ROOTFS_ARCHIVE} &>> output.log
fi

echo
echo -e "${C}One time setup complete!${N}"
