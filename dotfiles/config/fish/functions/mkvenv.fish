function mkvenv
	mkvirtualenv -p (which python3) $argv
end
