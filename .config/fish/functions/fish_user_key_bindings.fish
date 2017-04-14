function fish_user_key_bindings
	bind -M insert ! bind_bang
    bind -M insert '$' bind_dollar
	
    bind -M insert -m default jk force-repaint 
end
