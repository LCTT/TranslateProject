[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12715-1.html)
[#]: subject: (Using Bash traps in your scripts)
[#]: via: (https://opensource.com/article/20/6/bash-trap)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在脚本中使用 Bash 信号捕获
======

> 无论你的脚本是否成功运行，<ruby>信号捕获<rt>trap</rt></ruby>都能让它平稳结束。

![](https://img.linux.net.cn/data/attachment/album/202010/13/182135f2nktcrnryncisg8.jpg)

Shell 脚本的启动并不难被检测到，但 Shell 脚本的终止检测却并不容易，因为我们无法确定脚本会按照预期地正常结束，还是由于意外的错误导致失败。当脚本执行失败时，将正在处理的内容记录下来是非常有用的做法，但有时候这样做起来并不方便。而 [Bash][2] 中 `trap` 命令的存在正是为了解决这个问题，它可以捕获到脚本的终止信号，并以某种预设的方式作出应对。

### 响应失败

如果出现了一个错误，可能导致发生一连串错误。下面示例脚本中，首先在 `/tmp` 中创建一个临时目录，这样可以在临时目录中执行解包、文件处理等操作，然后再以另一种压缩格式进行打包：

```
#!/usr/bin/env bash
CWD=`pwd`
TMP=${TMP:-/tmp/tmpdir}

## create tmp dir
mkdir "${TMP}"

## extract files to tmp
tar xf "${1}" --directory "${TMP}"

## move to tmpdir and run commands
pushd "${TMP}"
for IMG in *.jpg; do
  mogrify -verbose -flip -flop "${IMG}"
done
tar --create --file "${1%.*}".tar *.jpg

## move back to origin
popd

## bundle with bzip2
bzip2 --compress "${TMP}"/"${1%.*}".tar \
      --stdout > "${1%.*}".tbz

## clean up
/usr/bin/rm -r /tmp/tmpdir
```

一般情况下，这个脚本都可以按照预期执行。但如果归档文件中的文件是 PNG 文件而不是期望的 JPEG 文件，脚本就会在中途失败，这时候另一个问题就出现了：最后一步删除临时目录的操作没有被正常执行。如果你手动把临时目录删掉，倒是不会造成什么影响，但是如果没有手动把临时目录删掉，在下一次执行这个脚本的时候，它必须处理一个现有的临时目录，里面充满了不可预知的剩余文件。

其中一个解决方案是在脚本开头增加一个预防性删除逻辑用来处理这种情况。但这种做法显得有些暴力，而我们更应该从结构上解决这个问题。使用 `trap` 是一个优雅的方法。

### 使用 trap 捕获信号

我们可以通过 `trap` 捕捉程序运行时的信号。如果你使用过 `kill` 或者 `killall` 命令，那你就已经使用过名为 `SIGTERM` 的信号了。除此以外，还可以执行 `trap -l` 或 `trap --list` 命令列出其它更多的信号：

```
$ trap --list
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
```

可以被 `trap` 识别的信号除了以上这些，还包括：

  * `EXIT`：进程退出时发出的信号
  * `ERR`：进程以非 0 状态码退出时发出的信号
  * `DEBUG`：表示调试模式的布尔值

如果要在 Bash 中实现信号捕获，只需要在 `trap` 后加上需要执行的命令，再加上需要捕获的信号列表就可以了。

例如，下面的这行语句可以捕获到在进程运行时用户按下 `Ctrl + C` 组合键发出的 `SIGINT` 信号：

```
trap "{ echo 'Terminated with Ctrl+C'; }" SIGINT
```

因此，上文中脚本的缺陷可以通过使用 `trap` 捕获 `SIGINT`、`SIGTERM`、进程错误退出、进程正常退出等信号，并正确处理临时目录的方式来修复：

```
#!/usr/bin/env bash
CWD=`pwd`
TMP=${TMP:-/tmp/tmpdir}

trap \
 "{ /usr/bin/rm -r "${TMP}" ; exit 255; }" \
 SIGINT SIGTERM ERR EXIT

## create tmp dir
mkdir "${TMP}"
tar xf "${1}" --directory "${TMP}"

## move to tmp and run commands
pushd "${TMP}"
for IMG in *.jpg; do
  mogrify -verbose -flip -flop "${IMG}"
done
tar --create --file "${1%.*}".tar *.jpg

## move back to origin
popd

## zip tar
bzip2 --compress $TMP/"${1%.*}".tar \
      --stdout > "${1%.*}".tbz
```

对于更复杂的功能，还可以用 [Bash 函数][3]来简化 `trap` 语句。

### Bash 中的信号捕获

信号捕获可以让脚本在无论是否成功执行所有任务的情况下都能够正确完成清理工作，能让你的脚本更加可靠，这是一个很好的习惯。尽管尝试把信号捕获加入到你的脚本里看看能够起到什么作用吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-trap

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/resources/what-bash
[3]: https://opensource.com/article/20/6/how-write-functions-bash
