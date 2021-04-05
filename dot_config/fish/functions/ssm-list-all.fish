function ssm-list-all --description 'list all ssm variables'
	aws ssm get-parameters-by-path --path / --recursive --with-decryption
end
