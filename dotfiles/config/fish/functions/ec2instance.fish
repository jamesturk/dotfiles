function ec2instance
    awsenv james
    if count $argv > /dev/null
        set cmd $argv[1]
    else
        set cmd status
    end
    switch $cmd
        case status
            aws ec2 describe-instances --filters "Name=tag-value,Values=ego" --region=us-east-1 | jq -r .Reservations[0].Instances[0].State.Name
        case ip
            aws ec2 describe-instances --filters "Name=tag-value,Values=ego" --region=us-east-1 | jq -r .Reservations[0].Instances[0].PublicIpAddress
        case id
            aws ec2 describe-instances --filters "Name=tag-value,Values=ego" --region=us-east-1 | jq -r .Reservations[0].Instances[0].InstanceId
        case stop
            aws ec2 stop-instances --instance-ids (ego id) --region=us-east-1
        case start
            aws ec2 start-instances --instance-ids (ego id) --region=us-east-1
        case ssh
            ssh james@(ego ip) -t "tmux attach; or tmux new"
    end
end
