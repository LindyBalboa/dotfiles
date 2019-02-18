set -gx PATH /usr/bin /usr/local/bin /usr/bin/core_perl /usr/bin/vendor_perl 
set -gx PATH $PATH /home/conner/anaconda3/bin /home/conner/.gem/ruby/2.5.0/bin/
set -gx PATH $PATH /usr/share/krakatau 
set -x PYTHONPATH $PYTHONPATH "/home/conner/TUD/Masters/Analysis:/home/conner/PyModules"

export NODE_PATH=/home/conner/anaconda3/lib/node_modules/

export EDITOR=vim
export VISUAL=vim
set fish_key_bindings fish_vi_key_bindings
#fish_user_key_bindings
#set fish_key_bindings fish_user_key_bindings
set theme_display_vi no

source /home/conner/anaconda3/etc/fish/conf.d/conda.fish

export FZF_DEFAULT_COMMAND="ag --follow --hidden --path-to-ignore ~/.agignore -g '' "
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

set -x VIRTUAL_ENV_DISABLE_PROMPT 1
