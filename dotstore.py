#!/usr/bin/env python3
import os
import glob

def link(dir, dfdir):
    for df in glob.glob(dfdir):
        if df.endswith(('.git', '.config')):
            continue
        goodpath = os.path.join(dir, os.path.basename(df))
        if os.path.exists(goodpath):
            if os.path.samefile(df, goodpath):
                pass
            else:
                print('files differ {0} {1}'.format(df, goodpath))
        else:
            print('linking {0} to {1}'.format(df, goodpath))
            os.symlink(df, goodpath)

if __name__ == '__main__':
    link(os.path.expanduser('~/'), os.path.abspath('dotfiles/.*'))
    link(os.path.expanduser('~/.config/'), os.path.abspath('dotfiles/.config/*'))
