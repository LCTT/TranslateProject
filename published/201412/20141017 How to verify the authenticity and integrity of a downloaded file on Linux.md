使用 GnuPG 加密签名来验证下载文件的可靠性和完整性
================================================================================
当你从网上下载一个文件后（比如：安装程序、ISO镜像或者一个压缩包），文件可能在不同的情况下发生了损坏，比如：由于线路传输错误、中断的下载、存储硬件错误、文件系统错误等等。除了这些错误，文件还可能在下载前或者下载中的攻击而被有意地篡改了。比如，一个攻破证书颁发机构的攻击者可以实施一个MITM攻击（中间人攻击），欺骗你从HTTPS网站上下载隐藏恶意软件的文件。

要保护你自己免受这些问题的困扰，建议你去验证从网上下载的文件的可靠性和完整性。特别是你下载了一个非常敏感的文件的时候）（比如：操作系统镜像、二进制应用程序、可执行安装包等等），盲目地相信下载的文件不是一个好习惯。

一个快速和简单地验证下载文件的完整性的方法是使用不同的校验工具（比如：md5sum、sha356sum、cksum）来计算和比较校验码（比如：MD5、SHA、CRC）。然而，然而校验容易受到[碰撞攻击][1]，而且同样不能用于验证文件的可靠性（比如：拥有者）。


如果你想要同时验证下载文件的可靠性（拥有者）和完整性（内容），你需要依赖于加密签名。本教程中，我会描述如何使用GnuPG（GNU Privacy Guard）来检查文件的可靠性和完整性。

本例中我会验证一个从 https://onionshare.org 上下载的磁盘镜像。这个网站中，发行商会提供他们的公钥，还有它用于密钥验证的指纹。

![](https://farm4.staticflickr.com/3933/15360287249_1bc4380a67_z.jpg)

至于下载的文件，发行商也会提供它相关的PGP签名。

![](https://farm6.staticflickr.com/5597/15360894527_e12bedce63_z.jpg)

### 安装 GnuPG 并且生成一个键对 ###

让我们首先在你的Linux系统上安装GnuPG。

在Debian、Ubuntu和其他Debian衍生版上：

    $ sudo apt-get install gnupg 

在Fedora、CentOS或者RHEL上:

    $ sudo yum install gnupg

完成安装后，生成一个本篇中会使用到的键对。

    $ gpg --gen-key 

![](https://farm6.staticflickr.com/5612/15360848908_ae171c485e_z.jpg)

在生成键对期间，你会被要求提供你的姓名和email，还有保护你私钥的密码。你同样也可以选择键对何时过期（默认不会过期）。依赖于你选择的key的大小（在1024和4096位之间），key生成会花上几分钟或者更多，同时它要求收集来自你桌面活动的大量的随机数据。（比如键盘输入、鼠标移动、磁盘访问等等，所以这个时候随便动动鼠标键盘什么的）。

一旦key生成完毕后，公钥和私钥会存储在~/.gnupg目录。

![](https://farm4.staticflickr.com/3942/15544226021_a9fbde1e9c_z.jpg)

### 与某个文件和拥有者建立信任 ###

验证下载文件的第一步是与任何提供文件下载的人建立信任。出于此，我们下载了这个文件的公钥，并且验证公钥的拥有者是否是他或者她自称的。

在下载完文件拥有者的公钥后：

    $ wget https://onionshare.org/signing-key.asc 

使用gpg命令导入公钥到你的keyring中

    $ gpg --import signing-key.asc 

![](https://farm6.staticflickr.com/5613/15360894397_48fec1ef05_z.jpg)

一旦拥有者的公钥导入后，他会像下面那样打印出一个key ID（比如："EBA34B1C"）。记住这个key ID。

现在，运行下面的命令检查导入的公钥的指纹：

    $ gpg --fingerprint EBA34B1C 

![](https://farm6.staticflickr.com/5614/15360894427_feb4df8894_z.jpg)

你会看到key的指纹字符串。把这个和网站上显示的指纹做对比。如果匹配，你可以选择信任这个文件拥有者的公钥。

一旦你决定相信这个公钥，你可以通过编辑key来设置信任级别：

    $ gpg --edit-key EBA34B1C

这个命令会显示GPG提示符：

![](https://farm4.staticflickr.com/3945/14926729683_ec6d98fcbc_z.jpg)

在GPG提示符中输入“trust”，它会让你从1-5之间选择这个key的信任等级。

![](https://farm6.staticflickr.com/5613/15547746702_bee019accc_z.jpg)

本例中，我决定分配给它“4”，在这之后，输入“sign”用你自己的私钥签名，接着输入在GPG提示符中输入“save”来完成操作。

![](https://farm6.staticflickr.com/5608/15544225981_f2254e406e_z.jpg)

要注意的是不需要这样明确地给一个公钥指派信任，通过key的导入隐式地信任往往就够了。

给一个key隐式地分配给“完全”的信任就是任何其他由这个完全信任签名的key X都会被认为是对你有效的。通常上，key验证依赖于一个称之为“[信任网][2]”的复杂机制。

回到教程，现在让我们检查导入的key列表。

     $ gpg --list-keys 

![](https://farm6.staticflickr.com/5616/14926159344_b77946ddc9_z.jpg)

你至少会看到两个key：一个带 depth 0和终极信任（"1u"），这就是你自己的key，另外一个带depth 1和完全信任("1f")，这是你之前签名的key。

### 验证文件的可靠性/完整性 ###

一旦你建立了与文件拥有者和他的/她的公钥之间的信任关系，我们需要验证你从拥有者那边下载的文件的可靠性和完整性了。

本例中，文件拥有者分别公布了一个文件和它相关的PGP签名（.asc）。签名所起的作用就是认证（文件）并且在其中加入一个时间戳。

一个典型的签名（*.asc）看上去像这样。

    -----BEGIN PGP SIGNATURE-----
    
    iQIcBAABCgAGBQJUJGhsAAoJEP1yCtnro0sc1jUP/ixNY/lKdrcMIAUoqlWKNE8f
    sj4SFiwREMew76w66GASDF03fa5zPX6EsS2kucgx8ZsfEiSmN5T0y2P/aSaXwZqF
    kywZVEzirKtca5AJ4DBzu6qrt9GgSw6JBJVv1oBJCMNyO+eAj341paR3MudvnyQz
    H/N5tc4Qcilzy6M184opGIzy4ipEmMXfLHsd7WJpAyn+tO/z3uhh9NkNuygZpaFr
    olpSWPE8revdDJyfMfSmb3ZrFmhLn7FCEltOi+a7SluvrMclizfnbec9rgLJtjo0
    CPDZY7tsWmmL0DA3VvpMVqGvkg/Dyhpn2IIDrNaLAlvGQ5aovf+4tjad5IHvyaWx
    4Gds93G6Hqvv5RwGx7OR3hgt2o0Y+qFsVDxVnPxerGhXeJXHzSDwLQMpdj9IoSU
    Ae/53XXnxqSN6POZcwHiHvbsv0pdlg0Ea0dDAAN0ZeINNyZf1R0tLjWkcgpvGCtv
    qkJuYFF9W9cWHraPY2ov5Hs/JZzPcG0eVpnDdzfOOH1gDKADq9A5D2X5QJCulsh9
    WwU3X+E43OqIsoRzBucItD9HhZbEH7t8Q0xAqnAkgU3hriZp3dN4cnMfhM6I9hli
    EmpSpLKCceMexu2o9QgzGXVm+AGZJe4QkuwAhRIccp5JDMVny61UlKTasjy6co8h
    5GBhhYybPEFM+G1BODMd
    =c9wo
    -----END PGP SIGNATURE-----

现在让我们同时下载它的文件和签名：

    $ wget https://onionshare.org/files/0.6/OnionShare.dmg
    $ wget https://onionshare.org/files/0.6/OnionShare.dmg.asc

现在验证下载文件的PGP签名。

    $ gpg --verify OnionShare.dmg.asc OnionShare.dmg 

![](https://farm4.staticflickr.com/3940/15361265960_c64f19707d_z.jpg)

如果命令的输出包含了“Good signature from <文件所属者>”，那么下载的.dmg文件就被成功地认证和核实了。如果下载的文件的任何地方在签名后被篡改了，那么验证就会失败。

这时你就可以放心地信任你下载的文件了。

--------------------------------------------------------------------------------

via: http://xmodulo.com/verify-authenticity-integrity-downloaded-file.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://en.wikipedia.org/wiki/Collision_attack
[2]:https://www.gnupg.org/gph/en/manual/x334.html