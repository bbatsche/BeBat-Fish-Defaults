function brewhp -d "Swap the currently active version of PHP"
  set brew_prefix (brew --prefix)
  set -U fish_user_paths (string match -vr "^$brew_prefix/opt/php@\d\.\d" $fish_user_paths)

  if set -q argv[1]
    set -U fish_user_paths $brew_prefix/opt/php@$argv[1]/bin $brew_prefix/opt/php@$argv[1]/sbin $fish_user_paths
  end
end
