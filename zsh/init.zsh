bindkey -e

# Key codes depend on the terminal. Use `showkey -a` to check.
bindkey  "^[[H"   beginning-of-line   # Home
bindkey  "^[[1~"  beginning-of-line   # Home (tmux)
bindkey  "^[[F"   end-of-line         # End
bindkey  "^[[4~"  end-of-line         # End (tmux)
bindkey  "^[[3~"  delete-char         # Del
bindkey  "^H"     backward-kill-word  # Ctrl+Backspace (no tmux equivalent--use Alt instead)
bindkey "^[[1;3D" backward-word       # Alt+Left (tmux)
bindkey "^[[1;3C" forward-word        # Alt+Right (tmux)
bindkey "^[[1;5D" backward-word       # Ctrl+Left (tmux)
bindkey "^[[1;5C" forward-word        # Ctrl+Right (tmux)


alias nsh="nix-shell --command zsh -p"
alias ndev="nix develop --command zsh"
