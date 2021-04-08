function ssm-param
  aws ssm get-parameter --with-decryption --name $argv[1] | jq -r .Parameter.Value
end
