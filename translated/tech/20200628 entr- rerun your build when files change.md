[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (entr: rerun your build when files change)
[#]: via: (https://jvns.ca/blog/2020/06/28/entr/)
[#]: author: (Julia Evans https://jvns.ca/)

entr：文件更改时重新运行构建
======

这将是一篇很快的文章。我是最近才发现 [[entr]][1] 的，我觉得为什么之前没有人告诉我？！？！因此，如果你和我一样，我会告诉你有关情况。

[entr 的网站][1]上有很多示例，对它已经有很好的解释。

它标题的总结是：`entr` 是一个命令行工具，当每次更改一组指定文件中的任何一个时，你都可以使用它运行任意命令。你给它传递要在标准输入监控的文件列表，如下所示：

```
git ls-files | entr bash my-build-script.sh
```

或者

```
find . -name *.rs | entr cargo test
```

或者任何你希望的。

### 快速反馈很棒

就像世界上的每个程序员一样，我发现每次更改代码时都必须手动重新运行构建/测试非常烦人。

许多工具（例如 hugo 和 flask）都有内置的系统，可以在更改文件时自动重建，这很棒！

但是通常我会自己编写一些自定义的构建过程（例如 “bash build.sh”），而 `entr` 让我有一种神奇的构建经验，我可以立即获得我是否只用一行 bash 修复了奇怪 bug 的反馈。万岁！

### 重启服务器（`entr -r`）

好的，但是如果你正在运行服务器，并且每次都需要重新启动服务器怎么办？ entr 了解你，如果你传递 `-r`，那么

```
git ls-files | entr -r python my-server.py
```

### 清除屏幕（`entr -c`）

另一个简洁的标志是 `-c`，它让你可以在重新运行命令之前清除屏幕，以免被前面构建的输出分散注意力。

### 与 `git ls-files` 一起使用

通常，我要跟踪的文件集与 git 中的文件列表大致相同，因此将 git ls-files 传递给 `entr` 是很自然的事情。

我现在有一个项目，有时我刚刚创建的文件还不在 git 中。那么，如果要包括未跟踪的文件怎么办？这是我拼凑的一点 bash 语句：

```
{ git ls-files; git ls-files . --exclude-standard --others; } | entr your-build-scriot
```

也许可以只用一条 git 命令做到，但我不知道是什么。

### 每次添加新文件时重启：`entr -d`

`git ls-files` 的另一个问题是有时候我添加一个新文件，当然它还没有在 git 中。entr 为此提供了一个很好的功能。如果你传递 `-d`，那么如果你在 entr 跟踪的任何目录中添加新文件，它将退出。

我将它与一个 while 循环配合使用，它将重启 `entr` 来包括新文件，如下所示：

```
while true
do
{ git ls-files; git ls-files . --exclude-standard --others; } | entr -d your-build-scriot
done
```

### entr 在 Linux 上的工作方式：inotify

在 Linux 中，entr 使用 `inotify`（用于跟踪文件系统事件（如文件更改）的系统）工作。如果跟踪它，那么你会看到每个监控文件的 `inotify_add_watch` 系统调用，如下所示：

```
inotify_add_watch(3, "static/stylesheets/screen.css", IN_ATTRIB|IN_CLOSE_WRITE|IN_CREATE|IN_DELETE_SELF|IN_MOVE_SELF) = 1152
```

### 就是这些

我希望这可以帮助一些人了解 `entr`！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/06/28/entr/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: http://eradman.com/entrproject/
