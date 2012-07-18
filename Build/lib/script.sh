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

function run()
{
  local -i status=0

  debug "Running command: ${*}"

  # Execute the command
  #${*} &>> "${BUILD[log]}"
  ${*}

  # Get what the command returns
  status=${?}

  debug "Command returned status: ${status}"

  # If the command returned something greater than 0 then bail out
  if [ ${status} -gt 0 ]; then
    abort "${1}: command failed"
  fi
}

function checkstatus()
{
  debug "Command returned status: ${1}"

  if [ ${1} -gt 0 ]; then
    abort "command failed"
  fi
}

function runscripts()
{
  local script

  for script in "${1}"/*.sh; do
    # Only run a script if it's executable. This allows quickly disabling a
    # script.
    if [ -x "${script}" ]; then
      debug "Running script: ${script}"
      source "${script}"
    fi
  done
}

function build()
{
  debug "Arguments: ${*}"
  debug "Build directory: ${BUILD[dir]}"
  debug "Package root: ${BUILD[pkg]}"

  readonly ARCH=${ARCH:-$(def_subarch ${HOST_ARCH})}
  readonly FLAGS=${FLAGS:-$(def_flags ${ARCH})}

  debug "ARCH=${ARCH}"
  debug "FLAGS=${FLAGS}"

  # Handle the sources
  for ((source = 0; source < ${#SRCNAME[@]}; source++)); do
    runscripts "${PRE_SCRIPT_PATH}"
  done

  # Handle the package
  runscripts "${PST_SCRIPT_PATH}"

  # Clean up
}
