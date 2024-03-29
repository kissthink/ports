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
info "Building ${SRCNAME[${source}]}-${SRCVERS[${source}]}"

# Create the documentation directory now so that we are able to install stuff
# into it.
if [[ ! "${SRCOPTS[${source}]}" == *shareddoc* ]]; then 
  SRCDOCDIR[${source}]="${PKG}/${SYS_DIR[doc]}/${SRCNAME[${source}],,}-${SRCVERS[${source}]}"
else
  SRCDOCDIR[${source}]="${PKG}/${SYS_DIR[doc]}/${NAME}-${VERSION}"
fi
DOC="${SRCDOCDIR[${source}]}"

if [[ ! "${SRCOPTS[${source}]}" == *skipsrcroot* ]]; then
  pushd "${SRC}" >/dev/null
fi

#build${source} &>> "${BUILD[log]}"

build${source}

if [[ ! "${SRCOPTS[${source}]}" == *skipsrcroot* ]]; then
  popd >/dev/null
fi
