Linux 有问必答-- 如何在Perl中捕捉并处理信号
================================================================================
> **提问**: 我需要通过使用Perl的自定义信号处理程序来处理一个中断信号。在一般情况下，我怎么在Perl程序中捕获并处理各种信号（如INT，TERM）？

作为POSIX标准的异步通知机制，信号由操作系统发送给进程某个事件来通知它。当产生信号时，目标程序的执行是通过操作系统中断，并且该信号被发送到处理该信号的处理程序。任何人可以定义和注册自定义信号处理程序或依赖于默认的信号处理程序。

在Perl中，信号可以被捕获并被一个全局的%SIG哈希变量处理。这个%SIG哈希变量被信号号锁定并包含对相应的信号处理程序。因此，如果你想为特定的信号定义自定义信号处理程序，你可以直接更新%SIG的信号的哈希值。

下面是一个代码段来处理使用自定义信号处理程序中断（INT）和终止（TERM）的信号。

    $SIG{INT}  = \&signal_handler;
    $SIG{TERM} = \&signal_handler;
     
    sub signal_handler {
        print "This is a custom signal handler\n";
        die "Caught a signal $!";
    }

![](https://farm4.staticflickr.com/3910/15141131060_f7958f20fb.jpg)

%SIG其他有效的哈希值有'IGNORE'和'DEFAULT'。当所分配的哈希值是'IGNORE'（例如，$SIG{CHLD}='IGNORE'）时，相应的信号将被忽略。分配'DEFAULT'的哈希值（例如，$SIG{HUP}='DEFAULT'），意味着我们将使用一个默认的信号处理程序。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/catch-handle-interrupt-signal-perl.html

译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出