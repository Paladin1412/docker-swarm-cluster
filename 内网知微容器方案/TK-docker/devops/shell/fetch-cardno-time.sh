#!/bin/sh
cd $1

git log --date=iso --pretty=format:"%H,%ae,%ad,%s" | grep $2
