[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11886-1.html)
[#]: subject: (Use this Python script to find bugs in your Overcloud)
[#]: via: (https://opensource.com/article/20/1/logtool-root-cause-identification)
[#]: author: (Arkady Shtempler https://opensource.com/users/ashtempl)

用 Python 脚本发现 OpenStack Overcloud 中的问题
======

> LogTool 是一组 Python 脚本，可帮助你找出 Overcloud 节点中问题的根本原因。

![](https://img.linux.net.cn/data/attachment/album/202002/12/211455woy57xx5q19cx175.jpg)

OpenStack 在其 Overcloud 节点和 Undercloud 主机上存储和管理了一堆日志文件。因此，使用 OSP 日志文件来排查遇到的问题并不是一件容易的事，尤其在你甚至都不知道是什么原因导致问题时。

如果你正处于这种情况，那么 [LogTool][2] 可以使你的生活变得更加轻松！它会为你节省本需要人工排查问题所需的时间和精力。LogTool 基于模糊字符串匹配算法，可提供过去发生的所有唯一错误和警告信息。你可以根据日志中的时间戳导出特定时间段（例如 10 分钟前、一个小时前、一天前等）的这些信息。

LogTool 是一组 Python 脚本，其主要模块 `PyTool.py` 在 Undercloud 主机上执行。某些操作模式使用直接在 Overcloud 节点上执行的其他脚本，例如从 Overcloud 日志中导出错误和警告信息。

LogTool 支持 Python 2 和 Python 3，你可以根据需要更改工作目录：[LogTool_Python2][3] or [LogTool_Python3][4]。

### 操作方式

#### 1、从 Overcloud 日志中导出错误和警告信息

此模式用于从过去发生的 Overcloud 节点中提取 **错误** 和 **警告** 信息。作为用户，系统将提示你提供“开始时间”和“调试级别”，以用于提取错误或警告消息。例如，如果在过去 10 分钟内出了问题，你则可以只提取该时间段内的错误和警告消息。

此操作模式将为每个 Overcloud 节点生成一个包含结果文件的目录。结果文件是经过压缩的简单文本文件（`*.gz`），以减少从 Overcloud 节点下载所需的时间。将压缩文件转换为常规文本文件，可以使用 `zcat` 或类似工具。此外，Vi 的某些版本和 Emacs 的任何最新版本均支持读取压缩数据。结果文件分为几部分，并在底部包含目录。

LogTool 可以即时检测两种日志文件：标准和非标准。在标准文件中，每条日志行都有一个已知的和已定义的结构：时间戳、调试级别、信息等等。在非标准文件中，日志的结构未知。例如，它可能是第三方的日志。在目录中，你可以找到每个部分的“名称 --> 行号”例如：

  * **原始数据 - 从标准 OSP 日志中提取的错误/警告消息：** 这部分包含所有提取的错误/警告消息，没有任何修改或更改。这些消息是 LogTool 用于模糊匹配分析的原始数据。
  * **统计信息 - 每个标准 OSP 日志的错误/警告信息数量：** 在此部分，你将找到每个标准日志文件的错误和警告数量。这些信息可以帮助你了解用于排查问题根本原因的潜在组件。
  * **统计信息 - 每个标准 OSP 日志文件的唯一消息：** 这部分提供指定时间戳内的唯一的错误和警告消息。有关每个唯一错误或警告的更多详细信息，请在“原始数据”部分中查找相同的消息。
  * **统计信息 - 每个非标准日志文件在任意时间的唯一消息：** 此部分包含非标准日志文件中的唯一消息。遗憾的是，LogTool 无法像标准日志文件那样的处理方式处理这些日志文件。因此，在你提取“特定时间”的日志信息时会被忽略，你会看到过去创建的所有唯一的错误/警告消息。因此，首先，向下滚动到结果文件底部的目录并查看其部分-使用目录中的行索引跳到相关部分，其中第 3、4 和 5 行的信息最重要。

#### 2、从 Overcloud 节点下载所有日志

所有 Overcloud 节点的日志将被压缩并下载到 Undercloud 主机上的本地目录。

#### 3、所有 Overcloud 日志中搜索字符串

该模式“grep”（搜索）由用户在所有 Overcloud 日志上提供的字符串。例如，你可能希望查看特定请求的所有日志消息，例如，“Create VM”的失败的请求 ID。

#### 4、检查 Overcloud 上当前的 CPU、RAM 和磁盘使用情况

该模式显示每个 Overcloud 节点上的当前 CPU、RAM 和磁盘信息。

#### 5、执行用户脚本

该模式使用户可以在 Overcloud 节点上运行自己的脚本。例如，假设 Overcloud 部署失败，你就需要在每个控制器节点上执行相同的过程来修复该问题。你可以实现“替代方法”脚本，并使用此模式在控制器上运行它。

#### 6、仅按给定的时间戳下载相关日志

此模式仅下载 Overcloud 上 “给定的时间戳”的“上次修改时间”的日志。例如，如果 10 分钟前出现错误，则与旧日志文件就没有关系，因此无需下载。此外，你不能（或不应）在某些错误报告工具中附加大文件，因此此模式可能有助于编写错误报告。

#### 7、从 Undercloud 日志中导出错误和警告信息

这与上面的模式 1 相同。

#### 8、在 Overcloud 上检查不正常的 docker

此模式用于在节点上搜索不正常的 Docker。

#### 9、下载 OSP 日志并在本地运行 LogTool

此模式允许你从 Jenkins 或 Log Storage 下载 OSP 日志（例如，`cougar11.scl.lab.tlv.redhat.com`），并在本地分析。

#### 10、在 Undercloud 上分析部署日志

此模式可以帮助你了解 Overcloud 或 Undercloud 部署过程中出了什么问题。例如，在`overcloud_deploy.sh` 脚本中，使用 `--log` 选项时会生成部署日志；此类日志的问题是“不友好”，你很难理解是什么出了问题，尤其是当详细程度设置为 `vv` 或更高时，使得日志中的数据难以读取。此模式提供有关所有失败任务的详细信息。

#### 11、分析 Gerrit（Zuul）失败的日志

此模式用于分析 Gerrit（Zuul）日志文件。它会自动从远程 Gerrit 门下载所有文件（HTTP 下载）并在本地进行分析。

### 安装

GitHub 上有 LogTool，使用以下命令将其克隆到你的 Undercloud 主机：

```
git clone https://github.com/zahlabut/LogTool.git
```

该工具还使用了一些外部 Python 模块：

#### Paramiko

默认情况下，SSH 模块通常会安装在 Undercloud 上。使用以下命令来验证是否已安装：

```
ls -a /usr/lib/python2.7/site-packages | grep paramiko
```

如果需要安装模块，请在 Undercloud 上执行以下命令：

```
sudo easy_install pip
sudo pip install paramiko==2.1.1
```

#### BeautifulSoup

此 HTML 解析器模块仅在使用 HTTP 下载日志文件的模式下使用。它用于解析 Artifacts HTML 页面以获取其中的所有链接。安装 BeautifulSoup，请输入以下命令：

```
pip install beautifulsoup4
```

你还可以通过执行以下命令使用 [requirements.txt][6] 文件安装所有必需的模块：

```
pip install -r requirements.txt
```

### 配置

所有必需的参数都直接在 `PyTool.py` 脚本中设置。默认值为：

```
overcloud_logs_dir = '/var/log/containers'
overcloud_ssh_user = 'heat-admin'
overcloud_ssh_key = '/home/stack/.ssh/id_rsa'
undercloud_logs_dir ='/var/log/containers'
source_rc_file_path='/home/stack/'
```

### 用法

此工具是交互式的，因此要启动它，只需输入：

```
cd LogTool
python PyTool.py
```

### 排除 LogTool 故障


在运行时会创建两个日志文件：`Error.log` 和 `Runtime.log`。请在你要打开的问题的描述中添加两者的内容。

### 局限性

LogTool 进行硬编码以处理最大 500 MB 的文件。

### LogTool_Python3 脚本

在 [github.com/zahlabut/LogTool][2] 获取。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/logtool-root-cause-identification

作者：[Arkady Shtempler][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/译者ID)
校对：[wxy](https://github.com/wxy)


本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ashtempl
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://github.com/zahlabut/LogTool
[3]: https://github.com/zahlabut/LogTool/tree/master/LogTool_Python2
[4]: https://github.com/zahlabut/LogTool/tree/master/LogTool_Python3
[5]: https://opensource.com/article/19/2/getting-started-cat-command
[6]: https://github.com/zahlabut/LogTool/blob/master/LogTool_Python3/requirements.txt
