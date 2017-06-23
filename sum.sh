#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-23 16:50:45
# Location: Shenzhen
# Desc: 第七章章末练习题
#
# 写一个脚本，名叫sum.sh，在脚本里定义一个名叫sum 的函数，
# 用来计算任意数量的参数的和，如果没有参数传给函数，
# 函数的结果应该是零。
#

sum() {
    total=0

    #
    # 如果没有传入参数，则if 里面的for 循环不会执行，
    # total 的值就是原来的0.
    #
    if test $# -gt 0
    then
        #
        # 因为一个数字就是一个整体，中间不会有空格，
        # 所以这里用 $* 和 $@ 的结果是一样的。
        #
        for num in $*
        do
            #
            # $(( ... )) 结构中，变量名字前面可以不加美元符号，
            # 但是特殊参数除外，比如说 $1, $2, $#.
            #
            total=$((total + num))
        done
    fi
    echo $total
}

#
# 测试函数的功能
#

# 2 个数相加
echo -n "1 + 2 = "
sum 1 2

# 10 个数相加
echo -n "1 + 2 + ... + 10 = "
sum {1..10}

# 100 个数相加
echo -n "1 + 2 + ... + 100 = "
sum {1..100}
