#!/bin/bash
scriptname=${0##*/}
# Copyright (c) 2022 Sea2Cloud Storage, Inc.  All Rights Reserved
# Modesto, CA 95356
#
# b2ppsum - This is a stub to compensate for the differences between
#           the GNU version of b2sum and the open source original
#           publication of b2sum.  The open source versions includes
#           invoking the application with a "-a" algorithm flag to
#           implement parallel versions of the Blake2 algorithm
#           since these parallel versions produce different outputs
#           from b2sum, they must be publishes as a separate
#           application and assigned a different canonical hash
#           program number.  In this script, we assume that you are
#           seeking the equivalent of:
#              b2sum -a blake2bp
#                 or
#              b2sum -a blake2sp
#          This assumes that the parent makefile has created a binary
#          called b2psum which has the functionality of the open source
#          version of b2sum.
# Author - Robert E. Novak aka REN
#	sailnfool@gmail.com
#	skype:sailnfool.ren
# License CC by Sea2Cloud Storage, Inc.
# see https://creativecommons.org/licenses/by/4.0/legalcode
# for a complete copy of the Creative Commons Attribution license
#_____________________________________________________________________
# Rev.|Auth.| Date     | Notes
#_____________________________________________________________________
# 1.0 | REN |06/01/2022| Initial release
#_____________________________________________________________________
#

if [[ ! $(which b2psum) ]]
then
  echo "-e" "b2psum not found.  You need to install either:"
  echo "https://www.blake2.net/" " or " \
    "https:/github.com/sailnfool/b2sumARM"
  exit 1
fi
if [[ "${0##*/}" == b2spsum ]]
then
  b2psum -a blake2sp $@
else
  b2psum -a blask2bp $@
fi

