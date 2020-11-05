R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
N='\033[0m'

CROSS_COMPILE="/home/csl/work/RTG-Synch/kernel/xavier/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-"

ROOTFS_DIR="/home/csl/work/RTG-Synch/kernel/xavier/Linux_for_Tegra/rootfs"
KERNEL_SRC_DIR="/home/csl/work/RTG-Synch/kernel/xavier/Linux_for_Tegra/sources/kernel/kernel-4.9"

# This script must be executed as sudo
if [ "`whoami`" != "root" ]; then
	echo -e "${R}[ERROR] Must be root!${N}"
	return
fi

cd ${KERNEL_SRC_DIR}

mkdir build
make ARCH=arm64 O=build tegra_defconfig

echo -e "${G}Compiling the L4T kernel and modules (~17-mins on 12-cores)${N}"
make ARCH=arm64 O=build CROSS_COMPILE=${CROSS_COMPILE} -j12 &>> output.log
echo >> output.log

echo -e "${G}Installing modules${N}"
make ARCH=arm64 O=build CROSS_COMPILE=${CROSS_COMPILE} INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=${ROOTFS_DIR} modules_install &>> output.log

echo -e "${C}Kernel compilation complete!${N}"
