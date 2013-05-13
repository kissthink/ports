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

### Tools

shopt -s expand_aliases

alias host.arch='uname -m'

alias src.download='curl -f -# -O -L'
alias src.unpack='bsdtar xf'
alias src.checksum='sha256sum'
alias src.patch='patch -p1 -s -f'

alias pkg.pack='/sbin/makepkg -l y -c n'

alias dir.make.temp='mktemp -d'

alias link='ln -sf'

alias install.doc='install -m 0644'
alias install.man='install -m 0644'
alias install.cfg='install -m 0644'
alias install.dat='install -m 0644'
alias install.bin='install -m 0755'
alias install.dir='install -m 0755 -d -D'

alias z.doc='xz -9f'
alias z.man='xz -9f'
alias z.info='xz -9f'

alias unz.patch='xzcat'

### Initialize associative arrays

declare -A DEFAULT_SUBARCH
declare -A DIST_FLAGS
declare -A SYS_DIR
declare -A URL
declare -A BUILD
declare -A DISPLAY

### Constants

readonly CWD="${PWD}"
readonly PRE_SCRIPT_PATH="${SELFPATH}/lib/pre"
readonly PST_SCRIPT_PATH="${SELFPATH}/lib/post"
readonly CONFIG="${SELFPATH}/build.conf"
readonly HOST_ARCH="$(host.arch)"

### Settings

source "${CONFIG}"

### Defaults

BUILD[root]="${SYS_DIR[tmp]:-'/var/tmp'}"
BUILD[dir]="$(dir.make.temp ${BUILD[root]}/build-XXXXXX)"
BUILD[pkg]="${BUILD[dir]}/package-root"
BUILD[log]="${BUILD[dir]}/build.log"

PKGREPO="${PKGREPO:-${CWD}}"
readonly PKG="${BUILD[pkg]}"
