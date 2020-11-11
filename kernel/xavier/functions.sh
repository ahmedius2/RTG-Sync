R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
N='\033[0m'

ROOT="`pwd`"
L4T_DIR="${ROOT}/Linux_for_Tegra"
ROOTFS_DIR="${L4T_DIR}/rootfs"
KERNEL_SRC_DIR="${L4T_DIR}/sources/kernel/kernel-4.9"
CROSS_COMPILE="${ROOT}/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-"

# This script must be executed as sudo
check_root () {
	if [ "`whoami`" != "root" ]; then
		echo -e "${R}[ERROR] This script must be executed as root!${N}"
		exit
	fi
}

# If user enters "no", this function will make the script exit.
# If user enters "yes", the function will return to resume execution in the
# calling script
warn_arg () {
	local prompt=${1}
	local hint=${2}
	local valid=0

	echo -e "${Y}[WARNING] ${prompt}${N}"
	echo -ne "${C}[PROMPT] Is this what you really want? (yes/no): ${N}"

	while [ "${valid}" == "0" ]; do
		read choice
		case ${choice} in
			"y"|"yes"|"Y"|"Yes")
				valid=1
				;;
			"n"|"no"|"N"|"No")
				echo -e "${G}[Hint] ${hint}. Exiting...${N}"
				exit
				;;
			*)
				echo -e "${R}[ERROR] Invalid response: <${choice}>!${N}"
				echo -ne "${C}[PROMPT] Please enter (yes/no): ${N}"
				;;
		esac
	done
}
