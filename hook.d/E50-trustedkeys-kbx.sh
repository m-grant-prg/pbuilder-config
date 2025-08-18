#! /usr/bin/env bash

#########################################################################
#									#
# Author: Copyright (C) 2018-2021, 2023-2025  Mark Grant		#
#									#
# This file is maintained in the project at:-				#
#	https://github.com/m-grant-prg/pbuilder-config			#
#		new versions are merely copied to consumer projects.	#
#									#
# Released under the GPLv3 only.					#
# SPDX-License-Identifier: GPL-3.0-only					#
#									#
# Purpose:								#
# A hook script to prepare for gpgv.					#
# The keybox 'trustedkeys.kbx' is required by gpgv and is created if it #
# does not exist, then it is loaded or refreshed with			#
# m.grant.prg@gmail.com public key.					#
#									#
# With a script name starting with 'E' this is run during create and	#
# update after apt-get work is completed. (See man 8 pbuilder (the part	#
# under --hookdir=)).							#
#									#
#########################################################################

#########################################################################
#									#
# Version	v1.0.13							#
#									#
#########################################################################


echo "Installing gpg key for m.grant.prg@gmail.com"
# Ensure the .gnupg directory exists.
gpg --list-keys

keyserver="keyserver.ubuntu.com"

# The keybox 'trustedkeys.kbx' is required by gpgv.
gpg --no-default-keyring --keyring trustedkeys.kbx --fingerprint

if [[ $PBUILDER_OPERATION == create ]]; then
	gpg --no-default-keyring --keyring trustedkeys.kbx \
		--keyserver $keyserver --recv-keys 20ECF9F0
else
	gpg --no-default-keyring --keyring trustedkeys.kbx \
		--keyserver $keyserver --refresh-keys
fi

find /root/.gnupg -type s | xargs rm -fv

