R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
N='\033[0m'

ROOT="`pwd`"
ROOTFS_DIR="${ROOT}/Linux_for_Tegra/rootfs"
KERNEL_SRC_DIR="${ROOT}/Linux_for_Tegra/sources/kernel/kernel-4.9"
CROSS_COMPILE="${ROOT}/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-"

# This script must be executed as sudo
if [ "`whoami`" != "root" ]; then
	echo -e "${R}[ERROR] Must be root!${N}"
	return
fi

cd ${KERNEL_SRC_DIR}

echo -e "${G}[STATUS] Patching the kernel with PREEMPT_RT${N}"
cd scripts
./rt-patch.sh apply-patches

echo
echo -e "${G}[STATUS] Making default kernel config${N}"
cd ..
mkdir build
make ARCH=arm64 O=build tegra_defconfig

echo
echo -e "${G}[STATUS] Compiling the L4T kernel and modules (~17-mins on 12-cores)${N}"
make ARCH=arm64 O=build CROSS_COMPILE=${CROSS_COMPILE} -j4 2>&1 | tee ${ROOT}/kernel_compile.log

echo
echo -e "${G}[STATUS] Installing modules${N}"
make ARCH=arm64 O=build CROSS_COMPILE=${CROSS_COMPILE} INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=${ROOTFS_DIR} modules_install 2>&1 | tee ${ROOT}/modules_install.log

echo -e "${Y}[STATUS] Kernel compilation complete!${N}"
