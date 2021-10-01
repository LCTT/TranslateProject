[#]: subject: "Watch commands and tasks with the Linux watch command"
[#]: via: "https://opensource.com/article/21/9/linux-watch-command"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13810-1.html"

用 Linux 的 watch 命令观察命令和任务
======

> 了解 watch 命令如何让你知道任务已完成或命令已执行。

![](https://img.linux.net.cn/data/attachment/album/202109/22/104541ddfgzpvud5ga55sp.jpg)

有很多时候，你需要等待一些事情的完成，比如：

  * 一个文件的下载。
  * 创建或解压一个 [tar][2] 文件。
  * 一个 [Ansible][3] 作业。

其中一些进程有进度指示，但有时进程是通过一层抽象运行的，衡量进度的唯一方法是通过其副作用。其中一些可能是：

  * 一个正在下载的文件不断增长。
  * 一个从 tarball 中提取的目录被文件填满了。
  * Ansible 作业构建了一个[容器][4]。

你可以用这样的命令查询所有这些：

```
$ ls -l downloaded-file
$ find . | wc -l
$ podman ps
$ docker ps
```

但是反复运行这些命令，即使是利用 [Bash 历史][5] 和**向上箭头**的便利，也是很乏味的。

另一种方法是写一个小的 Bash 脚本来为你自动执行这些命令：

```
while :
do
 docker ps
 sleep 2
done
```

但这样的脚本写起来也会很繁琐。你可以写一个小的通用脚本，并将其打包，这样它就可以一直被你使用。幸运的是，其他开源的开发者已经有了这样的经验和做法。

那就是 `watch` 这个命令。

### 安装 watch

`watch` 命令是 [procps-ng 包][6]的一部分，所以如果你是在 Linux 上，你已经安装了它。

在 macOS 上，使用 [MacPorts][7] 或 [Homebrew][8] 安装 `watch`。在 Windows 上，使用 [Chocolatey][9]。

### 使用 watch

`watch` 命令定期运行一个命令并显示其输出。它有一些文本终端的特性，所以只有最新的输出才会出现在屏幕上。

最简单的用法是：`watch <command>`。

例如，在 `docker ps` 命令前加上 `watch`，就可以这样操作：

```
$ watch docker ps
```

用 `watch` 命令，以及一些创造性的 Unix 命令行技巧，可以生成临时的仪表盘。例如，要计算审计事件：

```
$ watch 'grep audit: /var/log/kern.log |wc -l'
```

在最后一个例子中，如果有一个可视化的指示，表明审计事件的数量发生了变化，这可能是有用的。如果变化是预期的，但你想让一些东西看起来“不同”，`watch --differences` 就很好用。它可以高亮显示与上次运行的任何差异。如果你在多个文件中搜索，这一点尤其有效，所以你可以很容易地看到哪个文件发生了变化。

如果没有预期的变化，你可以使用 `watch --differences=permanent` 要求它们被“永久”高亮显示，以便知道哪些变化需要调查。这通常是更有用的。

### 控制频率

最后，有时该命令可能是资源密集型的，不应运行得太频繁。`-n` 参数控制频率。`watch` 默认使用 2 秒间隔，但是 `watch -n 10` 可能适合于资源密集型的情况，比如在子目录的任何文件中搜索一个模式：

```
$ watch -n 10 'find . -type f | xargs grep suspicious-pattern'
```

### 用 watch 观察一个命令

`watch` 命令对于许多临时性的系统管理任务非常有用，在这些任务中，你需要在没有进度条的情况下等待一些耗时的步骤，然后再进入下一个步骤。尽管这种情况并不理想，但 `watch` 可以使情况稍微好转。它让你有时间为工作做回顾性笔记！"。下载 [备忘录][10]，让有用的语法和选项触手可及。。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/linux-watch-command

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/desk_clock_job_work.jpg?itok=Nj4fuhl6 (Clock, pen, and notepad on a desk)
[2]: https://opensource.com/article/17/7/how-unzip-targz-file
[3]: https://opensource.com/resources/what-ansible
[4]: https://opensource.com/resources/what-docker
[5]: https://opensource.com/article/20/6/bash-history-control
[6]: https://opensource.com/article/21/8/linux-procps-ng
[7]: https://opensource.com/article/20/11/macports
[8]: https://opensource.com/article/20/6/homebrew-mac
[9]: https://opensource.com/article/20/3/chocolatey
[10]: https://opensource.com/downloads/watch-cheat-sheet
