set -x PATH $PATH "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources"
set -x COMPOSER_MEMORY_LIMIT -1

set fish_greeting Type (set_color green)help(set_color normal) for instructions on how to use the fish shell

function la --description 'List contents of directory, including hidden files in directory using long format'
  ls -lAhFG $argv
end

function ll --description 'List contents of directory using long format'
  ls -lhFG $argv
end

function px
  ps xco pid,pcpu,pmem,command
end

function pxa
  ps axco user,pid,pcpu,pmem,command
end

function logout --description 'I am so used to running logout instead of exit. Let\'s just give up already.'
  exit
end

set -g fish_key_bindings fish_vi_key_bindings

set -gx NVM_DIR /usr/local/opt/nvm

set -g __teleport_proxy leap.magento.cloud:10443
set -g __teleport_user bbatschelet

function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end
