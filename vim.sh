:s/abc/xyz/     ##单行匹配，首次匹配

:s/abc/xyz/g    ## 单行匹配，全部匹配

:1,$s/abc/xyz/g ## 全文匹配

:%s/abc/xyz/g   ##全文替换
