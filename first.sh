#!/bin/bash
echo -n "current user: "
whoami
echo -n "current directory: "
pwd
read -p "enter a directory: " dir
cd "$dir"
echo -n "new working directory: "
pwd
echo "content of the new directory: "
ls
