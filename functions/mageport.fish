function mageport -d "Teleport for Magento Cloud"
    if [ (count $argv) -lt 1 ]
        __mageport_help

        return 1
    end

    switch $argv[1]
        case "help"
            __mageport_help

        case "login"
            tsh --proxy=$__teleport_proxy --user $__teleport_user login

        case "ssh"
            if [ (count $argv) -lt 2 ]
                __mageport_help
                return 1
            end

            __mageport_ssh $argv[2..-1]

        case "scp"
            if [ (count $argv) -ne 3 ]
                __mageport_help
                return 1
            end

            __mageport_scp $argv[2..-1]

        case "*"
            __mageport_help

            return 1
    end
end
