echo bash profile loaded...

if uname -a | grep -q MING; then
	echo Git bash environment, cd ~/src/\$LATEST
	[ -d ~/src ] && cd $(ls -td ~/src/*/ | head -1)
fi
