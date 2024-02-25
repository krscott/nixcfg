if is_def zsh; then
	link_config zsh ~/.config/zsh
	(
		cd zsh
		link_config zshenv ~/.zshenv
		get_package powerlevel10k https://github.com/romkatv/powerlevel10k.git v1.20.0
	)

	# Change user shell to zsh
	chsh -s $(which zsh)
fi
