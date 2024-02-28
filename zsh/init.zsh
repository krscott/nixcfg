bindkey -e

# Fix Home/End/Delete/Ctrl-Backspace
# This might be different on other terminals. Use `showkey -a` to check.
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey  "^H"     backward-kill-word
