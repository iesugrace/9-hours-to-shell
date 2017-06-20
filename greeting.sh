#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-20 15:12:07
# Location: Zhuhai
# Desc: 第四章章末练习题
#
# 写一个脚本，名叫greeting.sh ，问用户要姓名和性别。
# 如果输入的是男性，就输出“你好，某某先生”；
# 如果输入的是女性，就输出“你好，某某女士”；
# 其它输入都属无效输入，应输出错误信息；
# 注意处理空值，就是用户在没有输入任何数据时按Enter 的情况。
#

#
# 从用户输入获取数据
#
read -p "Name: " name
read -p "Sex: " sex

#
# 用双引号把 $sex 包围起来，防止空值的输入造成语法错误
#
if test "$sex" = male
then
    echo "你好，$name 先生"
elif test "$sex" = female
then
    echo "你好，$name 女士"
else
    echo "not acceptable sex: $sex"
fi
