#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-16 17:09:06
# Location: Shenzhen
# Desc: 第二章章末练习题
#
# 按照以下要求写一个脚本，名字可以叫做 get_info.sh：
#
#  * 提示用户输入姓名、性别、和电话号码
#  * 把用户输入的数据按照这样的格式写到文件 out.txt 中：
#     Name: 张三
#     Sex: 男
#     phone: 18612345678
#  * 给代码写必要的注释
#  * 保存完后给用户显示这样的提示信息：
#    Your input has been saved in "out.txt"
#

#
# 从用户获取姓名，性别，电话
#
read -p " Name: " name
read -p "  Sex: " sex
read -p "Phone: " phone

#
# 把数据写到文件中，第一条echo 命令用 > 来重定向，用于创建out.txt 文件,
# 后续的echo 命令用 >> 来附加数据到out.txt 的尾部。
#
echo "Name: $name" > out.txt
echo "Sex: $sex" >> out.txt
echo "Phone: $phone" >> out.txt

#
# 执行完毕，给用户显示一条提示信息
#
echo 'Your input has been saved in "out.txt"'
