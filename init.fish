set -x PATH $PATH "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources"

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

function teleplat-login -d "Login to Platform.sh's Teleport cluster"
    tsh --proxy=leap.magento.cloud:10443 login
end

function teleplat-ssh -d "SSH into a project's environment"
    if test (count $argv) -eq 0
        echo "Who do you want to SSH to?"
        return 1
    end
    if test (count $argv) -eq 1
        tsh --proxy=leap.magento.cloud:10443 ssh $argv[1]@$argv[1].ent.magento.cloud
    else
        tsh --proxy=leap.magento.cloud:10443 ssh $argv[1]@$argv[1].ent.magento.cloud $argv[2..-1]
    end
end

set -g fish_key_bindings fish_vi_key_bindings

set -gx NVM_DIR /usr/local/opt/nvm

function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end
