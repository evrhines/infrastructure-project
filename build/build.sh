CHANGED_FILES=$(git diff --name-only --diff-filter=ACMRT "$SHA1" "$SHA2" | grep terragrunt.hcl | grep -v ".terragrunt-cache" | grep -v "infra/terragrunt.hcl")

for CHANGED in "$CHANGED_FILES"; do
    #terragrunt apply --terragrunt-working-dir "${CHANGED%\/*}" --terragrunt-non-interactive -auto-approve
    echo "$CHANGED"
done
