在 Ubuntu 15.04 中如何安装和使用 Snort
================================================================================

对于网络安全而言入侵检测是一件非常重要的事。入侵检测系统（IDS）用于检测网络中非法与恶意的请求。Snort是一款知名的开源的入侵检测系统。其 Web界面（Snorby）可以用于更好地分析警告。Snort使用iptables/pf防火墙来作为入侵检测系统。本篇中，我们会安装并配置一个开源的入侵检测系统snort。

### Snort 安装 ###

#### 要求 ####

snort所使用的数据采集库（DAQ）用于一个调用包捕获库的抽象层。这个在snort上就有。下载过程如下截图所示。

![downloading_daq](http://blog.linoxide.com/wp-content/uploads/2015/07/downloading_daq.png)

解压并运行./configure、make、make install来安装DAQ。然而，DAQ要求其他的工具，因此，./configure脚本会生成下面的错误。

flex和bison错误

![flexandbison_error](http://blog.linoxide.com/wp-content/uploads/2015/07/flexandbison_error.png)

libpcap错误

![libpcap error](http://blog.linoxide.com/wp-content/uploads/2015/07/libpcap-error.png)

因此在安装DAQ之前先安装flex/bison和libcap。

![install_flex](http://blog.linoxide.com/wp-content/uploads/2015/07/install_flex.png)

如下所示安装libpcap开发库

![libpcap-dev installation](http://blog.linoxide.com/wp-content/uploads/2015/07/libpcap-dev-installation.png)

安装完必要的工具后，再次运行./configure脚本，将会显示下面的输出。

![without_error_configure](http://blog.linoxide.com/wp-content/uploads/2015/07/without_error_configure.png)

make和make install 命令的结果如下所示。

![make install](http://blog.linoxide.com/wp-content/uploads/2015/07/make-install.png)

![make](http://blog.linoxide.com/wp-content/uploads/2015/07/make.png)

成功安装DAQ之后，我们现在安装snort。如下图使用wget下载它。

![downloading_snort](http://blog.linoxide.com/wp-content/uploads/2015/07/downloading_snort.png)

使用下面的命令解压安装包。

    #tar -xvzf  snort-2.9.7.3.tar.gz

![snort_extraction](http://blog.linoxide.com/wp-content/uploads/2015/07/snort_extraction.png)

创建安装目录并在脚本中设置prefix参数。同样也建议启用包性能监控（PPM）的sourcefire标志。

    #mkdir /usr/local/snort

    #./configure --prefix=/usr/local/snort/ --enable-sourcefire

![snort_installation](http://blog.linoxide.com/wp-content/uploads/2015/07/snort_installation.png)

配置脚本会由于缺少libpcre-dev、libdumbnet-dev 和zlib开发库而报错。

配置脚本由于缺少libpcre库报错。

![pcre-error](http://blog.linoxide.com/wp-content/uploads/2015/07/pcre-error.png)

配置脚本由于缺少dnet（libdumbnet）库而报错。

![libdnt error](http://blog.linoxide.com/wp-content/uploads/2015/07/libdnt-error.png)

配置脚本由于缺少zlib库而报错

![zlib error](http://blog.linoxide.com/wp-content/uploads/2015/07/zlib-error.png)

如下所示，安装所有需要的开发库。

    # aptitude install libpcre3-dev

![libpcre3-dev install](http://blog.linoxide.com/wp-content/uploads/2015/07/libpcre3-dev-install.png)

    # aptitude install libdumbnet-dev

![libdumnet-dev installation](http://blog.linoxide.com/wp-content/uploads/2015/07/libdumnet-dev-installation.png)

    # aptitude install zlib1g-dev

![zlibg-dev installation](http://blog.linoxide.com/wp-content/uploads/2015/07/zlibg-dev-installation.png)

安装完snort需要的库之后，再次运行配置脚本就不会报错了。

运行make和make install命令在/usr/local/snort目录下完成安装。

    #make

![make snort](http://blog.linoxide.com/wp-content/uploads/2015/07/make-snort.png)

    #make install

![make install snort](http://blog.linoxide.com/wp-content/uploads/2015/07/make-install-snort.png)

最后，从/usr/local/snort/bin中运行snort。现在它对eth0的所有流量都处在promisc模式（包转储模式）。

![snort running](http://blog.linoxide.com/wp-content/uploads/2015/07/snort-running.png)

如下图所示snort转储流量。

![traffic](http://blog.linoxide.com/wp-content/uploads/2015/07/traffic1.png)

#### Snort的规则和配置 ####

从源码安装的snort还需要设置规则和配置，因此我们需要复制规则和配置到/etc/snort下面。我们已经创建了单独的bash脚本来用于设置规则和配置。它会设置下面这些snort设置。

- 在linux中创建用于snort IDS服务的snort用户。
- 在/etc下面创建snort的配置文件和文件夹。
- 权限设置并从源代码的etc目录中复制数据。
- 从snort文件中移除规则中的#(注释符号)。

-

    #!/bin/bash#
    # snort源代码的路径
    snort_src="/home/test/Downloads/snort-2.9.7.3"
    echo "adding group and user for snort..."
    groupadd snort &> /dev/null
    useradd snort -r -s /sbin/nologin -d /var/log/snort -c snort_idps -g snort &> /dev/null#snort configuration
    echo "Configuring snort..."mkdir -p /etc/snort
    mkdir -p /etc/snort/rules
    touch /etc/snort/rules/black_list.rules
    touch /etc/snort/rules/white_list.rules
    touch /etc/snort/rules/local.rules
    mkdir /etc/snort/preproc_rules
    mkdir /var/log/snort
    mkdir -p /usr/local/lib/snort_dynamicrules
    chmod -R 775 /etc/snort
    chmod -R 775 /var/log/snort
    chmod -R 775 /usr/local/lib/snort_dynamicrules
    chown -R snort:snort /etc/snort
    chown -R snort:snort /var/log/snort
    chown -R snort:snort /usr/local/lib/snort_dynamicrules
    ###copy  configuration and rules from  etc directory under source code of snort
    echo "copying from snort source to /etc/snort ....."
    echo $snort_src
    echo "-------------"
    cp $snort_src/etc/*.conf* /etc/snort
    cp $snort_src/etc/*.map /etc/snort##enable rules
    sed -i 's/include \$RULE\_PATH/#include \$RULE\_PATH/' /etc/snort/snort.conf
    echo "---DONE---"

改变脚本中的snort源目录路径并运行。下面是成功的输出。

![running script](http://blog.linoxide.com/wp-content/uploads/2015/08/running_script.png)

上面的脚本从snort源中复制下面的文件和文件夹到/etc/snort配置文件中

![files copied](http://blog.linoxide.com/wp-content/uploads/2015/08/created.png)

snort的配置非常复杂，要让IDS能正常工作需要进行下面必要的修改。

    ipvar HOME_NET 192.168.1.0/24  # LAN side

----------

    ipvar EXTERNAL_NET !$HOME_NET   # WAN side

![veriable set](http://blog.linoxide.com/wp-content/uploads/2015/08/12.png)

    var RULE_PATH /etc/snort/rules     # snort signature path
    var SO_RULE_PATH /etc/snort/so_rules        #rules in shared libraries
    var PREPROC_RULE_PATH /etc/snort/preproc_rules  # Preproces path
    var WHITE_LIST_PATH /etc/snort/rules        # dont scan
    var BLACK_LIST_PATH /etc/snort/rules        #  Must scan

![main path](http://blog.linoxide.com/wp-content/uploads/2015/08/rule-path.png)

    include $RULE_PATH/local.rules   # file for custom rules

移除ftp.rules、exploit.rules前面的注释符号(#)。

![path rules](http://blog.linoxide.com/wp-content/uploads/2015/08/path-rules.png)

现在[下载社区规则][1]并解压到/etc/snort/rules。启用snort.conf中的社区及紧急威胁规则。

![wget_rules](http://blog.linoxide.com/wp-content/uploads/2015/08/wget_rules.png)

![community rules](http://blog.linoxide.com/wp-content/uploads/2015/08/community-rules1.png)

进行了上面的更改后，运行下面的命令来检验配置文件。

    #snort -T -c /etc/snort/snort.conf

![snort running](http://blog.linoxide.com/wp-content/uploads/2015/08/snort-final.png)

### 总结 ###

本篇中，我们关注了开源IDPS系统snort在Ubuntu上的安装和配置。通常它用于监控事件，然而它可以被配置成用于网络保护的在线模式。snort规则可以在离线模式中可以使用pcap捕获文件进行测试和分析

--------------------------------------------------------------------------------

via: http://linoxide.com/security/install-snort-usage-ubuntu-15-04/

作者：[nido][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/naveeda/
[1]:https://www.snort.org/downloads/community/community-rules.tar.gz
