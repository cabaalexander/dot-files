#!/bin/bash -e

main(){
    local repo repo_local_path

    repo=${1:?Repo?, Provide a repo to clone}
    repo_local_path=${2:?Need a loal path to clone the repo to}

    if ! [ -e "$repo_local_path" ]; then
        git clone "$repo" "$repo_local_path"
    fi

    if ! grep -q "$repo_local_path" .gitignore; then
        echo "$repo_local_path" >> .gitignore
    fi
}

main "$@"