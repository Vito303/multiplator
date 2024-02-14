# multiplator

# curl https://api.github.com/repos/Vito303/multiplator/commits?per_page=1 | jq .[0]
# curl https://api.github.com/repos/Vito303/multiplator/commits?per_page=1 | jq ".[0] | {message: .commit.message, name: .commit.committer.name}"