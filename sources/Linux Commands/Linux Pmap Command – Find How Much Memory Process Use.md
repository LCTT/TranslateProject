Linux Pmap Command – Find How Much Memory Process Use
================================================================================
Pmap provide memory map of a process, The pmap command display the memory usage map of a process or multiple processes. Pmap reports information about the address space or memory usage map of a process. Pmap is actually a Sun OS command and Linux supports only very limited number of features. But it is very helpful for finding the complete address space of a process. To check [memory usage of process][1] we need PID or unique process ID of running process, we can get PID from /proc or regular commands like top or ps.

### Syntax or usage  ###

    #pmap PID

or

    #pmap [options] PID

In outout it display total address, kbytes, mode and mapping.

### Options ###

    -x extended Show the extended format.
    -d device Show the device format.
    -q quiet Do not display some header/footer lines.
    -V show version Displays version of program.

### Memory usage map of single process ###

    [root@info ~]# pmap 1013


    1013: /usr/sbin/sshd
    00110000 1480K r-x– /usr/lib/libcrypto.so.1.0.0
    00282000 80K rw— /usr/lib/libcrypto.so.1.0.0
    00296000 12K rw— [ anon ]
    00299000 36K r-x– /lib/libkrb5support.so.0.1
    002a2000 4K rw— /lib/libkrb5support.so.0.1
    002a3000 16K r-x– /lib/libplc4.so
    002a7000 4K rw— /lib/libplc4.so
    002ab000 88K r-x– /lib/libaudit.so.1.0.0
    002c1000 4K r—- /lib/libaudit.so.1.0.0
    002c2000 4K rw— /lib/libaudit.so.1.0.0
    002c3000 216K r-x– /lib/libgssapi_krb5.so.2.2
    002f9000 4K rw— /lib/libgssapi_krb5.so.2.2
    002fa000 808K r-x– /lib/libkrb5.so.3.3
    003c4000 24K rw— /lib/libkrb5.so.3.3
    003ca000 152K r-x– /lib/libk5crypto.so.3.1
    003f0000 4K rw— /lib/libk5crypto.so.3.1
    003f1000 92K r-x– /usr/lib/libnssutil3.so
    00738000 4K r—- /lib/libresolv-2.12.so
    00739000 4K rw— /lib/libresolv-2.12.so
    0073a000 8K rw— [ anon ]
    00825000 120K r-x– /lib/ld-2.12.so
    00843000 4K r—- /lib/ld-2.12.so
    00844000 4K rw— /lib/ld-2.12.so
    0090d000 32K r-x– /lib/libwrap.so.0.7.6
    00915000 4K rw— /lib/libwrap.so.0.7.6
    00948000 484K r-x– /usr/sbin/sshd
    009c1000 8K rw— /usr/sbin/sshd
    009c3000 20K rw— [ anon ]
    009e0000 92K r-x– /lib/libpthread-2.12.so
    009f7000 4K r—- /lib/libpthread-2.12.so
    
    total 8232K

### Memory usage map of multiple processes ###

We can check memory map of multiple processes by inserting multiple PIDs. Add multiple PIDs with adding space.

    pmap 1013 1217 1118

### Extended memory map about a process ###

    [root@info ~]# pmap -x 1013
    1013: /usr/sbin/sshd
    Address Kbytes RSS Dirty Mode Mapping
    00110000 1480 92 0 r-x– libcrypto.so.1.0.0
    00282000 80 80 80 rw— libcrypto.so.1.0.0
    00296000 12 8 4 rw— [ anon ]
    00299000 36 0 0 r-x– libkrb5support.so.0.1
    002a2000 4 4 4 rw— libkrb5support.so.0.1
    002a3000 16 0 0 r-x– libplc4.so
    002a7000 4 4 4 rw— libplc4.so
    002ab000 88 4 0 r-x– libaudit.so.1.0.0
    002c1000 4 4 4 r—- libaudit.so.1.0.0
    002c2000 4 4 4 rw— libaudit.so.1.0.0
    002c3000 216 4 0 r-x– libgssapi_krb5.so.2.2
    002f9000 4 4 4 rw— libgssapi_krb5.so.2.2
    002fa000 808 4 0 r-x– libkrb5.so.3.3
    003c4000 24 24 24 rw— libkrb5.so.3.3
    003ca000 152 4 0 r-x– libk5crypto.so.3.1
    003f0000 4 4 4 rw— libk5crypto.so.3.1
    003f1000 92 0 0 r-x– libnssutil3.so
    00408000 12 12 12 rw— libnssutil3.so
    0040b000 12 0 0 r-x– libplds4.so
    0040e000 4 4 4 rw— libplds4.so
    
    ——– ——- ——- ——- ——-
    total kB 8232 – – -

Here Address, Kbyte, Dirty, RSS, mode and mapping containd information as below

### Extended and Device Format Fields ###

    Address: start address of map
    Kbytes: size of map in kilobytes
    RSS: resident set size in kilobytes
    Dirty: dirty pages (both shared and private) in kilobytes
    Mode: permissions on map: read, write, execute, shared, private (copy on write)
    Mapping: file backing the map, or ‘[ anon ]‘ for allocated memory, or ‘[ stack ]‘ for the program stack
    Offset: offset into the file
    Device: device name (major:minor)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/pmap-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linoxide.com/linux-shell-script/linux-memory-usage-program/