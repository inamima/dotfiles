function peco_aws_sso_login
  set aws_profiles (grep -E '^\[profile ' ~/.aws/config | sed 's/\[profile \(.*\)\]/\1/' | sort -u)
  set selected_profile (printf '%s\n' $aws_profiles | peco --query "$LBUFFER")

  if [ -n "$selected_profile" ]
    commandline "aws sso login --profile $selected_profile"
  end
end
