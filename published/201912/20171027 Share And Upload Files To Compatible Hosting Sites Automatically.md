自动共享和上传文件到兼容的托管站点
======

![](https://www.ostechnix.com/wp-content/uploads/2017/10/Upload-720x340.png)

前阵子我们写了一个关于 [Transfer.sh][1]的指南，它允许你使用命令行通过互联网来分享文件。今天，我们来看看另一种文件分享实用工具 Anypaste。这是一个基于文件类型自动共享和上传文件到兼容托管站点的简单脚本。你不需要去手动登录到托管站点来上传或分享你的文件。Anypaste 将会根据你想上传的文件的类型来**自动挑选合适的托管站点**。简单地说，照片将被上传到图像托管站点，视频被传到视频站点，代码被传到 pastebin。难道不是很酷的吗？Anypaste 是一个完全开源、免费、轻量的脚本，你可以通过命令行完成所有操作。因此，你不需要依靠那些臃肿的、需要消耗大量内存的 GUI 应用来上传和共享文件。

### 安装

正如我所说，这仅仅是一个脚本。所以不存在任何复杂的安装步骤。只需要将脚本下载后放置在你想要运行的位置（例如 `/usr/bin/`），并将其设置为可执行文件后就可以直接使用了。此外，你也可以通过下面的这两条命令来快速安装 Anypaste。

```
sudo curl -o /usr/bin/anypaste https://anypaste.xyz/sh
sudo chmod +x /usr/bin/anypaste
```

就是这样简单。如果需要更新老的 Anypaste 版本，只需要用新的可执行文件覆写旧的即可。

现在，让我们看看一些实例。

### 配置

Anypaste 开箱即用，并不需要特别的配置。默认的配置文件是 `~/.config/anypaste.conf`，这个文件在你第一次运行 Anypaste 时会自动创建。

需要配置的选项只有 `ap_plugins`。Anypaste 使用插件系统上传文件。每个站点（的上传）都由一个特定的插件表示。你可以在 `anypaste.conf` 文件中的 `ap-plugins directive` 位置浏览可用的插件列表。

```
# List of plugins
# If there are multiple compatible plugins, precedence is determined
# by which one is listed first in this array
ap_plugins=(
# Videos/Gifs
'sendvid' 'streamable' 'gfycat'
# Images
'tinyimg' 'vgyme'
# Audio
'instaudio'
# Text
'hastebin' 'ixio' 'sprunge'
# Documents
'docdroid'
# Any file
'jirafeau' 'fileio'
)
[...]
```

如果你要安装一个新的插件，将它添加进这个列表中就可以了。如果你想禁用一个默认插件，只需要将它从列表中移除即可。如果有多个兼容的插件，排列中的第一个会被选择，因此**顺序很重要**。

### 用法

上传一个简单的文件，例如 `test.png`，可以运行以下命令：

```
anypaste test.png
```

输出示例：

```
Current file: test.png
Attempting to upload with plugin 'tinyimg'
######################################################################## 100.0%

Direct Link: https://tinyimg.io/i/Sa1zsjj.png

Upload complete.
All files processed. Have a nice day!
```

正如输出结果中所看到的，Anypaste 通过自动匹配图像文件 `test.png` 发现了兼容的托管站点（https://tinyimg.io），并将文件上传到了该站点。此外，Anypaste 也为我们提供了用于直接浏览/下载该文件的链接。

不仅是 png 格式文件，你还可以上传任何其他图片格式的文件。例如，下面的命令将会上传 gif 格式文件：

```
$ anypaste file.gif
Current file: file.gif
Plugin 'streamable' is compatible, but missing config parameters: 'streamable_email' 'streamable_password'
You can set them in /home/sk/.config/anypaste.conf
Attempting to upload with plugin 'gfycat'
######################################################################## 100.0%
Reminder: Gfycat needs time to encode. Your video will not appear right away.

Link: https://gfycat.com/MisguidedQuaintBergerpicard
Direct(ish) Link: https://thumbs.gfycat.com/MisguidedQuaintBergerpicard-size_restricted.gif

Upload complete.
All files processed. Have a nice day!
```

你可以将链接分享给你的家庭、朋友和同事们。下图是我刚刚将图片上传到 gfycat 网站的截图。

![][3]

也可以一次同时上传多个（相同格式或不同格式）文件。

下面的例子提供参考，这里我会上传两个不同的文件，包含一个图片文件和一个视频文件：

```
anypaste image.png video.mp4
```

输出示例：

```
Current file: image.png
Attempting to upload with plugin 'tinyimg'
######################################################################## 100.0%

Direct Link: https://tinyimg.io/i/au1PHpg.png

Upload complete.
Current file: video.mp4
Plugin 'streamable' is compatible, but missing config parameters: 'streamable_email' 'streamable_password'
You can set them in /home/sk/.config/anypaste.conf
Attempting to upload with plugin 'sendvid'
######################################################################## 100.0%

Link: http://sendvid.com/wwy7w96h
Delete/Edit: http://sendvid.com/wwy7w96h?secret=39c0af2d-d8bf-4d3d-bad3-ad37432a40a5

Upload complete.
All files processed. Have a nice day!
```

Anypaste 针对两个文件自动发现了与之相兼容的托管站点并成功上传。

正如你在上述用法介绍部分的例子中注意到的，Anypaste 会自动挑选最佳的插件。此外，你可以指定插件进行文件上传，这里提供一个上传到 gfycat 的案例，运行以下命令：

```
anypaste -p gfycat file.gif
```

输出示例：

```
Current file: file.gif
Plugin 'streamable' is compatible, but missing config parameters: 'streamable_email' 'streamable_password'
You can set them in /home/sk/.config/anypaste.conf
Attempting to upload with plugin 'gfycat'
######################################################################## 100.0%
Reminder: Gfycat needs time to encode. Your video will not appear right away.

Link: https://gfycat.com/GrayDifferentCollie
Direct(ish) Link: https://thumbs.gfycat.com/GrayDifferentCollie-size_restricted.gif

Upload complete.
All files processed. Have a nice day!
```

如果要使用特定插件进行文件上传，可以通过以下命令绕过兼容性检查：

```
anypaste -fp gfycat file.gif
```

如果你发现在配置文件中忽略了特定的插件，你仍然可以强制 Anypaste 去使用特定的插件，只不过需要加上 `-xp` 参数。

```
anypaste -xp gfycat file.gif
```

如果想要以交互模式上传文件，可以在命令后加上 `-i` 标签：

```
$ anypaste -i file.gif
Current file: file.gif
Determine compatible plugins automatically? [Y/n] **n**
The following plugins were found: 'sendvid' 'streamable' 'gfycat' 'tinyimg' 'vgyme' 'instaudio' 'hastebin' 'ixio' 'sprunge' 'docdroid' 'jirafeau' 'fileio'

Enter the (partial) name of a plugin, or nothing for automatic selection
**gfycat**
Attempt to upload with plugin 'gfycat'? [Y/n] **y**
Attempting to upload with plugin 'gfycat'
######################################################################## 100.0%
Reminder: Gfycat needs time to encode. Your video will not appear right away.

Link: https://gfycat.com/WaryAshamedBlackbear
Direct(ish) Link: https://thumbs.gfycat.com/WaryAshamedBlackbear-size_restricted.gif

Upload complete.
All files processed. Have a nice day!
```

正如你所见，Anypaste 首先询问了我是否需要自动确定插件。因为我不想自动寻找插件，所以我回复了 “No”。之后，Anypaste 列出了所有可选择的插件，并要求我从列表中选择一个。同样的，你可以上传和共享不同类型的文件，相关文件会被上传到相兼容的站点。

无论你何时上传一个视频文件，Anypaste 都会将其上传到以下站点中的一个：

  1. sendvid
  2. streamable
  3. gfycat

这里注意列表顺序，Anypaste 将首先将文件上传到 sendvid 站点，如果没有 sendvid 的插件可供使用，Anypaste 将会尝试顺序中的另外两个站点。当然你也可以通过更改配置文件来修改顺序。

图像文件上传站点：

  1. tinyimg.io
  2. vgy.me

音频文件上传站点：

  1. instaud

文本文件上传站点：

  1. hastebin
  2. ix.io
  3. sprunge.us

文档上传站点：

  1. docdroid

其他任意类型的文件上传站点：

  1. jirafeau
  2. file.io

上面列出来的部分站点一段特定的时间后会删除上传的内容，所以在上传和分享内容时应先明确这些站点的条款和条件。

### 结论

在我看来，识别文件并决定将其上传到何处的想法非常棒，而且开发者也以恰当的方式完美地实现了它。毫无疑问，Anypaste 对那些在互联网上需要频繁分享文件的人们非常有用，我希望你也能这么觉得。

这就是今天的全部内容，后面会有越来越多的好东西分享给大家。再见啦！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/anypaste-share-upload-files-compatible-hosting-sites-automatically/

作者：[SK][a]
译者：[lixin555](https://github.com/lixin555)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/easy-fast-way-share-files-internet-command-line/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/10/gfycat.png
