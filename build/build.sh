for CHANGED in "$CHANGED_FILES"; do
    echo "$CHANGED"
    terragrunt apply --terragrunt-working-dir "${CHANGED%\/*}" --terragrunt-non-interactive -auto-approve
done

for DELETED in "$DELETED_FILES"; do
    echo "$DELETED"
    terragrunt destroy --terragrunt-working-dir "${DELETED%\/*}" --terragrunt-non-interactive -auto-approve
done
