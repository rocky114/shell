sed的命令格式是：sed command file

sed '/2/d' file.txt ##删除文件里包含2的行，d表示删除

head -n 5 /etc/passwd | sed 's/:.*$//' ##截取用户名称,s表示正则表达式

sed -n '/4/p' file.txt ##  -n 表明要明确输出的行， -p 输出

command部分是这样，可以分为两部分，一部分是确定范围部分，一部分是处理方式部分。

确定范围部分可以分为两种方式：

1 指定行数：例如3,5表示第3、第4和第5行；5,$表示第5行至最后一行；

2 用模式匹配进行指定：例如/^[^dD]/表示匹配行首不是以d或D开头的行等等。

处理方式部分呢，有很多命令可用，介绍几个最常用的吧：

d:表示删除行

p:打印该行

r:读取指定文件的内容

w:写入指定文件

a\:在下面插入新行新内容

sed -n '1,3p' sed.txt ##打印一到三行

sed '^[dD]/s/x/X/g' sed.txt ##将所有以d或D开头的行的所有小写x变为大写X

sed '1,3s/test/abc/' sed.txt ##将一到三行test替换成abc

sed 's/test/&234/' sed.txt ## 将包含test位置后面增加234

sed -n -e '1,2p' -e '4p' sed.txt ## 打印第一行，第二行，第四行 参数-e可以组合多个命令

sed -i 's/test/xinzhu/g' sed.txt  ## -i 选项直接修改文本

sed -i -E "s/(<username>.+)name(.+<\/username>)/\1something\2/" file.xml

##多个文件批量替换字符串
find . -name '*.txt' | xargs sed -i 's/xinzhu/rocky/g'
##或者
find . -name '*.txt' -exec sed -i 's/xinzhu/rocky/g' {} \;
