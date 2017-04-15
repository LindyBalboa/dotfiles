# Defined in - @ line 0
function dfg --wraps 'git' --description 'alias dfg /usr/bin/git --git-dir=/home/conner/.dfgit --work-tree=/home/conner'
	/usr/bin/git --git-dir=/home/conner/.dfgit --work-tree=/home/conner $argv;
end
