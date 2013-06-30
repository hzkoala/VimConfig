#!/bin/bash
chsh -s /bin/bash
who=$(whoami)
cd
for n in vim man bashrc bash_profile bash_aliases vimrc inputrc screenrc gitrc gitconfig.${who} git-completion.bash
do
	ln -sfv -T .rc/$n .$(basename $n .$who)
done
cd - >&/dev/null
