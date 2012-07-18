# Copyright (c) 2012, Christoph J. Thompson
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the copyright holder nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

function def_subarch()
{
  case "${1}" in
    x86)
      echo -n "${DEFAULT_SUBARCH[x86]}"
    ;;
    x86_64)
      echo -n "${DEFAULT_SUBARCH[x86_64]}"
    ;;
  esac
}

function def_flags()
{
  case "${1}" in
    noarch)
      return
    ;;
    i386)
      echo -n "${DIST_FLAGS[i386]}"
    ;;
    i486)
      echo -n "${DIST_FLAGS[i486]}"
    ;;
    i586)
      echo -n "${DIST_FLAGS[i586]}"
    ;;
    i686)
      echo -n "${DIST_FLAGS[i686]}"
    ;;
    x86_64)
      echo -n "${DIST_FLAGS[x86_64]}"
    ;;
    *)
      echo -n "${DIST_FLAGS[all]}"
    ;;
  esac
}

function cpufamily()
{
  case "${1}" in
    i386)
      echo -n "x86"
    ;;
    i486)
      echo -n "x86"
    ;;
    i586)
      echo -n "x86"
    ;;
    i686)
      echo -n "x86"
    ;;
    x86_64)
      echo -n "x86_64"
    ;;
  esac
}

function libdirsuffix()
{
  case "${HOST_ARCH}" in
    x86_64)
      echo -n "64"
    ;;
  esac
}
