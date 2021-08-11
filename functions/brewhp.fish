function brewhp -a version -d "Swap the currently active version of PHP"
    set brew_prefix (brew --prefix)
    set -U fish_user_paths (string match -vr "^$brew_prefix/opt/php@\d\.\d" $fish_user_paths)

    if set -q version
        set -U fish_user_paths $brew_prefix/opt/php@$version/bin $brew_prefix/opt/php@$version/sbin $fish_user_paths
    end
end
