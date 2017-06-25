#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-25 20:51:46
# Location: Shenzhen
# Desc: 第九章章末练习题
#
# 写一个脚本，名叫 watcher.sh，提供以下功能：
#   - 监视指定用户进程数的变化
#   - 用户名来自脚本的第一个参数
#   - 如果没有提供命令行参数，就使用当前用户名
#   - 脚本每隔10 秒钟就把当前时间和用户的进程数写入临时文件中
#   - 必须确保临时文件名字的唯一
#   - 当脚本收到sigusr1 信号时，输出临时文件中的最后一条记录
#   - 当脚本收到sigint 信号时，输出临时文件中进程数的平均值，
#     删除临时文件，退出脚本。
#   - 脚本收到sigusr1 时，会有"User defined signal 1" 字样输出，
#     应该屏蔽此信息。
#

#
# 如果第一个位置参数为空，就使用当前用户名。
# USER 变量保存着当前用户的名字。
#
user=${1:-$USER}

#
# 用mktemp 命令生成唯一的临时文件
#
file=$(mktemp)

#
# 设定间隔时间为10秒
#
interval=10

#
# 计算用户的进程数，输出当前时间和进程数
#
check() {
    now=$(date '+%F %T')
    count=$(ps -eo user | grep -c $user)
    echo "$now -- $count"
}

#
# 输出临时文件中的最后一条记录。
#
latest_record() {
    tail -n1 $file
}

#
# 输出临时文件中进程数的平均值，
# 删除临时文件，退出脚本。
#
clean_and_exit() {
    avg=$(awk '{a+=$NF} END{print a/NR}' $file)
    echo
    echo "average: $avg"
    rm -f $file
    exit 0
}

#
# 设定信号的处理函数
#
trap latest_record sigusr1
trap clean_and_exit sigint

#
# 屏蔽标准错误，
# 这样 "User defined signal 1" 就不会输出到屏幕了。
#
exec 2>/dev/null

while true
do
    check >>$file
    sleep $interval
done
