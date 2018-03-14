使用 PGP 保护代码完整性 - 第 3 部分：生成 PGP 子密钥
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/binary.jpg?itok=h62HujOC)

在本系列教程中，我们提供了使用 PGP 的实用指南。在此之前，我们介绍了[基本工具和概念][1]，并介绍了如何[生成并保护您的主 PGP 密钥][2]。在第三篇文章中，我们将解释如何生成  PGP 子密钥，以及它们在日常工作中使用。

### 清单

  1. 生成 2048 位加密子密钥（必要）

  2. 生成 2048 位签名子密钥（必要）

  3. 生成一个 2048 位验证子密钥（可选）

  4. 将你的公钥上传到 PGP 密钥服务器（必要）

  5. 设置一个刷新的定时任务（必要）



#### 注意事项

现在我们已经创建了主密钥，让我们创建用于日常工作的密钥。我们创建了 2048 位密钥，因为很多专用硬件（我们稍后会讨论这个）不能处理更长的密钥，但同样也是出于实用的原因。如果我们发现自己处于一个 2048 位 RSA 密钥也不够好的世界，那将是由于计算或数学的基本突破，因此更长的 4096 位密钥不会产生太大的差别。

##### 创建子密钥

要创建子密钥，请运行：
```
$ gpg --quick-add-key [fpr] rsa2048 encr
$ gpg --quick-add-key [fpr] rsa2048 sign

```

你也可以创建验证密钥，这能让你使用你的 PGP 密钥来使用 ssh：
```
$ gpg --quick-add-key [fpr] rsa2048 auth

```

你可以使用 gpg --list-key [fpr] 来查看你的密钥信息：
```
pub rsa4096 2017-12-06 [C] [expires: 2019-12-06]
 111122223333444455556666AAAABBBBCCCCDDDD
uid [ultimate] Alice Engineer <alice@example.org>
uid [ultimate] Alice Engineer <allie@example.net>
sub rsa2048 2017-12-06 [E]
sub rsa2048 2017-12-06 [S]

```

##### 上传你的公钥到密钥服务器

你的密钥创建已完成，因此现在需要你将其上传到一个公共密钥服务器，使其他人能更容易找到密钥。 （如果你不打算实际使用你创建的密钥，请跳过这一步，因为这只会在密钥服务器上留下垃圾数据。）
```
$ gpg --send-key [fpr]

```

如果此命令不成功，你可以尝试指定一台密钥服务器以及端口，这很有可能成功：
```
$ gpg --keyserver hkp://pgp.mit.edu:80 --send-key [fpr]

```

大多数密钥服务器彼此进行通信，因此你的密钥信息最终将与所有其他密钥信息同步。

**关于隐私的注意事项：**密钥服务器是完全公开的，因此在设计上会泄露有关你的潜在敏感信息，例如你的全名、昵称以及个人或工作邮箱地址。如果你签名了其他人的钥匙或某人签名你的钥匙，那么密钥服务器还会成为你的社交网络的泄密者。一旦这些个人信息发送给密钥服务器，就不可能编辑或删除。即使你撤销签名或身份，它也不会将你的密钥记录删除，它只会将其标记为已撤消 - 这甚至会显得更突出。

也就是说，如果你参与公共项目的软件开发，以上所有信息都是公开记录，因此通过密钥服务器另外让这些信息可见，不会导致隐私的净损失。

###### 上传你的公钥到 GitHub

如果你在开发中使用 GitHub（谁不是呢？），则应按照他们提供的说明上传密钥：

要生成适合粘贴的公钥输出，只需运行：
```
$ gpg --export --armor [fpr]

```

##### 设置一个刷新定时任务

你需要定期刷新你的 keyring，以获取其他人公钥的最新更改。你可以设置一个定时任务来做到这一点：
```
$ crontab -e

```

在新行中添加以下内容：
```
@daily /usr/bin/gpg2 --refresh >/dev/null 2>&1

```

**注意：**检查你的 gpg 或 gpg2 命令的完整路径，如果你的 gpg 是旧式的 GnuPG v.1，请使用 gpg2。


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-3-generating-pgp-subkeys

作者：[Konstantin Ryabitsev][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/blog/learn/2018/2/protecting-code-integrity-pgp-part-1-basic-pgp-concepts-and-tools
[2]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-2-generating-and-protecting-your-master-pgp-key
