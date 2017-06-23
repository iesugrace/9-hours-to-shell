#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-23 17:06:37
# Location: Shenzhen
# Desc: 第七章章末练习题
#
# 写一个脚本，名叫avg.sh，在脚本里定义一个名叫avg 的函数，
# 用来计算任意数量的参数的平均值，如果没有参数传给函数，
# 函数的结果应该是零。
#

avg() {
    #
    # 如果没有传入参数，直接输出0, 并结束函数
    #
    if test $# -eq 0
    then
        echo 0
        return
    fi

    #
    # 这里的total 变量不定义也可以，首次使用时
    # shell 会当它的值为0.
    #
    total=0

    for num in $*
    do
        total=$((total + num))
    done

    #
    # shell 的除法计算不保留小数
    #
    echo $((total/$#))
}

#
# 测试函数的功能
#

# 2 个数
echo -n "avg(1, 2) = "
avg 1 2

# 10 个数
echo -n "avg(1, 2, ..., 10) = "
avg {1..10}

# 100 个数
echo -n "avg(1, 2, ..., 100) = "
avg {1..100}
