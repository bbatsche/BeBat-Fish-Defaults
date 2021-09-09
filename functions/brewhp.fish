function brewhp -a php_version -d "Swap the currently active version of PHP"
    set brew_prefix (brew --prefix)
    set -U fish_user_paths (string match -vr "^$brew_prefix/opt/php@\d\.\d" $fish_user_paths)

    if set -q php_version
        set -U fish_user_paths $brew_prefix/opt/php@$php_version/bin $brew_prefix/opt/php@$php_version/sbin $fish_user_paths
    end
end
