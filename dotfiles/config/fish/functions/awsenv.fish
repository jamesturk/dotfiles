function awsenv
    if count $argv > /dev/null
        set -xg AWS_DEFAULT_PROFILE $argv
    else
        echo $AWS_DEFAULT_PROFILE
    end
end
