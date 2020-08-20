[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11967-1.html)
[#]: subject: (PHP Development on Fedora with Eclipse)
[#]: via: (https://fedoramagazine.org/php-development-on-fedora-with-eclipse/)
[#]: author: (Mehdi Haghgoo https://fedoramagazine.org/author/powergame/)

使用 Eclipse 在 Fedora 上进行 PHP 开发
======

![][1]

[Eclipse][2] 是由 Eclipse 基金会开发的功能全面的自由开源 IDE。它诞生于 2001 年。你可以在此 IDE 中编写各种程序，从 C/C++ 和 Java 到 PHP，乃至于 Python、HTML、JavaScript、Kotlin 等等。

### 安装

该软件可从 Fedora 的官方仓库中获得。要安装它，请用：

```
sudo dnf install eclipse
```

这将安装基本的 IDE 和 Eclipse 平台，能让你开发 Java 应用。为了将 PHP 开发支持添加到 IDE，请运行以下命令：

```
sudo dnf install eclipse-pdt
```

这将安装 PHP 开发工具，如 PHP 项目向导、PHP 服务器配置，composer 支持等。

### 功能

该 IDE 有许多使 PHP 开发更加容易的功能。例如，它有全面的项目向导（你可以在其中为新项目配置许多选项）。它还有如 composer 支持、调试支持、浏览器、终端等内置功能。

### 示例项目

现在已经安装了 IDE，让我们创建一个简单的 PHP 项目。进入 “File →New → Project”。在出现的对话框中，选择 “PHP project”。输入项目的名称。你可能还需要更改其他一些选项，例如更改项目的默认位置，启用 JavaScript 以及更改 PHP 版本。请看以下截图。

![Create A New PHP Project in Eclipse][3]

你可以单击 “Finish” 按钮创建项目，或按 “Next” 配置其他选项，例如添加包含和构建路径。在大多数情况下，你无需更改这些设置。

创建项目后，右键单击项目文件夹，然后选择 “New→PHP File” 将新的 PHP 文件添加到项目。在本教程中，我将其命名为 `index.php`，这是每个 PHP 项目中公认的默认文件。

![add a new PHP file][4]

接着在新文件中添加代码。

![Demo PHP code][5]

在上面的例子中，我在同一页面上使用了 CSS、JavaScript 和 PHP 标记，主要是为了展示 IDE 能够支持所有这些标记。

页面完成后，你可以将文件移至 Web 服务器文档根目录或在项目目录中创建一个 PHP 开发服务器来查看输出。

借助 Eclipse 中的内置终端，我们可以直接在 IDE 中启动 PHP 开发服务器。只需单击工具栏上的终端图标（![Terminal Icon][6]），然后单击 “OK”。在新终端中，进入项目目录，然后运行以下命令：

```
php -S localhost:8080 -t . index.php
```

![Terminal output][7]

现在，打开浏览器并进入 <http://localhost:8080>。如果按照说明正确完成了所有操作，并且代码没有错误，那么你将在浏览器中看到 PHP 脚本的输出。

![PHP output in Fedora][8]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/php-development-on-fedora-with-eclipse/

作者：[Mehdi Haghgoo][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/php-eclipse-816x346.png
[2]: https://projects.eclipse.org/projects/eclipse
[3]: https://fedoramagazine.org/wp-content/uploads/2020/02/Screenshot-from-2020-02-07-01-58-39.png
[4]: https://fedoramagazine.org/wp-content/uploads/2020/02/Screenshot-from-2020-02-07-02-02-05-1024x576.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/02/code-1024x916.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/02/Screenshot-from-2020-02-07-03-50-05.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/02/terminal-1024x239.png
[8]: https://fedoramagazine.org/wp-content/uploads/2020/02/output.png
