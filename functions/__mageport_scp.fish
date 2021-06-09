function __mageport_scp
    set argv[1] (__mageport_expand_scp $argv[1])
    set argv[2] (__mageport_expand_scp $argv[2])

    tsh --proxy=$__teleport_proxy --user $__teleport_user scp $argv
end
