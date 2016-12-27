#!/usr/bin/env bash

source ./config.sh
cat $REPOSITORY_PATH/supervisord.conf | grep stdout_logfile | sed s/stdout_logfile=//g | sed s/%\(ENV_REPO_PATH\)s//g | ruby format.rb