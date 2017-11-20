#!/bin/bash

echo "Shell 文件包含"

# Shell 也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件

# Shell 文件包含的语法格式如下:
#1  . filename   # 注意点号(.)和文件名中间有一空格
#2  source filename

. ./TestOne.sh
echo "My name is: $name"
