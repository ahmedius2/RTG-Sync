###############################################################################
# Usage:
#   sudo bash ./update_and_sign_kernel.sh <full>
#
#   Options:
#     <full>	: Copy kernel as well as DTBs to the output directory
###############################################################################
source functions.sh

copy_kernel_image () {
	if [ ! -f ${KERNEL_SRC_DIR}/build/arch/arm64/boot/Image ]; then
		echo -e "${R}[ERROR] Kernel image not found!${N}"
		exit
	fi

	echo -e "${G}[STATUS] Copying kernel image${N}"
	cp ${KERNEL_SRC_DIR}/build/arch/arm64/boot/Image ${KERNEL_OUT_DIR}/Image
}

copy_dtbs () {
	echo -e "${G}[STATUS] Copying dtbs${N}"
	cp -r ${KERNEL_SRC_DIR}/build/arch/arm64/boot/dts/* ${KERNEL_OUT_DIR}/dtb/.
}

sign_kernel_image () {
	cd Linux_for_Tegra

	echo -e "${G}[STATUS] Signing kernel image${N}"
	./l4t_sign_image.sh --file kernel/Image --chip 0x19 &>> ${ROOT}/update.log

	cd ..
}

# This script must be executed as sudo
check_root

copy_kernel_image

if [ "${1}" == "full" ]; then
	copy_dtbs
fi

sign_kernel_image

echo
echo -e "${Y}[STATUS] Kernel image is now ready to be flashed!${N}"
