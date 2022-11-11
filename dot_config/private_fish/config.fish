set -gx GOPATH /Users/sgetman/go
set -gx GOBIN $GOPATH/bin
set -gx EDITOR nvim
set -gxp PATH $GOBIN 
set -gxp PATH "$HOME/.cargo/bin"
set -gxp PATH "$HOME/.npm-global/bin"

#set -x LC_ALL en_GB.UTF-8

# git prompt settings
#set -g __fish_git_prompt_show_informative_status 1
#set -g __fish_git_prompt_showdirtystate 'yes'
#set -g __fish_git_prompt_char_stateseparator ' '
#set -g __fish_git_prompt_char_dirtystate "✖"
#set -g __fish_git_prompt_char_cleanstate "✔"
#set -g __fish_git_prompt_char_untrackedfiles "…"
#set -g __fish_git_prompt_char_stagedstate "●"
#set -g __fish_git_prompt_char_conflictedstate "+"
#set -g __fish_git_prompt_color_dirtystate yellow
#set -g __fish_git_prompt_color_cleanstate green --bold
#set -g __fish_git_prompt_color_invalidstate red
#set -g __fish_git_prompt_color_branch cyan --dim --italics

alias vi="nvim"

alias python=python3
starship init fish | source

# Setting PATH for Python 3.10
# The original version is saved in /Users/sgetman/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"
set -x PATH "(pyenv root)/shims" "$PATH"
set -x PATH "/Users/sgetman/.linkerd2/bin" "$PATH"

kubectl completion fish | source
