function _line
    set -l line $argv[1]
    set -l file $argv[2]
    echo (cat $file | head -n $line | tail -n 1)
end

