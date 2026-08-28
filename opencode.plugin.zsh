if ! (( $+commands[opencode] )); then
  print "zsh opencode plugin: opencode not found. Please install opencode before using this plugin." >&2
  return 1
fi
