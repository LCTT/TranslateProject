[#]: subject: (Encrypt and decrypt files with a passphrase on Linux)
[#]: via: (https://opensource.com/article/21/7/linux-age)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (turbokernel)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13592-1.html)

在 Linux 上用密码加密和解密文件
======

> age 是一个简单的、易于使用的工具，允许你用一个密码来加密和解密文件。

![](https://img.linux.net.cn/data/attachment/album/202107/18/102604m808ppq4ddd8w910.jpg)

文件的保护和敏感文档的安全加密是用户长期以来关心的问题。即使越来越多的数据被存放在网站和云服务上，并由具有越来越安全和高强度密码的用户账户来保护，但我们能够在自己的文件系统中存储敏感数据仍有很大的价值，特别是我们能够快速和容易地加密这些数据时。

[age][2] 能帮你这样做。它是一个小型且易于使用的工具，允许你用一个密码加密一个文件，并根据需要解密。

### 安装 age

`age` 可以从众多 Linux 软件库中 [安装][3]。

在 Fedora 上安装它：

```
$ sudo dnf install age -y
```

在 macOS 上，使用 [MacPorts][4] 或 [Homebrew][5] 来安装。在 Windows 上，使用 [Chocolatey][6] 来安装。

### 用 age 加密和解密文件

`age` 可以用公钥或用户自定义密码来加密和解密文件。

#### 在 age 中使用公钥

首先，生成一个公钥并写入 `key.txt` 文件：

```
$ age-keygen -o key.txt
Public key: age16frc22wz6z206hslrjzuv2tnsuw32rk80pnrku07fh7hrmxhudawase896m9
```

### 使用公钥加密

要用你的公钥加密一个文件：

```
$ touch mypasswds.txt | age -r \
    ageage16frc22wz6z206hslrjzuv2tnsuw32rk80pnrku07fh7hrmxhudawase896m9 \
    > mypass.tar.gz.age
```

在这个例子中，我使用生成的公钥加密文件 `mypasswds.txt`，保存在名为 `mypass.tar.gz.age` 的加密文件中。

### 用公钥解密

如需解密加密文件，使用 `age` 命令和 `--decrypt` 选项：

```
$ age --decrypt -i key.txt -o mypass.tar.gz mypass.tar.gz.age
```

在这个例子中，`age` 使用存储在 `key.text` 中的密钥，并解密了我在上一步创建的加密文件。

### 使用密码加密

不使用公钥的情况下对文件进行加密被称为对称加密。它允许用户设置密码来加密和解密一个文件。要做到这一点：

```
$ age --passphrase --output mypasswd-encrypted.txt mypasswd.txt
Enter passphrase (leave empty to autogenerate a secure one): 
Confirm passphrase:
```

在这个例子中，`age` 提示你输入一个密码，它将通过这个密码对输入文件 `mypasswd.txt` 进行加密，并生成加密文件 `mypasswd-encrypted.txt`。

### 使用密码解密

如需将用密码加密的文件解密，可以使用 `age` 命令和 `--decrypt` 选项：

```
$ age --decrypt --output passwd-decrypt.txt mypasswd-encrypted.txt
```

在这个例子中，`age` 提示你输入密码，只要你提供的密码与加密时设置的密码一致，`age` 随后将 `mypasswd-encrypted.txt` 加密文件的内容解密为 `passwd-decrypt.txt`。

### 不要丢失你的密钥

无论你是使用密码加密还是公钥加密，你都_不能_丢失加密数据的凭证。根据设计，如果没有用于加密的密钥，通过 `age` 加密的文件是不能被解密的。所以，请备份你的公钥，并记住这些密码！

### 轻松实现加密

`age` 是一个真正强大的工具。我喜欢把我的敏感文件，特别是税务记录和其他档案数据，加密到 `.tz` 文件中，以便以后访问。`age` 是用户友好的，使其非常容易随时加密。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/linux-age

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2 (Scissors cutting open access to files)
[2]: https://github.com/FiloSottile/age
[3]: https://github.com/FiloSottile/age#installation
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://opensource.com/article/20/3/chocolatey
