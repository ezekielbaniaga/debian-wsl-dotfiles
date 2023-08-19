if status is-interactive
    # Commands to run in interactive sessions can go here
end


#
# aliases for exa
#
alias ls='exa --icons'
alias ll='exa -lah --icons'

#
# aliases for dotfiles git commands
#
alias config='/usr/bin/git --git-dir=$HOME/.boy_deploy_config/ --work-tree=$HOME'

#
# Rust binaries
#
fish_add_path "$HOME/.cargo/bin"

#
# Zig binaries
#
fish_add_path "$HOME/.zig/zig-linux-x86_64-0.11.0"

#
# use starship prompt
# disabled because it is slowing down on my WSL
#
# starship init fish | source

function fish_greeting
	echo \n
	echo ┏━━━━━━━━━━━━━━━━━━━━┓\tDebian GNU/Linux: (set_color cyan; uname -onrm; set_color normal)
	echo ┃ --= boy_deploy =-- ┃\tFish Shell: (set_color cyan; fish --version; set_color normal)
	echo ┗━━━━━━━━━━━━━━━━━━━━┛\tDate: (set_color cyan; date; set_color normal)
	echo \n
end
