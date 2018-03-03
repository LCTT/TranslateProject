用 PGP 保护代码完整性 - 第一部分： 基本概念和工具
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/pgp-security.jpg?itok=lulwyzYc)

在本系列文章中，我们将深度探讨如何使用 PGP 确保软件完整性。这些文章将为工作于自由软件项目的开发者提供实用指南，并且将包含以下主题：


  1. PGP 基础和最佳实践
  
  2. 如何用 Git 使用 PGP
  
  3. 如何保护你的开发者账户


我们使用与“Freedom”含义相同的词项“Free”，但这个系列中列出的指南也可以被任何其它类型的依赖于分布式团队开发者贡献的软件中。如果你编写进入公共源仓库的代码，你可以从了解和遵循这篇指南中受益。

### 结构

每节分为两个部分：

  * 适用于你项目需求的清单

  * 自由形式的考虑事项的列表，解释这些决定取决于什么，并伴随着配置指令

  


#### 清单优先级

每个清单中各项包含着优先级，用来帮助指导你的决定：

  * (ESSENTIAL) 该项一定要排在考虑事项列表的前面。如果没有这样做，它们将给提交到开源项目中的代码带来高风险。
  
  * （NICE) 包含该项将提升整体安全性，但会影响你与工作环境的交互方式，并且可能需要学习新的习惯或者放弃旧的习惯。




记住，这些只是指导。如果你感到这些优先级不能反映你项目提交的安全，你应该根据自己的需要调整它们。

## PGP 基本概念和工具

### 清单

  1. 理解 PGP 在自由软件开发中的作用 (ESSENTIAL)
  
  2. 理解公钥密码学(Public Key Cryptography)的基础知识 (ESSENTIAL)
  
  3. 理解 PGP 加密和签名的不同 (ESSENTIAL)
  
  4. 理解 PGP 密钥身份（key identities） (ESSENTIAL)
  
  5. 理解 PGP 密钥有效性（key validity） (ESSENTIAL)
  
  6. 安装 GnuPG 工具（版本 2.x） (ESSENTIAL)




### 考虑事项

自由软件社区长期依赖于 PGP 确保它生产的软件产品的真实性和完整性。你可能没有注意到，但无论你是一个 linux，Mac 和 Windowas 用户，你都曾依赖 PGP 来确保你电脑环境的完整性：

  * Linux 发行版依赖 PGP 来确保当二进制或者原代码包从被生产出来到被终端用户安装之间没被更改过
  
  * 自由软件项目通常会提供分离的 PGP 签名以伴随发行软件存档，使得下游的项目可以把下载的版本集成到自己的分布式下载之前，验证下载版本的完整性。
  
  * 自由软件项目通常依赖代码本身的 PGP 签名来跟踪起源，并验证项目开发者提交的代码的完整性





这与工作于专有平台的程序员使用的开发者证书或代码签名机制非常相似。实际上，这两种技术背后的核心概念非常相似 -- 尽管它们在实现的技术层面和它们委托信任方式的大多不同。PGP 不依赖于集中式认证机构，而是让每个用户为每个证书分配自己的信任。

我们的目标是使你的项目通过使用 PGP 来进行代码起源和完整性追踪，遵循最佳实践并遵守基本的安全预防措施。 

### 极其基本的 PGP 操作概括

你不需要知道 PGP 如何工作的具体细节 -- 理解核心概念足以成功地达到我们的目的。PGP 依赖于公钥密码学来将明文转换为密文。这个过程需要两种不同的密钥：

  * 公钥，被所有人知道
  
  * 私钥，只被拥有者知道 




#### 加密

对加密来说，PGP 使用拥有者的公钥创造一条只能通过拥有者私钥解密的消息：

  1. 发送者生成一条随机的加密密钥（“会话密钥”）
  
  2. 发送者使用该会话密钥（使用对称密码）加密内容
  
  3. 发送者使用接收者的 PGP 公钥加密会话密钥
  
  4. 发送者向接收者发送加密后的内容和加密后的会话密钥




对于解密：

  1. 接受者使用他们的 PGP 私钥解密会话密钥
  
  2. 接受者使用会话密钥解密消息的内容




#### 签名
为了创建签名，PGP 私钥或公钥会以相反的方式使用：
    
  1. 签名者生成内容的校检和哈希
  2. 签名者使用自己的 PGP 私钥来加密该校检和
  3. 签名者伴随内容提供加密后的校检和




为了验证签名：

  1. 验证者生成自己的内容校检和哈希
  
  2. 验证者使用签名者的 PGP 公钥来解密提供的校检和
  
  3. 如果校检和匹配，就验证了内容的完整性
 





通常，加密消息也被发送者自己的 PGP 密钥签名。无论何时使用加密消息，这应当是默认的，因为没有认证的加密没有很大意义（除非你是一个告密者或秘密代理并且需要可行的可否认性）

```
Bob Designer (obsolete 1024-bit key) <bob.designer@example.com>

```
### 理解密钥身份

每个 PGP 密钥必须有一个或多个与之关联的身份。通常，一个“身份”指的是以下格式中的人物全名和邮件地址：
```
Alice Engineer <alice.engineer@example.com>

```

有时也会在括号中包含说明，来告诉终端用户关于该特定密钥的更多信息：
```
Bob Designer (obsolete 1024-bit key) <bob.designer@example.com>

```



由于人们可以和多个职业和个人实体相关联，因此在同一密钥上可以有多个身份：
```
Alice Engineer <alice.engineer@example.com>
Alice Engineer <aengineer@personalmail.example.org>
Alice Engineer <webmaster@girlswhocode.example.net>

```

当使用多个身份时，其中之一将被标记为“primary identity”（主要身份）来让检索更简单。

### 理解密钥有效性

为了能使用其他人的公钥来加密或验证，你需要确保它确实属于正确的人（Alice）而不属于冒牌的(Eve)。在 PGP 中，这被称为密钥有效性：

  * Validity: full -- 意味着非常确认该密钥属于 Alice
  * Validity: marginal -- 意味着大致确认该密钥属于 Alice
  * Validity: unknown -- 意味着不确认该密钥是否属于 Alice



#### Web of Trust (WOT) vs. Trust on First Use (TOFU)

PGP 使用了一种信任委托机制叫“Web of Trust”。它的核心是尝试替代 HTTPS/TLS 世界中对集中式认证机构的需求。PGP 把这个责任交给了每个用户，而非各种软件制作商来决定谁应该是你的可信认证实体。

不幸的是，很少有人理解 Web of Trust 的是如何工作的，能让继续工作的人更少。它仍然是 OpenPGP 规范的一个重要方面，但 GnuPG 的近期版本(2.2 及以上)已经实现了一种替代机制叫“Trust on First Use”(TOFU)。

你可以把 TOFU 当作类似 SSH 的信任方式。使用 SSH，当你第一次连接到远程系统，它的密钥指纹会被记录和保存。如果将来密钥改变，SSH 客户端将会提醒你并拒绝连接，迫使你决定是否信任已改变的的密钥。

同样，当你第一次导入某人的 PGP 密钥，它被假定可信。如果在将来的任何时候，GnuPG 碰巧发现另一同样身份的密钥，过去导入的密钥和新密钥都将被标记为无效，并且你需要手动指出保留哪个。 


### 安装 OpenPGP 软件

首先，理解 PGP, OpenPGP, GnuPG 和 gpg 之间的不同很重要：

  * PGP ("Pretty Good Privacy") 是原始商业软件的名字
  
  * OpenPGP 是与原始 PGP 工具兼容的 IETF 标准
  
  * GnuPG ("Gnu Privacy Guard")是实现了 OpenPGP 标准的自由软件
  
  * GnuPG 的命令行工具称为 “gpg”





今天，“PGP”这个词几乎被普遍用来表示开放的 OpenPGP 标准，而不是原始的商业软件，因此“PGP”和“OpenPGP”是可以互换的。“GnuPG”和“pgp”这两个词应该仅在提及工具时使用，而不用于它们产生的输出或它们实现的 OpenPGP 功能。举例：

  * PGP(而非 GnuPG 或 GPG)密钥
  
  * PGP(而非 GnuPG 或 GPG)签名
  
  * PGP(而非 GnuPG 或 GPG)密钥服务器




理解这一点应该可以保护你免受来自你遇到的其他 PGP 用户“实际上”不可避免的迂腐。

#### 安装 GnuPG

如果你正在使用 Linux，你应该已经安装过了 GnuPG。在 Mac 上，你应该安装[GPG-Suite][1]，或者使用 brew 安装 gnupg2。在 windows 上，你应该安装[GPG4Win][2]，并且为了奏效你可能需要调整指南中的部分命令，除非你设置了类似 unix 的环境。对其他平台来说，你需要自行查找正确的地址来下载和安装 GnuPG。

#### GnuPG 1 vs. 2

GnuPG v.1 和 GnuPG v.2 都实现了同样的标准，但它们提供不兼容的库和命令行工具，所以许多发行版都发布了旧版本 1 和最新版本 2。你需要确保你总是使用 GnuPG v.2。

首先，运行：
```
$ gpg --version | head -n1

```

如果你看到 gpg (GnuPG) 1.4.x，说明你正使用 GnuPG v.1。尝试 gpg2 命令：
```
$ gpg2 --version | head -n1

```

如果你看到 gpg (GnuPG) 2.x.x，说明你可以继续了。这篇指南将假设你使用 GnuPG 2.2 版本（或更晚）。如果你正使用 GnuPG 的 2.0 版本，本指南中某些命令可能无效，你应该考虑安装 GnuPG 最新的 2.2 版本

#### 确保你总是使用 GnuPG v.2 

如果你 gpg 和 gpg2 命令都有，你应该确保总是使用 GnuPG v.2，而不是旧的版本。你可以通过设置别名来确保这一点：
```
$ alias gpg=gpg2

```

你可以把它放在你的 .bashrc 中，以确保它在你使用 gpg 命令时总是被加载。

在本系列的第 2 部分中，我们将介绍生成和保护你的 PGP 主密钥的基本步骤。

通过 Linux 基金会和 edX 的免费[“Introduction to Linux” ][3]课程了解关于 Linux 的更多信息。




--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/2/protecting-code-integrity-pgp-part-1-basic-pgp-concepts-and-tools

作者：[Konstantin Ryabitsev][a]
译者：[kimii](https://github.com/kimii)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://gpgtools.org/
[2]:https://www.gpg4win.org/
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
