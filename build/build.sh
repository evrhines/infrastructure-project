
for CHANGED in "$CHANGED_FILES"; do
    echo "$CHANGED"
    if [ $(echo "$CHANGED" | grep 'terragrunt.hcl' | grep -v 'infra/terragrunt.hcl') ]; then
        terragrunt apply --terragrunt-working-dir "${CHANGED%\/*}" --terragrunt-non-interactive -auto-approve
    fi
done

for DELETED in "$DELETED_FILES"; do
    echo "$DELETED"
    if [ $(echo "$DELETED" | grep 'terragrunt.hcl' | grep -v 'infra/terragrunt.hcl') ]; then
        terragrunt apply --terragrunt-working-dir "${DELETED%\/*}" --terragrunt-non-interactive -auto-approve
    fi
done
