# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto      # update automatically without asking
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' frequency 7
ENABLE_CORRECTION="false"
HIST_STAMPS="dd.mm.yyyy"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git docker zsh-autosuggestions zsh-you-should-use command-not-found zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top --preview "bat --color=always --style=numbers --line-range=:500 {}"'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

alias e="exa --icons"
alias ee="exa -algm --icons"
alias ea="exa -a --icons"
