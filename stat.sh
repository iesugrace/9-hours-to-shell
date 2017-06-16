#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-16 17:20:48
# Location: Shenzhen
# Desc: 第二章章末练习题
#
# 按照以下要求写一个脚本，名字可以叫做 stat.sh：
#
#  * 输出类似下面所示的信息：
#      current time: 2017-01-01 05:00:00
#      total processes: 100
#      total online users: 10
#      total users on the system: 30
#  * 命令提示：
#      时间信息可以通过date 命令获取
#      进程信息通过ps 命令获取，注意加上选项--no-headers
#      在线用户信息通过w 命令获取，注意加上选项-h
#      计算行数用命令 wc -l
#  * 给代码写必要的注释
#

#
# 显示当前时间
#
echo -n "current time: "
date '+%F %T'

#
# 显示系统上所有进程的总数
#
echo -n "total processes: "
ps -e --no-headers | wc -l

#
# 显示系统上所有在线用户的总数
#
echo -n "total online users: "
w -h | wc -l

#
# 显示系统上所有用户的总数
#
echo -n "total users on the system: "
wc -l < /etc/passwd
