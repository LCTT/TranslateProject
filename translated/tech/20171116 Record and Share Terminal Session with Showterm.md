使用 Showterm 录制和共享终端会话
======

![](https://www.maketecheasier.com/assets/uploads/2017/11/record-terminal-session.jpg)

你可以使用几乎所有的屏幕录制程序轻松录制终端会话。但是，你很可能会得到超大的视频文件。Linux 中有几种终端录制程序，每种录制程序都有自己的优点和缺点。Showterm 是一个可以非常容易地记录终端会话，上传，共享，并将它们嵌入到任何网页中。一个优点是，你不会有巨大的文件来处理。

Showterm 是开源的，该项目可以在这个[ GitHub 页面][1]上找到。

**相关**：[2 个简单的将你的终端会话录制为视频的 Linux 程序][2]

### 在 Linux 中安装 Showterm

Showterm 要求你在计算机上安装了 Ruby。以下是如何安装该程序。
```
gem install showterm
```

如果你没有在 Linux 上安装 Ruby：
```
sudo curl showterm.io/showterm > ~/bin/showterm
sudo chmod +x ~/bin/showterm
```

如果你只是想运行程序而不是安装：
```
bash <(curl record.showterm.io)
```

你可以在终端输入 `showterm --help` 得到帮助页面。如果没有出现帮助页面，那么可能是未安装 showterm。现在你已安装了 Showterm（或正在运行独立版本），让我们开始使用该工具进行录制。

 **相关**：[如何在 Ubuntu 中录制终端会话][3]

### 录制终端会话

![showterm terminal][4]

录制终端会话非常简单。从命令行运行 `showterm`。这会在后台启动终端录制。所有从命令行输入的命令都由 Showterm 记录。完成录制后，请按 Ctrl + D 或在命令行中输入`exit` 停止录制。

Showterm 会上传你的视频并输出一个看起来像  http://showterm.io/<一长串字符> 的链接的视频。不幸的是，终端会话会立即上传，而没有任何提示。请不要惊慌！你可以通过输入 `showterm --delete <recording URL>` 删除任何已上传的视频。在上传视频之前，你可以通过在 showterm 命令中添加 `-e` 选项来改变计时。如果视频无法上传，你可以使用 `showterm --retry <script> <times>` 强制重试。

在查看录制内容时，还可以通过在 URL 中添加 “#slow”、“#fast” 或 “#stop” 来控制视频的计时。slow 让视频以正常速度播放、fast 是速度加倍、stop，如名称所示，停止播放视频。

Showterm 终端录制视频可以通过 iframe 轻松嵌入到网页中。这可以通过将 iframe 源添加到 showterm 视频地址来实现，如下所示。

![showtermio][5]

作为开源工具，Showterm 允许进一步定制。例如，要运行你自己的 Showterm 服务器，你需要运行以下命令：
```
export SHOWTERM_SERVER=https://showterm.myorg.local/
```
这样你的客户端可以和它通信。还有额外的功能只需很少的编程知识就可添加。Showterm 服务器项目可在此[ GitHub 页面][1]获得。

### 结论

如果你想与同事分享一些命令行教程，请务必记得 Showterm。Showterm 是基于文本的。因此，与其他屏幕录制机相比，它将产生相对较小的视频。该工具本身尺寸相当小 - 只有几千字节。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/record-terminal-session-showterm/

作者：[Bruno Edoh][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/brunoedoh/
[1]:https://github.com/ConradIrwin/showterm
[2]:https://www.maketecheasier.com/record-terminal-session-as-video/ (2 Simple Applications That Record Your Terminal Session as Video [Linux])
[3]:https://www.maketecheasier.com/record-terminal-session-in-ubuntu/ (How to Record Terminal Session in Ubuntu)
[4]:https://www.maketecheasier.com/assets/uploads/2017/11/showterm-interface.png (showterm terminal)
[5]:https://www.maketecheasier.com/assets/uploads/2017/11/showterm-site.png (showtermio)
