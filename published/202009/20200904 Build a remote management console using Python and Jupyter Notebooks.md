[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12606-1.html)
[#]: subject: (Build a remote management console using Python and Jupyter Notebooks)
[#]: via: (https://opensource.com/article/20/9/remote-management-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

使用 Jupyter Notebooks 构建一个远程管理控制台
======

> 把 Jupyter 变成一个远程管理控制台。

![](https://img.linux.net.cn/data/attachment/album/202009/12/115114jct1g15e9ucsr6ua.jpg)

SSH 是一个强大的远程管理工具，但有些细节还不够好。编写一个成熟的远程管理控制台听起来好像是一件很费劲的事情。当然，开源社区中肯定有人已经写了一些东西吧？

是的，他们已经写出来了，它的名字是 [Jupyter][2]。你可能会认为 Jupyter 是那些数据科学家用来分析一周内的广告点击趋势之类的工具。这并没有错，它确实是的，而且它是一个很好的工具。但这仅仅刻画是它的表面。

### 关于 SSH 端口转发

有时，你可以通过 22 端口进入一台服务器。一般你也连接不到其他端口。也许你是通过另一个有更多访问权限的“堡垒机”，或者限制主机或端口的网络防火墙访问 SSH。当然，限制访问的 IP 范围是有充分理由的。SSH 是远程管理的安全协议，但允许任何人连接到任何端口是相当不必要的。

这里有一个替代方案：运行一个简单的 SSH 端口转发命令，将本地端口转发到一个“远程”本地连接上。当你运行像 `-L 8111:127.0.0.1:8888` 这样的 SSH 端口转发命令时，你是在告诉 SSH 将你的*本地*端口 `8111` 转发到它认为的“远程”主机 `127.0.0.1:8888`。远程主机认为 `127.0.0.1` 就是它本身。

就像在《芝麻街》节目一样，“这里”是一个微妙的词。

地址 `127.0.0.1` 就是你告诉网络的“这里”。

### 实际动手学习

这可能听起来很混乱，但运行比解释它更简单。

```
$ ssh -L 8111:127.0.0.1:8888 moshez@172.17.0.3
Linux 6ad096502e48 5.4.0-40-generic #44-Ubuntu SMP Tue Jun 23 00:01:04 UTC 2020 x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Wed Aug  5 22:03:25 2020 from 172.17.0.1
$ jupyter/bin/jupyter lab --ip=127.0.0.1
[I 22:04:29.771 LabApp] JupyterLab application directory is /home/moshez/jupyter/share/jupyter/lab
[I 22:04:29.773 LabApp] Serving notebooks from local directory: /home/moshez
[I 22:04:29.773 LabApp] Jupyter Notebook 6.1.1 is running at:
[I 22:04:29.773 LabApp] http://127.0.0.1:8888/?token=df91012a36dd26a10b4724d618b2e78cb99013b36bb6a0d1
<删节>
```

端口转发 `8111` 到 `127.0.0.1`，并在远程主机上启动 Jupyter，它在 `127.0.0.1:8888` 上监听。

现在你要明白，Jupyter 在撒谎。它认为你需要连接到 `8888` 端口，但你把它转发到 `8111` 端口。所以，当你把 URL 复制到浏览器后，但在点击回车之前，把端口从 `8888` 修改为 `8111`。

![Jupyter remote management console][3]

这就是你的远程管理控制台。如你所见，底部有一个“终端”图标。点击它可以启动一个终端。

![Terminal in Jupyter remote console][5]

你可以运行一条命令。创建一个文件会在旁边的文件浏览器中显示出来。你可以点击该文件，在本地的编辑器中打开它。

![Opening a file][6]

你还可以下载、重命名或删除文件：

![File options in Jupyter remote console][7]

点击**上箭头**就可以上传文件了。那就上传上面的截图吧。

![Uploading a screenshot][8]

最后说个小功能，Jupyter 可以让你直接通过双击远程图像查看。

哦，对了，如果你想用 Python 做系统自动化，还可以用 Jupyter 打开笔记本。

所以，下次你需要远程管理防火墙环境的时候，为什么不使用 Jupyter 呢？

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/remote-management-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://jupyter.org/
[3]: https://opensource.com/sites/default/files/uploads/output_1_0.png (Jupyter remote management console)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/output_3_0.png (Terminal in Jupyter remote console)
[6]: https://opensource.com/sites/default/files/uploads/output_5_0.png (Opening a file)
[7]: https://opensource.com/sites/default/files/uploads/output_7_0.png (File options in Jupyter remote console)
[8]: https://opensource.com/sites/default/files/uploads/output_9_0.png (Uploading a screenshot)
