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

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git docker zsh-autosuggestions zsh-you-should-use command-not-found zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top --preview "bat --color=always --style=numbers --line-range=:500 {}"'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export PATH="$HOME/.local/bin:$PATH"
export YDOTOOL_SOCKET="/tmp/.ydotool_socket"

alias e="exa --icons"
alias ee="exa -algm --icons"
alias ea="exa -a --icons"
alias o="xdg-open"
alias gwenview="gwenview -stylesheet ~/.config/qt6ct/qss/gwenview-style.qss"

compress-pdf() {
  if [[ "$1" == "--help" || -z "$1" ]]; then
    echo "Usage: compress-pdf input.pdf output.pdf"
    echo "Compress a PDF file using Ghostscript with a balanced compression setting."
    echo "Arguments:"
    echo "  input.pdf   The input PDF file to compress."
    echo "  output.pdf  The output PDF file where the compressed version will be saved."
    return 0
  fi
  
  if [[ -z "$2" ]]; then
    echo "Error: Missing output file."
    echo "Usage: compress-pdf input.pdf output.pdf"
    return 1
  fi
  
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$2" "$1"
}


# Load Angular CLI autocompletion.
source <(ng completion script)
