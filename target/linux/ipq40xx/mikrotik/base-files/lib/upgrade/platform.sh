# Copyright (C) 2011 OpenWrt.org

PART_NAME=firmware

REQUIRE_IMAGE_METADATA=1
platform_check_image() {
	return 0
}

platform_do_upgrade() {
	local board=$(board_name)

	case "$board" in
	*)
		# NOR devices: erase firmware if booted from initramfs
		[ -z "$(rootfs_type)" ] && mtd erase firmware

		default_do_upgrade "$1"
		;;
	esac
}
