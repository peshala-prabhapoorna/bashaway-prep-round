rm -rf src

git clone https://github.com/sliit-foss/bashaway-ui.git src

# Write your code here
cd src

git config user.name "github-actions"
git config user.email "github-actions[bot]@users.noreply.github.com"

git filter-branch --env-filter '
old_name="github-actions[bot]"
correct_name="github-actions"

if [ -z "$GIT_AUTHOR_NAME" ] || [ "$GIT_AUTHOR_NAME" = "$old_name" ]; then
    export GIT_AUTHOR_NAME="$correct_name"
    export GIT_COMMITTER_NAME="$correct_name"
fi
' --tag-name-filter cat -- --branches --tags
