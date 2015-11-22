如何使用Vault安全的存储密码和API密钥
=======================================================================
Vault是用来安全的获取秘密信息的工具，它可以保存密码、API密钥、证书等信息。Vault提供了一个统一的接口来访问秘密信息，其具有健壮的访问控制机制和丰富的事件日志。

对关键信息的授权访问是一个困难的问题，尤其是当有许多用户角色，并且用户请求不同的关键信息时，例如用不同权限登录数据库的登录配置，用于外部服务的API密钥，SOA通信的证书等。当保密信息由不同的平台进行管理，并使用一些自定义的配置时，情况变得更糟，因此，安全的存储、管理审计日志几乎是不可能的。但Vault为这种复杂情况提供了一个解决方案。

### 突出特点 ###

**数据加密**：Vault能够在不存储数据的情况下对数据进行加密、解密。开发者们便可以存储加密后的数据而无需开发自己的加密技术，Vault还允许安全团队自定义安全参数。

**安全密码存储**：Vault在将秘密信息（API密钥、密码、证书）存储到持久化存储之前对数据进行加密。因此，如果有人偶尔拿到了存储的数据，这也没有任何意义，除非加密后的信息能被解密。

**动态密码**：Vault可以随时为AWS、SQL数据库等类似的系统产生密码。比如，如果应用需要访问AWS S3 桶，它向Vault请求AWS密钥对，Vault将给出带有租期的所需秘密信息。一旦租用期过期，这个秘密信息就不再存储。

**租赁和更新**：Vault给出的秘密信息带有租期，一旦租用期过期，它便立刻收回秘密信息，如果应用仍需要该秘密信息，则可以通过API更新租用期。

**撤销**：在租用期到期之前，Vault可以撤销一个秘密信息或者一个秘密信息树。

### 安装Vault ###

有两种方式来安装使用Vault。

**1. 预编译的Vault二进制** 能用于所有的Linux发行版，下载地址如下，下载之后，解压并将它放在系统PATH路径下，以方便调用。

- [下载预编译的二进制 Vault  (32-bit)][1]
- [下载预编译的二进制 Vault  (64-bit)][2]
- [下载预编译的二进制 Vault  (ARM)][3]

![wget binary](http://blog.linoxide.com/wp-content/uploads/2015/04/wget-binary.png)

*下载相应的预编译的Vault二进制版本。*

![vault](http://blog.linoxide.com/wp-content/uploads/2015/04/unzip.png)

*解压下载到本地的二进制版本。*

祝贺你！您现在可以使用Vault了。

![](http://blog.linoxide.com/wp-content/uploads/2015/04/vault.png)

**2. 从源代码编译**是另一种在系统中安装Vault的方式。在安装Vault之前需要安装GO和GIT。

在 **Redhat系统中安装GO** 使用下面的指令：

    sudo yum install go

在 **Debin系统中安装GO** 使用下面的指令：

    sudo apt-get install golang

或者

    sudo add-apt-repository ppa:gophers/go

    sudo apt-get update

    sudo apt-get install golang-stable

在 **Redhat系统中安装GIT** 使用下面的命令：

    sudo yum install git

在 **Debian系统中安装GIT** 使用下面的命令：

    sudo apt-get install git

一旦GO和GIT都已被安装好，我们便可以开始从源码编译安装Vault。

> 将下列的Vault仓库拷贝至GOPATH

    https://github.com/hashicorp/vault

> 测试下面的文件是否存在，如果它不存在，那么Vault没有被克隆到合适的路径。

    $GOPATH/src/github.com/hashicorp/vault/main.go

> 执行下面的指令来编译Vault，并将二进制文件放到系统bin目录下。

    make dev

![path](http://blog.linoxide.com/wp-content/uploads/2015/04/installation4.png)

### 一份Vault入门教程 ###

我们已经编制了一份Vault的官方交互式教程，并带有它在SSH上的输出信息。

**概述**

这份教程包括下列步骤：

- 初始化并启封您的Vault
- 在Vault中对您的请求授权
- 读写秘密信息
- 密封您的Vault

#### **初始化您的Vault**

首先，我们需要为您初始化一个Vault的工作实例。在初始化过程中，您可以配置Vault的密封行为。简单起见，现在使用一个启封密钥来初始化Vault，命令如下：

    vault init -key-shares=1 -key-threshold=1

您会注意到Vault在这里输出了几个密钥。不要清除您的终端，这些密钥在后面的步骤中会使用到。

![Initializing SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Initializing-SSH.png)

#### **启封您的Vault**

当一个Vault服务器启动时，它是密封的状态。在这种状态下，Vault被配置为知道物理存储在哪里及如何存取它，但不知道如何对其进行解密。Vault使用加密密钥来加密数据。这个密钥由"主密钥"加密，主密钥不保存。解密主密钥需要入口密钥。在这个例子中，我们使用了一个入口密钥来解密这个主密钥。

    vault unseal <key 1>

![Unsealing SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Unsealing-SSH.png)

####**为您的请求授权**

在执行任何操作之前，连接的客户端必须是被授权的。授权的过程是检验一个人或者机器是否如其所申明的那样具有正确的身份。这个身份用在向Vault发送请求时。为简单起见，我们将使用在步骤2中生成的root令牌，这个信息可以回滚终端屏幕看到。使用一个客户端令牌进行授权：

    vault auth <root token>

![Authorize SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Authorize-SSH.png)

####**读写保密信息**

现在Vault已经被设置妥当，我们可以开始读写默认挂载的秘密后端里面的秘密信息了。写在Vault中的秘密信息首先被加密，然后被写入后端存储中。后端存储机制绝不会看到未加密的信息，并且也没有在Vault之外解密的需要。

    vault write secret/hello value=world

当然，您接下来便可以读这个保密信息了：

    vault read secret/hello

![RW_SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/RW_SSH.png)

####**密封您的Vault**

还有一个用I来密封Vault的API。它将丢掉现在的加密密钥并需要另一个启封过程来恢复它。密封仅需要一个拥有root权限的操作者。这是一种罕见的"打破玻璃过程"的典型部分。

这种方式中，如果检测到一个入侵，Vault数据将会立刻被锁住，以便最小化损失。如果不能访问到主密钥碎片的话，就不能再次获取数据。

    vault seal

![Seal Vault SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Seal-Vault-SSH.png)

这便是入门教程的结尾。

### 总结 ###

Vault是一个非常有用的应用，它提供了一个可靠且安全的存储关键信息的方式。另外，它在存储前加密关键信息、审计日志维护、以租期的方式获取秘密信息，且一旦租用期过期它将立刻收回秘密信息。Vault是平台无关的，并且可以免费下载和安装。要发掘Vault的更多信息，请访问其[官方网站][4]。

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/secure-secret-store-vault/

作者：[Aun Raza][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:https://dl.bintray.com/mitchellh/vault/vault_0.1.0_linux_386.zip
[2]:https://dl.bintray.com/mitchellh/vault/vault_0.1.0_linux_amd64.zip
[3]:https://dl.bintray.com/mitchellh/vault/vault_0.1.0_linux_arm.zip
[4]:https://vaultproject.io/
