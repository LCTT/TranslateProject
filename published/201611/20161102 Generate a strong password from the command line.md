使用命令行生成高强度密码
===

 ![generate-a-strong-password-from-the-command-line](https://www.rosehosting.com/blog/wp-content/uploads/2016/10/generate-a-strong-password-from-the-command-line.jpg) 

设置一个高强度的密码是非常重要的，这样才能够很好的保护自己的账号或者服务器以及确保自己的数据的安全。通常来说，一个高强度密码至少有 14 个字符，包括大小写字母、数字和特殊字符，并且要牢记永远不用那些字典中的单词。使用长密码比短密码要来的安全，因为密码越长越难猜测。在本文中，我将给你介绍几个不同方法，让你可以在 Linux 命令行下生成一个高强度密码。

### 使用 openssl 生成高强度密码

这里使用 openssl 的 rand 方法，它会生成一个 14 位字符的随机字符：

```
openssl rand -base64 14
```

### 使用 urandom 生成高强度密码

这里我们将使用 `tr` 条件来过滤 `/dev/urandom` 的输出，从而删掉那些不想要的字符，并打印出第一个出现的 14 位字符。

```
< /dev/urandom tr -dc A-Za-z0-9 | head -c14; echo
```

### 使用 pwgen 生成高强度密码

`pwgen` 是一个生成随机、无特殊含义但可以正常拼读的密码。

安装 `pwgen`，运行：

```
sudo apt-get install pwgen
```
安装好之后，使用以下命令来生成一个 14 位随机字符：

```
pwgen 14 1
```

你也可以使用以下标记：

-  -c 或 --capitalize
        生成的密码中至少包含一个大写字母
-  -A 或 --no-capitalize
        生成的密码中不含大写字母
-  -n 或 --numerals
        生成的密码中至少包含一个数字
-  -0 或 --no-numerals
        生成的密码中不含数字
-  -y 或 --symbols
        生成的密码中至少包含一个特殊字符
-  -s 或 --secure
        生成一个完全随机的密码
-  -B 或 --ambiguous
        生成的密码中不含易混淆字符 (ambiguous characters)
-  -h 或 --help
        输出帮助信息
-  -H 或 --sha1=path/to/file[#seed]
        使用指定文件的 sha1 哈希值作为随机生成器
-  -C
        按列输出生成的密码
-  -1
        不按列输出生成的密码
-  -v 或 --no-vowels
        不使用任何元音，以免意外生成让人讨厌的单词


### 使用 gpg 生成高强度密码

我们也可以使用 `gpg` 工具来生成一个 14 位字符的密码：

```
gpg --gen-random --armor 1 14
```

### 其它方法

当然，可能还有很多方法可以生成一个高强度密码。比方说，你可以添加以下 bash shell 方法到 `~/.bashrc` 文件：

```
genpasswd() { 
    strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 14 | tr -d '\n'; echo
}
```

当你想要生成一个高强度的随机密码时，运行 `genpasswd` 就好了。

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/generate-password-linux-command-line/

作者：[RoseHosting][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:www.rosehosting.com
