#!/bin/bash
chsh -s /bin/bash
cp -rf vim ~/.vim
who=$(whoami)
cd
for n in bashrc bash_profile bash_aliases vimrc inputrc screenrc lftp gitrc gitconfig.${who}
do
	ln -sfv -T .rc/$n .$(basename $n .$who)
done
cd - >&/dev/null
