如何在 Arch Linux 中查找已安装的专有软件包？
======

![](https://www.ostechnix.com/wp-content/uploads/2018/01/Absolutely-Proprietary-720x340.jpg)

你是狂热的自由软件支持者吗？你目前在使用任何基于 Arch 的 Linux 发行版吗？我有一个小小的提示送给你！现在，你可以轻松地在 Arch Linux 及其变体（如 Antergos、Manjaro Linux 等）中找到已安装的专有软件包。你无需在已安装软件包的网站中参考其许可细节，也无需使用任何其它外部工具来查明软件包是自由的还是专有的。（LCTT 译注：其实下面还是借助了一个外部程序）

### 在 Arch Linux 中查找已安装的专有软件包

一位开发人员开发了一个名为 “[Absolutely Proprietary][5]” 的实用程序，它是一种用于基于 Arch 发行版的专有软件包检测器。它将基于 Arch 系统中的所有安装包与 Parabola 的软件包 [blacklist][1]和 [aur-blacklist][2] 进行比较，然后显示出你的<ruby>斯托曼自由指数<rt>Stallman Freedom Index</rt></ruby>（“自由/总计”比分）。此外，你可以将该列表保存到文件中，并与其他系统/用户共享或比较。

在安装之前，确保你安装了 Python 和 Git。

然后，`git clone` 仓库：

```
git clone https://github.com/vmavromatis/absolutely-proprietary.git
```

这条命令将会下载所有内容到你当前工作目录中的 `absolutely-proprietary` 目录。

进入此目录：

```
cd absolutely-proprietary
```

接着，使用以下命令查找已安装的专有软件：

```
python main.py
```

这条命令将会下载 `blacklist.txt`、`aur-blacklist.txt`，并将本地已安装的软件包与远程软件包进行比较并显示其指数。

以下是在我的 Arch Linux 桌面的示例输出：

```
Retrieving local packages (including AUR)...
Downloading https://git.parabola.nu/blacklist.git/plain/blacklist.txt
Downloading https://git.parabola.nu/blacklist.git/plain/aur-blacklist.txt
Comparing local packages to remote...
=============================================
47 ABSOLUTELY PROPRIETARY PACKAGES INSTALLED
=============================================

Your GNU/Linux is infected with 47 proprietary packages out of 1370 total installed.
Your Stallman Freedom Index is 96.57

+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| Name | Status | Libre Alternatives | Description |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| chromium-pepper-flash | nonfree | | proprietary Google Chrome EULA, missing sources |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| faac | nonfree | | [FIXME:description] is a GPL'ed package, but has non free code that can't be distributed und|
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| libunrar | nonfree | | part of nonfree unrar, Issue442 |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| opera | nonfree | | nonfree, nondistributable, built from binary installers, etc |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| shutter | nonfree | | need registered user to download (and access website) the source code and depends perl-net-d|
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| ttf-ms-fonts | nonfree | | |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| ttf-ubuntu-font-family | nonfree | | Ubuntu font license considered non-free by DFSG and Fedora |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| unace | nonfree | | license forbids making competing ACE archivers from unace |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| unrar | nonfree | unar | |
| | | fsf | |
| | | unrar | |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| virtualbox | nonfree | | contains BIOS which needs a nonfree compiler to build from source (OpenWatcom compiler), doe|
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+
| wordnet | nonfree | | |
+------------------------|---------|--------------------|---------------------------------------------------------------------------------------------+


Save list to file? (Y/n)
```

![][4]

如你所见，我的系统中有 47 个专有软件包。就像我说的那样，我们可以将它保存到文件中稍后查看。为此，当提示你将列表保存在文件时，请按 `y`。然后按 `y` 接受默认值，或按 `n` 以你喜欢的格式和位置来保存它。

```
Save list to file? (Y/n) y
Save as markdown table? (Y/n) y
Save it to (/tmp/tmpkuky_082.md): y
The list is saved at /home/sk/absolutely-proprietary/y.md

You can review it from the command line
using the "less -S /home/sk/absolutely-proprietary/y.md"
or, if installed, the "most /home/sk/absolutely-proprietary/y.md" commands
```

你可能已经注意到，我只有 **nonfree** 包。它还会显示另外两种类型的软件包，例如 semifree、 uses-nonfree。

  * **nonfree**：这个软件包是公然的非自由软件。
  * **semifree**：这个软件包大部分是自由的，但包含一些非自由软件。
  * **uses-nonfree**：这个软件包依赖、推荐或不恰当地与其他自由软件或服务集成。

该使用程序的另一个显著特点是它不仅显示了专有软件包，而且还显示这些包的替代品。

希望这有些帮助。我很快就会在这里提供另一份有用的指南。敬请关注！

干杯!

资源：

- [Absolutely Proprietary][5]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/find-installed-proprietary-packages-arch-linux/

作者：[SK][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://git.parabola.nu/blacklist.git/plain/blacklist.txt
[2]:https://git.parabola.nu/blacklist.git/plain/aur-blacklist.txt
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2018/01/Proprietary-Packages-1-1.png
[5]:https://github.com/vmavromatis/absolutely-proprietary