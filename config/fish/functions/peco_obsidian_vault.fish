function peco_obsidian_vault
  set vaults_dir ~/Documents/vaults
  set selected_vault (find $vaults_dir -mindepth 1 -maxdepth 1 -type d | xargs -n1 basename | sort | peco --query "$LBUFFER")

  if [ -n "$selected_vault" ]
    open "obsidian://open?path="(string escape --style=url $vaults_dir/$selected_vault)
    commandline -f repaint
  end
end
