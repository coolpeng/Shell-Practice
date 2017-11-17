#!/bin/bash

echo "Shell 流程控制"

# sh的流程控制不可为空

####1. if else----------

#1.1 if

#if condition
#then
#    command1
#    command2
#    ...
#    commandN
#fi


#1.2 if else

#if condition
#then
#    command1
#    command2
#    ...
#    commandN
#else
#    command
#fi

#1.3 if else-if else

#if condition1
#then
#    command1
#elif condition2
#then
#    command2
#else
#    commandN
#fi

a=10
b=20

if [ $a == $b ]
then
    echo "a 等于 b"
elif [ $a -gt $b ]
then
    echo "a 大于 b"
elif [ $a -lt $b ]
then
    echo "a 小于 b"
else
    echo "没有符合的条件"
fi

num1=$[2*3]
num2=$[1+5]

if test $[$num1] -eq $[$num2]
then
    echo "num1 等于 num2"
else
    echo "num1 不等于 num2"
fi

####2. for 循环----------

#for var in item1 item2 ... itemN
#do
#    command1
#    command2
#    ...
#    commandN
#done

# 写成一行

# for var in item1 item2 ... itemN; do command1 command2…; done;

# 顺序输出当前列表中的数字
for loop in 1 2 3 4 5
do
    echo "The value is : $loop"
done

for loop in 11 12 13 14 15; do echo "The value is : $loop";done

# 顺序输出字符串中的字符
for str in "This is a test string"
do
    echo "The String is : $str"
done

####3. while 语句----------

# while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件

#while condition
#do
#    command
#done

#3.1
m=1
while(( $m <= 5))
do
    echo $m
    let "m++"
done

n=10
while([ $n -lt 15 ])
do
    echo $n
    let "n++"
done

# Bash let 命令，它用于执行一个或多个表达式，变量计算中不需要加上 $ 来表示变量

# while循环可用于读取键盘信息。下面的例子中，输入信息被设置为变量FILM，按<Ctrl-D>结束循环

echo "按下<CTRL-D>退出"
echo -n "输入你最喜欢的App名称："
while read AppName
do
    echo "Your favorite App is : $AppName"
done

####4. 无限循环----------

#while :
#do
#    command
#done

#while true
#do
#command
#done

#for (( ; ; ))

####5. until 循环----------

# until循环执行一系列命令直至条件为真时停止。条件可为任意测试条件，测试发生在循环末尾，因此循环至少执行一次—请注意这一点

#until condition
#do
#    command
#done

####6. case----------

# Shell case语句为多选择语句。可以用case语句匹配一个值与一个模式，如果匹配成功，执行相匹配的命令


#case 值 in
#模式1)
#    command1
#    command2
#    ...
#    commandN
#    ;;
#模式2）
#    command1
#    command2
#    ...
#    commandN
#    ;;
#esac

# 注意事项

# case工作方式如上所示。取值后面必须为单词in，每一模式必须以右括号结束。
# 取值可以为变量或常数。
# 匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。
# 取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令


echo "输入 1 到 4 之间的数字: "
echo "你输入的数字为: "
read aNum
case $aNum in
    1) echo "你选择了 1"
    ;;
    2) echo "你选择了 2"
    ;;
    3) echo "你选择了 3"
    ;;
    4) echo "你选择了 4"
    ;;
    *) echo "你没有输入1 到 4 之前的数字"
    ;;
esac

####6. 跳出循环----------
# 在循环过程中，有时候需要在未达到循环结束条件时强制跳出循环，Shell使用两个命令来实现该功能：break和continue

#6.1 break命令

# break命令允许跳出所有循环（终止执行后面的所有循环）
# 下例中，脚本进入死循环直至用户输入数字大于5。要跳出这个循环，返回到shell提示符下，需要使用break命令

while :
do
    echo -n "请输入 10 到 15 之间的数字: "
    read theNum
    case $theNum in
        10|11|12|13|14|15) echo "你输入的数字为: $theNum !"
        ;;
        *) echo "你输入的数字不是 10 到 15 之间的数字！Game Over"
        break
        ;;
    esac
done

#6.2 continue

# 它不会跳出所有循环，仅仅跳出当前循环

#while :
#do
#    echo -n "请输入 1 到 5 之间的数字: "
#    read aNum
#    case $aNum in
#        1|2|3|4|5) echo "你输入的数字是: $aNum"
#        ;;
#        *) echo "你输入的数字不符合要求"
#            continue
#            echo "Game Over"
#        ;;
#    esac
#done

#6.3 esac

# case的语法和C family语言差别很大，它需要一个esac（就是case反过来）作为结束标记，每个case分支用右圆括号，用两个分号表示break






























