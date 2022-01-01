terragrunt run-all apply --terragrunt-working-dir infra/aws/ --terragrunt-non-interactive

for DELETED in "$DELETED_FILES"; do
    echo "$DELETED"
    if [ $(echo "$DELETED" | grep 'terragrunt.hcl' | grep -v 'infra/terragrunt.hcl') ]; then
        terragrunt delete --terragrunt-working-dir "${DELETED%\/*}" --terragrunt-non-interactive -auto-approve
    fi
done
