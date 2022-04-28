function brewhp -a php_version -d "Swap the currently active version of PHP"
    set brew_prefix (brew --prefix)
    set -U fish_user_paths (string match -vr "^$brew_prefix/opt/php@\d\.\d" $fish_user_paths)
    set -U fish_user_paths (string match -vr "^$HOME/.config/composer/php@\d\.\d" $fish_user_paths)
    set -e COMPOSER_HOME

    # Make sure no version specific composer paths are in PATH
    # we want default PATH to use default value
    set PATH (string match -vr "$HOME/.config/composer/php@\d\.\d" $PATH)

    if test -n "$php_version"; and test -d $brew_prefix/opt/php@$php_version
        fish_add_path $brew_prefix/opt/php@$php_version/bin $brew_prefix/opt/php@$php_version/sbin

        mkdir -p $HOME/.config/composer/php@$php_version/vendor/bin
        set -Ux COMPOSER_HOME $HOME/.config/composer/php@$php_version

        if test -e $HOME/.composer/auth.json; and not test -e $COMPOSER_HOME/auth.json
            ln -s $HOME/.composer/auth.json $COMPOSER_HOME/auth.json
        end

        fish_add_path $COMPOSER_HOME/vendor/bin
    end
end
