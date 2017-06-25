#!/bin/bash
#
# 变量path 的值是第一个命令行参数
# 与当前日期拼接起来的字符串
#
# 如果没有提供命令行参数，则path 的
# 名字就不是期待中的值。
#
# 因此程序需要对没有命令行参数的情况
# 作出处理，防止出现这样的问题。
#

#
# 如果$1 为空，就报错，并退出程序
#
if test -z "$1"
then
    echo "user name is required" >&2
    exit 1
fi

user=$1
date=$(date +%Y%m%d)
path="${user}_${date}"

echo aaa >>$path
echo bbb >>$path
echo ccc >>$path
