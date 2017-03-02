在 Linux 下生成高强度密码的四种方法
===============

![在 Linux 下生成一个高强度密码](https://www.ostechnix.com/wp-content/uploads/2016/11/password-720x340.jpg) 

*图片来源： Google.*

前一段时间，我们已经分享了如何在诸如 Debian、Ubuntu、Linux Mint、Elementary OS 的基于 DEB 的系统中[强制用户使用高强度的密码][8] ，比如。那么，你可能会疑惑一个高强度的密码究竟是什么样的呢？怎么才能生成一个那样的密码呢？不用担心，下面我们将介绍 4 种简单方法让你在 Linux 中生成一个高强度密码。当然，已经有很多免费的工具或者方式来完成这个任务，但这里我们仅考虑那些简单直接的方法。下面就让我们开始吧。

### 1. 在 Linux 中使用 OpenSSL 来生成一个高强度密码

OpenSSL 在所有的类 Unix 发行版、Solaris、Mac OS X 和 Windows 中都可以获取到。

要使用 OpenSSL 生成一个随机密码，打开终端并运行下面的命令：

```
openssl rand 14 -base64
```

上面的 `-base64` 参数将确保生成的密码可以被键盘敲出来。

输出样例：

```
wXCHXlxuhrFrFMQLqik=
```

[
 ![sksk_003](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_003.png) 
][6]

上面的命令将生成一个随机的、长度为 14 个字符的高强度密码。我们强烈推荐你生成 14 个字符的密码。
当然你可以使用 OpenSSL 生成任意长度的密码。

要了解更多信息，可以参考联机手册：

```
man openssl
```

### 2. 在 Linux 中使用 Pwgen 来生成一个高强度密码

pwgen 是一个简单却非常有用的命令行工具，用它可以在短时间内生成一个随机且高强度的密码。它设计出的安全密码可以被人们更容易地记住。在大多数的类 Unix 系统中都可以获取到它。

在基于 DEB 的系统中安装 pwgen 请运行：

```
sudo apt-get install pwgen
```

在基于 RPM 的系统中，运行：

```
sudo yum install pwgen
```

在基于 Arch 的系统中，则运行：

```
sudo pacman -S pwgen
```

pwgen 安装完成后，便可以使用下面的命令来生成一个长度为 14 个字符的随机高强度密码：

```
pwgen 14 1
```

输出样例：

```
Choo4aicozai3a
```

[ 
![sksk_004](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_004.png) 
][5]

上面的命令将生成一个 14 位字符长的密码，如果要生成两个不同的 14 位字符长的密码，则可以运行：

```
pwgen 14 2
```

输出样例：

```
xee7seerez6Kau Aeshu0geveeji8
```

如果要生成 100 个（尽管可能没有必要生成那么多）不同的 14 位字符长的密码，则可以运行：

```
pwgen 14
```

输出样例：

```
kaeNg3EiVei4ei Oo0iehiJaix5Ae aenuv2eree2Quo iaT7zahH1eN2Aj Bie2owaiFahsie
gaan9zu5Xeh5ah ahGeeth8ea5ooh Ir0ueda5poogh5 uo0ohqu2ufaiX2 Mei0pee6Og3zae
Oofeiceer8Aipu sheew3aeReidir Dee4Heib2eim2o eig6jar8giPhae Zahde9nae1Niew
quatol5Oi3Bah2 quue4eebaiNgaa oGoahieSh5oL4m aequeeQue2piti laige5seePhugo
iiGo9Uthee4ros WievaiQu2xech6 shaeve0maaK3ae ool8Pai2eighis EPheiRiet1ohci
ZieX9outhoht8N Uh1UoPhah2Thee reaGhohZae5idi oiG4ooshiyi5in keePh1ohshei8y
aim5Eevah2thah Xaej8tha5eisho IeGie1Anaalaev gaoY3ohthooh3x chaebeesahTh8e
soh7oosieY5eiD ahmoh6Ihii6que Shoowoo5dahbah ieW0aiChubee7I Caet6aikai6aex
coo1du2Re9aika Ohnei5Egoh7leV aiyie6Ahdeipho EiV0aeToeth1da iNgaesu4eeyu0S
Eeb1suoV3naera railai2Vaina8u xu3OhVee1reeyu Og0eavae3oohoh audahneihaeK8a
foo6iechi5Eira oXeixoh6EwuboD we1eiDahNgoh9s ko1Eeju1iedu1z aeP7achiisohr7
phang5caeGei5j ait4Shuo5Aitai no4eis9Tohd8oh Quiet6oTaaQuei Dei2pu2NaefeCa
Shiim9quiuy0ku yiewooph3thieL thu8Aphai1ieDa Phahnahch1Aam1 oocex7Yaith8oo
eraiGaech5ahNg neixa3malif5Ya Eux7chah8ahXix eex1lahXae4Mei uGhahzonu6airu
yah8uWahn3jeiW Yi4ye4Choongie io1Vo3aiQuahpi rie4Rucheet6ae Dohbieyaeleis5
xi1Zaushohbei7 jeeb9EiSiech0u eewo0Oow7ielie aiquooZamah5th kouj7Jaivohx9o
biyeeshesaDi9e she9ooj3zuw6Ah Eit7dei1Yei5la xohN0aeSheipaa Eeg9Phob6neema
eengoneo4saeL4 aeghi4feephu6W eiWash2Vie1mee chieceish5ioPe ool4Hongo7ef1o
jahBe1pui9thou eeV2choohoa4ee Ohmae0eef4ic8I Eet0deiyohdiew Ke9ue5thohzei3
aiyoxeiva8Maih gieRahgh8anahM ve2ath9Eyi5iet quohg6ok3Ahgee theingaech5Nef
```

[ 
![sksk_005](https://www.ostechnix.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][4]

如果要在密码中包含至少 1 个数字，则可以运行：

```
pwgen 14 1 -n 1
```

输出样例：

```
xoiFush3ceiPhe
```

另外，pwgen 命令还有一些很实用的选项：

- `-c` 或 `--capitalize` 在密码中包含至少一个大写字母
- `-A` 或 `--no-capitalize` 在密码中不包含大写字母
- `-n` 或 `--numerals` 在密码中包含至少一个数字
- `-0` 或 `--no-numerals` 在密码中不包含数字
- `-y` 或 `--symbols` 在密码中包含至少一个特殊字符
- `-s` 或 `--secure` 生成完全随机的密码
- `-B` 或 `--ambiguous` 在密码中不包含难于区分的字母，如 `0` 和 `o`、`1` 和 `l`
- `-h` 或 `--help` 输出帮助信息
- `-H` 或 `--sha1=path/to/file[#seed]` 使用某个给定文件的 sha1 哈希值来作为随机数的生成种子
- `-C` 按列输出生成好的密码
- `-1` 不按列输出生成好的密码
- `-v` 或 `--no-vowels` 不使用任何元音字母，以防止生成下流的词语
```

若想了解更多信息，请查阅其联机手册：

```
man pwgen
```

### 3. 在 Linux 中使用 GPG 来生成一个高强度密码

GPG (GnuPG 或 GNU Privacy Guard) 是一个自由开源的命令行程序，可以用于替代赛门铁克的 PGP 加密软件。在类 Unix 操作系统、Microsoft Windows 和 Android 中都可以获取到它。

要使用 PGP 生成 1 个长度为 14 个字符的高强度密码，请在终端中运行下面的命令：

```
 gpg --gen-random --armor 1 14
```

输出样例：

```
DkmsrUy3klzzbIbavx8=
```

[
![sksk_006](https://www.ostechnix.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][3]

上面的命令将生成一个安全、随机、高强度且基于 base64 编码的密码。

### 4. 在 Linux 中使用 Perl 来生成一个高强度密码

Perl 在大多数 Linux 发行版本的默认软件仓库中都可以获取到，你可以使用相应的包管理器来安装它。

例如在基于 DEB 的系统中，可以运行下面的命令来安装 Perl：

```
sudo apt-get install perl
```

在基于 RPM 的系统中安装 Perl，可以运行：

```
sudo yum install perl
```

在基于 Arch 的系统中，则运行：

```
sudo pacman -S perl
```

一旦 Perl 安装完成，使用下面的命令创建一个文件：

```
vi password.pl
```

接着添加下面的内容到这个文件中：

```
#!/usr/bin/perl

my @alphanumeric = ('a'..'z', 'A'..'Z', 0..9);
my $randpassword = join '', map $alphanumeric[rand @alphanumeric], 0..8;
print "$randpassword\n"
```

[ 
![sksk_001](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_001.png) 
][2]

保存并关闭该文件。

接着，切换到你刚才保存文件的地方，并运行下面的命令：

```
perl password.pl
```

使用你自己定义的文件名来替换上面命令中的 `password.pl` 。

输出样例：

```
3V4CJJnYd
```

[ 
![sksk_002](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_002.png) 
][1]

注： 我无法找到这个脚本的原作者，假如你知道作者的名字，请在下面的评论部分让我知晓，我将在这篇指南中添加上该作者的名字。

请注意：对于生成的密码，你必须记住它，或者将它保存到电脑中一个安全的地方。我建议你记住密码并将它从系统中删除，因为这比你的系统被黑客控制要好的多。

伙计们，今天就是这么多了。不久我将带来另一篇有意思的文章。在此之前，敬请继续关注。


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/4-easy-ways-to-generate-a-strong-password-in-linux/

作者：[SK][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_002.png
[2]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_001.png
[3]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_006.png
[4]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_005.png
[5]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_004.png
[6]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_003.png
[8]:https://www.ostechnix.com/force-users-use-strong-passwords-debian-ubuntu/
