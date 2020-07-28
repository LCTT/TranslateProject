[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12463-1.html)
[#]: subject: (Program IoT systems using Python with this VSCode plugin for RTOS)
[#]: via: (https://opensource.com/article/20/7/python-rt-thread)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

通过 VSCode RTOS 插件使用 Python 为物联网系统编写程序
======

> RTOS 之类的实时嵌入式操作系统使嵌入式系统的编程更简单

![](https://img.linux.net.cn/data/attachment/album/202007/29/001132c37u7u5qp284wef2.jpg)

物联网（IoT）无处不在，它意味着几乎所有的产品，从冰箱到口袋手表，都可以连网。为了实现这个目标，每个产品都需要拥有一个嵌入式计算机来运行网络栈，有些产品几乎是小的不可思议。这就是嵌入式软件出现的场景：现代科技打造的非常小的计算机，硬编码到硬件芯片，不需要任何板外处理器、内存或者存储盘。

就传统视角而言，这种场景意味着没有操作系统可用，但是因为种种 [原因][2]，开发者发现，类似于 RTOS 之类的实时嵌入式操作系统能让嵌入式系统的编程变得非常简单。

虽然 RT-Thread 嵌入式操作系统致力于鼓励程序员新手进入物联网领域，但并非所有的人都具备使用 C 语言硬编码微芯片的能力。幸运的是，MicroPython 通过让开发者创建运行于嵌入式系统的 Python 代码的方式，逐渐填补了这个鸿沟。为了让整个过程更简单，RT-Thread 有一个可以用于 VSCode 和 [VSCodium][4] 的插件，为开发者提供了物联网方面的开发环境。其部分特性包括：

  * 方便的连接方式，可以很容易的通过串口、网络或者 USB 连接到开发板（如果你使用过 Arduino，肯定会很熟悉这个流程）。
  * 支持上传文件或目录到开发板。
  * 支持基于 MicroPython 的代码，而且具有智能的代码补完、语法检查功能。
  * 支持 MicroPython REPL 交互式环境。
  * 丰富的示例代码和演示程序。
  * 完整的工程同步功能。
  * 快速运行内存中的程序代码。
  * 运行函数的代码片段。
  * 支持主流的 MicroPython 开发板。
  * 支持 Linux 和 Windows 操作系统，并经过充分测试。

### 准备

在开始之前，如果你使用的是 Windows 操作系统，那么必须保证 VSCode 的默认终端是 [PowerShell][5]。运行 VSCodium，从 “Terminal” 菜单项启动一个终端. 在显示在 VSCodium 窗口底部的终端界面，从下拉菜单顶端选择 “PowerShell”。
不论你是在 [Windows][6] 还是 Linux 系统下工作，必须保证安装了 Python 3（在 Linux 上，它可能已经安装了，否则可以通过软件库安装它）。

还要安装的是微软提供的通用 VSCode Python 插件。安装方法是点击 “File” 菜单，找到 “Preferences” 子菜单，从中打开 “Extensions” 面板。在扩展中，搜索 “Python”，找到来自微软的 Python 插件。

![VSCodium Python plugin][7]

当然，在上述操作之前，你要先正确安装 [VSCodium][9] 或 [VSCode][10]。

### 安装插件

安装 MicroPython 开发插件的方法与安装 Python 插件一样，点击 “File” 菜单，找到 “Preferences” 子菜单，选择 “Extensions”。

在扩展中，搜索 “MicroPython”，安装 RT-Thread 插件。

![MicroPython plugin for RT-Thread][11]

### 使用插件

你的开发板必须能访问串口，这需要组策略的允许。你可能需要将自己的账户加入该组，通常在默认情况下你的账户可能并不在该组。首先，确认你的账户不在 “dialout” 组：

```
$ groups
tux users
```

本例中，用户“tux”只是“tux”组和“users”组的成员，所以需要将用户“tux”添加到“dialout”组：


```
$ sudo usermod --append --groups dialout tux
```

退出登录或重启以载入你新的组权限。

### 创建 MicroPython 工程

MicroPython 开发的第一步是创建 MicroPython 工程用来编写和运行代码。使用 MicroPython 插件创建工程的方法是，点击左下方的 “Create MicroPython project” 按钮。

![Create MicroPython project][12]

之后会有一些提示，让你选择创建空白工程还是包含例程的工程。

### 连接到开发板

点击 VSCodium 左下方的 “Connection” 按钮，进行 VSCodium 与开发板的连接，在弹出的列表中，选择要连接的物理设备。

### 查看例程

MicroPython 插件提供了许多例程和例库，供学习和调用。获取例程的过程是，激活 MicroPython 之后，VSCodium 左侧按钮条会出现“新建”快捷图标，点击该图标就可以了。点击“文档”快捷图标，会显示例程文件列表；点击“文件夹”快捷图标，会显示例库列表。

![MicroPython examples][13]

### 直接在开发板上运行 MicroPython 文件

在 VSCodium 中可以通过在开发板上运行单个程序文件，很方便快捷的进行程序调试。快捷键 `Alt+Q` 会触发一个特定的插件，该插件会将当前的 Python 文件上传到开发板内存中。你还可以在当前 Python 文档界面点击右键，然后选择 “Run the MicroPython file directly on the device” 实现同样的功能。

![Running code on your device][14]

如果你需要以不上传代码的方式检查一组代码，可以使用“代码片段”功能。要运行 MicroPython REPL 环境中的代码片段，在编辑器中选中要运行的片段，右键菜单中点击 “Execute the selected MicroPython code on the device” （也可以使用 `Alt+Q` 快捷键）。

### 加载文件和目录到开发板

如果需要加载文件或目录到开发板，有现成的方法可用：选中工程中要加载到开发板的文件或目录，在选中的对象上右键，点击右键菜单中的 “Download the file/folder to the device”。

注意，如果开发板中已有与要加载的文件或目录同名者，加载操作将导致开发板原有的内容被覆盖。

在 REPL 环境中运行 `os.listdir()` 命令，可以检查文件和目录是否成功加载。当然，也可以通过相应的命令删除 REPL 中的文件或目录。

删除文件的命令如下：

```
os.remove('file_to_delete')
```

删除目录的命令如下：

```
os.rmdir('folder_to_delete')
```

### 工程的同步

点击左下角“同步”按钮可以启动工程同步，该操作将把本地工程中所有的文件和目录同步到开发板的文件系统。建议在完成程序调试之后进行该操作，调试过程中不需要频繁进行同步操作。

工程的同步操作完成后，开发板上的文件列表可以在 “Device Files List” 列看到。

### 放手尝试

RT-Thread 以开源的方式发布 MicroPython 插件，意在为新老开发者提供帮助，它的很多特性，如代码自动补全等，与开源插件之间互有影响和促进。你如果想为嵌入式系统或物联网系统编写软件，这就是最简单的方式，没有之一。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/python-rt-thread

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[silentdawn-zz](https://github.com/silentdawn-zz)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://opensource.com/article/20/6/open-source-rtos
[3]: https://www.rt-thread.io/
[4]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[5]: https://opensource.com/article/18/2/powershell-people
[6]: https://opensource.com/article/19/8/how-install-python-windows
[7]: https://opensource.com/sites/default/files/uploads/vscodium-python-plugin.jpg (VSCodium Python plugin)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: http://vscodium.com
[10]: https://github.com/microsoft/vscode
[11]: https://opensource.com/sites/default/files/uploads/vscodium-micropython.jpg (MicroPython plugin for RT-Thread)
[12]: https://opensource.com/sites/default/files/uploads/vscodium-micropython-create.jpg (Create MicroPython project)
[13]: https://opensource.com/sites/default/files/uploads/vscodium-micropython-examples.jpg (MicroPython examples)
[14]: https://opensource.com/sites/default/files/uploads/vscodium-micropython-run.jpg (Running code on your device)
