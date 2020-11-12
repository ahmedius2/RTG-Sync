###############################################################################
# Usage:
#   sudo bash ./flash_kernel.sh <full>
#
#   Options:
#     <full>	: Flash the entire L4T package
###############################################################################
source functions.sh

FULL_FLASH_WARNING="You are about to erase the eMMC of the target board and flash a brand new system image!"
FULL_FLASH_EXIT_HINT="Please leave the 1st arg blank to flash only the minimum kernel image"

cd Linux_for_Tegra

echo -e "${G}[STATUS] Updating binaries${N}"
./apply_binaries.sh

if [ "${1}" == "full" ]; then
	warn_arg "${FULL_FLASH_WARNING}" "${FULL_FLASH_EXIT_HINT}"

	echo -e "${G}[STATUS]${N} ${R}Erasing eMMC${N}${G} and Flashing full L4T${N}"
	./flash.sh jetson-xavier mmcblk0p1
else
	echo -e "${G}[STATUS] Flashing the kernel${N}"
	./flash.sh -k kernel jetson-xavier mmcblk0p1
fi

echo -e "${Y}[STATUS] Flash complete!${N}"
