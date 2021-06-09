function __mageport_expand_host
    if [ (string match "*@*" $argv[1]) ]
        set parts (string split @ $argv[1])
        set user $parts[1]
        set host $parts[2]

        if not [ (string match "*.*" $host) ]
            set host $host.platform.sh
        end

        echo $user@$host
    else
        set user $argv[1]
        set project (string replace -r '_stg$' "" $argv[1])

        echo $user@$project.ent.magento.cloud
    end
end
