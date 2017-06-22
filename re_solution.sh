#!/bin/bash
#
# Author:   Joshua Chen <iesugrace@gmail.com>
# Date:     2017-06-22 15:59:19
# Location: Shenzhen
# Desc: 第六章章末练习题
#
# 在脚本 re.sh 中按要求添加命令，
# 使脚本最后能输出"All is well."。
#

#
# 创建临时文件，并设置自动删除临时文件
#
tmpfile=$(mktemp)
tmpfile2=$(mktemp)
trap "rm -f $tmpfile $tmpfile2" exit

#
# 本函数用于填充临时文件的内容
#
create_data() {
cat >$tmpfile <<'EOF'
root user is the administrator.
root is powerful.
the default shell is bash.
root's shell is bash.

abc.
xyz.

foot is shorter than boot.
Behold, Esau my brother is a hairy man, and I am a smooth man.
And Jacob journeyed to Succoth, and built him an house, and made booths for his cattle.

system is up and running.
Something that is done in a systematic way is done according to a fixed plan, in a thorough and efficient way.
rsyslog is a server.

1st.
12th.
Linux 101.
sbin.
bin.
sbing.
And Pharaoh said unto Joseph, Say unto thy brethren, This do ye; lade your beasts, and go, get you unto the land of Canaan.
forget.
begettest.
And she caught him by his garment, saying, Lie with me: and he left his garment in her hand, and fled, and got him out.
And there shall arise after them seven years of famine; and all the plenty shall be forgotten in the land of Egypt; and the famine shall consume the land;.
git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals.
github is a development platform inspired by the way you work.
When thou tillest the ground, it shall not henceforth yield unto thee her strength; a fugitive and a vagabond shalt thou be in the earth.
this is a backslash: \.
EOF
}

#
# 填充文件 $tmpfile 的内容
#
create_data

##########################################################
#                                                        #
#  以下所有将要添加的命令都要从文件 $tmpfile 中获取输入  #
#  数据，$tmpfile 文件的内容已经由函数create_data 生成。 #
#                                                        #
##########################################################

(
:

#########################################
#  脚本修改由此开始，不要修改前面的行。 #
#########################################

#
# 行的匹配条件：以root 开头
#
grep ^root $tmpfile

# 
# 行的匹配条件：以bash 结尾
#
grep 'bash$' $tmpfile

# 
# 行的匹配条件：空行
#
grep '^$' $tmpfile

#
# 行的匹配条件：长度为3 个字符
#
grep '^...$' $tmpfile

#
# 行的匹配条件：包含了以oot 结尾且长度为4个字符的英文单词
#
grep -w '[a-zA-Z]oot' $tmpfile

#
# 行的匹配条件：包含了以sys 开头的英文单词
#
grep -w 'sys[a-zA-Z]*' $tmpfile

#
# 行的匹配条件：包含了数字，数字至少是两位数
#
grep '[0-9][0-9]+' $tmpfile

#
# 行的匹配条件：包含了单词sbin 或者单词bin
# 如果不加-E 选项的话，就需要在问号前面加一个反斜杠，
# 写成这样：'s\?bin'
#
grep -Ew 's?bin' $tmpfile

#
# 行的匹配条件：包含了单词get 或者got 或者git
#
grep -w 'g[eoi]t' $tmpfile

#
# 行的匹配条件：包含了反斜杠
# 用一个反斜杠来对另一个反斜杠做转义。
#
grep '\\' $tmpfile

#########################################
#  脚本修改到此为止，不要修改后面的行。 #
#########################################

) | tee $tmpfile2

checksum=$(md5sum $tmpfile2 | awk '{print $1}')
correct=e7b9a074d3c2cab847accb4eb7958c33
if test "$checksum" = "$correct"
then
    echo "------------"
    echo "All is well."
    echo "------------"
fi
