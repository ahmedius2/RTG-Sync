R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
N='\033[0m'

ROOT="`pwd`"

cd Linux_for_Tegra

echo -e "${G}[STATUS] Updating binaries${N}"
./apply_binaries.sh

echo
echo -e "${G}[STATUS] Flashing kernel${N}"
./flash.sh jetson-xavier mmcblk0p1

echo
echo -e "${Y}[STATUS] Flash complete!${N}"
