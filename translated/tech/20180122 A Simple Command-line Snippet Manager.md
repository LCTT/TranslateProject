一个简单的命令行片段管理器
=====

![](https://www.ostechnix.com/wp-content/uploads/2018/01/pet-6-720x340.png)
我们不可能记住所有的命令，对吧？是的。除了经常使用的命令之外，我们几乎不可能记住一些很少使用的长命令。这就是为什么需要一些外部工具来帮助我们在需要时找到命令。在过去，我们已经审查了两个有用的工具，名为 "Bashpast" 和 "Keep"。使用 Bashpast，我们可以轻松地为 Linux 命令添加书签，以便更轻松地重复调用。而且，Keep 实用程序可以用来在终端中保留一些重要且冗长的命令，以便你可以按需使用它们。今天，我们将看到该系列中的另一个工具，以帮助你记住命令。现在向 "Pet" 打个招呼，这是一个用 Go 语言编写的简单的命令行代码管理器。

使用 Pet，你可以：

  * 注册/添加你重要的，冗长和复杂的命令片段。
  * 以交互方式来搜索保存的命令片段。
  * 直接运行代码片段而无须一遍又一遍地输入。
  * 轻松编辑保存的代码片段。
  * 通过 Gist 同步片段。
  * 在片段中使用变量
  * 还有很多特性即将来临。


#### 安装 Pet 命令行接口代码管理器

由于它是用 Go 语言编写的，所以确保你在系统中已经安装了 Go。

安装 Go 后，从 [**Pet 发布页面**][3] 获取最新的二进制文件。
```
wget https://github.com/knqyf263/pet/releases/download/v0.2.4/pet_0.2.4_linux_amd64.zip
```

对于 32 位计算机：
```
wget https://github.com/knqyf263/pet/releases/download/v0.2.4/pet_0.2.4_linux_386.zip
```

解压下载的文件：
```
unzip pet_0.2.4_linux_amd64.zip
```

对于 32 位：
```
unzip pet_0.2.4_linux_386.zip
```

将 pet 二进制文件复制到 PATH（即 **/usr/local/bin** 之类的）。
```
sudo cp pet /usr/local/bin/
```

最后，让它可以执行：
```
sudo chmod +x /usr/local/bin/pet
```

如果你使用的是基于 Arch 的系统，那么你可以使用任何 AUR 帮助工具从 AUR 安装它。

使用 [**Pacaur**][4]:
```
pacaur -S pet-git
```

使用 [**Packer**][5]:
```
packer -S pet-git
```

使用 [**Yaourt**][6]:
```
yaourt -S pet-git
```

使用 [**Yay** :][7]
```
yay -S pet-git
```

此外，你需要安装 **[fzf][8]** 或 [**peco**][9] 工具已启用交互式搜索。请参阅官方 GitHub 链接了解如何安装这些工具。

#### 用法

运行没有任何参数的 'pet' 来查看可用命令和常规选项的列表。
```
$ pet
pet - Simple command-line snippet manager.

Usage:
 pet [command]

Available Commands:
 configure Edit config file
 edit Edit snippet file
 exec Run the selected commands
 help Help about any command
 list Show all snippets
 new Create a new snippet
 search Search snippets
 sync Sync snippets
 version Print the version number

Flags:
 --config string config file (default is $HOME/.config/pet/config.toml)
 --debug debug mode
 -h, --help help for pet

Use "pet [command] --help" for more information about a command.
```

要查看特定命令的帮助部分，运行：
```
$ pet [command] --help
```

**配置 Pet**

它只适用于默认值。但是，你可以更改默认目录来保存片段，选择要使用的选择器 (fzf 或 peco)，默认文本编辑器编辑片段，添加 GIST id 详细信息等。


要配置 Pet，运行：
```
$ pet configure
```

该命令将在默认的文本编辑器中打开默认配置（例如我是 **vim**），根据你的要求更改或编辑特定值。
```
[General]
 snippetfile = "/home/sk/.config/pet/snippet.toml"
 editor = "vim"
 column = 40
 selectcmd = "fzf"

[Gist]
 file_name = "pet-snippet.toml"
 access_token = ""
 gist_id = ""
 public = false
~
```

**创建片段**

为了创建一个新的片段，运行：
```
$ pet new
```

添加命令和描述，然后按下 ENTER 键保存它。
```
Command> echo 'Hell1o, Welcome1 2to OSTechNix4' | tr -d '1-9'
Description> Remove numbers from output.
```

[![][10]][11]

这是一个简单的命令，用于从 echo 命令输出中删除所有数字。你可以很轻松地记住它。但是，如果你很少使用它，几天后你可能会完全忘记它。当然，我们可以使用 "CTRL+r" 搜索历史记录，但 "Pet" 会更容易。另外，Pet 可以帮助你添加任意数量的条目。

另一个很酷的功能是我们可以轻松添加以前的命令。为此，在你的  **.bashrc** 或 **.zshrc** 文件中添加以下行。
```
function prev() {
 PREV=$(fc -lrn | head -n 1)
 sh -c "pet new `printf %q "$PREV"`"
}
```

执行以下命令来使保存的更改生效。
```
source .bashrc
```

或者
```
source .zshrc
```

现在，运行任何命令，例如：
```
$ cat Documents/ostechnix.txt | tr '|' '\n' | sort | tr '\n' '|' | sed "s/.$/\\n/g"
```

要添加上述命令，你不必使用 "pet new" 命令。只需要：
```
$ prev
```

将说明添加到命令代码片段中，然后按下 ENTER 键保存。

![][12]

**片段列表**

要查看保存的片段，运行：
```
$ pet list
```

![][13]

**编辑片段**

如果你想编辑描述或代码片段的命令，运行：
```
$ pet edit
```

这将在你的默认文本编辑器中打开所有保存的代码片段，你可以根据需要编辑或更改片段。
```
[[snippets]]
 description = "Remove numbers from output."
 command = "echo 'Hell1o, Welcome1 2to OSTechNix4' | tr -d '1-9'"
 output = ""

[[snippets]]
 description = "Alphabetically sort one line of text"
 command = "\t prev"
 output = ""
```

**在片段中使用标签**

要将标签用于判断，使用下面的 **-t** 标志。
```
$ pet new -t
Command> echo 'Hell1o, Welcome1 2to OSTechNix4' | tr -d '1-9
Description> Remove numbers from output.
Tag> tr command examples

```

**执行片段**

要执行一个保存的片段，运行：
```
$ pet exec
```

从列表中选择你要运行的代码段，然后按 ENTER 键来运行它：

![][14]

记住你需要安装 fzf 或 peco 才能使用此功能。

**寻找片段**

如果你有很多要保存的片段，你可以使用字符串或关键词如 below.qjz 轻松搜索它们。
```
$ pet search
```

输入搜索字词或关键字以缩小搜索结果范围。

![][15]

**同步片段**

首先，你需要获取访问令牌。转到此链接  <https://github.com/settings/tokens/new> 并创建访问令牌（只需要 "gist" 范围）。

使用以下命令来配置 Pet：
```
$ pet configure
```

将标记设置到 **[Gist]** 字段中的 **access_token**。

设置完成后，你可以像下面一样将片段上传到 Gist。
```
$ pet sync -u
Gist ID: 2dfeeeg5f17e1170bf0c5612fb31a869
Upload success

```

你也可以在其他 PC 上下载片段。为此，编辑配置文件并在 **[Gist]** 中将 **Gist ID** 设置为 **gist_id**。

之后，下载片段使用以下命令：
```
$ pet sync
Download success

```

获取更多细节，参阅 help 选项：
```
pet -h
```

或者
```
pet [command] -h
```

这就是全部了。希望这可以帮助到你。正如你所看到的，Pet 使用相当简单易用！如果你很难记住冗长的命令，Pet 实用程序肯定会有用。

干杯！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pet-simple-command-line-snippet-manager/

作者：[SK][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/bookmark-linux-commands-easier-repeated-invocation/
[2]:https://www.ostechnix.com/save-commands-terminal-use-demand/
[3]:https://github.com/knqyf263/pet/releases
[4]:https://www.ostechnix.com/install-pacaur-arch-linux/
[5]:https://www.ostechnix.com/install-packer-arch-linux-2/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[8]:https://github.com/junegunn/fzf
[9]:https://github.com/peco/peco
[10]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[11]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-1.png
[12]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-2.png 
[13]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-3.png 
[14]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-4.png 
[15]:http://www.ostechnix.com/wp-content/uploads/2018/01/pet-5.png
