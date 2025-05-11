alias nvim="~/nvim-linux-x86_64.appimage"

__git_files () {
  _wanted files expl 'local files' _files
}

path+=('/usr/local/go/bin')

# Path to your oh-my-zsh installation.
export ZSH="/home/paul/.oh-my-zsh"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='vim'
source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
[ -f "/home/paul/.ghcup/env" ] && source "/home/paul/.ghcup/env" # ghcup-env

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# pnpm
export PNPM_HOME="/home/paul/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
