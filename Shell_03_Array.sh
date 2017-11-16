#!/bin/bash

echo "Shell 数组"

#Shell 数组用括号来表示，元素用"空格"符号分割开，语法格式如：array_name=(value1 ... valuen)

first_array=(a b "c" d)
echo ${first_array[@]}

echo "第一个元素为: ${first_array[0]}"
echo "第三个元素为: ${first_array[2]}"

#1. 获取数组中的所有元素，使用@ 或 * 可以获取数组中的所有元素

second_array[0]=A
second_array[1]=B
second_array[2]=C

echo "数组的元素为: ${second_array[*]}"
echo "数组的元素为: ${second_array[@]}"

#2. 获取数组的长度 ${#array[@]} 或者 ${#array[*]}
echo "数组元素的个数为: ${#second_array[@]}"
echo "数组元素的个数为: ${#second_array[*]}"

#3. 数组的值也可以写入变量
num=2
third_array=(${num} 5 9)

echo ${third_array[@]}

#4. 根据数组元素索引获取该数组元素值时，数组下标可为变量
i=1
echo "third_array 第二个元素为: ${third_array[i]}"


