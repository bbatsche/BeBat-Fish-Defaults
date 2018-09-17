function __mageport_help
  echo -e \
"Usage:
  mageport help
  mageport login
  mageport ssh <project_id> [command]
  mageport scp <SOURCE> <DESTINATION>"
end

function __mageport_ssh
  set host (__mageport_expand_host $argv[1])

  if [ (count $argv) -eq 1 ]
    tsh --proxy=$__teleport_proxy --user $__teleport_user ssh $host
  else
    tsh --proxy=$__teleport_proxy --user $__teleport_user ssh $host $argv[2..-1]
  end
end

function __mageport_expand_host
  if echo $argv[1] | grep -q '@'
    # project and node specified, just append
    echo $argv[1].platform.sh
  else
    set user $argv[1]
    set project (string replace -r '_stg$' "" $argv[1])

    echo $user@$project.ent.magento.cloud
  end
end

function __mageport_expand_scp
  if [ (string match "*:*" $argv[1]) ]
    set parts (string split : $argv[1])
    set host (__mageport_expand_host $parts[1])
    set argv[1] (echo "$host:$parts[2]")
  end

  echo $argv[1]
end

function __mageport_scp
  set argv[1] (__mageport_expand_scp $argv[1])
  set argv[2] (__mageport_expand_scp $argv[2])

  tsh --proxy=$__teleport_proxy --user $__teleport_user scp $argv
end

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
