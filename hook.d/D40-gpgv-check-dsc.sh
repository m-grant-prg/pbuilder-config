#! /usr/bin/env bash

#########################################################################
#									#
# Author: Copyright (C) 2018, 2020, 2021, 2023, 2024  Mark Grant	#
#									#
# This file is maintained in the project at:-				#
#	https://github.com/m-grant-prg/pbuilder-config			#
#		new versions are merely copied to consumer projects.	#
#									#
# Released under the GPLv3 only.					#
# SPDX-License-Identifier: GPL-3.0-only					#
#									#
# Purpose:								#
# A hook script to run gpgv on all .dsc files.				#
#									#
# The gpgv run by pbuilder -always- fails. Whilst that pbuilder check	#
# still runs and fails, it is now followed by this hook script which	#
# works. gpgv requires the keybox 'trustedkeys.kbx'.			#
#									#
# With a script name starting with 'D' this is run during chroot setup,	#
# before dependencies are evaluated and before package building has	#
# started. (See man 8 pbuilder (the part under --hookdir=)).		#
#									#
#########################################################################

#########################################################################
#									#
# Version	v1.0.6							#
#									#
#########################################################################


if [[ $REL != xenial ]]; then
	echo "Checking the following .dsc files:-"
	ls /build/*.dsc
	gpgv /build/*.dsc
fi

