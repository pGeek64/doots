# Lines configured by zsh-newuser-install
export PATH=/home/chungus/.local/bin:/home/chungus/.spicetify:$PATH
export HISTFILE=~/.config/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bigchungus/.zshrc'
setopt extended_glob
setopt correct
ZLE_RPROMPT_INDENT=0
#eval $(starship init zsh)
autoload -Uz compinit
compinit

PS1='%B[%F{yellow}%n%f@%F{magenta}%m%f %F{blue}%~%f]%b $ '


# source ~/.config/zsh/themes/edvardm.zsh
#Plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/archlinux.plugin.zsh
source ~/.config/env
source ~/.config/shell/aliasrc
# End of lines added by compinstall

#pywal
cat ~/.cache/wal/sequences

# for lf icons
source ~/.config/zsh/scripts/lf-icons.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
shuf -n 1 ~/.local/share/words.txt
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


eval "$(atuin init zsh)"