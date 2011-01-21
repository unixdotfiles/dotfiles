zle -N overwrite-mode _overwrite_mode
function _overwrite_mode() {
  zle .$WIDGET
  cursorcol_normal
}

function cursorcol() {
  printf '\e]12;%s\a' $1
}

function cursorcol_normal() {
  case $ZLE_STATE in
    *overwrite*)
      cursorcol green
      ;;
    *)
      [[ $UID = 0 ]] && cursorcol red || cursorcol \#A6CAF4
      ;;
  esac
}