function fish_user_key_bindings
	fzf_key_bindings
	bind -M insert ! bind_bang
    bind -M insert '$' bind_dollar
	
    bind -M insert -m default jk force-repaint 

	bind -M insert \ca beginning-of-line
	bind -M insert \ce end-of-line
	bind -M default \ca beginning-of-line
	bind -M default \ce end-of-line
end
