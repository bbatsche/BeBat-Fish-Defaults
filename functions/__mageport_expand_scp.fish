function __mageport_expand_scp
    if [ (string match "*:*" $argv[1]) ]
        set parts (string split : $argv[1])
        set host (__mageport_expand_host $parts[1])
        set argv[1] (echo "$host:$parts[2]")
    end

    echo $argv[1]
end

