在Linux上使用eCryptFS加密文件和目录
================================================================================
作为罪犯，你需要为自己的身份保密；而作为中情局成员，你同样也需要为自己的身份保密。但是，你却不是他们其中的任何一员，你只是不想其他人查探到你的金融数据、家庭照片、尚未出版的手稿，或者记录着你能发家致富的最初想法的私密笔记。

我时常听到有人告诉我“我只是个微不足道的人，没人会查探我”或者“我没有什么东西要隐藏的。”好吧，告诉你我的想法，即便我没有什么要隐藏的，或者我也可以公开我带着狗的孩子的照片，那我也有权利不这么去做，也有权利来保护我的隐私。

### 加密类型 ###

我们主要有两种加密文件和目录的方法。一种是文件系统级别的加密，在这种加密中，你可以选择性地加密某些文件或者目录（如，/home/alice）。对我而言，这是个十分不错的方法，你不需要为了启用或者测试加密而把所有一切重新安装一遍。然而，文件系统级别的加密也有一些缺点。例如，许多现代应用程序会缓存（部分）文件你硬盘中未加密的部分中，比如交换分区、/tmp和/var文件夹，而这会导致隐私泄漏。

另外一种方式，就是所谓的全盘加密，这意味着整个磁盘都会被加密（可能除了主引导记录外）。全盘加密工作在物理磁盘级别，写入到磁盘的每个比特都会被加密，而从磁盘中读取的任何东西都会在运行中解密。这会阻止任何潜在的对未加密数据的未经授权的访问，并且确保整个文件系统中的所有东西都被加密，包括交换分区或任何临时缓存数据。

### 可用的加密工具 ###

在Linux中要实施加密，有几个可供选择的工具。在本教程中，我打算介绍其中一个：**eCryptFS**，一个用户空间文件系统加密工具。下面提供了一个Linux上可用的加密工具摘要供您参考。

#### 文件系统级别加密 ####

- [EncFS][1]：尝试加密的最简单方式之一。EncFS工作在基于FUSE的伪文件系统上，所以你只需要创建一个加密文件夹并将它挂载到某个文件夹就可以工作了。
- [eCryptFS][2]：一个POSIX兼容的加密文件系统，eCryptFS工作方式和EncFS相同，所以你必须挂载它。

#### 磁盘级别加密 ####

- [Loop-AES][3]：最古老的磁盘加密方法。它真的很快，并且适用于旧系统（如，2.0内核分支）。
- [DMCrypt][4]：最常见的磁盘加密方案，支持现代Linux内核。
- [CipherShed][5]：已停止的TrueCrypt磁盘加密程序的一个开源分支。

### eCryptFS基础 ###

eCrypFS是一个基于FUSE的用户空间加密文件系统，在Linux内核2.6.19及更高版本中可用（作为encryptfs模块）。eCryptFS加密的伪文件系统是挂载到当前文件系统顶部的。它可以很好地工作在EXT文件系统家族和其它文件系统如JFS、XFS、ReiserFS、Btrfs，甚至是NFS/CIFS共享文件系统上。Ubuntu使用eCryptFS作为加密其家目录的默认方法，ChromeOS也是。在eCryptFS底层，默认使用的是AES算法，但是它也支持其它算法，如blowfish、des3、cast5、cast6。如果你是通过手工创建eCryptFS设置，你可以选择其中一种算法。

就像我所的，Ubuntu让我们在安装过程中选择是否加密/home目录。好吧，这是使用eCryptFS的最简单的一种方法。

![](https://farm6.staticflickr.com/5600/15639040345_8d74cd54a8_z.jpg)

Ubuntu提供了一个用户友好的工具集，通过eCryptFS可以让我们的生活更轻松，但是在Ubuntu安装过程中启用eCryptFS只创建了一个指定的预配置的设置。所以，如果默认的设置不适合你的需求，你需要进行手工设置。在本教程中，我将介绍**如何在主流Linux发行版上手工设置eCryptFS**。

### eCryptFS的安装 ###

Debian，Ubuntu或其衍生版：

    $ sudo apt-get install ecryptfs-utils 

注意，如果你在Ubuntu安装过程中选择加密家目录，eCryptFS应该已经安装了。

CentOS, RHEL or Fedora：

    # yum install ecryptfs-utils

Arch Linux：

    $ sudo pacman -S ecryptfs-utils

在安装完包后，加载eCryptFS内核模块当然会是一个很好的实践：

    $ sudo modprobe ecryptfs

### 配置eCryptFS ###

现在，让我们开始加密一些目录，运行eCryptFS配置工具：

    $ ecryptfs-setup-private 

![](https://farm6.staticflickr.com/5608/15453440890_3b4be6d5a7_z.jpg)

它会要求你输入登录密码和挂载密码。登录密码和你常规登录的密码一样，而挂载密码用于派生一个文件加密主密钥。这里留空可以生成一个（复杂的），这样会更安全。登出然后重新登录。

你会注意到，eCryptFS默认在你的家目录中创建了两个目录：Private和.Private。~/.Private目录包含有加密的数据，而你可以在~/Private目录中访问到相应的解密后的数据。在你登录时，~/.Private目录会自动解密并映射到~/Private目录，因此你可以访问它。当你登出时，~/Private目录会自动卸载，而~/Private目录中的内容会加密回到~/.Private目录。

eCryptFS怎么会知道你拥有~/.Private目录，并自动将其解密到~/Private目录而不需要我们输入密码呢？这就是eCryptFS的PAM模块捣的鬼，它为我们提供了这项便利服务。

如果你不想让~/Private目录在登录时自动挂载，只需要在运行ecryptfs-setup-private工具时添加“--noautomount”选项。同样，如果你不想要~/Private目录在登出后自动卸载，也可以自动“--noautoumount”选项。但是，那样后，你需要自己手工挂载或卸载~/Private目录：

    $ ecryptfs-mount-private ~/.Private ~/Private
    $ ecryptfs-umount-private ~/Private

你可以来验证一下.Private文件夹是否被挂载，运行：

    $ mount 

![](https://farm6.staticflickr.com/5610/15452374739_2ffb73cf05_z.jpg)

现在，我们可以开始把任何敏感文件放进~/Private文件夹里头了，它们会在我们登出时自动被加密并锁在~/.Private文件内。

所有这一切看起来是那么得神奇。这主要是ecryptfs-setup-private工具让一切设置变得简单。如果你想要深究一点，对eCryptFS指定的方面进行设置，那么请转到[官方文档][6]。

### 结尾 ###

综上所述，如果你十分关注你的隐私，最好是将基于eCryptFS文件系统级别的加密和全盘加密相结合。切记，只进行文件加密并不能保证你的隐私不受侵犯。

------------------------------------------------------------------------------

via: http://xmodulo.com/encrypt-files-directories-ecryptfs-linux.html

作者：[Christopher Valerio][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/valerio
[1]:http://www.arg0.net/encfs
[2]:http://ecryptfs.org/
[3]:http://sourceforge.net/projects/loop-aes/
[4]:https://code.google.com/p/cryptsetup/wiki/DMCrypt
[5]:https://ciphershed.org/
[6]:http://ecryptfs.org/documentation.html
