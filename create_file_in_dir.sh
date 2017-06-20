#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-20 15:26:53
# Location: Zhuhai
# Desc: 第四章章末练习题
#
# 写一个脚本，名叫create_file_in_dir.sh，从用户读入一个路径名，
# 如果路径名是一个可写的目录，就在其中创建一个名叫dome 的空文件。
# 仅用一条if test 语句判断。
#

#
# 从用户读入一个路径名
#
read -p "enter a directory: " dir

#
# 在一条if test 语句中用 -a 选项来连接两个判断条件：
# 1. -d 判断是不是目录
# 2. -w 判断目录是否可写
#
if test -d "$dir" -a -w "$dir"
then
    #
    # 有多种方法可以创建空文件：
    #
    #   1. echo -n 不加任何参数，则不输出任何数据，
    #      shell 的重定向操作会创建空文件。
    #   2. 可以用空命令 : 代替echo 命令。
    #      : > "$dir"/dome
    #   3. 用touch 命令也可以。
    #      touch "$dir"/dome
    #
    echo -n > "$dir"/dome
    echo success
else
    echo "$dir is not a directory, or not writeable"
fi
