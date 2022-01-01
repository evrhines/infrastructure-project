CHANGED_FILES=$(cat "$HOME"/files_added.json "$HOME"/files_modified.json "$HOME"/files_renamed.json  | jq '.[]' | xargs)
DELETED_FILES=$(cat "$HOME"/files_deleted.json | jq '.[]' | xargs)

for CHANGED in "$CHANGED_FILES"; do
    echo "$CHANGED"
    terragrunt apply --terragrunt-working-dir "${CHANGED%\/*}" --terragrunt-non-interactive -auto-approve
done

for DELETED in "$DELETED_FILES"; do
    echo "$DELETED"
    terragrunt destroy --terragrunt-working-dir "${DELETED%\/*}" --terragrunt-non-interactive -auto-approve
done
