function discharge -d "Remove quarantine extend attribute"
    xattr -r -d com.apple.quarantine $argv
end
