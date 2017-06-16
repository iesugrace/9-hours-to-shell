#!/bin/bash 
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-16 19:17:34
# Location: Shenzhen
# Desc: 第三章章末练习
#
# 按照脚本special_chars_bad.sh 中的提示修改代码，
# 使脚本能够输出 "All is well." 这个字符串。
#

#
# 不要动这行
#
exec 2>/dev/null

result=$(
    (

    #
    # 按照提示修改下面的代码
    #

    # 这行应该输出：shell is    good.
    echo shell is    good.

    # 这行应该输出：it's good to program in shell.
    echo it's good to program in shell.

    # 这行应该输出："UNIX" is a trademark.
    echo "UNIX" is a trademark.

    # 这行应该输出：It's good to use Linux, Linux is a kind of "Unix".
    echo It's good to use Linux, Linux is a "Unix".

    #
    # 修改工作到此结束，不要改动后面的行
    #

    ) | md5sum | awk '{print $1}'
)

answer=ce14c53249602bd316d11d764390195a
test "$result" = "$answer" && echo All is well.
