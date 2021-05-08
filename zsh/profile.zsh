

# autoload -U colors && colors
venv_info() {
    local venv=''; [[ -n $VIRTUAL_ENV ]] && venv="%F{39}${VIRTUAL_ENV##*/}%f"
    [[ -n "$venv" ]] && [[ -n $(git branch 2>/dev/null) ]] && echo "$venv, " || echo "$venv"
}

local LAMBDA="%F{220}λ%f"
local DELTA="%F{217}𝚫%f"

export VIRTUAL_ENV_DISABLE_PROMPT=1


PROMPT=$''$LAMBDA' $([[ $(scutil --nc list 2>/dev/null) =~ 'Connected' ]] && echo $DELTA)($(venv_info)%F{34}$(git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/")%f) -> %~/% : '

RPROMPT='$([[ -n $(git rev-parse --git-dir 2>/dev/null) ]] && echo "[%{\e[36m%}$(git rev-parse --short HEAD)%{\e[0m%}]")'
