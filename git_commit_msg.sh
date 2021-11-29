#!/bin/sh

# 忽略merge request
MERGE_MSG=`cat $1 | egrep '^Merge branch*'`

if [ "$MERGE_MSG" != "" ]; then
    exit 0
fi

_red() {
  printf '\033[1;31;31m%b\033[0m\n' "$1"
}

COMMIT_MSG=`cat $1 | egrep "^(feat|fix|docs|chore|style|refactor|test|other)?:\s(\S|\w)+"`

if [ "$COMMIT_MSG" = "" ]; then
    _red "message 不是以feat，fix，docs，chore，style，refactor，test，other开头，请修改备注\n"
    exit 1
fi
