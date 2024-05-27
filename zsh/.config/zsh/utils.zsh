pyright-venv-config() {
  echo '{ "venvPath": ".", "venv": ".venv" }' | jq > pyrightconfig.json
}

wd() {
  baseline="$HOME/Developer/" 
  cd $(
    fd -0 -u -E ".terraform" -td "^.git$" "$baseline" |\
      xargs -0 dirname |\
      fzf \
        --preview-window "right:50%" \
        --preview "eza -la --icons --group-directories-first --color=always --no-filesize {}"
    )
}

#########################################################
# AWS
#########################################################
select-aws-profile() {
  export AWS_PROFILE=$(aws configure list-profiles | fzf)
}

export_credentials() {
  eval "$(aws configure export-credentials --format env)"
}

empty_credentials() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
  unset AWS_CREDENTIAL_EXPIRATION
}

empty_model_group() {
  aws sagemaker list-model-packages --model-package-group-name $1 | \
    jq -r '.ModelPackageSummaryList[] | .ModelPackageArn' | \
    xargs -I{} aws sagemaker delete-model-package --model-package-name {}
}

assume-role() {
  echo "Assuming $role_arn..."
  credentials=$(
    aws sts assume-role \
      --role-arn $1 \
      --role-session-name tmp | \
      jq ".Credentials"
  )

  export AWS_ACCESS_KEY_ID=$(echo $credentials | jq -r ".AccessKeyId")
  export AWS_SECRET_ACCESS_KEY=$(echo $credentials | jq -r ".SecretAccessKey")
  export AWS_SESSION_TOKEN=$(echo $credentials | jq -r ".SessionToken")
  echo "Role $role_arn assumed."
}

