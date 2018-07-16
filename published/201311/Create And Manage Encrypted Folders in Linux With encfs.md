Linux系统上用encfs创建和管理加密文件夹
================================================================================

如果你想使你计算机上的某些信息免于被窥视的话，可以看看这篇文字。保护信息的一种方法就是加密你的home目录，但是一旦你登录系统后，你的home目录下的信息将暴露于外。过去，我已经写过关于怎样[在你的系统上使用Cryptkeeper来创建加密的文件夹][1]。Cryptkeeper是一个图形前端，后端是 **encfs**。encfs允许你创建一个加密的文件夹，然后通过[FUSE][2]来挂载作为用户文件系统。在这篇教程里，我会教你怎么在Linux系统上的命令行下面使用encfs工具来创建和管理一个加密的文件夹。

![](http://tuxtweaks.com/wp-content/uploads/2013/10/encfs.png)

### 安装encfs ###

如果你使用的是Ubuntu或者它的衍生版本中的一种如Linux Mint的话，在软件源库当中应该能找到encfs。这种情况，可以用下面的命令来安装

    sudo apt-get install encfs

### 用encfs创建加密文件夹 ###

一旦在系统中安装好了encfs后，你就能在你的home目录下创建一个加密的文件夹。在这个示例当中，我将会创建一个叫做tuxtweaks的加密文件夹，这通过终端窗口就可以完成。当创建一个新的文件夹的时候，你需要指定全路径名，当然也可以使用如下所示的标准快捷方式。

    encfs ~/.tuxtweaks ~/tuxtweaks

这会创建两个文件夹。第一个.**tuxtweaks**,它包含被加密的信息；第二个tuxtweaks，当你想要访问信息的时候，解密的版本信息将会挂载到下面。如果这些文件夹都不存在，系统将会提示询问是否创建它们。在提示下面键入‘**y**’以允许创建文件夹，然后你应该能看到如下所示的一些信息：

    Creating new encrypted volume.
    Please choose from one of the following options:
     enter "x" for expert configuration mode,
     enter "p" for pre-configured paranoia mode,
     anything else, or an empty line will select standard mode.

如果你想要最高级别的加密文件夹的话，在提示符下输入**p**选项。否则只需敲击**[Enter]键**，就会以标准选项来创建新的加密文件夹。

之后，你将会看到新加密卷的参数列表及一些警告信息，随之提示符会让输入一个密码。确保不要忘记使用的密码，因为没有密码找回机制。在输入密码并以第二次输入校验通过后，新的文件夹会被创建成功，并自动挂载进文件系统，可以开始使用了。

### 使用加密文件夹 ###

一旦新加密文件夹被挂载上，它就跟你系统上的其它文件夹一样的使用，但如果你把它设置为paranoia模式的话，使用它的硬链接会出现不可用的异常。我想，这对大多数用户来说并不是问题。让我们继续吧，在新文件夹里创建一个简单的文本文件，然后用它来做测试。

    echo "GNU/Linux is my favorite computer operating system." >~/tuxtweaks/test.txt

在终端下或在文件系统管理器下，你都能看到在**tuxtweaks**目录里已经有一个叫做**test.txt**的新文件。打开此文件可看到这里一个完全可读的文本文件。现在切换到**~/.tuxtweaks**目录下，这是你文件夹的加密版本，可以看到这里的文件名不一样了，如里你查看此文件的内容话，会发现是乱糟糟的。

### 卸载encfs创建的加密文件夹 ###

一旦你完成文件访问或者数据创建等操作，最好把加密文件夹卸载，以便里面的信息安全的隐藏掉。encfs自身不带有卸载的命令，一旦用它创建了用户文件系统，就可以利用FUSE来处理卸载任务。下面我们会使用fusermount命令来卸载我们的加密文件夹。

    fusermount -u ~/tuxtweaks

切换到home目录下，会看到tuxtweaks目录仍然存在，但进入文件夹，你会发现里面是空的。（译注：因为tuxtweaks目录只是一个挂载点，真实的数据是以加密的方式存储在.tuxtweaks目录下的，）

### 挂载用encfs创建的加密文件夹 ###

下一次你想要访问加密数据的话，你需要重新加载并解密它，仅仅只需要使用跟我们在第一步创建此文件夹相同的命令就可以。

    encfs ~/.tuxtweaks ~/tuxtweaks

### 用途 ###
	
我发现使用**encfs**加密文件夹来安全地存储财务信息非常便捷，比如纳税申报表以及用于存储日志列表凭据。这样我只需要记住我加密文件夹的密码，然后就可以进入访问记录有其他登录ID和密码的名单文件。

你会使用encfs来做什么呢？在评论中给我们分享吧。

--------------------------------------------------------------------------------

via: http://tuxtweaks.com/2013/10/encrypted-folders-linux-encfs/

译者：[runningwater](https://github.com/runningwater) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://tuxtweaks.com/2009/03/create-an-encrypted-folder-in-ubuntu-with-cryptkeeper/
[2]:http://fuse.sourceforge.net/