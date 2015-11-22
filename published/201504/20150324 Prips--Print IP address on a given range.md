Prips - 打印指定范围内的IP地址
================================================================================
prips是一个可以打印出指定范围内所有ip地址的一个工具。它可以增强那些只能同时工作在一个主机上的工具的可用性。

### 在ubuntu上安装prips ###

打开终端并输入下面的命令

    sudo apt-get install prips

### 使用prips ###

prips语法

    prips [-c] [-d delim] [-e exclude] [-f format] [-i incr] start end
    prips [-c] [-d delim] [-e exclude] [-f format] [-i incr] CIDR-block

### 可用选项 ###

prips接受下面的命令行选项：

- -c -- 以CIDR形式打印范围。
- -d 分隔符 -- 用ASCII码作为分隔符，0 <= 分隔符 <= 255。
- -e -- 排除输出的范围。
- -f 格式 -- 设置地址格式 (hex：16进制, dec：10进制, 或者dot：以点分隔).
- -i 增长 -- 设置增长上限

### Prips示例 ###

显示保留的子网内的所有地址：

    prips 192.168.32.0 192.168.32.255

同上面一样，使用CIDR标示:

    prips 192.168.32/24

只显示A类保留子网内所有可用的地址，用空格而不是换行作为分隔符：

    prips -d 32 10.0.0.1 10.255.255.255

每块显示4个ip地址：

    prips -i 4 192.168.32.7 192.168.33.5

打印包含两个地址的最小CIDR块。

    prips -c 192.168.32.5 192.168.32.11

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/prips-print-ip-address-on-a-given-range.html

作者：[ruchi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
