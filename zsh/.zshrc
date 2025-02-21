
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/jacobr/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt beep extendedglob nomatch notify
# End of lines configured by zsh-newuser-install

setopt no_extended_history

# Enable commands
  # starship
  eval "$(starship init zsh)"
  
  # zoxide
  eval "$(zoxide init zsh)"

  # fzf
  source <(fzf --zsh)
