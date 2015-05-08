如何使用Vault安全的存储密码和API密钥
=======================================================================
Vault是用于安全的获取保密信息的工具。他可以保存密码、API密钥、证书等信息。Vault通过强访问控制机制和高扩展性的事件日志提供了一个统一的接口来访问保密信息。

对关键信息的准许访问是一个困难的问题，尤其是当有许多用户角色和用户请求不同的关键信息，例如使用不同的权限登录数据库的细节，对外服务的API密钥，面向服务的架构的通信证书等。当保密信息由不同的平台进行管理，并且使用一些自定义的配置时，情况变得更糟，因此，安全的存储、管理审计日志几乎是不可能的。但Vault为这种复杂情况提供了一个解决方案。

### 突出特点 ###

数据加密：Vault能够保证在不存储数据的情况下对数据进行加密、解密。开发者们现在便可以存储加密后的数据而无需开发他们自己的加密技术，Vault还允许安全团队自定义安全参数。

**安全密码存储**：Vault在将保密信息（API密钥、密码、证书）存储到持久化存储之前对数据进行加密。因此，如果有人偶尔拿到了获取存储的数据的权限，这也没有任何意义，除非数据被解密。

**动态密码**：Vault为类似AWS和SQL数据库的系统按需产生密码。如果应用需要获得AWS S3的桶，例如，它向Vault请求AWS密钥对，即请求需要的保密信息一段租用期。这个保密信息在租用时间过期后将变得不可用。

**租赁和更新**：Vault以租用期为限制授予保密信息，一旦租用期过期，它便立刻收回保密信息，如果应用仍需要保密信息，则可以通过API更新租用期。

**撤销**：在租用期到期之前，Vault可以撤销一个保密信息或者一个保密信息树。

### 安装Vault ###

有两种方式来安装使用Vault。

**1. 预编译的Vault二进制** 能用于所有的Linux发行版，下载地址如下，一旦下载完成，解压并将它放在系统PATH路径下，以便方便的调用。

- [Download Precompiled Vault Binary (32-bit)][1]
- [Download Precompiled Vault Binary (64-bit)][2]
- [Download Precompiled Vault Binary (ARM)][3]

下载相应的预编译的Vault二进制版本。

![wget binary](http://blog.linoxide.com/wp-content/uploads/2015/04/wget-binary.png)

解压下载到的二进制版本。

![vault](http://blog.linoxide.com/wp-content/uploads/2015/04/unzip.png)

祝贺！您现在可以使用Vault了。

![](http://blog.linoxide.com/wp-content/uploads/2015/04/vault.png)

**2. 从源代码编译** 是另一种在系统中安装Vault的方式。在安装Vault之前需要安装GO和GIT。

在 **Redhat系统中安装GO** 使用下面的指令。

    sudo yum install go

在 **Debin系统中安装GO** 使用下面的指令。

    sudo apt-get install golang

或者

    sudo add-apt-repository ppa:gophers/go

    sudo apt-get update

    sudo apt-get install golang-stable

在 **Redhat系统中安装GIT** 使用下面的命令。

    sudo yum install git

在 **Debian系统中安装GIT** 使用下面的命令。

    sudo apt-get install git

一旦GO和GIT都已被安装好，我们便可以开始从源码编译安装Vault。

> 将下列的Vault仓库拷贝到GOPATH

    https://github.com/hashicorp/vault

> 测试下面的文件是否存在，如果它不存在，那么Vault没有被克隆到合适的路径。

    $GOPATH/src/github.com/hashicorp/vault/main.go

> 执行下面的指令来编译Vault，并将二进制文件放到系统bin目录下。

    make dev

![path](http://blog.linoxide.com/wp-content/uploads/2015/04/installation4.png)

### 一份Vault入门教程 ###

我们已经编译了Vault的官方交互式教程，以及他在SSH上的输出

**概述**

这份教程包括下列步骤：

- 初始化，开启您的Vault
- 在Vault中对您的请求授权
- 读写保密信息
- 密封您的Vault

**初始化您的Vault**

首先，我们需要为您初始化一个Vault的工作实例。
在初始化过程中，您可以配置Vault的密封行为。
现在初始化Vault，简单起见，使用一个非密封密钥

    vault init -key-shares=1 -key-threshold=1

您会注意到Vault在这里打印出了许多的密钥。不要清楚您的终端，这些密钥在后面的步骤中会使用到。

![Initializing SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Initializing-SSH.png)

**开启您的Vault**

当一个Vault服务器启动时，它是密封的状态。在这种状态下，Vault被配置为知道在哪里和如何存取物理存储，但不知道如何对其进行解密。
Vault使用加密密钥来加密数据。这个密钥由"主密钥"加密，主密钥不保存。解密主密钥需要一个碎片的阈值。在这个例子中，我们使用一个碎片来解密这个主密钥。

    vault unseal <key 1>

![Unsealing SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Unsealing-SSH.png)

**为您的请求授权**

在执行任何操作之前，连接的客户端应该被授权。授权的过程是检验一个人或者机器是不是他们说的那样，并被赋予了身份。这个身份在向Vault发送请求时被使用。
为简单起见，我们将使用在步骤2中生成的root令牌。这个输出应该以滚动模式出现。

    vault auth <root token>

![Authorize SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Authorize-SSH.png)

**读写保密信息**

现在Vault已经被设置妥当，我们可以开始使用默认的密码后端读写保密信息了。写在Vault中的保密信息被加密并被写入后端的存储。后端存储机制不会查看未加密的值，并且没有任何无需Vault即可解密的必要信息。

    vault write secret/hello value=world

当然，您接下来便可以读这个保密信息了：

    vault read secret/hello

![RW_SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/RW_SSH.png)

**密封您的Vault**

有一个API来密封Vault。它将丢掉加密密钥并需要其他解密过程来恢复它。密封仅需要一个拥有root权限的单独操作。这通常是一种罕见的"打破玻璃过程"的一部分。
这种方式中，如果有一个检测到的入侵，Vault数据将会立刻被锁住，以便最小化损失。如果没有获取到主密钥碎片，它不会被再次获取。

    vault seal

![Seal Vault SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Seal-Vault-SSH.png)

这便是入门教程的结尾。

### 总结 ###

Vault是一个非常有用的应用，它提供了一个可靠且安全的存储关键信息的方式。另外，它在存储前加密关键信息，维护他的审计日志，并以租用期的方式获取保密信息，且一旦租用期过期，它将立刻收回保密信息。Vault是平台独立的，并且可以免费下载和安装。要发掘Vault的更多信息，请访问官方网站。

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/secure-secret-store-vault/

作者：[Aun Raza][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:https://dl.bintray.com/mitchellh/vault/vault_0.1.0_linux_386.zip
[2]:https://dl.bintray.com/mitchellh/vault/vault_0.1.0_linux_amd64.zip
[3]:https://dl.bintray.com/mitchellh/vault/vault_0.1.0_linux_arm.zip
