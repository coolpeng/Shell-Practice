#!/bin/bash

echo "Shell echo命令"

# Shell 的 echo 指令与 PHP 的 echo 指令类似，都是用于字符串的输出。命令格式: echo string

#1. 显示普通字符串

echo "This is a test"

# 这里的双引号完全可以省略
echo This is a test

#2. 显示转义字符
echo "\"It is another test\""
echo \"It is another test\"

#3. 显示变量
# read 命令从标准输入中读取一行,并把输入行的每个字段的值指定给 shell 变量

read name
echo "$name this is a test"

#4. 显示换行
echo -e "OK! \n" # -e 开启转义
echo "It is a test"

#5. 显示不换行
echo -e "Haha! \c" # -e 开启转义 \c 不换行
echo "Will show these words in the same line"

#6. 显示结果定向至文件
#echo "This is a test" > myFile

#7. 原样输出字符串，不进行转义或取变量(用单引号)

#8. 显示命令执行结果
echo `date`














































