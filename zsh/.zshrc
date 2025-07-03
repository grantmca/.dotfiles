#!/bin/sh
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/sh
#
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"


export HISTFILE=$HOME/.zsh_history
ulimit -n 1024 # increased from 256
# zsh options for more info use man zshoptions
setopt appendhistory

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# Color
autoload -Uz colors && colors

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "romkatv/powerlevel10k"
plug "zap-zsh/completions"

# Add Files For Organization
source "$HOME/.config/zsh/zsh-aliases"
# source "$HOME/.config/zsh/zsh-work-aliases"
source "$HOME/.config/zsh/zsh-exports"
# source "$HOME/.config/zsh/zsh-work-exports"
source "$HOME/.config/zsh/zsh-history"
source "$HOME/.config/zsh/zsh-keys"

#Enviroment variables set everywhere
export EDITOR="nvim"
export TERMINAL="Ghostty"
export BROWSER="firefox"
export TERM="xterm-256color"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/DMcAllister/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/DMcAllister/.bun/_bun" ] && source "/Users/DMcAllister/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
