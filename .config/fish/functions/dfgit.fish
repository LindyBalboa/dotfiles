# Defined in - @ line 0
function dfgit --wraps 'git' --description 'alias dfgit /usr/bin/git --git-dir=/home/conner/.dfgit --work-tree=/home/conner'
	/usr/bin/git --git-dir=/home/conner/.dfgit --work-tree=/home/conner $argv;
end
