#!/bin/bash
echo "Hello World!"

#变量名与等号中间不能有空格,变量首字符必须为字母
myName="Edward Peng"
echo ${myName}

#只读变量
readonly myName

#删除变量: 变量被删除后不能再次使用; unset 命令不能删除只读变量
myCity="ShiJiazhuang"
echo ${myCity}
unset myCity

####1. Shell 字符串
string="i know your name is \"${myName}\", and from ShiJiazhuang"
echo ${string}

#1.1 拼接字符串
yourName="Edward Peng"
greeting="Hello, "${yourName}"!"
greeting_1="Hello, ${yourName}!"
echo $greeting $greeting_1

#1.2 获取字符串长度
stringOne="abcd"
echo ${#stringOne}

#1.3 提取子字符串
stringTwo="Edward Peng is my english name"
echo ${stringTwo:7:4}

#1.4 查找子字符串
echo `expr index "$stringTwo" is`

####2. Shell 数组

#2.1 定义数组
array_name=(value0 value1 value2 value3)

array_num=(
10
11
12
13
)

#2.2 读取数组
echo ${array_name[1]}

#使用@符号可以获取数组中的所有元素
echo ${array_num[@]}

#2.3 获取数组的长度

#2.3.1 取得数组元素的个数
length=${#array_name[@]}

#或者
length=${#array_name[*]}

echo ${length}

#2.3.2 取得数组单个元素的长度
length_0=${#array_name[0]}
echo ${length_0}

####3 Shell 注释









