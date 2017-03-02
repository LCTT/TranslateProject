在 Linux 下如何查看一个进程的运行时间
=====================

![](http://s0.cyberciti.org/images/category/old/linux-logo.png)

> 我是一个 Linux 系统的新手。我该如何在我的 Ubuntu 服务器上查看一个进程（或者根据进程 id 查看）已经运行了多久？

你需要使用 ps 命令来查看关于一组正在运行的进程的信息。ps 命令提供了如下的两种格式化选项。

1. etime 显示了自从该进程启动以来，经历过的时间，格式为 `[[DD-]hh:]mm:ss`。
2. etimes 显示了自该进程启动以来，经历过的时间，以秒的形式。

### 如何查看一个进程已经运行的时间？

你需要在 ps 命令之后添加 -o etimes 或者 -o etime 参数。它的语法如下：

```
ps -p {PID-HERE} -o etime
ps -p {PID-HERE} -o etimes
```

#### 第一步：找到一个进程的 PID (openvpn 为例)

```
$ pidof openvpn
6176
```

#### 第二步：openvpn 进程运行了多长时间？

```
$ ps -p 6176 -o etime
```

或者

```
$ ps -p 6176 -o etimes
```

隐藏输出头部：

```
$ ps -p 6176 -o etime=
$ ps -p 6176 -o etimes=
```

样例输出：

![](http://s0.cyberciti.org/uploads/faq/2016/08/How-to-check-how-long-a-process-has-been-running.jpg)

这个 6176 就是你想查看的进程的 PID。在这个例子中，我查看的是 openvpn 进程。你可以按照你的需求随意的更换 openvpn 进程名或者是 PID。在下面的例子中，我打印了 PID、执行命令、运行时间、用户 ID、和用户组 ID：

```
$ ps -p 6176 -o pid,cmd,etime,uid,gid
```

样例输出：

```
  PID CMD                             ELAPSED   UID   GID
 6176 /usr/sbin/openvpn --daemon        15:25 65534 65534
```
 
--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/how-to-check-how-long-a-process-has-been-running/

作者：[VIVEK GITE][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.cyberciti.biz/faq/how-to-check-how-long-a-process-has-been-running/
