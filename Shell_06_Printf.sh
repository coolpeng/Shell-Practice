#!/bin/bash

echo "Shell printf命令"

# printf 命令的语法: printf  format-string  [arguments...]
# 参数说明: format-string: 为格式控制字符串; arguments: 为参数列表

echo "Hello, Shell"
printf "Hello, Shell\n"

# format-string为双引号
printf "%d %s\n" 2 "abc"

# 单引号与双引号效果一样
printf '%d %s\n' 2 "abc"

# 没有引号也可以输出
printf %s mn
printf "\n"

# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf "%s" abc def
printf "\n"

printf "%s\n" opq rst

printf "%s %s %s\n" u v w x y z

# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"


# %s %c %d %f都是格式替代符
# %-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在10个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
# %-4.2f 指格式化为小数，其中.2指保留2位小数。
printf "%-10s %-8s %-4s\n" Name Sex WeightKg
printf "%-10s %-8s %-4.2f\n" EdwardPeng Male 75.356
printf "%-10s %-8s %-4.2f\n" Lucy Female 45.789

#
printf "a string, no processing:<%s>\n" "A\nB"

printf "a string, no processing:<%b>\n" "A\nB"

printf "www.baidu.com \a" #不换行




































