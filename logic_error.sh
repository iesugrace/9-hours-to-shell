#!/bin/bash
#
# 变量path 的值是第一个命令行参数
# 与当前日期拼接起来的字符串
#
user=$1
date=$(date +%Y%m%d)
path="${user}_${date}"

echo aaa >>$path
echo bbb >>$path
echo ccc >>$path
