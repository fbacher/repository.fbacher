#!/usr/bin/bash

from=/home/fbacher/Source/git/My_Repo/repository.fbacher/repo/zips
to=/var/www/html/repository.fbacher/repo/zips
mkdir -p ${to}
rm -rf ${to}/*
cp -rp ${from}/* ${to}
