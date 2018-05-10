function brewhp -d "Swap the currently active version of PHP"
    set __brew_prefix (brew --prefix)
    set -U fish_user_paths (string match -vr "^$__brew_prefix/opt/php@\d\.\d" $fish_user_paths)

    if set -q argv[1]
        set -U fish_user_paths $__brew_prefix/opt/php@$argv[1]/bin $fish_user_paths
        set -U fish_user_paths $__brew_prefix/opt/php@$argv[1]/sbin $fish_user_paths
    end
end
