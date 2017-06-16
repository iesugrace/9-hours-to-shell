#!/bin/bash 
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-16 18:45:03
# Location: Shenzhen
# Desc: 第三章章末练习
#
# 把脚本var_names_bad.sh 中错误的变量名所在的行删除，
# 使脚本能够输出 "All is well." 这个字符串。
#

#
# 不要动这行
#
exec 2>/dev/null

result=$(
    (

    #
    # 找出下面的变量定义中，变量名字有问题的行，并删除整行
    #
    first.name=a; echo $first.name
    first-name=b; echo $first-name
    first_name=c; echo $first_name
    1st=d;        echo $1st
    _conv=e;      echo $_conv
    num1=f;       echo $num1
    TermType=g;   echo $TermType
    #
    # 变量查找到此结束，不要改动后面的行
    #

    ) | md5sum | awk '{print $1}'
)

answer=cfb6014282cfa51e18463eaaeab947a5
test "$result" = "$answer" && echo All is well.
