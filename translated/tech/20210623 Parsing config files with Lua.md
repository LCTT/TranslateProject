[#]: subject: (Parsing config files with Lua)
[#]: via: (https://opensource.com/article/21/6/parsing-config-files-lua)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( hadisi1993)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

使用Lua解析配置文件
======
使用Lua配置持久化应用设置


![坐在电脑前的女人][1]
不是所有的应用都需要配置文件；对很多应用来说，在启动时变得焕然一新对它们更有利。例如，简单的工具就极少需要偏好项和设置在使用过程中保持稳定不变。然而，当你编写一个复杂的应用程序时，如果能让用户设置与应用的交互方式，以及应用与系统交互的方式会很不错。这就是配置文件用来做的事情。本文将讨论一些利用Lua进行持久化配置的方法。

### 选择一种格式
关于配置文件很重要的两点是一致性和可预见性。你不会希望为了保存用户偏好项，将信息转储到文件中，然后再花几天去编码实现“逆向工程”，处理最后出现在文件里的随机信息。

这里用一些常用的[配置文件格式][2]。Lua有一些库可以处理大多数常用的配置格式；在本文中，我会采用INI格式。
### 安装库
Lua库的核心仓库是[Luarocks.org][3].你可以在这个网站搜索库，或者你可以安装并使用`luarocks`终端命令。
Linux环境中，你可以从发行版的软件仓库中下载它，例如：

```
`$ sudo dnf install luarocks`
```

在macOS上，请使用[MacPorts][4] 或者[Homebrew][5]. 在Windows上，请使用[Chocolatey][6].
一旦`luarocks`被安装，你可以使用`search`子命令来搜索一个恰当的库。如果你不知道库的名字，可以通过关键词来搜索这个库，例如`ini` ，`xml` 或者 `json`，这取决于你想要用这个库做什么。打个比方，你可以搜索`inifile`， 这个库被我用来解析INI格式的文本文件。

```
$ luarocks search inifile
Search results:
inifile
 1.0-2 (rockspec) - <https://luarocks.org>
 1.0-2 (src) - <https://luarocks.org>
 1.0-1 (rockspec) - <https://luarocks.org>
 [...]
```

A common trap programmers fall into is installing a library on their system and forgetting to bundle it with their application. This can create problems for users who don't have the library installed. To avoid this, use the `--tree` option to install the library to a local folder within your project directory. If you don't have a project directory, create one first, and then install:
一个开发者容易犯的错误是在系统上安装了这个库却忘了把它和应用打包。这会给没有安装这个库的用户带来麻烦。为了防止这个问题发生，可以使用`--tree`选项将它安装在项目的本地文件夹中。如果你没有这个项目文件夹，那就先创建这个文件夹再安装库。

```
$ mkdir demo
$ cd demo
$ luarocks install --tree=local inifile
```

`--tree` 选项指示`luarocks`创建一个新文件夹并在其中安装你的库，例如这个例子中的`local`文件夹。 使用这个简单的技巧，你可以将所有你项目要使用的依赖项直接安装到项目文件夹中。
### 配置代码
首先，在一个名`myconfig.ini`的文件中创建一些INI数据

```
[example]
name=Tux
species=penguin
enabled=false

[demo]
name=Beastie
species=demon
enabled=false
```

将这个文件保存到你的home文件夹下，命名为`myconfig.ini`, _不要_ 存到项目文件夹下。你通常会希望配置文件独立于你的文件存在，这样当用户卸载你的应用时，使用应用时产生的数据可以保存在系统中。有些用户会删除不重要的配置文件，但大多数不会。最终，如果他们要重装这个应用，还会保留着所有的用户偏好项。


配置文件的地址以技术来说并不重要，但每一个操作系统都有特指或者默认的路径存储它们。在Linux中，这个路径被[Freedesktop specification][7]指定。它规定配置文件被保存在一个名为`~/.config`的隐藏文件夹中。为了操作时更加清晰明确，可以在home目录下存储配置文件，以便于使用和寻找


创建第二个文件，命名为`main.lua`，并在你喜欢的文本编辑器中打开它。

首先，你必须告诉Lua你将想要使用的附加库放置在哪里。`package.path`变量决定了Lua到哪里去寻找这些库。你可以中终端中查看Lua默认的包地址：

```
$ Lua
&gt; print(package.path)
./?.lua;/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;/usr/lib64/lua/5.3/?.lua;/usr/lib64/lua/5.3/?/init.lua
```

在你的Lua代码中，将你本地库的路径添加到`package.path`中：

```
`package.path = package.path .. ';local/share/lua/5.3/?.lua`
```

### 使用Lua解析INI文件
当包地址被创建以后，下一个件事就是引入`inifile`库并处理OS逻辑。即使这是一个很简单的应用，代码也需要从操作系统获取到用户home目录的路径并建立在必要时将文件系统路径返回给操作系统的通信方式。

```
package.path = package.path .. ';local/share/lua/5.3/?.lua
inifile = require('inifile')

\-- find home directory
home = os.getenv('HOME')

\-- detect path separator
\-- returns '/' for Linux and Mac
\-- and '\' for Windows
d = package.config:sub(1,1)
```

现在你可使用`inifile`来从配置文件解析数据到Lua表中。一旦这些数据被导入进表中，你可以像查询其他的Lua表一样查询它。

```
\-- parse the INI file and
\-- put values into a table called conf
conf = inifile.parse(home .. d .. 'myconfig.ini')

\-- print the data for review
print(conf['example']['name'])
print(conf['example']['species'])
print(conf['example']['enabled'])
```

在终端中运行代码可以看见结果：

```
$ lua ./main.lua
Tux
penguin
false
```

这看起来是正确的。试试在demo块中执行同样的操作。
### 使用INI格式存储数据
不是所有用来解析的库都会读写数据(通常被称为 _编码 和 _解码_), 但是`inifile`会这样做。这意味着你可以使用它对配置文件进行修改。

为了改变配置文件中的值，你可以对被解析的表中的变量进行设置，然后把表重写回配置文件中。

```
\-- set enabled to true
conf['example']['enabled'] = true
conf['demo']['enabled'] = true

\-- save the change
inifile.save(home .. d .. 'myconfig.ini', conf)
```

现在再来看看配置文件：

```
$ cat ~/myconfig.ini
[example]
name=Tux
species=penguin
enabled=true

[demo]
name=Beastie
species=demon
enabled=true
```

### 配置文件
按照用户的设想来存储数据对程序来说是至关重要的。幸运的是， 这对工程师来说是一个很常规的任务，大多数工作可能早已被完成了。只要找到一个好用的库完成开放格式下编码和解码，你就能为用户提供一致且持续的体验。

以下是完整的demo，可供参考。

```
package.path = package.path .. ';local/share/lua/5.3/?.lua'
inifile = require('inifile')

\-- find home directory
home = os.[getenv][8]('HOME')

\-- detect path separator
\-- returns '/' for Linux and Mac
\-- and '\' for Windows
d = package.config:sub(1,1)

\-- parse the INI file and
\-- put values into a table called conf
conf = inifile.parse(home .. d .. 'myconfig.ini')

\-- print the data for review
print(conf['example']['name'])
print(conf['example']['species'])
print(conf['example']['enabled'])

\-- enable Tux
conf['example']['enabled'] = true

\-- save the change
inifile.save(home .. d .. 'myconfig.ini', conf)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/parsing-config-files-lua

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](hadisi1993)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_2.png?itok=JPlR5aCA (坐在电脑前的女人)
[2]: https://opensource.com/article/21/6/config-files-and-their-formats
[3]: https://opensource.com/article/19/11/getting-started-luarocks
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://opensource.com/article/20/3/chocolatey
[7]: https://www.freedesktop.org/wiki/Specifications
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/getenv.html
