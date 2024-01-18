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
# A hook script to update the package index files.			#
# This is useful when building a sequence of dependent packages so that	#
# any given package will always find the latest dependencies which may	#
# have just been built.							#
#									#
# This is not a substitute for pbuilder update.				#
#									#
# With a script name starting with 'D' this is run during chroot setup,	#
# before dependencies are evaluated and before package building has	#
# started. (See man 8 pbuilder (the part under --hookdir=)).		#
#									#
#########################################################################

#########################################################################
#									#
# Version	v1.0.4							#
#									#
#########################################################################


apt-get update

