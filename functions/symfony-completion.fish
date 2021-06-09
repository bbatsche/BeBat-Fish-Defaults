function symfony-completion -d "Generation completions for a PHP Symphony based command"
    if test $argv[1] = "-t"
        symfony-autocomplete $argv[2] | source
    else
        set -l  cmd_basename (basename $argv[1])

        symfony-autocomplete $argv[1] > $fish_completions/{$cmd_basename}.fish
    end
end
