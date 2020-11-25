PACKAGECONFIG_zynqmp += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
                         ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'egl glesv2', '', d)} \
                         trace"

OPENGL_FEATURE_xilinx-zynqmp = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', ' mesa', '', d)}"

# OpenGL comes from libmali on ev/eg
DEPENDS_append_zynqmpev = "${@bb.utils.contains('PNWHITELIST_xilinx', 'libmali-xlnx', ' libmali-xlnx', ' ${OPENGL_FEATURE}', d)}"
DEPENDS_append_zynqmpeg = "${@bb.utils.contains('PNWHITELIST_xilinx', 'libmali-xlnx', ' libmali-xlnx', ' ${OPENGL_FEATURE}', d)}"

PACKAGE_ARCH_zynqmpev = "${SOC_VARIANT_ARCH}"
PACKAGE_ARCH_zynqmpeg = "${SOC_VARIANT_ARCH}"
