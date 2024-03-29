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

SRCPKG="${SRCPACK[${source}]##*/}"
SRCURL="${SRCPACK[${source}]%/*}"
SRCSCH="${SRCPACK[${source}]%://*}"

debug "SRCPKG=${SRCPKG}"
debug "SRCURL=${SRCURL}"
debug "SRCSCH=${SRCSCH}"

if [ ! -e "${SRCPKG}" ]; then
  if [[ "${SRCURL}" ]]; then
    info "Downloading ${SRCPACK[${source}]}"
    case "${SRCSCH}" in
      'git')
        pushd "${BUILD[dir]}" >/dev/null
	src.download.git ${SRCPACK[${source}]}
	checkstatus ${?}
	popd >/dev/null
	SRCROOT[${source}]="${SRCPKG%*.git}"
	SRCOPTS[${source}]="${SRCOPTS[${source}]} nounpack"
      ;;
      *)
        src.download ${SRCPACK[${source}]}
        # Throw a newline because curl doesn't
        echo
        # Since curl returns 0 even when it failed to download something, then
        # just check if we can find the source.
        if [ ! -e "${SRCPKG}" ]; then
	  abort "No source"
	fi
      ;;
    esac
  else
    abort "No source"
  fi
fi
