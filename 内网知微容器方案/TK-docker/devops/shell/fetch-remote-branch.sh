#!/bin/bash
path=$1
branch=$2
cd $path
git fetch origin $branch
