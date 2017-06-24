#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-24 21:13:11
# Location: Shenzhen
# Desc: 第八章章末练习题
#
# 导入函数库 functions 中的usage 函数
#
# 如果参数数量少于1，就用usage 输出这行信息：
# usage: XXX [option]... file...
# 然后退出程序，返回1。XXX 要替换成相应的脚本名字。
#
# 如果第一个参数是-h，也用usage 输出这行信息：
# usage: XXX [option]... file...
# 然后退出程序，返回0.
#

#
# 导入函数库
# dir 是脚本所在的目录
#
dir=$(dirname "$0")
source $dir/functions

if test $# -lt 1
then
    #
    # 输出到标准错误，因为只是一种错误信息。
    #
    usage "$0" '[option]...' 'file...' >&2
    exit 1
fi

if test "$1" = '-h'
then
    #
    # 用户通过-h 选项主动要求显示帮助信息，
    # 不算错误，所以输出到标准输出。
    #
    usage "$0" '[option]...' 'file...'
    exit 0
fi
