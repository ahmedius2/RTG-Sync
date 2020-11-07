R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
N='\033[0m'

ROOT="`pwd`"
KERNEL_OUT_DIR="${ROOT}/Linux_for_Tegra/kernel"
KERNEL_SRC_DIR="${ROOT}/Linux_for_Tegra/sources/kernel/kernel-4.9"

copy_kernel_image_and_dtbs () {
	if [ ! -f ${KERNEL_SRC_DIR}/build/arch/arm64/boot/Image ]; then
		echo -e "${R}[ERROR] Kernel image not found!${N}"
		exit
	fi

	echo
	echo -e "${G}[STATUS] Copying kernel image${N}"
	cp ${KERNEL_SRC_DIR}/build/arch/arm64/boot/Image ${KERNEL_OUT_DIR}/Image

	echo
	echo -e "${G}[STATUS] Copying dtbs${N}"
	cp -r ${KERNEL_SRC_DIR}/build/arch/arm64/boot/dts/* ${KERNEL_OUT_DIR}/dtb/.
}

sign_kernel_image () {
	cd Linux_for_Tegra

	echo
	echo -e "${G}[STATUS] Signing kernel image${N}"
	./l4t_sign_image.sh --file kernel/Image --chip 0x19 &>> ${ROOT}/update.log

	cd ..
}

# This script must be executed as sudo
if [ "`whoami`" != "root" ]; then
	echo -e "${R}[ERROR] Must be root!${N}"
	return
fi

copy_kernel_image_and_dtbs
sign_kernel_image

echo
echo -e "${Y}[STATUS] Kernel image is now ready to be flashed!${N}"
