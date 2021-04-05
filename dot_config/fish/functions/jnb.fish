function jnb --description 'alias jnb env PYTHONHOME=/Users/james/.virtualenvs/jupyter /usr/local/bin/python3 -m jupyter notebook'
	env PYTHONHOME=/Users/james/.virtualenvs/jupyter /usr/local/bin/python3 -m jupyter notebook $argv;
end
