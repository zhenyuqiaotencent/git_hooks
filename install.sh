#!/bin/sh

# from https://github.com/razeencheng/git-hooks

set -e

_green() {
  printf '\033[1;31;32m%b\033[0m\n' "$1"
}

_red() {
  printf '\033[1;31;40m%b\033[0m\n' "$1"
}

_exists() {
  cmd="$1"
  if [ -z "$cmd" ]; then
    _red "Usage: _exists cmd"
    return 1
  fi

  if eval type type >/dev/null 2>&1; then
    eval type "$cmd" >/dev/null 2>&1
  elif command >/dev/null 2>&1; then
    command -v "$cmd" >/dev/null 2>&1
  else
    which "$cmd" >/dev/null 2>&1
  fi
  return "$?"
}

main() {

  if [ ! -d ~/.git_template/hooks ]; then
    mkdir -p ~/.git_template/hooks
  fi 


  if [ -f ~/.git_template/hooks/commit-msg ]; then
    mv ~/.git_template/hooks/commit-msg ~/.git_template/hooks/commit-msg.bak;
  fi
  

  curl https://raw.githubusercontent.com/zhenyuqiaotencent/git_hooks/main/git_commit_msg.sh -o ~/.git_template/hooks/commit-msg

  chmod +x ~/.git_template/hooks/commit-msg
  
  git config --global core.hooksPath ~/.git_template/hooks


  _green "Golang pre-commit hook & commit-msg hook Install Success!"
}

main "$@"
