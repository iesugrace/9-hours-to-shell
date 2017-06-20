#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-20 16:52:53
# Location: Zhuhai
# Desc: 第五章章末练习题
#
# 创建一个脚本，名叫count_files_size.sh，从用户读取一个目录路径，
# 计算该目录下所有常规文件的大小的总和，隐藏文件除外。
# 
# 要点：
#
#   * 用户输入的必须是目录，而且该目录必须是可读和可执行
#   * 用ls -l 来读取目录下的文件信息
#   * 以 - 开头的是常规文件
#   * ls 命令默认不会列出目录下的隐藏文件
#   * for file in dir/* 结构已经忽略掉了隐藏文件
#

#
# 目前还没有讲授文本处理，所以需要借助临时文件来存放中间结果
# $$ 是shell 进程的id，这里利用进程id 的唯一性来创建唯一的临时文件。
#
tmpfile=/tmp/$$.log

#
# 从用户读取目录的路径
#
read -p "enter a directory: " dir

#
# 如果路径是一个目录 (-d)，同时该目录可读 (-r)，可执行 (-x)，
# 就列出目录下的文件信息，计算文件大小总和。
#
if test -d "$dir" -a -r "$dir" -a -x "$dir"
then
    total=0

    #
    # 用for 循环遍历目录 $dir 下的所有文件，不包括隐藏文件
    #
    for file in "$dir"/*
    do
        #
        # 先把文件的信息存放到临时文件中，再通过标准输入重定向
        # 使read 命令从该文件中读取信息，read 命令把读到的信息
        # 切分成6块，其中用到的只有第1 和第5 块。
        #
        # ls 命令的-d 选项的作用是：如果文件是目录文件，就显示
        # 目录本身的信息，而不是目录里面的文件的信息。
        #
        ls -ld "$file" > $tmpfile
        read perm link uid gid size junk < $tmpfile

        #
        # 暂时还没有讲授文本处理，所以这里使用case 的
        # 通配符匹配功能判断字符串是否以减号开头。
        #
        case "$perm" in
            -*)
                total=$(( $total + $size ))
                ;;
        esac
    done

    #
    # 输出结果
    #
    echo "total size: $total"
else
    #
    # 输出错误信息
    #
    echo "$dir is not a directory, or permission denied"
fi

#
# 删除临时文件
#
rm -f "$tmpfile"
