# shell
syntax on

syntax off

set number 

set nonumber

set autoindent

set cindent

基本显示

echo -e 终端颜色+显示内容+结束后的颜色
例：
echo -e "\e[1;30m Jeson say Hi~\e[1;0m"

echo -e "\e[1;30m" "Josen say Hi~" $(tput sgr0)
	
echo -e ## 开启转义输出

\a 发出警告声
\b 删除前一个字符
\c 最后不加上换行符号
\f 换行但光标仍旧停留在原来的位置
\n 换行切光标移至行首
\r 光标移至行首，但不换行
\t 插入tab
\v 与 \f 相同
\\ 插入\字符
\nnn 插入nnn（八进制）所代表的ASSCII

echo -e "\e[1;31mThis is red text\e[0m" 
## \e[1;31m 将颜色设置为红色 \e[0m 将颜色重新置回
## 颜色码 重置=0，黑色=40，红色=41，绿色=42，黄色=43，蓝色=44，洋红=45，青色=46，白色=47
## 其他参数：0关闭所有属性、1设置高亮度（加粗）、4下划线、5闪烁，7反显、8消隐
