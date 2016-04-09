使用一次性密码本通过 SSH 安全登录 Linux
================================================================================
有人说，安全不是一个产品，而是一个过程（LCTT 注：安全公司 McAfee 认为，安全风险管理是一个方法论，而不是安全产品的堆叠）。虽然 SSH 协议被设计成使用加密技术来确保安全，但如果使用不当，别人还是能够破坏你的系统：比如弱密码、密钥泄露、使用过时的 SSH 客户端等，都能引发安全问题。

在考虑 SSH 认证方案时，大家普遍认为[公钥认证][1]比密码认证更安全。然而，公钥认证技术并不是为公共环境设置的，如果你在一台公用电脑上使用公钥认证登录 SSH 服务器，你的服务器已经毫无安全可言了，公用的电脑可能会记录你的公钥，或从你的内存中读取公钥。如果你不信任本地电脑，那你最好还是使用其他方式登录服务器。现在就是“一次性密码（OTP）”派上用场的时候了，就像名字所示，一次性密码只能被使用一次。这种一次性密码非常合适在不安全的环境下发挥作用，就算它被窃取，也无法再次使用。

有个生成一次性密码的方法是通过[谷歌认证器][2]，但在本文中，我要介绍的是另一种 SSH 登录方案：[OTPW][3]，它是个一次性密码登录的软件包。不像谷歌认证，OTPW 不需要依赖任何第三方库。

### OTPW 是什么 ###

OTPW 由一次性密码生成器和 PAM 认证规则组成。在 OTPW 中一次性密码由生成器事先生成，然后由用户以某种安全的方式获得（比如打印到纸上）。另一方面，这些密码会通过 Hash 加密保存在 SSH 服务器端。当用户使用一次性密码登录系统时，OTPW 的 PAM 模块认证这些密码，并且保证它们不能再次使用。

### 步骤1：OTPW 的安装和配置 ###

#### 在 Debian, Ubuntu 或 Linux Mint 发行版上 ####

使用 apt-get 安装：

    $ sudo apt-get install libpam-otpw otpw-bin

打开针对 SSH 服务的 PAM 配置文件（/etc/pam.d/sshd），注释掉下面这行（目的是禁用 PAM 的密码认证功能）：

    #@include common-auth

添加下面两行（用于打开一次性密码认证功能）：

    auth       required     pam_otpw.so
    session    optional     pam_otpw.so

![](https://farm8.staticflickr.com/7599/16775121360_d1f93feefa_b.jpg)

#### 在 Fedora 或 CentOS/RHEL 发行版上 ####

在基于 RedHat 的发行版中没有编译好的 OTPW，所以我们需要使用源代码来安装它。

首先，安装编译环境：

    $ sudo yum git gcc pam-devel
    $ git clone https://www.cl.cam.ac.uk/~mgk25/git/otpw
    $ cd otpw

打开 Makefile 文件，编辑以“PAMLIB=”开头的那行配置：

64 位系统：

    PAMLIB=/usr/lib64/security

32 位系统：

    PAMLIB=/usr/lib/security

编译安装。需要注意的是安装过程会自动重启 SSH 服务一下，所以如果你是使用 SSH 连接到服务器，做好被断开连接的准备吧（LCTT 译注：也许不会被断开连接，即便被断开连接，请使用原来的方式重新连接即可，现在还没有换成一次性口令方式。）。

    $ make
    $ sudo make install

现在你需要更新 SELinux 策略，因为 /usr/sbin/sshd 会往你的 home 目录写数据，而 SELinux 默认是不允许这么做的。如果没有使用 SELinux 服务（LCTT 注：使用 getenforce 命令查看结果，如果是 enforcing，就是打开了 SELinux 服务），请跳过这一步。

    $ sudo grep sshd /var/log/audit/audit.log | audit2allow -M mypol
    $ sudo semodule -i mypol.pp

接下来打开 PAM 配置文件（/etc/pam.d/sshd），注释下面这行（为了禁用密码认证）：

    #auth       substack     password-auth

添加下面两行（用于打开一次性密码认证功能）：

    auth       required     pam_otpw.so
    session    optional     pam_otpw.so

#### 步骤2：配置 SSH 服务器，使用一次性密码 ####

打开 /etc/ssh/sshd_config 文件，设置下面三个参数。你要确保下面的参数不会重复存在，否则 SSH 服务器可能会出现异常。

    UsePrivilegeSeparation yes
    ChallengeResponseAuthentication yes
    UsePAM yes

你还需要禁用默认的密码认证功能。另外可以选择开启公钥认证功能，那样的话你就可以在没有一次性密码的时候使用公钥进行认证。

    PubkeyAuthentication yes
    PasswordAuthentication no

重启 SSH 服务器。

Debian, Ubuntu 或 Linux Mint 发行版：

    $ sudo service ssh restart

Fedora 或 CentOS/RHEL 7 发行版：

    $ sudo systemctl restart sshd
    
（LCTT 译注：虽然这里重启了 sshd 服务，但是你当前的 ssh 连接应该不受影响，只是在你完成下述步骤之前，无法按照原有方式建立新的连接了。因此，保险起见，要么多开一个 ssh 连接，避免误退出当前连接；要么将重启 sshd 服务器步骤放到步骤3完成之后。）

#### 步骤3：使用 OTPW 产生一次性密码 ####

之前提到过，你需要事先创建一次性密码，并保存起来。使用 otpw-gen 命令创建密码：

    $ cd ~
    $ otpw-gen > temporary_password.txt

![](https://farm9.staticflickr.com/8751/16961258882_c49cfe03fb_b.jpg)

这个命令会让你输入密码前缀，当你以后登录的时候，你需要同时输入这个前缀以及一次性密码。密码前缀是另外一层保护，就算你的一次性密码表被泄漏，别人也无法通过暴力破解你的 SSH 密码。

设置好密码前缀后，这个命令会产生 280 个一次性密码（LCTT 译注：保存到 ~/.otpw 下），并将它们导出到一个文本文件中（如 temporary_password.txt）。每个密码（默认是 8 个字符）由一个 3 位十进制数索引。你需要将这个密码表打印出来，并随身携带。

![](https://farm8.staticflickr.com/7281/16962594055_c2696d5ae1_b.jpg)

查看 ./.otpw 文件，它存放了一次性密码的 HASH 值。头 3 位十进制数与你随身携带的密码表的索引一一对应，在你登录 SSH 服务器的时候会被用到。

    $ more ~/.otpw

----------

    OTPW1
    280 3 12 8
    191ai+:ENwmMqwn
    218tYRZc%PIY27a
    241ve8ns%NsHFmf
    055W4/YCauQJkr:
    102ZnJ4VWLFrk5N
    2273Xww55hteJ8Y
    1509d4b5=A64jBT
    168FWBXY%ztm9j%
    000rWUSdBYr%8UE
    037NvyryzcI+YRX
    122rEwA3GXvOk=z

### 测试一次性密码登录 SSH 服务器 ###

使用普通的方式登录 SSH 服务器：

    $ ssh user@remote_host

如果 OTPW 成功运行，你会看到一点与平时登录不同的地方：

    Password 191:

现在打开你的密码表，找到索引号为 191 的密码。

    023 kBvp tq/G  079 jKEw /HRM  135 oW/c /UeB  191 fOO+ PeiD  247 vAnZ EgUt

从上表可知，191 号密码是“fOO+PeiD”。你需要加上密码前缀，比如你设置的前缀是“000”，则你实际需要输入的密码是“000fOO+PeiD”。

成功登录后，你这次输入的密码自动失效。查看 ~/.otpw　文件，你会发现第一行变成“---------------”，这表示 191 号密码失效了。

    OTPW1
    280 3 12 8
    ---------------
    218tYRZc%PIY27a
    241ve8ns%NsHFmf
    055W4/YCauQJkr:
    102ZnJ4VWLFrk5N
    2273Xww55hteJ8Y
    1509d4b5=A64jBT
    168FWBXY%ztm9j%
    000rWUSdBYr%8UE
    037NvyryzcI+YRX
    122rEwA3GXvOk=z

### 总结 ###

在这个教程中，我介绍了如何使用 OTPW 工具来设置一次性登录密码。你也许意识到了在这种双因子的认证方式中，打印一张密码表让人感觉好 low，但是这种方式是最简单的，并且不用依赖任何第三方软件。无论你用哪种方式创建一次性密码，在你需要在一个不可信任的环境登录 SSH 服务器的时候，它们都很有用。你可以就这个主题来分享你的经验和观点。

--------------------------------------------------------------------------------

via: http://xmodulo.com/secure-ssh-login-one-time-passwords-linux.html

作者：[Dan Nanni][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://linux.cn/article-5444-1.html
[2]:https://linux.cn/article-2642-1.html
[3]:http://www.cl.cam.ac.uk/~mgk25/otpw.html
