在 Linux 中安全且轻松地管理 Cron 定时任务
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Crontab-UI-720x340.jpg)

在 Linux 中遇到计划任务的时候，你首先会想到的大概就是 Cron 定时任务了。Cron 定时任务能帮助你在类 Unix 操作系统中计划性地执行命令或者任务。也可以参考一下我们之前的一篇《[关于 Cron 定时任务的新手指导][1]》。对于有一定 Linux 经验的人来说，设置 Cron 定时任务不是什么难事，但对于新手来说就不一定了，他们在编辑 crontab 文件的时候不知不觉中犯的一些小错误，也有可能把整个 Cron 定时任务搞挂了。如果你在处理 Cron 定时任务的时候为了以防万一，可以尝试使用 **Crontab UI**，它是一个可以在类 Unix 操作系统上安全轻松管理 Cron 定时任务的 Web 页面工具。

Crontab UI 是使用 NodeJS 编写的自由开源软件。有了 Crontab UI，你在创建、删除和修改 Cron 定时任务的时候就不需要手工编辑 Crontab 文件了，只需要打开浏览器稍微操作一下，就能完成上面这些工作。你可以用 Crontab UI 轻松创建、编辑、暂停、删除、备份 Cron 定时任务，甚至还可以简单地做到导入、导出、部署其它机器上的 Cron 定时任务，它还支持错误日志、邮件发送和钩子。

### 安装 Crontab UI

只需要一条命令就可以安装好 Crontab UI，但前提是已经安装好 NPM。如果还没有安装 NPM，可以参考《[如何在 Linux 上安装 NodeJS][2]》这篇文章。

执行这一条命令来安装 Crontab UI。

```
$ npm install -g crontab-ui
```

就是这么简单，下面继续来看看在 Crontab UI 上如何管理 Cron 定时任务。

### 在 Linux 上安全轻松管理 Cron 定时任务

执行这一条命令启动 Crontab UI：

```
$ crontab-ui
```

你会看到这样的输出：

```
Node version: 10.8.0
Crontab UI is running at http://127.0.0.1:8000
```

首先在你的防火墙和路由器上放开 8000 端口，然后打开浏览器访问 `<http://127.0.0.1:8000>`。

注意，默认只有在本地才能访问到 Crontab UI 的控制台页面。但如果你想让 Crontab UI 使用系统的 IP 地址和自定义端口，也就是想让其它机器也访问到本地的 Crontab UI，你需要使用以下这个命令：

```
$ HOST=0.0.0.0 PORT=9000 crontab-ui
Node version: 10.8.0
Crontab UI is running at http://0.0.0.0:9000
```

Crontab UI 就能够通过 `<http://IP-Address>:9000` 这样的 URL 被远程机器访问到了。

Crontab UI 的控制台页面长这样：

![](https://www.ostechnix.com/wp-content/uploads/2018/08/crontab-ui-dashboard.png)

从上面的截图就可以看到，Crontab UI 的界面非常简洁，所有选项的含义都能不言自明。

在终端输入 `Ctrl + C` 就可以关闭 Crontab UI。

#### 创建、编辑、运行、停止、删除 Cron 定时任务
 
点击 “New”，输入 Cron 定时任务的信息并点击 “Save” 保存，就可以创建一个新的 Cron 定时任务了。

  1. 为 Cron 定时任务命名，这是可选的；
  2. 你想要执行的完整命令；
  3. 设定计划执行的时间。你可以按照启动、每时、每日、每周、每月、每年这些指标快速指定计划任务，也可以明确指定任务执行的具体时间。指定好计划时间后，“Jobs” 区域就会显示 Cron 定时任务的句式。
  4. 选择是否为某个 Cron 定时任务记录错误日志。

这是我的一个 Cron 定时任务样例。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/create-new-cron-job.png)

如你所见，我设置了一个每月清理 `pacman` 缓存的 Cron 定时任务。你也可以设置多个 Cron 定时任务，都能在控制台页面看到。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/crontab-ui-dashboard-1.png)

如果你需要更改 Cron 定时任务中的某些参数，只需要点击 “Edit” 按钮并按照你的需求更改对应的参数。点击 “Run” 按钮可以立即执行 Cron 定时任务，点击 “Stop” 则可以立即停止 Cron 定时任务。如果想要查看某个 Cron 定时任务的详细日志，可以点击 “Log” 按钮。对于不再需要的 Cron 定时任务，就可以按 “Delete” 按钮删除。

#### 备份 Cron 定时任务

点击控制台页面的 “Backup” 按钮并确认，就可以备份所有 Cron 定时任务。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/backup-cron-jobs.png)

备份之后，一旦 Crontab 文件出现了错误，就可以使用备份来恢复了。

#### 导入/导出其它机器上的 Cron 定时任务

Crontab UI 还有一个令人注目的功能，就是导入、导出、部署其它机器上的 Cron 定时任务。如果同一个网络里的多台机器都需要执行同样的 Cron 定时任务，只需要点击 “Export” 按钮并选择文件的保存路径，所有的 Cron 定时任务都会导出到 `crontab.db` 文件中。

以下是 `crontab.db` 文件的内容：

```
$ cat Downloads/crontab.db
{"name":"Remove Pacman Cache","command":"rm -rf /var/cache/pacman","schedule":"@monthly","stopped":false,"timestamp":"Thu Aug 23 2018 10:34:19 GMT+0000 (Coordinated Universal Time)","logging":"true","mailing":{},"created":1535020459093,"_id":"lcVc1nSdaceqS1ut"}
```

导出成文件以后，你就可以把这个 `crontab.db` 文件放置到其它机器上并导入成 Cron 定时任务，而不需要在每一台主机上手动设置 Cron 定时任务。总之，在一台机器上设置完，导出，再导入到其他机器，就完事了。

#### 在 Crontab 文件获取/保存 Cron 定时任务

你可能在使用 Crontab UI 之前就已经使用 `crontab` 命令创建过 Cron 定时任务。如果是这样，你可以点击控制台页面上的 “Get from crontab” 按钮来获取已有的 Cron 定时任务。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/get-from-crontab.png)

同样地，你也可以使用 Crontab UI 来将新的 Cron 定时任务保存到 Crontab 文件中，只需要点击 “Save to crontab” 按钮就可以了。

管理 Cron 定时任务并没有想象中那么难，即使是新手使用 Crontab UI 也能轻松管理 Cron 定时任务。赶快开始尝试并发表一下你的看法吧。


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-easily-and-safely-manage-cron-jobs-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/a-beginners-guide-to-cron-jobs/
[2]:https://www.ostechnix.com/install-node-js-linux/

