Linux Pmap 命令 - 查看进程用了多少内存
================================================================================

Pmap 提供了进程的内存映射，pmap命令用于显示一个或多个进程的内存状态。其报告进程的地址空间和内存状态信息。Pmap实际上是一个Sun OS上的命令，linux仅支持其有限的功能。但是它还是对查看完整的进程地址空间很有帮助。我们需要PID或者运行的进程的唯一进程ID来查看[进程内存状态][1]，我们可以通过/proc或者常规命令比如top或ps得到它。

### 语法或用法  ###

    #pmap PID

或者

    #pmap [options] PID

在输出中它显示全部的地址,kbytes,mode还有mapping。

### 选项 ###

- -x extended显示扩展格式
- -d device显示设备格式
- -q quiet不显示header/footer行
- -V 显示版本信息

### 单一进程内存状态 ###

    [root@info ~]# pmap 1013


    1013: /usr/sbin/sshd
    00110000 1480K r-x- /usr/lib/libcrypto.so.1.0.0
    00282000 80K rw-- /usr/lib/libcrypto.so.1.0.0
    00296000 12K rw-- [ anon ]
    00299000 36K r-x- /lib/libkrb5support.so.0.1
    002a2000 4K rw-- /lib/libkrb5support.so.0.1
    002a3000 16K r-x- /lib/libplc4.so
    002a7000 4K rw-- /lib/libplc4.so
    002ab000 88K r-x- /lib/libaudit.so.1.0.0
    002c1000 4K r-- /lib/libaudit.so.1.0.0
    002c2000 4K rw-- /lib/libaudit.so.1.0.0
    002c3000 216K r-x- /lib/libgssapi_krb5.so.2.2
    002f9000 4K rw-- /lib/libgssapi_krb5.so.2.2
    002fa000 808K r-x- /lib/libkrb5.so.3.3
    003c4000 24K rw-- /lib/libkrb5.so.3.3
    003ca000 152K r-x- /lib/libk5crypto.so.3.1
    003f0000 4K rw-- /lib/libk5crypto.so.3.1
    003f1000 92K r-x- /usr/lib/libnssutil3.so
    00738000 4K r--- /lib/libresolv-2.12.so
    00739000 4K rw-- /lib/libresolv-2.12.so
    0073a000 8K rw-- [ anon ]
    00825000 120K r-x- /lib/ld-2.12.so
    00843000 4K r--- /lib/ld-2.12.so
    00844000 4K rw-- /lib/ld-2.12.so
    0090d000 32K r-x- /lib/libwrap.so.0.7.6
    00915000 4K rw-- /lib/libwrap.so.0.7.6
    00948000 484K r-x- /usr/sbin/sshd
    009c1000 8K rw-- /usr/sbin/sshd
    009c3000 20K rw-- [ anon ]
    009e0000 92K r-x- /lib/libpthread-2.12.so
    009f7000 4K r--- /lib/libpthread-2.12.so
    
    total 8232K

### 多进程内存状态 ###

我们可以检查多进程内存通过插入多个PID。加入多个PID中间使用空格分隔。

    pmap 1013 1217 1118

### 扩展进程内存 ###

    [root@info ~]# pmap -x 1013
    1013: /usr/sbin/sshd
    Address Kbytes RSS Dirty Mode Mapping
    00110000 1480 92 0 r-x- libcrypto.so.1.0.0
    00282000 80 80 80 rw-- libcrypto.so.1.0.0
    00296000 12 8 4 rw-- [ anon ]
    00299000 36 0 0 r-x- libkrb5support.so.0.1
    002a2000 4 4 4 rw-- libkrb5support.so.0.1
    002a3000 16 0 0 r-x- libplc4.so
    002a7000 4 4 4 rw-- libplc4.so
    002ab000 88 4 0 r-x- libaudit.so.1.0.0
    002c1000 4 4 4 r--- libaudit.so.1.0.0
    002c2000 4 4 4 rw-- libaudit.so.1.0.0
    002c3000 216 4 0 r-x- libgssapi_krb5.so.2.2
    002f9000 4 4 4 rw-- libgssapi_krb5.so.2.2
    002fa000 808 4 0 r-x- libkrb5.so.3.3
    003c4000 24 24 24 rw-- libkrb5.so.3.3
    003ca000 152 4 0 r-x- libk5crypto.so.3.1
    003f0000 4 4 4 rw-- libk5crypto.so.3.1
    003f1000 92 0 0 r-x- libnssutil3.so
    00408000 12 12 12 rw-- libnssutil3.so
    0040b000 12 0 0 r-x- libplds4.so
    0040e000 4 4 4 rw-- libplds4.so
    
    --- --- --- --- ---
    total kB 8232 - - -

这里的Address，Kbyte，Dirty，RSS，mode还有mapping的说明如下

### 扩展和设备格式区域 ###

- Address: 内存开始地址
- Kbytes: 占用内存的字节数（KB）
- RSS: 保留内存的字节数（KB）
- Dirty: 脏页的字节数（包括共享和私有的）（KB）
- Mode: 内存的权限：read、write、execute、shared、private (写时复制)
- Mapping: 占用内存的文件、或[anon]（分配的内存）、或[stack]（堆栈）
- Offset: 文件偏移
- Device: 设备名 (major:minor)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/pmap-command/

译者：[flsf](https://github.com/flsf) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linoxide.com/linux-shell-script/linux-memory-usage-program/
