function prefix()
{

  local prefix=""

  # If requested, don't display prefixes
  if [[ "${DISPLAY[prefix]}" == "no" ]]; then
    return
  fi

  case "${1}" in
    "")
      return
    ;;
    error)
      prefix="!!!"
    ;;
    warning)
      prefix="+++"
    ;;
    info)
      prefix=">>>"
    ;;
    debug)
      prefix="%%%"
    ;;
    *)
      return
    ;;
  esac

  echo -ne "${prefix}"

}

function display()
{
  echo -e "$(color ${1})$(prefix ${1}) ${2}$(color end)"
}

function error()
{
  display error "${1}"
}

function debug()
{
  # If requested don't display debug messages
  if [[ "${DISPLAY[debug]}" == "no" ]]; then
    return
  fi

  display debug "${1}"
}

function warning()
{
  display warning "${1}"
}

function info()
{
  display info "${1}"
}
