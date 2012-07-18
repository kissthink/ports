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

function color()
{

  local color=""

  # If requested, don't display colors
  if [[ "${DISPLAY[color]}" == "no" ]]; then
    return
  fi

  case "${1}" in
    "")
      return
    ;;
    end)
      color="\e[0;0m"
    ;;
    black)
      color="\e[0;30m"
    ;;
    red)
      color="\e[0;31m"
    ;;
    green)
      color="\e[0;32m"
    ;;
    brown)
      color="\e[0;33m"
    ;;
    blue)
      color="\e[0;34m"
    ;;
    purple)
      color="\e[0;35m"
    ;;
    cyan|debug)
      color="\e[0;36m"
    ;;
    lightgray)
      color="\e[0;37m"
    ;;
    darkgray)
      color="\e[1;30m"
    ;;
    lightred|error)
      color="\e[1;31m"
    ;;
    lightgreen|info)
      color="\e[1;32m"
    ;;
    yellow)
      color="\e[1;33m"
    ;;
    lightblue)
      color="\e[1;34m"
    ;;
    pink|warning)
      color="\e[1;35m"
    ;;
    lightcyan)
      color="\e[1;36m"
    ;;
    white)
      color="\e[1;37m"
    ;;
    *)
      return
    ;;
  esac

  echo -ne "${color}"

}
