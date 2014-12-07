如何用Nagios远程执行插件（NRPE）来检测服务器内存使用率
================================================================================
在[先前的教程中][1]，我们已经见到了如何在Nagios设置中设置Nagios远程执行插件（NRPE）。然而，监控内存使用率的脚本和插件并没有在原生的Nagios中。本篇中，我们会看到如何配置NRPE来监控远程服务器上的内存使用率。

我们要用的监控内存的脚本在[Nagios 市场][2]上，在创建者的[Github仓库][3]中也可以找到。

假设我们已经安装了NRPE，我们首先在我们想要监控的服务器上下载脚本。

### 准备远程服务器 ###

#### 在 Debain/Ubuntu 中: ####

    # cd /usr/lib/nagios/plugins/
    # wget https://raw.githubusercontent.com/justintime/nagios-plugins/master/check_mem/check_mem.pl
    # mv check_mem.pl check_mem
    # chmod +x check_mem 

#### 在 RHEL/CentOS 中: ####

    # cd /usr/lib64/nagios/plugins/ (or /usr/lib/nagios/plugins/ for 32-bit)
    # wget https://raw.githubusercontent.com/justintime/nagios-plugins/master/check_mem/check_mem.pl
    # mv check_mem.pl check_mem
    # chmod +x check_mem

你可以通过手工在本地运行下面的命令来检查脚本的输出是否正常。当使用NRPE时，这条命令应该会检测空闲的内存，当可用内存小于20%时会发出警告，并且在可用内存小于10%时会生成一个严重警告。

    # ./check_mem -f -w 20 -c 10 

----------

    OK - 34.0% (2735744 kB) free.|TOTAL=8035340KB;;;; USED=5299596KB;6428272;7231806;; FREE=2735744KB;;;; CACHES=2703504KB;;;;

如果你看到像上面那样的输出，那就意味这命令正常工作着。

现在脚本已经准备好了，我们要定义NRPE检查内存使用率的命令了。如上所述，命令会检查可用内存，在可用率小于20%时发出警报，小于10%时发出严重警告。

    # vim /etc/nagios/nrpe.cfg 
 
#### 对于 Debian/Ubuntu: ####

    command[check_mem]=/usr/lib/nagios/plugins/check_mem  -f -w 20 -c 10

#### 对于 RHEL/CentOS 32 bit: ####

    command[check_mem]=/usr/lib/nagios/plugins/check_mem  -f -w 20 -c 10

#### 对于 RHEL/CentOS 64 bit: ####

    command[check_mem]=/usr/lib64/nagios/plugins/check_mem  -f -w 20 -c 10

### 准备 Nagios 服务器 ###

在Nagios服务器中，我们为NRPE定义了一条自定义命令。该命令可存储在Nagios内的任何目录中。为了让本教程简单，我们会将命令定义放在/etc/nagios目录中。

#### 对于 Debian/Ubuntu: ####

    # vim /etc/nagios3/conf.d/nrpe_command.cfg 

----------

    define command{
            command_name check_nrpe
            command_line /usr/lib/nagios/plugins/check_nrpe -H '$HOSTADDRESS$'  -c '$ARG1$'
    }

#### 对于 RHEL/CentOS 32 bit: ####

    # vim /etc/nagios/objects/nrpe_command.cfg 

----------

    define command{
            command_name check_nrpe
            command_line /usr/lib/nagios/plugins/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
            }

#### 对于 RHEL/CentOS 64 bit: ####

    # vim /etc/nagios/objects/nrpe_command.cfg 

----------

    define command{
            command_name check_nrpe
            command_line /usr/lib64/nagios/plugins/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
            }

现在我们定义Nagios的服务检查

#### 在 Debian/Ubuntu 上: ####

    # vim /etc/nagios3/conf.d/nrpe_service_check.cfg 

----------

    define service{
            use                            local-service
            host_name                      remote-server
            service_description            Check RAM
            check_command                  check_nrpe!check_mem
    }

#### 在 RHEL/CentOS 上: ####

    # vim /etc/nagios/objects/nrpe_service_check.cfg 

----------

    define service{
            use                            local-service
            host_name                      remote-server
            service_description            Check RAM
            check_command                  check_nrpe!check_mem
    }

最后我们重启Nagios服务

#### 在 Debian/Ubuntu 上: ####

    # service nagios3 restart 

#### 在 RHEL/CentOS 6 上: ####

    # service nagios restart 

#### 在 RHEL/CentOS 7 上: ####

    # systemctl restart nagios.service 

### 故障排除 ###

Nagios应该开始在使用NRPE的远程服务器上检查内存使用率了。如果你有任何问题，你可以检查下面这些情况。


- 确保NRPE的端口在远程主机上是总是允许的。默认NRPE的端口是TCP 5666。
- 你可以尝试通过执行check\_nrpe 命令： /usr/lib/nagios/plugins/check\_nrpe -H remote-server 手工检查NRPE操作。
- 你同样可以尝试运行check\_mem 命令：/usr/lib/nagios/plugins/check\_nrpe -H remote-server –c check\_mem
- 在远程服务器上，在/etc/nagios/nrpe.cfg中设置debug=1。重启NRPE服务并检查这些日志文件，/var/log/messages (RHEL/CentOS)或者/var/log/syslog (Debain/Ubuntu)。如果有任何的配置或者权限错误，日志中应该包含了相关的信息。如果日志中没有反映出什么，很有可能是由于请求在某些端口上有过滤而没有到达远程服务器上。

总结一下，这边教程描述了我们该如何调试NRPE来监控远程服务器的内存使用率。过程只需要下载脚本、定义命令和重启服务就行了。希望这对你们有帮助。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/monitor-server-memory-usage-nagios-remote-plugin-executor.html

作者：[Sarmed Rahman][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://linux.cn/article-4101-1.html
[2]:http://exchange.nagios.org/directory/Plugins/Operating-Systems/Solaris/check_mem-2Epl/details
[3]:https://github.com/justintime/nagios-plugins/blob/master/check_mem/check_mem.pl