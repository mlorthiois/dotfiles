#########################################################
# General
#########################################################
confirm() {
  read -q "response?Are you sure? [y/N] "
  case "$response" in
    [yY][eE][sS]|[yY]) 
      true
      ;;
    *)
      exit 0
      ;;
  esac
}

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

# IAM
select-aws-profile() {
  export AWS_PROFILE=$(aws configure list-profiles | fzf)
}

export-credentials() {
  eval "$(aws configure export-credentials --format env)"
}

empty-credentials() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
  unset AWS_CREDENTIAL_EXPIRATION
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

# SageMaker
empty-sm-model-group() {
  aws sagemaker list-model-packages --model-package-group-name $1 | \
    jq -r '.ModelPackageSummaryList[] | .ModelPackageArn' | \
    xargs -I{} aws sagemaker delete-model-package --model-package-name {}
}

delete-sm-models() {
  aws sagemaker list-models | \
    jq -r '.Models.[].ModelName' | \
    xargs -I{} aws sagemaker delete-model --model-name {}
}

#########################################################
# Vault
#########################################################
get-vault-token() {
  export-credentials
  env=$(echo $AWS_PROFILE | cut -d"-" -f1)
  echo "Env: $env"
  get-vault-addr
  vault login -token-only -method=aws region=eu-west-3
}
