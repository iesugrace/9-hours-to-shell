#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-22 17:09:46
# Location: Shenzhen
# Desc: 第六章章末练习题
#
# 写一个脚本，名叫 fetch_by_awk.sh，处理文件 /etc/passwd，
# 生成类似下面的输出：
#  root   /bin/bash
#  daemon /usr/sbin/nologin
#  bin    /usr/sbin/nologin
#

#
# 抽取第一字段，和最后一个字段
#
awk -F: '{print $1, $NF}' /etc/passwd
