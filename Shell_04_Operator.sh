#!/bin/bash

echo "Shell 基本运算符"

# 原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。

#expr 是一款表达式计算工具，使用它能完成表达式的求值操作。
#两个数相加(注意使用的是反引号 ` 而不是单引号 ')
var=`expr 2 + 2`
echo "两数之和为: ${var}"

#注意:
#@1. 表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2，这与我们熟悉的大多数编程语言不一样。
#@2. 完整的表达式要被 ` ` 包含，注意这个字符不是常用的单引号，在 Esc 键下边

####1. 算术运算符----------

a=10
b=20

#1.1 加法
c=`expr $a + $b`
echo "a+b: $c"

#1.2 减法
d=`expr $a - $b`
echo "a-b: $d"

#1.3 乘法  乘号(*)前边必须加反斜杠(\)才能实现乘法运算
e=`expr $a \* $b`
echo "a*b: $e"

#1.4 除法
f=`expr $b / $a`
echo "b/a: $f"

#1.5 取余
g=`expr $b % $a`
echo "b%a: $g"

#1.6 赋值
a=$b
echo "a: $a"

#1.7 相等。用于比较两个数字，相同则返回 true
if [ $a = $b ]
then
    echo "a=b"
fi

#1.8 不相等。用于比较两个数字，不相同则返回 true
if [ $a != $b ]
then
    echo "a 不等于 b"
fi

#注意：条件表达式要放在方括号之间，并且要有空格，例如: [$a==$b] 是错误的，必须写成 [ $a == $b ]

####2. 关系运算符----------
# 关系运算符只支持数字，不支持字符串，除非字符串的值是数字

x=20
y=30

#2.1 -eq 检测两个数是否相等，相等返回 true
if [ $x -eq $y]
then
    echo "$x -eq $y : x等于y"
else
    echo "$x -eq $y : x不等于y"
fi

#2.2 -ne 检测两个数是否相等，不相等返回 true
if [ $x -ne $y ]
then
    echo "$x -ne $y : x不等于y"
else
    echo "$x -ne $y : x等于y"
fi

#2.3 -gt 检测左边的数是否大于右边的，如果是，则返回 true
if [ $x -gt $y ]
then
    echo "$x -gt $y : x大于y"
else
    echo "$x -gt $y : x不大于y"
fi

#2.4 -lt 检测左边的数是否小于右边的，如果是，则返回 true
if [ $x -lt $y ]
then
    echo "$x -lt $y : x小于y"
else
    echo "$x -lt $y : x不小于y"
fi

#2.5 -ge 检测左边的数是否大于等于右边的，如果是，则返回 true
if [ $x -ge $y ]
then
    echo "$x -ge $y : x大于或等于y"
else
    echo "$x -ge $y : x小于y"
fi

#2.6 -le 检测左边的数是否小于等于右边的，如果是，则返回 true
if [ $x -le $y ]
then
    echo "$x -le $y : x小于或者等于y"
else
    echo "$x -le $y : x大于y"
fi

####3. 布尔运算符----------
m=10
n=20

#3.1 ! 非运算，表达式为 true 则返回 false，否则返回 true
if [ $m != $n ]
then
    echo "$m != $n : m不等于n"
else
    echo "$m != $n : m等于n"
fi

#3.2 -o 或运算，有一个表达式为 true 则返回 true
if [ $m -lt 20 -o $n -gt 100 ]
then
    echo "$m 小于 20 或者 $n 大于 100 : 返回true"
else
    echo "$m 小于 20 或者 $n 大于 100 : 返回false"
fi

#3.3 -a 与运算，两个表达式都为 true 才返回 true
if [ $m -lt 20 -a $n -gt 100 ]
then
    echo "$m 小于 20 并且 $n 大于 100 : 返回true"
else
    echo "$m 小于 20 并且 $n 大于 100 : 返回false"
fi

####4. 逻辑运算符----------

#4.1 && 逻辑的 AND
if [[ $m -lt 100 && $n -gt 100 ]]
then
    echo "$m 小于 100 并且 $n 大于 100: 返回true"
else
    echo "$m 小于 100 并且 $n 大于 100: 返回false"
fi

#4.2 || 逻辑的 OR
if [[ $m -lt 100 || $n -gt 100 ]]
then
echo "$m 小于 100 或者 $n 大于 100: 返回true"
else
echo "$m 小于 100 或者 $n 大于 100: 返回false"
fi

####5. 字符串运算符----------

ab="ab"
cd="cd"

#5.1 = 检测两个字符串是否相等，相等返回 true
if [ $ab = $cd ]
then
    echo "$ab = $cd : ab 等于 cd"
else
    echo "$ab = $cd : ab 不等于 cd"
fi

#5.2 != 检测两个字符串是否相等，不相等返回 true
if [ $ab != $cd ]
then
    echo "$ab != $cd : ab 不等于cd"
else
    echo "$ab != $cd : ab 等于cd"
fi

#5.3 -z 检测字符串长度是否为0，为0返回 true
if [ -z $ab ]
then
    echo "$ab 长度为0"
else
    echo "$ab 长度不为0"
fi

#5.4 -n 检测字符串长度是否为0，不为0返回 true
if [ -n $cd ]
then
    echo "$cd 长度不为0"
else
    echo "$cd 长度为0"
fi

#5.5 str 检测字符串是否为空，不为空返回 true
if [ $ab ]
then
    echo "$ab : 字符串不为空"
else
    echo "$ab : 字符串不为空"
fi

####6.0 文件测试运算符----------
# 文件测试运算符用于检测 Unix 文件的各种属性

