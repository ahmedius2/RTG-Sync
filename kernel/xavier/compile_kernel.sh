###############################################################################
# Usage:
#   sudo bash ./compile_kernel.sh <full [preempt_rt] [defconfig]>
#
#   Options:
# 	<full>		: Compile the full L4T package (kernel + modules)
#
#       Additional Option for full L4T build:
#	  	[preempt_rt]	: Apply the preempt_rt to the kernel
#	  	[defconfig]	: Create default kernel config
###############################################################################
source functions.sh

# Make sure that we are executing this script as root
check_root

cd ${KERNEL_SRC_DIR}

if [ "${1}" == "full" ]; then
	warn_arg "You are about to compile the full L4T kernel! (long operation > 20-mins)" "Please leave the 1st arg blank to compile the minimum kernel image"

	if [ "${2}" == "preempt_rt" ]; then
		warn_arg "You are about to apply the preempt_rt patch to the L4T kernel!" "Please leave the 2nd arg blank to compile the default kernel"

		echo
		echo -e "${G}[STATUS] Patching the kernel with PREEMPT_RT${N}"
		cd scripts
		./rt-patch.sh apply-patches
	fi

	if [ "${3}" == "defconfig" ]; then
		warn_arg "You are about to generate default tegra config!" "Please leave the 3nd arg blank to use the current config (if exists)"

		echo
		echo -e "${G}[STATUS] Making default kernel config${N}"
		cd ..
		mkdir build
		make ARCH=arm64 O=build tegra_defconfig
	fi

	echo
	echo -e "${G}[STATUS] Compiling the L4T kernel and modules (~17-mins on 12-cores)${N}"
	make ARCH=arm64 O=build CROSS_COMPILE=${CROSS_COMPILE} -j4 2>&1 | tee ${ROOT}/kernel_compile.log

	echo
	echo -e "${G}[STATUS] Installing modules${N}"
	make ARCH=arm64 O=build CROSS_COMPILE=${CROSS_COMPILE} INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=${ROOTFS_DIR} modules_install 2>&1 | tee ${ROOT}/modules_install.log

	echo -e "${Y}[STATUS] Kernel compilation complete!${N}"
	exit
fi

echo
echo -e "${G}[STATUS] Compiling the L4T kernel image only${N}"
make ARCH=arm64 O=build CROSS_COMPILE=${CROSS_COMPILE} -j4 Image 2>&1 | tee ${ROOT}/kernel_compile.log
echo -e "${Y}[STATUS] Kernel image compilation complete!${N}"
