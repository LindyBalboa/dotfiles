# TODO: Make and abbr for abbr to write to append to this list!

# Collection of fish abbreviations
# Only run if fish_initialized is not set. 
# You must run 
# 	set -e fish_initialized 
# and restart fish to refresh this fish_user_abbreviations
#
# WARNING: This will permanently delete all abbreviations not
# in this file!

if not set -q fish_initialized
	abbr -a mv "mv -i"
	abbr -a cp "cp -i"

	abbr -a gs "git status"
	abbr -a ga "git add"
	abbr -a gc "git commit"
	abbr -a gp "git push"
	abbr -a gco "git checkout"

	abbr -a dfgs "/usr/bin/git --git-dir=/home/conner/.dfg --work-tree=/home/conner status"
	abbr -a dfga "/usr/bin/git --git-dir=/home/conner/.dfg --work-tree=/home/conner add"
	abbr -a dfgc "/usr/bin/git --git-dir=/home/conner/.dfg --work-tree=/home/conner commit -m"
	abbr -a dfgp "/usr/bin/git --git-dir=/home/conner/.dfg --work-tree=/home/conner push"
	abbr -a agl "ag --pager='less -R'"
	set -U fish_initialized

end
