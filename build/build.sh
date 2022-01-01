CHANGED_FILES=$(cat CHANGED | jq '.[]' | xargs)

for CHANGED in "$CHANGED_FILES"; do
    echo "$CHANGED"
    terragrunt apply --terragrunt-working-dir "${CHANGED%\/*}" --terragrunt-non-interactive -auto-approve
done
