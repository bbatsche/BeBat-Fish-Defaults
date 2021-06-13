set -g fish_greeting Type (set_color green)help(set_color normal) for instructions on how to use the fish shell

set -g fish_key_bindings fish_vi_key_bindings

set -g __teleport_proxy leap.magento.cloud:10443
set -g __teleport_user bbatschelet

set -g pisces_only_insert_at_eol 1

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set -g fish_cursor_default block blink
# Set the insert mode cursor to a line
set -g fish_cursor_insert line blink
# Set the replace mode cursor to an underscore
set -g fish_cursor_replace_one underscore blink

set -g fish_vi_force_cursor 1

set -g grc_plugin_execs configure curl df diff dig docker du free gcc g++ ifconfig kubectl \
                        lsof make mount mtr netstat ping ps tail traceroute uptime wdiff

if test -e {$HOME}/.iterm2_shell_integration.fish
    source {$HOME}/.iterm2_shell_integration.fish
end
