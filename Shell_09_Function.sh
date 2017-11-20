#!/bin/bash

echo "Shell 函数"

####1. 不带有return语句的函数

demoFun() {
    echo "This is my first Shell function!"
}

echo "-----start-----"
demoFun
echo "-----end-----"


####2. 带有return语句的函数
funWithReturn() {
    echo "这个函数会对输入的两个数字进行相加运算..."
    echo "输入第一个数字: "
    read aNum
    echo "输入第二个数字: "
    read anotherNum
    echo "两个数字分别为 $aNum and $anotherNum !"
    return $(($aNum+$anotherNum))
}

funWithReturn
echo "输入的两个数字之和为 $? !"

# 函数返回值在调用该函数后通过 $? 来获得
# 注意: 所有函数在使用前必须定义。这意味着必须将函数放在脚本开始部分，直至shell解释器首次发现它时，才可以使用。调用函数仅使用其函数名即可


####3. 函数参数

#3.1 在Shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1表示第一个参数，$2表示第二个参数...

#3.2 注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。

funWithParam() {
    echo "The first parameter is: $1"
    echo "The second parameter is: $2"
    echo "The tenth parameter is: $10"
    echo "The tenth parameter is: ${10}"
    echo "The eleventh parameter is: ${11}"
    echo "The number of the parameters is: $#"
    echo "Show the parameters in one string: $*"
}

funWithParam 10 30 27 11 15 19 90 77 80 14 38 56

echo "#$?"

#$#	传递到脚本的参数个数
#$*	以一个单字符串显示所有向脚本传递的参数
#$$	脚本运行的当前进程ID号
#$!	后台运行的最后一个进程的ID号
#$@	与$*相同，但是使用时加引号，并在引号中返回每个参数
#$-	显示Shell使用的当前选项，与set命令功能相同
#$?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误




















