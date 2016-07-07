Linux有问必答：如何启用Open vSwitch的日志功能以便调试和排障
================================================================================
> **问题** 我试着为我的Open vSwitch部署排障，鉴于此，我想要检查它的由内建日志机制生成的调试信息。我怎样才能启用Open vSwitch的日志功能，并且修改它的日志等级（如，修改成INFO/DEBUG级别）以便于检查更多详细的调试信息呢？

Open vSwitch（OVS)是Linux平台上最流行的开源的虚拟交换机。由于当今的数据中心日益依赖于软件定义网络（SDN）架构，OVS被作为数据中心的SDN部署中的事实标准上的网络元素而得到飞速应用。

Open vSwitch具有一个内建的日志机制，它称之为VLOG。VLOG工具允许你在各种网络交换组件中启用并自定义日志，由VLOG生成的日志信息可以被发送到一个控制台、syslog以及一个便于查看的单独日志文件。你可以通过一个名为`ovs-appctl`的命令行工具在运行时动态配置OVS日志。

![](https://farm1.staticflickr.com/499/19300367114_cd8aac2fb2_c.jpg)

这里为你演示如何使用`ovs-appctl`启用Open vSwitch中的日志功能，并进行自定义。

下面是`ovs-appctl`自定义VLOG的语法。

    $ sudo ovs-appctl vlog/set module[:facility[:level]] 

- **Module**：OVS中的任何合法组件的名称（如netdev，ofproto，dpif，vswitchd等等）
- **Facility**：日志信息的目的地（必须是：console，syslog，或者file）
- **Level**：日志的详细程度（必须是：emer，err，warn，info，或者dbg）

在OVS源代码中，模块名称在源文件中是以以下格式定义的：

    VLOG_DEFINE_THIS_MODULE(<module-name>);

例如，在lib/netdev.c中，你可以看到：

    VLOG_DEFINE_THIS_MODULE(netdev);

这个表明，lib/netdev.c是netdev模块的一部分，任何在lib/netdev.c中生成的日志信息将属于netdev模块。

在OVS源代码中，有多个严重度等级用于定义几个不同类型的日志信息：VLOG_INFO()用于报告，VLOG_WARN()用于警告，VLOG_ERR()用于错误提示，VLOG_DBG()用于调试信息，VLOG_EMERG用于紧急情况。日志等级和工具确定哪个日志信息发送到哪里。

要查看可用模块、工具和各自日志级别的完整列表，请运行以下命令。该命令必须在你启动OVS后调用。

    $ sudo ovs-appctl vlog/list 

![](https://farm1.staticflickr.com/465/19734939478_7eb5d44635_c.jpg)

输出结果显示了用于三个场合（facility：console，syslog，file）的各个模块的调试级别。默认情况下，所有模块的日志等级都被设置为INFO。

指定任何一个OVS模块，你可以选择性地修改任何特定场合的调试级别。例如，如果你想要在控制台屏幕中查看dpif更为详细的调试信息，可以运行以下命令。

    $ sudo ovs-appctl vlog/set dpif:console:dbg 

你将看到dpif模块的console工具已经将其日志等级修改为DBG，而其它两个场合syslog和file的日志级别仍然没有改变。

![](https://farm1.staticflickr.com/333/19896760146_5d851311ae_c.jpg)

如果你想要修改所有模块的日志等级，你可以指定“ANY”作为模块名。例如，下面命令将修改每个模块的console的日志级别为DBG。

    $ sudo ovs-appctl vlog/set ANY:console:dbg 

![](https://farm1.staticflickr.com/351/19734939828_8c7f59e404_c.jpg)

同时，如果你想要一次性修改所有三个场合的日志级别，你可以指定“ANY”作为场合名。例如，下面的命令将修改每个模块的所有场合的日志级别为DBG。

    $ sudo ovs-appctl vlog/set ANY:ANY:dbg 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/enable-logging-open-vswitch.html

作者：[Dan Nanni][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
