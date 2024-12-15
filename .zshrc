# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    command-not-found
    dirhistory
)

source $ZSH/oh-my-zsh.sh


# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
pokemon-colorscripts --no-title -s -r

#ALIAS
alias conf='code "$HOME/.zshrc" && code "$HOME/.p10k.zsh" && code "$HOME/.config/neofetch/config.conf" && code "$HOME/.config/kitty/kitty.conf"'
alias ls="lsd"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

mongodb() {
    if [ "$1" = "start" ]; then
        sudo systemctl start mongod
    elif [ "$1" = "stop" ]; then
        sudo systemctl stop mongod
    elif [ "$1" = "restart" ]; then
        sudo systemctl restart mongod
    elif [ "$1" = "status" ]; then
        sudo systemctl status mongod
    else
        echo "Usage: mongodb {start|stop}"
    fi
}
