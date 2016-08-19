MikeCoder translating...

Linux how long a process has been running
=====================

![](http://s0.cyberciti.org/images/category/old/linux-logo.png)

>I‘m a new Linux system user. How do I check how long a process or pid has been running on my Ubuntu Linux server?

You need to use the ps command to see information about a selection of the active processes. The ps command provide following two formatting options:

1. etime Display elapsed time since the process was started, in the form [[DD-]hh:]mm:ss.
2. etimes Display elapsed time since the process was started, in seconds.

### How to check how long a process has been running?

You need to pass the -o etimes or -o etime to the ps command. The syntax is:

```
ps -p {PID-HERE} -o etime
ps -p {PID-HERE} -o etimes
```

#### Step 1: Find PID of a process (say openvpn)

```
$ pidof openvpn
6176
```

#### Step 2: How long a openvpn process has been running?

```
$ ps -p 6176 -o etime
```

OR

```
$ ps -p 6176 -o etimes
```

To hide header:

```
$ ps -p 6176 -o etime=
$ ps -p 6176 -o etimes=
```

Sample outputs:

![](http://s0.cyberciti.org/uploads/faq/2016/08/How-to-check-how-long-a-process-has-been-running.jpg)

The 6176 is the PID of the process you want to check. In this case I’m looking into openvpn process. Feel free to replace openvpn and PID # 6176 as per your own requirements. In this find example, I am printing PID, command, elapsed time, user ID, and group ID:

```
$ ps -p 6176 -o pid,cmd,etime,uid,gid
```

Sample outputs:

```
  PID CMD                             ELAPSED   UID   GID
 6176 /usr/sbin/openvpn --daemon        15:25 65534 65534
```
 
--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/how-to-check-how-long-a-process-has-been-running/

作者：[VIVEK GITE][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.cyberciti.biz/faq/how-to-check-how-long-a-process-has-been-running/
