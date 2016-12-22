#!/usr/bin/env bash
rm -rf ../Supervisor
mkdir ../Supervisor
cp -r "`pwd`/." ../Supervisor
zip -r ./Supervisor.alfredworkflow ../Supervisor
rm -rf ../Supervisor