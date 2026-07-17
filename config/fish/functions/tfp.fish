function tfp --description 'Run terraform with an AWS profile selected via peco'
  set aws_profiles (grep -E '^\[profile ' ~/.aws/config | sed 's/\[profile \(.*\)\]/\1/' | sort -u)
  set selected_profile (printf '%s\n' $aws_profiles | peco --query "$TFP_LAST_PROFILE" --prompt "AWS_PROFILE>")

  if [ -n "$selected_profile" ]
    set -g TFP_LAST_PROFILE $selected_profile
    env AWS_PROFILE=$selected_profile terraform $argv
  end
end
