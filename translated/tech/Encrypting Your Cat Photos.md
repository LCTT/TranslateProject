给猫咪照片加密
================================================================================
事实上，我的硬盘上不存在那种不愿意被别人看到的东西，只存有一些猫咪的照片、一些记录着想写的书想法的文本文件或者是一些短篇故事的文本，也有一些写了一半的 NaNoWriMo 小说文件。简单的说，我的硬盘就没有加密的必要，因为没有什么可隐藏的。可问题是，我们错误的把“隐私的渴望”跟“要隐藏某东西”两概念混淆在一起。比如说我生活的美国，我们视隐私权利是理所当然的事，但不包括那些传统所认为的“某人隐藏色情或炸弹”。隐私考虑的是一些平常的事情。

我居住在密歇根州。这儿的冬天很冷，我趋向于把温度设置在 75 度左右。对您们来说这个温度可能高了，但在我的家里刚好合适。多亏我的家是属于私有的，我的邻居不可能知道我们保持了这么高的温度，否则一但他们看到冬天如此“浪费”能源的家庭，这些邻居心里会很不平衡的。事实上，本地条规中有一条明确指出任何超过 60 度的就算是生态浪费。我并不想与这种僵老的条例较真，所以我仅仅想保守我们舒适的房子的秘密。我们并不想隐藏任何事情，但也并不是任何事情都要让外人知道。

很明显，我举的例子有点弱智，但我希望的是这能引起大家的思考。现代的 Linux 系统很容易的就可以对我们的数据进行加密，并且很可靠，所以为什么不好好利用利用呢？

### 加密原理? ###

我不会涉及太多关于加密原理的细节，但要明白最基本的原理，即使是最简单的实现，这是必须的。要加密和解密一个文件，需要两把“钥匙”。一把是私钥，正如名字所示，属于私有的。我宁愿把私钥看作是真实的钥匙-你想要多少就可造出多少，但这样做是不明智的。同样的私钥你造的越多，某些不怀好意的人得到其中一把的机率就越大，他们就会闯入你的公寓（额，我的意思的文件）。

公钥更像是锁的样子，只有你能打开（用你的私钥）此锁。这公钥任何人都可以得到，你可以将它张贴在网站上、把它放在你的 E-mail 中、甚至纹在你的背上。其它人想创建一个只有你能访问的文件，就可以使用此公钥来加密。

这种一对多的情况也有个很酷的副作用。如果你用你的私钥来加密一些东西，任何人都可以用你提供的公钥来解密它们。这听起来很傻，但这种情景很有用。虽然加密的文件不能免于被窥视，但是它能保证此文件确实来自于你而没有被恶意改动过。用你的公钥能解密的文件仅仅只能是用你私钥加密过的。用这种方式，用私钥加密的文件即是数字“签名”文件。

#### 通用加密步骤: ####

1. 你有一个文件想要发送给苏茜 ，所以你得使用苏茜的公钥来加密，这样就只有 苏茜才能打开这个文件，但苏茜没有办法知道是谁给她发送的文件。因为任何一个人都可以用她的公钥来加密文件。
2. 因此，你得把你的文件用苏茜的公钥和你的私钥都加密。苏茜将不得不解密两次，但她知道它是来自于你的文件。
3. 苏茜接收到此文件后会用能证明来自于你的公钥来解密第一层。 
4. 然后用她的私钥来解密第二层的密码，这是唯一的能够将原始文件进行解密的钥匙了（因为你是用她的公钥来加密的）。

当然，这情景就是用来安全传输文件的加密手段。这也是加密你的文件（或者分区）相当常用及简单的方法。就让我们开始来对文件进行加密吧，因为大多数人都想加密他们的系统。

### 始于简 ###

在深入更复杂的各种加密设置操作前，我们先做简单的对文件加密例子。能处理加密的应用程序有很多很多，事实上，对文件和系统进行加密的各种可用软件选择，很容易就会让我们变得焦头烂额。现在，我们就使用一款很基本的（但非常强大）命令行工具来对文件加密。 GPG （英文名：Gnu Privacy Guard）是一款对商业软件 PGP（英文名：Pretty Good Protection）的开源实现软件。它具有加密、签名及管理多个密钥等功能。用例子说明，让我们简单的加密一个文件吧。

我们假设你有一个名叫 secret_manifesto.txt 的文件，它包含有关于生命、宇宙及一切事物的秘密。使用 GPG，你只需要一个密码就可以加密此文件。使用密码远比使用公钥和私钥对简单，因为它只是用你的密码加密。虽然这很容易就让你的文件遭受到破解（使用彩虹表或其他黑客工具），但像锡上的标签上所说的：这是相当不错的保护。要加密你的文件，可以这样做：

    # gpg -c secret_manifesto.txt
    # Enter passphrase:
    # Repeat passphrase:

一但完成，在相同的目录下就会多出个新的文件，它默认的名字是 secret_manifesto.txt.gpg 。这是一个二进制文件，这意味着它非常非常小，但是要拷贝/粘贴进电子邮件（e-mail）或 即时消息（IM） 就不可能了。要使其可拷贝等操作，可以添加 -a 标志，这将创建一个只包含 ASCII 码文本的加密文件：

    # gpg -a -c secret_manifesto.txt
    # Enter passphrase:
    # Repeat passphrase:
    # ls -l
    -rw-rw-r--  1 spowers spowers    6 Nov 23 1:26 secret_manifesto.txt
    -rw-rw-r--  1 spowers spowers  174 Nov 23 1:27 secret_manifesto.txt.asc
    -rw-rw-r--  1 spowers spowers   55 Nov 23 1:26 secret_manifesto.txt.gpg

注意到现在多了一个以 .asc 为扩展名的文件。它是个纯文本文件，从上面的代码段示例可以看到它比二进制的加密文件还大，当然比原文本文件就大的更多了。一但你把文件加密了，也确实想要对些信息保密，最明智的就是把原文本文件删除掉。

要解密文件，你需要再一次使用 GPG 程序。不管是二进制的还是 ASCII 文件，使用相同的命令就可以解密。如下示：

    # gpg secret_manifesto.txt.asc
    # gpg: CAST5 encrypted data
    # Enter passphrase:
    # gpg: encrypted with 1 passphrase
    # File `secret_manifesto.txt' exists. Overwrite? (y/N)

注意到上面的例子中，我没有删除源文本文件，所以 GPG 给出了是否覆盖选项提示。一但操作完成，我的未加密的源文件又回来了。如果你仅仅只有一两个文件要保护，那基于命令行的 GPG 程序正是你所需的。但如果你想实现在系统上指定一个区域，任何保存到这区域的的文件都会自动加密的话，就有点复杂了。可这也并不是非常的困难，让我们用一个非常简单的示范例子来讲解吧。

### 加密 USB 驱动盘 ###

如我前面提到的，要加密有很多可选的方式方法。加密磁盘分区最通用的一种方法是 LUKS（Linux Unified Key Setup） 系统。一个使用 LUKS 格式化分区的 USB 驱动盘可以被大多数系统自动被别到。实际上，如果你使用的是像 Ubuntu 桌面这样的桌面环境系统的话，加密 USB 驱动盘其实就是在格式化过程中简单的勾选上一个复选框而已。虽然这是加密 USB 盘最容易让人接受的方式，但我还是想演示如何在命令行下进行加密，因为这种方式可以让你明白在加密的后面具体发生了什么。

#### 步骤 1: 识别您的 USB 驱动盘。 ####

在您插入 USB 驱动盘后，如果输入 `dmesg` 命令，将会显示出所有的系统信息，包括刚插入的 USB 驱动盘的设备名字。 确保设备标识是正确的，因为后面要进行的操作会破坏驱动盘上的所有数据。您也不想一不小心就格式化掉正常的磁盘吧。（虽然不用提醒，但我还是要说，确保您的 USB 驱动盘已经没有你想保留的数据，因为这是一个破坏性的过程。）

#### 步骤 2: 对 USB 驱动盘进行分区。 ####

假设，在您的系统上 USB 驱动盘是 /dev/sdb 这个设备，您需要在这个驱动上创建一个单分区。我们使用 fdisk 命令。下面是 fdisk 必须的交互操作。一般地，用 o 命令来创建一个新的空分区，然后用 w 命令来保存设置。然后重新运行 fdisk 命令，并用 n 命令来创建一个新的主分区，接下来保持默认的以使用整个设备空间：

    # sudo fdisk /dev/sdb

    Command (m for help): o
    Building a new DOS disklabel with disk identifier 0x1234567.
    Changes will remain in memory only, until you decide to write them.
    After that, of course, the previous content won't be recoverable.
    
    Command (m for help): w
    The partition table has been altered!
    
    # sudo fdisk /dev/sdb
    Command (m for help): n
    Command action
    e   extended
    p   primary partition (1-4)
    p
    Partition number (1-4, default 1): 1
    Using default value 1
    First sector (2048-1016522, default 2048):
    Using default value 2048
    Last sector, +sectors or +size{K,M,G} (2048-1016522, default 1016522):
    Using default value 1016522
    
    Command (m for help): w
    The partition table has been altered!

现在你的 USB 驱动盘有了一个单分区了（/dev/sdb1），但还没有文件系统，这正是我们所想要的，因为 LUKS 系统需要在创建文件系统前在您的分区上创建一个加密层。因此，在创建文件系统之前，就让我们在分区上先创建一个 LUKS 层吧，可以使用 cryptsetup 程序。如果您还没有安装 cryptsetup 的话，可以搜索您系统发布版本的仓库源，里有就有。下面就开始创建 LUKS 加密分区层:

    # cryptsetup luksFormat /dev/sdb1

    WARNING!
    ========
    This will overwrite data on /dev/sdb1 irrevocably.
    
    Are you sure? (Type uppercase yes): YES
    Enter LUKS passphrase:
    Verify passphrase: 

按照提示的操作，一定要确保记得您的密码！注意，这儿的“密码单词”不仅仅只表示一个单词。这只是一个习惯，因而得名，设置的越长，越难被破解。

Once the process completes, you have an encrypted partition, but it's not mounted or formatted yet. The first step is to mount the partition, which again uses the cryptsetup utility: 一但上面的操作完成，就创建好了一个加密的分区，但它还没有被挂载或格式化。

    # cryptsetup luksOpen /dev/sdb1 my_crypto_disk
    Enter passphrase for /dev/sdb1:

When you type in your passphrase, the device name you entered will be mounted like a virtual hard drive. Usually, it's mounted under /dev/mapper/devicename, so this example mounts a partition at /dev/mapper/my_crypto_disk.

This device is now being accessed as an unencrypted volume. As long as it stays mounted, it will act like any other unencrypted volume. That means you need to write a filesystem to it if you want to use it: 

    # mkfs.vfat /dev/mapper/my_crypto_disk -n my_crypto_disk
    mkfs.vfat 3.0.9 (31 Jan 2010)

Now the drive is fully functional and can be mounted like any other disk. In fact, when you put the USB drive into your computer, if you have a modern GUI desktop, it should prompt you for a password and mount it automatically. Then you can eject it like a normal disk, and it will be encrypted until you next enter your passphrase. It's simple to unmount and, therefore, re-encrypt the drive on the command line too, using cryptsetup: 

    # cryptsetup luksClose my_crypto_disk

That's Only the Tip of the Iceberg

In this article, my hope is to peel back some of the mystery behind encryption. It's simple to encrypt and decrypt a file. It's not too much more difficult (especially if you use the GUI desktop tools) to encrypt an entire USB drive. With most distributions, it's possible to encrypt the entire home directory during the installation process! When encryption is set up on your entire home directory, however, there are some issues you need to address. For example, jobs that run while you're not logged in most likely will not have access to your home directory. If you have cron jobs that need access to your home directory, you should rewrite them to access data elsewhere on the system. I find a happy medium between security and convenience is to encrypt a USB drive and store my personal data on it.

Once you get the encryption bug, I must warn you, you'll want to start encrypting everything. That's not a bad thing, but like the home directory scenario, you'll run into a few snags. Cross-platform accessibility is a big one if you go between systems. For situations like that, I highly recommend [TrueCrypt][1]. I've mentioned TrueCrypt in UpFront pieces before, but it's basically an open-source, cross-platform encryption system that allows you to encrypt files, folders, partitions and more while being able to access that data on any system. Windows, Mac and Linux clients are all available, and the community has great support.

You don't have to have something to hide in order to desire encryption for your files. Just like it's wise to lock your house at night, even if you live in a good neighborhood, it's a smart move to encrypt your personal data. If you want to share your photos of Mr Whiskerton in his cute little beanie hat with everyone on the Internet, that's your right. But others don't need to see those things if they're being nosey and poking around your hard drive! 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/encrypting-your-cat-photos

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.truecrypt.org/