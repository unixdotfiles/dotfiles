#some settings
PS1_USER="${ANSI_COLOR_BLUE}\u";              #my username
if __inSSH
then
      PS1_HOST="${ANSI_COLOR_LIGHT_BLUE}\h${ANSI_COLOR_DEFAULT}"
else
      PS1_HOST="${ANSI_COLOR_BLUE}\h${ANSI_COLOR_DEFAULT}";              #hostname
fi
PS1_WD="${ANSI_COLOR_MAGENTA}\w";     #current working directory
PS1_PROMPT="\$";                          #EOF

export PS1="[\! $PS1_USER@$PS1_HOST $PS1_WD ${ANSI_COLOR_DEFAULT}]$PS1_PROMPT"
