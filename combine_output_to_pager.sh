#!/bin/bash 
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-16 19:38:30
# Location: Shenzhen
# Desc: 第三章章末练习
#
# 写一个脚本，名字叫做combine_output_to_pager.sh，
# 使以下几条命令的输出都传给一个less 命令分屏显示，所有命令写在一行上。
#  * 用date 获取当前时间
#  * 用pwd 获取当前工作目录
#  * 用whoami 获取当前用户名
#  * 用ls -l 列出当前目录的所有文件
#

{ date; pwd; whoami; ls -l; } | less

# 用小括号也可以
# ( date; pwd; whoami; ls -l ) | less
