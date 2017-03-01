read ##读取标准输入到赋值给变量

read (选项) (参数)

选项
	-p：指定读取提示符
	-t：指定读取等待的时间

read name ##读取输入赋值给变量name

echo $name

read name1 name2 ##读取输入赋值给变量name1，【空格之后的值赋给name2】

read -a array ##读取输入赋值给数组

echo ${array[0]} ${array[1]} ##打印数组第一个值，第二个值

read -p "text" ##输入提示符

read -r name ##允许输入包含反斜线

read -t 2 ##等待输入最长时间

read -n 2 name ##读取俩个字符的输入

read -d ':' name ##定界符 :  结束输入行
