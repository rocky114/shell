find . -name abc ## 查找当前目录下的名称是abc文件

find . -type d -name xyz ##查找当前目录下类型为目录，名称是xyz目录

find . -name "*txt" ##通配符匹配

find . -user roc ## 查询用户所属名称的文件

find . -perm 755 ## 查找权限是755的文件

find . -regex '.*b.*3' ## 使用正则模式查询文件

find . -type f -name '*abc' -exec cat {} \; ## 查询结果执行查看

find . -amin -5 ## 查询文件 访问：amin 修改：mmin  文件状态：cmin

find . -size +100C ## +表示大于某个数 -表示小鱼某个数 c表示单位是字节

find . -maxdepth 1 -name '.c' ## 查询当前一个目录，名称包含字符c
