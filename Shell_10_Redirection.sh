#!/bin/bash

echo "Shell 输入/输出重定向"

# 重定向命令列表

# command > file	将输出重定向到 file。
# command < file	将输入重定向到 file。
# command >> file	将输出以追加的方式重定向到 file。
# n > file	将文件描述符为 n 的文件重定向到 file。
# n >> file	将文件描述符为 n 的文件以追加的方式重定向到 file。
# n >& m	将输出文件 m 和 n 合并。
# n <& m	将输入文件 m 和 n 合并。
# << tag	将开始标记 tag 和结束标记 tag 之间的内容作为输入。

# 需要注意的是文件描述符 0 通常是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）

####1. 输出重定向

# command1 > file1

# 上面这个命令执行command1然后将输出的内容存入file1。
# 注意任何file1内的已经存在的内容将被新内容替代。如果要将新内容添加在文件末尾，请使用>>操作符。

echo "This is to show the function of Redirection" >> Outfile


####2. 输入重定向

# command1 < file1

# 这样，本来需要从键盘获取输入的命令会转移到文件读取内容。
# 注意：输出重定向是大于号(>)，输入重定向是小于号(<)

echo "统计 Infile 文件的行数, 会输出文件名"
wc -l Infile

echo "统计 Infile 文件的行数, 不会输出文件名，它仅仅知道从标准输入读取内容"
wc -l < Infile

####3. 重定向深入讲解

#标准输入文件(stdin)：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
#标准输出文件(stdout)：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
#标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息

# 默认情况下，command > file 将 stdout 重定向到 file，command < file 将stdin 重定向到 file

#3.1 如果希望 stderr 重定向到 file

# $ command 2 > file

# 如果希望 stderr 追加到 file 文件末尾，

# 2 表示标准错误文件(stderr)

#3.2 如果希望将 stdout 和 stderr 合并后重定向到 file

# $ command > file 2>&1  或者 $ command >> file 2>&1

#3.3 如果希望对 stdin 和 stdout 都重定向

# $ command < file1 >file2

####4. Here Document----------

# Here Document 是 Shell 中的一种特殊的重定向方式，用来将输入重定向到一个交互式 Shell 脚本或程序, 它的基本的形式如下

# command << delimiter
#     document
# delimiter

# 它的作用是将两个 delimiter 之间的内容(document) 作为输入传递给 command
# 注意：
#4.1 结尾的delimiter 一定要顶格写，前面不能有任何字符，后面也不能有任何字符，包括空格和 tab 缩进
#4.2 开始的delimiter前后的空格会被忽略掉

# 通过 wc -l 命令计算 Here Document 的行数

echo "通过 wc -l 命令计算 Here Document 的行数"
wc -l << EOF
    HELLO
    MY NAME IS EDWARD
EOF

# 通过 cat 命令查看 Here Document 的内容
cat << EOF
HELLO
MY NAME IS EDWARD
EOF


####5. /dev/null 文件----------

# 如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到 /dev/null

# $ command > /dev/null

# /dev/null 是一个特殊的文件，写入到它的内容都会被丢弃；如果尝试从该文件读取内容，那么什么也读不到。但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到"禁止输出"的效果

# 如果希望屏蔽 stdout 和 stderr，可以这样写

# $ command > /dev/null 2>&1


#笔记

# $ command > file 2>&1
# $ command >> file 2>&1

# 这里的&没有固定的意思，放在>后面的&，表示重定向的目标不是一个文件，而是一个文件描述符，内置的文件描述符如下

# 1 => stdout
# 2 => stderr
# 0 => stdin

# 2>1  代表将stderr重定向到当前路径下文件名为1的regular file中，
# 2>&1 代表将stderr重定向到文件描述符为1的文件(即/dev/stdout)中，这个文件就是stdout在file system中的映射

# &>file 或者 &file 是一种特殊的用法，二者的意思完全相同，都等价于 >file 2>&1


# 顺序问题

# find /etc -name .bashrc > list 2>&1

# find /etc -name .bashrc 2>&1 > list

# 第一种
# xxx > list 2>&1

# 先将要输出到stdout的内容重定向到文件，此时文件list就是这个程序的stdout，再将stderr重定向到stdout，也就是文件list

# 第二种
# xxx 2>&1 > list

# 先将要输出到stderr的内容重定向到stdout，此时会产生一个stdout的拷贝，作为程序的stderr，而程序原本要输出到stdout的内容，依然是对接在stdout原身上的，因此第二步重定向stdout，对stdout的拷贝不产生任何影响




