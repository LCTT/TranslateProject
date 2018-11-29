10 个 Linux 中方便的 Bash 别名
======
> 对 Bash 长命令使用压缩的版本来更有效率。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U)

你有多少次在命令行上输入一个长命令，并希望有一种方法可以保存它以供日后使用？这就是 Bash 别名派上用场的地方。它们允许你将长而神秘的命令压缩为易于记忆和使用的东西。需要一些例子来帮助你入门吗？没问题！

要使用你创建的 Bash 别名，你需要将其添加到 `.bash_profile` 中，该文件位于你的家目录中。请注意，此文件是隐藏的，并只能从命令行访问。编辑此文件的最简单方法是使用 Vi 或 Nano 之类的东西。

### 10 个方便的 Bash 别名

1、 你有几次遇到需要解压 .tar 文件但无法记住所需的确切参数？别名可以帮助你！只需将以下内容添加到 `.bash_profile` 中，然后使用 `untar FileName` 解压缩任何 .tar 文件。

```
alias untar='tar -zxvf '
```
2、 想要下载的东西，但如果出现问题可以恢复吗？

```
alias wget='wget -c '
```

3、 是否需要为新的网络帐户生成随机的 20 个字符的密码？没问题。

```
alias getpass="openssl rand -base64 20"
```

4、 下载文件并需要测试校验和？我们也可做到。

```
alias sha='shasum -a 256 '
```

5、 普通的 `ping` 将永远持续下去。我们不希望这样。相反，让我们将其限制在五个 `ping`。

```
alias ping='ping -c 5'
```

6、 在任何你想要的文件夹中启动 Web 服务器。

```
alias www='python -m SimpleHTTPServer 8000'
```

7、 想知道你的网络有多快？只需下载 Speedtest-cli 并使用此别名即可。你可以使用 `speedtest-cli --list` 命令选择离你所在位置更近的服务器。

```
alias speed='speedtest-cli --server 2406 --simple'
```

8、 你有多少次需要知道你的外部 IP 地址，但是不知道如何获取？我也是。

```
alias ipe='curl ipinfo.io/ip'
```

9、 需要知道你的本地 IP 地址？

```
alias ipi='ipconfig getifaddr en0'
```

10、 最后，让我们清空屏幕。

```
alias c='clear'
```

如你所见，Bash 别名是一种在命令行上简化生活的超级简便方法。想了解更多信息？我建议你 Google 搜索“Bash 别名”或在 Github 中看下。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/handy-bash-aliases

作者：[Patrick H.Mullins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pmullins
