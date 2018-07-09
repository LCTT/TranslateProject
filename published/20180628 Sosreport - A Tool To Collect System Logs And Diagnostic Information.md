Sosreport：收集系统日志和诊断信息的工具
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/sos-720x340.png)

如果你是 RHEL 管理员，你可能肯定听说过 **Sosreport** ：一个可扩展、可移植的支持数据收集工具。它是一个从类 Unix 操作系统中收集系统配置详细信息和诊断信息的工具。当用户提出支持服务单时，他/她必须运行此工具并将由 Sosreport 工具生成的结果报告发送给 Red Hat 支持人员。然后，执行人员将根据报告进行初步分析，并尝试找出系统中的问题。不仅在 RHEL 系统上，你可以在任何类 Unix 操作系统上使用它来收集系统日志和其他调试信息。

### 安装 Sosreport

Sosreport 在 Red Hat 官方系统仓库中，因此你可以使用 Yum 或 DNF 包管理器安装它，如下所示。

```
$ sudo yum install sos
```

要么，

```
$ sudo dnf install sos
```

在 Debian、Ubuntu 和 Linux Mint 上运行：

```
$ sudo apt install sosreport
```

### 用法

安装后，运行以下命令以收集系统配置详细信息和其他诊断信息。

```
$ sudo sosreport
```

系统将要求你输入系统的一些详细信息，例如系统名称、案例 ID 等。相应地输入详细信息，然后按回车键生成报告。如果你不想更改任何内容并使用默认值，只需按回车键即可。

我的 CentOS 7 服务器的示例输出：

```
sosreport (version 3.5)

This command will collect diagnostic and configuration information from
this CentOS Linux system and installed applications.

An archive containing the collected information will be generated in
/var/tmp/sos.DiJXi7 and may be provided to a CentOS support
representative.

Any information provided to CentOS will be treated in accordance with
the published support policies at:

https://wiki.centos.org/

The generated archive may contain data considered sensitive and its
content should be reviewed by the originating organization before being
passed to any third party.

No changes will be made to system configuration.

Press ENTER to continue, or CTRL-C to quit.

Please enter your first initial and last name [server.ostechnix.local]:
Please enter the case id that you are generating this report for []:

Setting up archive ...
Setting up plugins ...
Running plugins. Please wait ...

Running 73/73: yum...
Creating compressed archive...

Your sosreport has been generated and saved in:
/var/tmp/sosreport-server.ostechnix.local-20180628171844.tar.xz

The checksum is: 8f08f99a1702184ec13a497eff5ce334

Please send this file to your support representative.

```

如果你不希望系统提示你输入此类详细信息，请如下使用批处理模式。

```
$ sudo sosreport --batch
```

正如你在上面的输出中所看到的，生成了一个归档报告并保存在 `/var/tmp/sos.DiJXi7` 中。在 RHEL 6/CentOS 6 中，报告将在 `/tmp` 中生成。你现在可以将此报告发送给你的支持人员，以便他可以进行初步分析并找出问题所在。

你可能会担心或想知道报告中的内容。如果是这样，你可以通过运行以下命令来查看它：

```
$ sudo tar -tf /var/tmp/sosreport-server.ostechnix.local-20180628171844.tar.xz
```

要么，

```
$ sudo vim /var/tmp/sosreport-server.ostechnix.local-20180628171844.tar.xz
```

请注意，上述命令不会解压存档，而只显示存档中的文件和文件夹列表。如果要查看存档中文件的实际内容，请首先使用以下命令解压存档：

```
$ sudo tar -xf /var/tmp/sosreport-server.ostechnix.local-20180628171844.tar.xz
```

存档的所有内容都将解压当前工作目录中 `ssosreport-server.ostechnix.local-20180628171844/` 目录中。进入目录并使用 `cat` 命令或任何其他文本浏览器查看文件内容：

```
$ cd sosreport-server.ostechnix.local-20180628171844/

$ cat uptime
17:19:02 up 1:03, 2 users, load average: 0.50, 0.17, 0.10
```

有关 Sosreport 的更多详细信息，请参阅手册页。

```
$ man sosreport
```

就是这些了。希望这些有用。还有更多好东西。敬请关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/sosreport-a-tool-to-collect-system-logs-and-diagnostic-information/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
