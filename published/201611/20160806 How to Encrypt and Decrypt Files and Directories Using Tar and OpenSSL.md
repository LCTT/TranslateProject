怎样用 Tar 和 OpenSSL 给文件和目录加密及解密
=========

当你有重要的敏感数据的时候，给你的文件和目录额外加一层保护是至关重要的，特别是当你需要通过网络与他人传输数据的时候。

由于这个原因，我在寻找一个可疑在 Linux 上加密及解密文件和目录的实用程序，幸运的是我找到了一个用 tar（Linux 的一个压缩打包工具）和 OpenSSL 来解决的方案。借助这两个工具，你真的可以毫不费力地创建和加密 tar 归档文件。

在这篇文章中，我们将了解如何使用 OpenSSL 创建和加密 tar 或 gz（gzip，另一种压缩文件）归档文件：

牢记使用 OpenSSL 的常规方式是：

```
# openssl command command-options arguments
```

### 在 Linux 中加密文件

要加密当前工作目录的内容（根据文件的大小，这可能需要一点时间）：

```
# tar -czf - * | openssl enc -e -aes256 -out secured.tar.gz
```

上述命令的解释：

1.  `enc` - openssl 命令使用加密进行编码
2.  `-e` – 用来加密输入文件的 `enc` 命令选项，这里是指前一个 tar 命令的输出
3.  `-aes256` – 加密用的算法
4.  `-out` – 用于指定输出文件名的 `enc` 命令选项，这里文件名是 `secured.tar.gz`

### 在 Linux 中解密文件

要解密上述 tar 归档内容，使用以下命令。

```
# openssl enc -d -aes256 -in secured.tar.gz | tar xz -C test
```

上述命令的解释：

1.  `-d` – 用于解密文件
2.  `-C` – 提取内容到 `test` 子目录

下图展示了加解密过程，以及当你尝试执行以下操作时会发生什么：

1.  以传统方式提取 tar 包的内容
2.  使用了错误的密码的时候
3.  当你输入正确的密码的时候

[![在 Linux 中加密和解密 Tar 归档文件](http://www.tecmint.com/wp-content/uploads/2016/08/Encrypt-Decrypt-Tar-Archive-Files-in-Linux.png)][1]

*在 Linux 中加密和解密 Tar 归档文件*

当你在本地网络或因特网工作的时候，你可以随时通过加密来保护你和他人共享的重要文本或文件，这有助于降低将其暴露给恶意攻击者的风险。

我们研究了一种使用 OpenSSL（一个 openssl 命令行工具）加密 tar 包的简单技术，你可以参考它的手册页（man page）来获取更多信息和有用的命令。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/encrypt-decrypt-files-tar-openssl-linux/

作者：[Gabriel Cánepa][a]
译者：[OneNewLife](https://github.com/OneNewLife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/wp-content/uploads/2016/08/Encrypt-Decrypt-Tar-Archive-Files-in-Linux.png
