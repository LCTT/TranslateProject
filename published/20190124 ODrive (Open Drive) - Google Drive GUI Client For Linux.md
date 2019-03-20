[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10637-1.html)
[#]: subject: (ODrive (Open Drive) – Google Drive GUI Client For Linux)
[#]: via: (https://www.2daygeek.com/odrive-open-drive-google-drive-gui-client-for-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

ODrive：Linux 中的 Google 云端硬盘图形客户端
======

这个我们已经多次讨论过。但是，我还要简要介绍一下它。截至目前，还没有官方的 Google 云端硬盘的 Linux 客户端，我们需要使用非官方客户端。Linux 中有许多集成 Google 云端硬盘的应用。每个应用都提供了一组功能。

我们过去在网站上写过一些此类文章。

这些文章是 [DriveSync][1] 、[Google Drive Ocamlfuse 客户端][2] 和 [在 Linux 中使用 Nautilus 文件管理器挂载 Google 云端硬盘][3]。

今天我们也将讨论相同的主题，程序名字是 ODrive。

### ODrive 是什么？

ODrive 意即 Open Drive。它是 Google 云端硬盘的图形客户端，它用 electron 框架编写。

它简单的图形界面能让用户几步就能集成 Google 云端硬盘。

### 如何在 Linux 上安装和设置 ODrive？

由于开发者提供了 AppImage 包，因此在 Linux 上安装 ODrive 没有任何困难。

只需使用 `wget` 命令从开发者的 GitHub 页面下载最新的 ODrive AppImage 包。

```
$ wget https://github.com/liberodark/ODrive/releases/download/0.1.3/odrive-0.1.3-x86_64.AppImage
```

你必须为 ODrive AppImage 文件设置可执行文件权限。

```
$ chmod +x odrive-0.1.3-x86_64.AppImage
```

只需运行 ODrive AppImage 文件以启动 ODrive GUI 以进行进一步设置。

```
$ ./odrive-0.1.3-x86_64.AppImage
```

运行上述命令时，可能会看到下面的窗口。只需按下“下一步”按钮即可进行进一步设置。

![][5]

点击“连接”链接添加 Google 云端硬盘帐户。

![][6]

输入你要设置 Google 云端硬盘帐户的电子邮箱。

![][7]

输入邮箱密码。

![][8]

允许 ODrive 访问你的 Google 帐户。

![][9]

默认情况下，它将选择文件夹位置。如果你要选择特定文件夹，则可以更改。

![][10]

最后点击“同步”按钮开始将文件从 Google 下载到本地系统。

![][11]

同步正在进行中。

![][12]

同步完成后。它会显示所有已下载的文件。

![][13]

我看到所有文件都下载到上述目录中。

![][14]

如果要将本地系统中的任何新文件同步到 Google 。只需从应用菜单启动 “ODrive”，但它不会实际启动应用。它将在后台运行，我们可以使用 `ps` 命令查看。

```
$ ps -df | grep odrive
```

![][15]

将新文件添加到 Google文件夹后，它会自动开始同步。从通知菜单中也可以看到。是的，我看到一个文件已同步到 Google 中。

![][16]

同步完成后图形界面没有加载，我不确定这个功能。我会向开发者反馈之后，根据他的反馈更新。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/odrive-open-drive-google-drive-gui-client-for-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/drivesync-google-drive-sync-client-for-linux/
[2]: https://linux.cn/article-10517-1.html
[3]: https://www.2daygeek.com/mount-access-setup-google-drive-in-linux/
[4]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-1.png
[6]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-2.png
[7]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-3.png
[8]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-4.png
[9]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-5.png
[10]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-6.png
[11]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-7.png
[12]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-8a.png
[13]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-9.png
[14]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-11.png
[15]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-9b.png
[16]: https://www.2daygeek.com/wp-content/uploads/2019/01/odrive-open-drive-google-drive-gui-client-for-linux-10.png
