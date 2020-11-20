# OpenGL comes from libmali on ev/eg, when egl is enabled
DEPENDS_MALI_XLNX = "${@bb.utils.contains('PACKAGECONFIG', 'egl', 'libmali-xlnx', '', d)}"
PKG_ARCH_XLNX = "${@bb.utils.contains('PACKAGECONFIG', 'egl', '${SOC_VARIANT_ARCH}', '${TUNE_PKGARCH}', d)}"

DEPENDS_append_zynqmpev = "${@bb.utils.contains('PNWHITELIST_xilinx', 'libmali-xlnx', ' ${DEPENDS_MALI_XLNX}', ' mesa', d)}"
DEPENDS_append_zynqmpeg = "${@bb.utils.contains('PNWHITELIST_xilinx', 'libmali-xlnx', ' ${DEPENDS_MALI_XLNX}', ' mesa', d)}"

PACKAGE_ARCH_zynqmpev = "${PKG_ARCH_XLNX}"
PACKAGE_ARCH_zynqmpeg = "${PKG_ARCH_XLNX}"
