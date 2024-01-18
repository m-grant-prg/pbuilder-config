#! /usr/bin/env bash

#########################################################################
#									#
# Author: Copyright (C) 2018, 2021, 2023, 2024  Mark Grant		#
#									#
# This file is maintained in the project at:-				#
#	https://github.com/m-grant-prg/pbuilder-config			#
#		new versions are merely copied to consumer projects.	#
#									#
# Released under the GPLv3 only.					#
# SPDX-License-Identifier: GPL-3.0-only					#
#									#
# Purpose:								#
# A hook script to print a warning that the following -built in- gpgv	#
# check on the dsc file will fail but after that a hook script will run	#
# to perform a valid check.						#
#									#
# With a script name starting with 'H' this is run after unpacking the	#
# chroot and mounting proc. (See man 8 pbuilder (the part under		#
# --hookdir=)).								#
#									#
#########################################################################

#########################################################################
#									#
# Version	v1.0.4							#
#									#
#########################################################################


if [ "$PBUILDER_OPERATION" == "build" ]; then
	echo "*************************"
	echo "The following -built in- pbuilder gpgv check on the .dsc file"
	echo "-always- fails."
	echo "See the hook script output immediately following that for a"
	echo "working gpgv check."
	echo "*************************"
fi

