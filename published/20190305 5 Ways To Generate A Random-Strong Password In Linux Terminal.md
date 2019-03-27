[#]: collector: (lujun9972)
[#]: translator: (leommxj)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10657-1.html)
[#]: subject: (5 Ways To Generate A Random/Strong Password In Linux Terminal)
[#]: via: (https://www.2daygeek.com/5-ways-to-generate-a-random-strong-password-in-linux-terminal/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 终端下生成随机/强密码的五种方法
======

最近我们在网站上发表过一篇关于 [检查密码复杂性/强度和评分][1] 的文章。它可以帮助你检查你的密码的强度和评分。

我们可以手工创建我们需要的密码。但如果你想要为多个用户或服务器生成密码，解决方案是什么呢？

是的，Linux 中有许多可用的工具能满足这个需求。本文中我将会介绍五种最好的密码生成器。

这些工具可以为你生成高强度随机密码。如果你想要为多个用户和服务器更新密码，请继续读下去。

这些工具易于使用，这也是我喜欢用它们的原因。默认情况下它们会生成一个足够健壮的密码，你也可以通过使用其他可用的选项来生成一个超强的密码。

它会帮助你生成符合下列要求的超强密码。密码长度至少有 12-15 个字符，包括字母（大写及小写），数字及特殊符号。

工具如下：

  * `pwgen`：生成易于人类记忆并且尽可能安全的密码。
  * `openssl`：是一个用来从 shell 中调用 OpenSSL 加密库提供的多种密码学函数的命令行工具。
  * `gpg`：OpenPGP 加密/签名工具。
  * `mkpasswd`：生成新密码，可以选择直接设置给一名用户。
  * `makepasswd`：使用 `/dev/urandom` 生成真随机密码，比起好记它更重视安全性。
  * `/dev/urandom` 文件：两个特殊的字符文件 `/dev/random` 和 `/dev/urandom` （自 Linux 1.3.30 起出现）提供了内核随机数生成器的接口。
  * `md5sum`：是一个用来计算及校验 128 位 MD5 哈希的程序。
  * `sha256sum`：被设计用来使用 SHA-256 算法（SHA-2 系列，摘要长度为 256 位）校验数据完整性。
  * `sha1pass`：生成一个 SHA1 密码哈希。在命令缺少盐值的情况下，将会生成一个随机的盐值向量。

### 怎么用 pwgen 命令在 linux 下生成一个随机的强壮密码？

`pwgen` 程序生成易于人类记忆并且尽可能安全的密码。

易于人类记忆的密码永远都不会像完全随机的密码一样安全。

使用 `-s` 选项来生成完全随机，难于记忆的密码。由于我们记不住，这些密码应该只用于机器。

在 Fedora 系统中，使用 [DNF 命令][2] 来安装 `pwgen`。

```
$ sudo dnf install pwgen
```

在 Debian/Ubuntu 系统中，使用 [APT-GET 命令][3] 或 [APT 命令][4] 来安装 `pwgen`。

```
$ sudo apt install pwgen
```

在 Arch Linux 系统中，使用 [Pacman 命令][5] 来安装 `pwgen`。

```
$ sudo pacman -S pwgen
```

在 RHEL/CentOS 系统中，使用 [YUM 命令][6] 来安装 `pwgen`。

```
$ sudo yum install pwgen
```

在 openSUSE Leap 系统中，使用 [Zypper 命令][7] 来安装 `pwgen`。

```
$ sudo zypper install pwgen
```

### 在 Linux 下如何使用 pwgen 命令？

使用方法非常简单直接。使用下列示例中更适合你的那种。默认情况下，它会生成一个方便记忆的密码。

想要这样做，只要在你的终端中运行 `pwgen` 命令。将会一下生成160个密码以8列20行打印出来。

```
$ pwgen
ameiK2oo aibi3Cha EPium0Ie aisoh1Ee Nidee9ae uNga0Bee uPh9ieM1 ahn1ooNg
oc5ooTea tai7eKid tae2yieS hiecaiR8 wohY2Ohk Uab2maed heC4aXoh Ob6Nieso
Shaeriu3 uy9Juk5u hoht7Doo Fah6yah3 faz9Jeew eKiek4ju as0Xuosh Eiwo4epo
oot8teeZ Ui1yoohi Aechae7A Ohdi2ael cae5Thoh Au1aeTei ais0aiC2 Cai2quin
Oox9ohz4 neev0Che ahza8AQu Ahz7eica meiBeeW0 Av3bo7ah quoiTu3f taeNg3ae
Aiko7Aiz SheiGh8E aesaeSh7 haet6Loo AeTel3oN Ath7zeer IeYah4ie UG3ootha
Ohch9Och Phuap6su iel5Xu7s diqui7Bu ieF2dier eeluHa1u Thagei0i Ceeth3oh
OCei1ahj zei2aiYo Jahgh1ia ooqu1Cej eez2aiPo Wahd5soo noo7Mei9 Hie5ashe
Uith4Or2 Xie3uh2b fuF9Eilu eiN2sha9 zae2YaSh oGh5ephi ohvao4Ae aixu6aeM
fo4Ierah iephei6A hae9eeGa eiBeiY3g Aic8Kee9 he8AheCh ohM4bid9 eemae3Zu
eesh2EiM cheiGa4j PooV2vii ahpeeg5E aezauX2c Xe7aethu Ahvaph7a Joh2heec
Ii5EeShi aij7Uo8e ooy2Ahth mieKe2ni eiQuu8fe giedaQu0 eiPhob3E oox1uo2U
eehia4Hu ga9Ahw0a ohxuZei7 eV4OoXio Kid2wu1n ku4Ahf5s uigh8uQu AhWoh0po
vo1Eeb2u Ahth7ve5 ieje4eiL ieci1Ach Meephie9 iephieY8 Eesoom7u eakai2Bo
uo8Ieche Zai3aev5 aGhahf0E Wowoo5th Oraeb0ah Gah3nah0 ieGhah0p aeCh0OhJ
ahQu2feZ ahQu0gah foik7Ush cei1Wai1 Aivi3ooY eephei5U MooZae3O quooRoh7
aequae5U pae6Ceiv eizahF1k ohmi7ETa ahyaeK1N Mohw2no8 ooc8Oone coo7Ieve
eePhei9h Weequ8eV Vie4iezu neeMiim4 ie6aiZoh Queegh2E shahwi3N Inichie8
Sid1aeji mohj4Ko7 lieDi0pe Zeemah6a thuevu2E phi4Ohsh paiKeix1 ooz1Ceph
ahV4yore ue2laePh fu1eThui qui7aePh Fahth1nu ohk9puLo aiBeez0b Neengai5
```

生成安全的随机密码，使用 `pwgen` 命令的 `-s` 选项。 

```
$ pwgen -s
CU75lgZd 7HzzKgtA 2ktBJDpR F6XJVhBs UjAm3bNL zO7Dw7JJ pxn8fUvp Ka3lLilG
ywJX7iJl D9ajxb6N 78c1HOg2 g8vtWCra Jp6pBGBw oYuev9Vl gbA6gHV8 G6XQoVO5
uQN98IU4 50GgQfrX FrTsou2t YQorO4x6 UGer8Yi2 O7DB5nw1 1ax370UR 1xVRPkA1
RVaGDr2i Nt11ekUd 9Vm3D244 ck8Lnpd0 SjDt8uWn 5ERT4tf8 4EONFzyY Jc6T83jg
WZa6bKPW H4HMo1YU bsDDRik3 gBwV7LOW 9H1QRQ4x 3Ak7RcSe IJu2RBF9 e508xrLC
SzTrW191 AslxDa6E IkWWov2b iOb6EmTy qHt82OwG 5ZFO7B53 97zmjOPu A4KZuhYV
uQpoJR4D 0eKyOiUr Rz96smeO 3HTABu3N 6W0VmEls uPsp5zpw 8UD3VkMG YTct6Rd4
VKo0cVmq E07ZX7j9 kQSlvA69 Nm3fpv3i xWvF2xMu yEfcw8uA oQGVX3l9 grTzx7Xj
s4GVEYtM uJl5sYMe n3icRPiY ED3Mup4B k3M9KHI7 IkxqoSM0 dt2cxmMU yb2tUkut
2Q9wGZQx 8Rpo11s9 I13siOHu 7GV64Fjv 3VONzD8i SCDfVD3F oiPTx239 6BQakoiJ
XUEokiC4 ybL7VGmL el2RfvWk zKc7CLcE 3FqNBSyA NjDWrvZ5 KI3NSX4h VFyo6VPr
h4q3XeqZ FDYMoX6f uTU5ZzU3 6u4ob4Ep wiYPt05n CZga66qh upzH6Z9y RuVcqbe8
taQv11hq 1xsY67a8 EVo9GLXA FCaDLGb1 bZyh0YN8 0nTKo0Qy RRVUwn9t DuU8mwwv
x96LWpCb tFLz3fBG dNb4gCKf n6VYcOiH 1ep6QYFZ x8kaJtrY 56PDWuW6 1R0If4kV
2XK0NLQK 4XQqhycl Ip08cn6c Bnx9z2Bz 7gjGlON7 CJxLR1U4 mqMwir3j ovGXWu0z
MfDjk5m8 4KwM9SAN oz0fZ5eo 5m8iRtco oP5BpLh0 Z5kvwr1W f34O2O43 hXao1Sp8
tKoG5VNI f13fuYvm BQQn8MD3 bmFSf6Mf Z4Y0o17U jT4wO1DG cz2clBES Lr4B3qIY
ArKQRND6 8xnh4oIs nayiK2zG yWvQCV3v AFPlHSB8 zfx5bnaL t5lFbenk F2dIeBr4
C6RqDQMy gKt28c9O ZCi0tQKE 0Ekdjh3P ox2vWOMI 14XF4gwc nYA0L6tV rRN3lekn
lmwZNjz1 4ovmJAr7 shPl9o5f FFsuNwj0 F2eVkqGi 7gw277RZ nYE7gCLl JDn05S5N
```

假设你想要生成 5 个 14 字符长的密码，方法如下：

```
$ pwgen -s 14 5
7YxUwDyfxGVTYD em2NT6FceXjPfT u8jlrljbrclcTi IruIX3Xu0TFXRr X8M9cB6wKNot1e
```

如果你真的想要生成 20 个超强随机密码，方法如下：

```
$ pwgen -cnys 14 20
mQ3E=vfGfZ,5[B #zmj{i5|ZS){jg Ht_8i7OqJ%N`~2 443fa5iJ\W-L?] ?Qs$o=vz2vgQBR
^'Ry0Az|J9p2+0 t2oA/n7U_'|QRx EsX*%_(4./QCRJ ACr-,8yF9&eM[* !Xz1C'bw?tv50o
8hfv-fK(VxwQGS q!qj?sD7Xmkb7^ N#Zp\_Y2kr%!)~ 4*pwYs{bq]Hh&Y |4u=-Q1!jS~8=;
]{$N#FPX1L2B{h I|01fcK.z?QTz" l~]JD_,W%5bp.E +i2=D3;BQ}p+$I n.a3,.D3VQ3~&i
```

### 如何在 Linux 下使用 openssl 命令生成随机强密码？

`openssl` 是一个用来从 shell 中调用 OpenSSL 加密库提供的多种密码学函数的命令行工具。

像下面这样运行 `openssl` 命令可以生成一个 14 字符长的随机强密码。

```
$ openssl rand -base64 14
WjzyDqdkWf3e53tJw/c=
```

如果你想要生成 10 个 14 字符长的随机强密码，将 `openssl` 命令与 `for` 循环结合起来使用。

```
$ for pw in {1..10}; do openssl rand -base64 14; done
6i0hgHDBi3ohZ9Mil8I=
gtn+y1bVFJFanpJqWaA=
rYu+wy+0nwLf5lk7TBA=
xrdNGykIzxaKDiLF2Bw=
cltejRkDPdFPC/zI0Pg=
G6aroK6d4xVVYFTrZGs=
jJEnFoOk1+UTSx/wJrY=
TFxVjBmLx9aivXB3yxE=
oQtOLPwTuO8df7dIv9I=
ktpBpCSQFOD+5kIIe7Y=
```

### 如何在 Linux 下使用 gpg 命令生成随机强密码？

`gpg` 是 Gnu Privacy Guard （GnuPG） 中的 OpenPGP 实现部分。它是一个提供 OpenPGP 标准的数字加密与签名服务的工具。`gpg` 具有完整的密钥管理功能和其他完整 OpenPGP 实现应该具备的全部功能。

下面这样执行 `gpg` 命令来生成一个 14 字符长的随机强密码。

```
$ gpg --gen-random --armor 1 14
or
$ gpg2 --gen-random --armor 1 14
jq1mtY4gBa6gIuJrggM=
```

如果想要使用 `gpg` 生成 10 个 14 字符长的随机强密码，像下面这样使用 `for` 循环。

```
$ for pw in {1..10}; do gpg --gen-random --armor 1 14; done
or
$ for pw in {1..10}; do gpg2 --gen-random --armor 1 14; done
F5ZzLSUMet2kefG6Ssc=
8hh7BFNs8Qu0cnrvHrY=
B+PEt28CosR5xO05/sQ=
m21bfx6UG1cBDzVGKcE=
wALosRXnBgmOC6+++xU=
TGpjT5xRxo/zFq/lNeg=
ggsKxVgpB/3aSOY15W4=
iUlezWxL626CPc9omTI=
pYb7xQwI1NTlM2rxaCg=
eJjhtA6oHhBrUpLY4fM=
```

### 如何在 Linux 下使用 mkpasswd 命令生成随机强密码？

`mkpasswd` 生成密码并可以自动将其为用户设置。不加任何参数的情况下，`mkpasswd` 返回一个新的密码。它是 expect 软件包的一部分，所以想要使用 `mkpasswd` 命令，你需要安装 expect 软件包。

在 Fedora 系统中，使用 [DNF 命令][2] 来安装 `mkpasswd`。

```
$ sudo dnf install expect
```

在 Debian/Ubuntu 系统中，使用 [APT-GET 命令][3] 或 [APT 命令][4] 来安装 `mkpasswd`。

```
$ sudo apt install expect
```

在 Arch Linux 系统中，使用 [Pacman 命令][5] 来安装 `mkpasswd`。

```
$ sudo pacman -S expect
```

在 RHEL/CentOS 系统中，使用 [YUM 命令][6] 来安装 `mkpasswd`。

```
$ sudo yum install expect
```

在 openSUSE Leap 系统中，使用 [Zypper 命令][7] 来安装 `mkpasswd`。

```
$ sudo zypper install expect
```

在终端中执行 `mkpasswd` 命令来生成一个随机密码。

```
$ mkpasswd
37_slQepD
```

像下面这样执行 `mkpasswd` 命令可以生成一个 14 字符长的随机强密码。

```
$ mkpasswd -l 14
W1qP1uv=lhghgh
```

像下面这样执行 `mkpasswd` 命令 来生成一个 14 字符长，包含大小写字母、数字和特殊字符的随机强密码。

```
$ mkpasswd -l 14 -d 3 -C 3 -s 3
3aad!bMWG49"t,
```

如果你想要生成 10 个 14 字符长的随机强密码（包括大小写字母、数字和特殊字符），使用 `for` 循环和 `mkpasswd` 命令。

```
$ for pw in {1..10}; do mkpasswd -l 14 -d 3 -C 3 -s 3; done
zmSwP[q9;P1r6[
E42zcvzM"i3%B\
8}1#[email protected]
0X:zB(mmU22?nj
0sqqL44M}ko(O^
43tQ(.6jG;ceRq
-jB6cp3x1GZ$e=
$of?Rj9kb2N(1J
9HCf,nn#gjO79^
Tu9m56+Ev_Yso(
```

### 如何在 Linux 下使用 makepasswd 命令生成随机强密码？

`makepasswd` 使用 `/dev/urandom` 生成真随机密码，与易于记忆相比它更注重安全性。它也可以加密命令行中给出的明文密码。

在终端中执行 `makepasswd` 命令来生成一个随机密码。

```
$ makepasswd
HdCJafVaN
```

在终端中像下面这样执行 `makepasswd` 命令来生成 14 字符长的随机强密码。

```
$ makepasswd --chars 14
HxJDv5quavrqmU
```

像下面这样执行 `makepasswd` 来生成 10 个 14 字符长的随机强密码。

```
$ makepasswd --chars 14 --count 10
TqmKVWnRGeoVNr
mPV2P98hLRUsai
MhMXPwyzYi2RLo
dxMGgLmoFpYivi
8p0G7JvJjd6qUP
7SmX95MiJcQauV
KWzrh5npAjvNmL
oHPKdq1uA9tU85
V1su9GjU2oIGiQ
M2TMCEoahzLNYC
```

### 如何在 Linux 系统中使用多个命令生成随机强密码？

如果你还在寻找其他的方案，下面的工具也可以用来在 Linux 中生成随机密码。

使用 `md5sum`：它是一个用来计算及校验 128 位 MD5 哈希的程序。

```
$ date | md5sum
9baf96fb6e8cbd99601d97a5c3acc2c4 -
```

使用 `/dev/urandom`: 两个特殊的字符文件 `/dev/random` 和 `/dev/urandom` （自 Linux 1.3.30 起出现）提供了内核随机数生成器的接口。`/dev/random` 的主设备号为 1，次设备号为 8。`/dev/urandom` 主设备号为 1，次设备号为 9。

```
$ cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 14
15LQB9J84Btnzz
```

使用 `sha256sum`：它被设计用来使用 SHA-256 算法（SHA-2 系列，摘要长度为 256 位）校验数据完整性。

```
$ date | sha256sum
a114ae5c458ae0d366e1b673d558d921bb937e568d9329b525cf32290478826a -
```

使用 `sha1pass`：它生成一个 SHA1 密码哈希。在命令缺少盐值的情况下，将会生成一个随机的盐值向量。

```
$ sha1pass
$4$9+JvykOv$e7U0jMJL2yBOL+RVa2Eke8SETEo$
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/5-ways-to-generate-a-random-strong-password-in-linux-terminal/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[leommxj](https://github.com/leommxj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10623-1.html
[2]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
