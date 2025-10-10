function peco_ssh_connect
  set ssh_hosts (cat ~/.ssh/config | grep -E "^[Hh]ost " | grep -v "github.com" | awk '{print $2}' | sort -u)
  set selected_host (printf '%s\n' $ssh_hosts | peco --query "$LBUFFER")

  if [ -n "$selected_host" ]
    commandline "ssh $selected_host"
  end
end
