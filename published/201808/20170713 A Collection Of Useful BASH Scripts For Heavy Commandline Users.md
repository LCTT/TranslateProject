献给命令行重度用户的一组实用 BASH 脚本
======

![](https://www.ostechnix.com/wp-content/uploads/2017/07/A-Collection-Of-Useful-BASH-Scripts-720x340.png)

今天，我偶然发现了一组适用于命令行重度用户的实用 BASH 脚本，这些脚本被称为 **Bash-Snippets**，它们对于那些整天都与终端打交道的人来说可能会很有帮助。想要查看你居住地的天气情况？它为你做了。想知道股票价格？你可以运行显示股票当前详细信息的脚本。觉得无聊？你可以看一些 YouTube 视频。这些全部在命令行中完成，你无需安装任何严重消耗内存的 GUI 应用程序。

在撰写本文时，Bash-Snippets 提供以下 19 个实用工具：

  1. **Cheat** – Linux 命令备忘单。
  2. **Cloudup** – 一个将 GitHub 仓库备份到 bitbucket 的工具。
  3. **Crypt** – 加解密文件。
  4. **Cryptocurrency** – 前 10 大加密货币的实时汇率转换。
  5. **Currency** – 货币转换器。
  6. **Geo** – 提供 wan、lan、router、dns、mac 和 ip 的详细信息。
  7. **Lyrics** – 从命令行快速获取给定歌曲的歌词。
  8. **Meme** – 创造命令行表情包。
  9. **Movies** – 搜索并显示电影详情。
  10. **Newton** – 执行数值计算一直到符号数学解析。（to 校正：这里不理解）
  11. **Qrify** – 将给定的字符串转换为二维码。
  12. **Short** – 缩短 URL
  13. **Siteciphers** – 检查给定 https 站点启用或禁用的密码。
  14. **Stocks** – 提供某些股票的详细信息。
  15. **Taste** – 推荐引擎提供三个类似的项目，如提供物品（如书籍、音乐、艺术家、电影和游戏等。）
  16. **Todo** – 命令行待办事项管理。
  17. **Transfer** – 从命令行快速传输文件。
  18. **Weather** – 显示你所在地的天气详情。
  19. **Youtube-Viewer** – 从终端观看 YouTube 视频。

作者可能会在将来添加更多实用程序和/或功能，因此我建议你密切关注该项目的网站或 GitHub 页面以供将来更新。

### 安装

你可以在任何支持 BASH 的操作系统上安装这些脚本。

首先，克隆 git 仓库，使用以下命令：

```
$ git clone https://github.com/alexanderepstein/Bash-Snippets
```

进入目录：

```
$ cd Bash-Snippets/
```

切换到最新的稳定版本：

```
$ git checkout v1.22.0
```

最后，使用以下命令安装 Bash-Snippets：

```
$ sudo ./install.sh
```

这将询问你要安装哪些脚本。只需输入 `Y` 并按回车键即可安装相应的脚本。如果你不想安装某些特定脚本，输入 `N` 并按回车键。

```
Do you wish to install currency [Y/n]: y
```

要安装所有脚本，运行：

```
$ sudo ./install.sh all
```

要安装特定的脚本，比如 currency，运行：

```
$ sudo ./install.sh currency
```

你也可以使用 [Linuxbrew][1] 包管理器来安装它。

安装所有的工具，运行：

```
$ brew install bash-snippets
```

安装特定的工具：

```
$ brew install bash-snippets --without-all-tools --with-newton --with-weather
```

另外，对于那些基于 Debian 系统的，例如 Ubuntu、Linux Mint，可以添加 PPA 源：

```
$ sudo add-apt-repository ppa:navanchauhan/bash-snippets
$ sudo apt update
$ sudo apt install bash-snippets
```

### 用法

**需要网络连接**才能使用这些工具。用法很简单。让我们来看看如何使用其中的一些脚本，我假设你已经安装了所有脚本。

#### 1、 Currency – 货币转换器

这个脚本根据实时汇率转换货币。输入当前货币代码和要交换的货币，以及交换的金额，如下所示：

```
$ currency
What is the base currency: INR
What currency to exchange to: USD
What is the amount being exchanged: 10

=========================
| INR to USD
| Rate: 0.015495
| INR: 10
| USD: .154950
=========================
```

你也可以在单条命令中传递所有参数，如下所示：

```
$ currency INR USD 10
```

参考以下屏幕截图：

[![Bash-Snippets][2]][3]

#### 2、 Stocks – 显示股票价格详细信息

如果你想查看一只股票价格的详细信息，输入股票即可，如下所示：

```
$ stocks Intel

INTC stock info
=============================================
| Exchange Name: NASDAQ
| Latest Price: 34.2500
| Close (Previous Trading Day): 34.2500
| Price Change: 0.0000
| Price Change Percentage: 0.00%
| Last Updated: Jul 12, 4:00PM EDT
=============================================
```

上面输出了 **Intel 股票** 的详情。

#### 3、 Weather – 显示天气详细信息

让我们查看以下天气详细信息，运行以下命令：

```
$ weather
```

示例输出：

![][4]

正如你在上面屏幕截图中看到的那样，它提供了 3 天的天气预报。不使用任何参数的话，它将根据你的 IP 地址显示天气详细信息。你还可以显示特定城市或国家/地区的天气详情，如下所示：

```
$ weather Chennai
```

同样，你可以查看输入以下命令来查看月相（月亮的形态）：

```
$ weather moon
```

示例输出：

![][5]

#### 4、 Crypt – 加解密文件

此脚本对 openssl 做了一层包装，允许你快速轻松地加密和解密文件。

要加密文件，使用以下命令：

```
$ crypt -e [original file] [encrypted file]
```

例如，以下命令将加密 `ostechnix.txt`，并将其保存在当前工作目录下，名为 `encrypt_ostechnix.txt`。

```
$ crypt -e ostechnix.txt encrypt_ostechnix.txt
```

输入两次文件密码：

```
Encrypting ostechnix.txt...
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:
Successfully encrypted
```

上面命令将使用 **AES 256 位密钥**加密给定文件。密码不要保存在纯文本文件中。你可以加密 .pdf、.txt、 .docx、 .doc、 .png、 .jpeg 类型的文件。

要解密文件，使用以下命令：

```
$ crypt -d [encrypted file] [output file]
```

例如：

```
$ crypt -d encrypt_ostechnix.txt ostechnix.txt
```

输入密码解密：

```
Decrypting encrypt_ostechnix.txt...
enter aes-256-cbc decryption password:
Successfully decrypted

```

#### 5、 Movies – 查看电影详情

使用这个脚本，你可以查看电影详情。

以下命令显示了一部名为 “mother” 的电影的详情：

```
$ movies mother

==================================================
| Title: Mother
| Year: 2009
| Tomato: 95%
| Rated: R
| Genre: Crime, Drama, Mystery
| Director: Bong Joon Ho
| Actors: Hye-ja Kim, Bin Won, Goo Jin, Je-mun Yun
| Plot: A mother desperately searches for the killer who framed her son for a girl's horrific murder.
==================================================
```

#### 6、 显示类似条目

要使用这个脚本，你需要从**[这里][6]** 获取 API 密钥。不过不用担心，它完全是免费的。一旦你获得 API 密钥后，将以下行添加到 `~/.bash_profile`：`export TASTE_API_KEY=”你的 API 密钥放在这里”`。（LCTT 译注： TasteDive 是一个推荐引擎，它会根据你的品味推荐相关项目。）

现在你可以根据你提供的项目查看类似项目，如下所示：

```
$ taste -i Red Hot Chilli Peppers
```

#### 7、 Short – 缩短 URL

这个脚本会缩短给定的 URL。

```
$ short <URL>
```

#### 8、 Geo – 显示网络的详情


这个脚本会帮助你查找网络的详细信息，例如广域网、局域网、路由器、 dns、mac 地址和 ip 地址。

例如，要查找你的局域网 ip，运行：

```
$ geo -l
```

我系统上的输出：

```
192.168.43.192
```

查看广域网 ip：

```
$ geo -w
```

在终端中输入 `geo` 来查看更多详细信息。

```
$ geo
Geo
Description: Provides quick access for wan, lan, router, dns, mac, and ip geolocation data
Usage: geo [flag]
 -w Returns WAN IP
 -l Returns LAN IP(s)
 -r Returns Router IP
 -d Returns DNS Nameserver
 -m Returns MAC address for interface. Ex. eth0
 -g Returns Current IP Geodata
Examples:
 geo -g
 geo -wlrdgm eth0
Custom Geo Output =>
[all] [query] [city] [region] [country] [zip] [isp]
Example: geo -a 8.8.8.8 -o city,zip,isp
 -o [options] Returns Specific Geodata
 -a [address] For specific ip in -s
 -v Returns Version
 -h Returns Help Screen
 -u Updates Bash-Snippets
```

#### 9、 Cheat – 显示 Linux 命令的备忘单

想参考 Linux 命令的备忘单吗？这是可能的。以下命令将显示 `curl` 命令的备忘单：

```
$ cheat curl
```

只需用你选择的命令替换 `curl` 即可显示其备忘单。这对于快速参考你要使用的任何命令非常有用。

#### 10、 Youtube-Viewer – 观看 YouTube 视频

使用此脚本，你可以直接在终端上搜索或打开 YouTube 视频。（LCTT 译注：在媒体播放器中，而不是文本的终端中打开）

让我们来看一些有关 **Ed Sheeran** 的视频。

```
$ ytview Ed Sheeran
```

从列表中选择要播放的视频。所选内容将在你的默认媒体播放器中播放。

![][7]

要查看艺术家的近期视频，你可以使用：

```
$ ytview -c [channel name]
```

要寻找视频，只需输入：

```
$ ytview -s [videoToSearch]
```

或者：

```
$ ytview [videoToSearch]
```

#### 11、 cloudup – 备份 GitHub 仓库到 bitbucket

你在 GitHub 上托管过任何项目吗？如果托管过，那么你可以随时间 GitHub 仓库备份到 **bitbucket**，它是一种用于源代码和开发项目的基于 Web 的托管服务。

你可以使用 `-a` 选项一次性备份指定用户的所有 GitHub 仓库，或者备份单个仓库。

要备份 GitHub 仓库，运行：

```
$ cloudup
```

系统将要求你输入 GitHub 用户名， 要备份的仓库名称以及 bitbucket 用户名和密码等。

#### 12、 Qrify – 将字符串转换为二维码

这个脚本将任何给定的文本字符串转换为二维码。这对于发送链接或者保存一串命令到手机非常有用。

```
$ qrify convert this text into qr code
```

示例输出：

![][8]

很酷，不是吗？

#### 13、 Cryptocurrency

它将显示十大加密货币实时汇率。

输入以下命令，然后单击回车来运行：

```
$ cryptocurrency
```

![][9]


#### 14、 Lyrics

这个脚本从命令行快速获取一首歌曲的歌词。

例如，我将获取 “who is it” 歌曲的歌词，这是一首由 <ruby>迈克尔·杰克逊<rt>Michael Jackson</rt></ruby> 演唱的流行歌曲。

```
$ lyrics -a michael jackson -s who is it
```

![][10]

#### 15、 Meme

这个脚本允许你从命令行创建简单的表情贴图。它比基于 GUI 的表情包生成器快得多。

要创建一个表情贴图，只需输入：

```
$ meme -f mymeme
Enter the name for the meme's background (Ex. buzz, doge, blb ): buzz
Enter the text for the first line: THIS IS A
Enter the text for the second line: MEME
```

这将在你当前的工作目录创建 jpg 文件。

#### 16、 Newton

厌倦了解决复杂的数学问题？你来对了。Newton 脚本将执行数值计算，乃至于符号数学解析。

![][11]

#### 17、 Siteciphers

这个脚本可以帮助你检查在给定的 https 站点上启用/禁用哪些加密算法。（LCTT 译注：指 HTTPS 通讯中采用的加密算法）

```
$ siteciphers google.com
```

![][12]

#### 18、 Todo

它允许你直接从终端创建日常任务。

让我们来创建一些任务。

```
$ todo -a The first task
01). The first task Tue Jun 26 14:51:30 IST 2018
```

要添加其它任务，只需添加任务名称重新运行上述命令即可。

```
$ todo -a The second task
01). The first task Tue Jun 26 14:51:30 IST 2018
02). The second task Tue Jun 26 14:52:29 IST 2018
```

要查看任务列表，运行：

```
$ todo -g
01). The first task Tue Jun 26 14:51:30 IST 2018
02). A The second task Tue Jun 26 14:51:46 IST 2018
```

一旦你完成了任务，就可以将其从列表中删除，如下所示：

```
$ todo -r 2
Sucessfully removed task number 2
01). The first task Tue Jun 26 14:51:30 IST 2018
```

要清除所有任务，运行：

```
$ todo -c
Tasks cleared.
```

#### 19、 Transfer

Transfer 脚本允许你通过互联网快速轻松地传输文件和目录。

让我们上传一个文件：

```
$ transfer test.txt
Uploading test.txt
################################################################################################################################################ 100.0%
Success!
Transfer Download Command: transfer -d desiredOutputDirectory ivmfj test.txt
Transfer File URL: https://transfer.sh/ivmfj/test.txt
```

该文件将上传到 transfer.sh 站点。Transfer.sh 允许你一次上传最大 **10 GB** 的文件。所有共享文件在 **14 天**后自动过期。如你所见，任何人都可以通过 Web 浏览器访问 URL 或使用 transfer 目录来下载文件，当然，transfer 必须安装在他/她的系统中。

现在从你的系统中移除文件。

```
$ rm -fr test.txt
```

现在，你可以随时（14 天内）从 transfer.sh 站点下载该文件，如下所示：

```
$ transfer -d Downloads ivmfj test.txt
```

获取关于此实用脚本的更多详情，参考以下指南。

* [用命令行在互联网上共享文件的一个简单快捷方法](https://www.ostechnix.com/easy-fast-way-share-files-internet-command-line/)

### 获得帮助

如果你不知道如何使用特定脚本，只需输入该脚本的名称，然后按下 ENTER 键，你将会看到使用细节。以下示例显示 Qrify 脚本的帮助信息。

```
$ qrify
Qrify
Usage: qrify [stringtoturnintoqrcode]
Description: Converts strings or urls into a qr code.
 -u Update Bash-Snippet Tools
 -m Enable multiline support (feature not working yet)
 -h Show the help
 -v Get the tool version
Examples:
 qrify this is a test string
 qrify -m two\\nlines
 qrify github.com # notice no http:// or https:// this will fail

```

### 更新脚本

你可以随时使用 `-u` 选项更新已安装的工具。以下命令更新 “weather” 工具。

```
$ weather -u
```

### 卸载

你可以使用以下命令来卸载这些工具。

克隆仓库：

```
$ git clone https://github.com/alexanderepstein/Bash-Snippets
```

进入 Bash-Snippets 目录：

```
$ cd Bash-Snippets
```

运行以下命令来卸载脚本：

```
$ sudo ./uninstall.sh
```

输入 `y`，并按下回车键来移除每个脚本。

```
Do you wish to uninstall currency [Y/n]: y
```

**另请阅读：**

- [Cli.Fyi —— 快速而简单地获取诸如 IP、电子邮件、域名等信息的方式](https://www.ostechnix.com/cli-fyi-quick-easy-way-fetch-information-ips-emails-domains-lots/)

好了，这就是全部了。我必须承认，在测试这些脚本时我印象很深刻。我真的很喜欢将所有有用的脚本组合到一个包中的想法。感谢开发者。试一试，你不会失望的。

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/collection-useful-bash-scripts-heavy-commandline-users/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
[3]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk_001.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk_002-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk_003.png
[6]:https://tastedive.com/account/api_access
[7]:http://www.ostechnix.com/wp-content/uploads/2017/07/ytview-1.png
[8]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk_005.png
[9]:http://www.ostechnix.com/wp-content/uploads/2017/07/cryptocurrency.png
[10]:http://www.ostechnix.com/wp-content/uploads/2017/07/lyrics.png
[11]:http://www.ostechnix.com/wp-content/uploads/2017/07/newton.png
[12]:http://www.ostechnix.com/wp-content/uploads/2017/07/siteciphers.png
