ss 

Usage: ss [ OPTIONS ]
       ss [ OPTIONS ] [ FILTER ]
   -h, --help		this message                           帮助
   -V, --version	output version information             版本信息
   -n, --numeric	don't resolve service names            不解析服务名称
   -r, --resolve       resolve host names                  解析主机名
   -a, --all		display all sockets                    显示所有套接字sockets
   -l, --listening	display listening sockets              显示监听状态的套接字sockets
   -o, --options       show timer information              显示计时器信息
   -e, --extended      show detailed socket information    显示详细的套接字信息
   -m, --memory        show socket memory usage            显示套接字内存使用情况
   -p, --processes	show process using socket              显示使用套接字的进程
   -i, --info		show internal TCP information          显示TCP内部信息
   -s, --summary	show socket usage summary              显示套接字使用概况
   -4, --ipv4          display only IP version 4 sockets   显示ipv4的套接字
   -6, --ipv6          display only IP version 6 sockets   显示ipv6的套接字
   -0, --packet	display PACKET sockets                     显示PACKET套接字
   -t, --tcp		display only TCP sockets               仅显示TCP套接字
   -u, --udp		display only UDP sockets               仅显示UDP套接字
   -d, --dccp		display only DCCP sockets              仅显示DCCP套接字
   -w, --raw		display only RAW sockets               仅显示RAW套接字
   -x, --unix		display only Unix domain sockets       仅显示Unix套接字
   -f, --family=FAMILY display sockets of type FAMILY      显示 FAMILY类型的套接字（sockets），FAMILY可选，支持  unix, inet, inet6, link, netlink
   -A, --query=QUERY, --socket=QUERY
       QUERY := {all|inet|tcp|udp|raw|unix|packet|netlink}[,QUERY]
   -D, --diag=FILE     Dump raw information about TCP sockets to FILE  将原始TCP套接字信息转储到文件
   -F, --filter=FILE   read filter information from FILE    从文件中都去过滤器信息
       FILTER := [ state TCP-STATE ] [ EXPRESSION ]




ss -tl -f inet || ss -tl4 ##只显示ipv4套接字连接使用'-f inet' 或者'-4'

ss -tl6 ##只显示ipv4套接字连接使用'-f inet6 ' 或者'-6'

ss -t4 state established ##显示ipv4 tcp 套接字 连接状态

ss -t4 state time-wait ##显示套接字状态为 time-wait

可以是以下状态
1. established
2. syn-sent
3. syn-recv
4. fin-wait-1
5. fin-wait-2
6. time-wait
7. closed
8. close-wait
9. last-ack
10. closing
11. all - All of the above states
12. connected - All the states except for listen and closed
13. synchronized - All the connected states except for syn-sent
14. bucket - Show states, which are maintained as minisockets, i.e. time-wait and syn-recv.
15. big - Opposite to bucket state.

ss -nt sport == :80 or sport == :22000 ##显示未解析tcp连接源端口是80或者22000

ss -nt dport gt :1024 ##显示未解析的tcp连接目标端口大于1024

ss -o state fin-wait-1 \( sport = :http or sport = :https \) dst 193.233.7.24  ##显示套接字进行组合查询

1. dst ADDRESS_PATTERN
2. src ADDRESS_PATTERN
3. dport RELOP PORT
4. sport RELOP PORT
5. autobound
其中ADDRESS_PATTERN为ip地址与端口匹配，ip:port，可以用*代替。RELOP为<= >=或==。
