complete -c awsenv -x -a (python -c "import os; f=open(os.path.expanduser('~/.aws/credentials'));  print(' '.join(line.strip(' []\n') for line in f.readlines() if line.startswith('[')))")
