complete -c awsenv -x -a (python -c "with(open('/Users/james/.aws/credentials')) as f:  print(' '.join(line.strip(' []\n') for line in f.readlines() if line.startswith('[')))")
