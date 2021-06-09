function __mageport_ssh
    set host (__mageport_expand_host $argv[1])

    if [ (count $argv) -eq 1 ]
        tsh --proxy=$__teleport_proxy --user $__teleport_user ssh $host
    else
        tsh --proxy=$__teleport_proxy --user $__teleport_user ssh $host $argv[2..-1]
    end
end
