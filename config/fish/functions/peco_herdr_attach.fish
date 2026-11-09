function peco_herdr_attach
  set sessions (herdr session list | tail -n +2 | awk '{print $1}')
  set selected_session (printf '%s\n' $sessions | peco --query "$LBUFFER")

  if [ -n "$selected_session" ]
    commandline "herdr session attach $selected_session"
  end
end
