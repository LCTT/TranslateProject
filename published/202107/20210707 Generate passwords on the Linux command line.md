[#]: subject: (Generate passwords on the Linux command line)
[#]: via: (https://opensource.com/article/21/7/generate-passwords-pwgen)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (turbokernel)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13582-1.html)

在 Linux 命令行中生成密码
======

> 在命令行上创建符合特定规范的密码。

![](https://img.linux.net.cn/data/attachment/album/202107/15/094657l4l494c0080u2ca4.jpg)

大多数网站或应用都要求用户创建带有安全密码的账户，以便他们能够迎合用户体验。虽然这有利于网站开发者，但肯定不会让用户的生活更轻松。

有时，创建密码的规则是如此严格，以至于难以生成一个强壮且合规的组合。如果有一个工具可以生成符合网站或应用程序要求的任何规则的安全密码，那就容易多了。

这就是 `pwgen` 的用武之地。根据它的 [手册页][2]：“pwgen 生成的密码是为了让人容易记住，同时又尽可能的安全。” 它返回符合你所提供的规则的多个密码选项，这样你就可以选择一个你喜欢的（而且可能更容易记住）。

### 安装 pwgen

在 Linux 上，你可以通过包管理器安装 `pwgen`。例如，在 Fedora 上：

```
$ sudo dnf install pwgen
```

在 macOS 上，可以使用 [MacPorts][3] 或 [Homebrew][4]。在 Windows 上，可以使用 [Chocolatey][5]。

### 使用 pwgen 生成密码

有几种方式可以通过向 `pwgen` 传递参数来生成密码，这取决于你所需的参数。这里有一些例子。更多的参数选项请查阅手册页。

如果你需要一个安全的、难以记忆的特定长度的密码，请运行 `pwgen --secure`（或简写 `-s`），后面跟上你所需的密码长度：

```
$ pwgen -s 25
pnFBg9jB8AlKL3feOuS2ZwMGb xlmDRoaLssduXTdGV6jkQhUGY O3IUB3CH7ry2kD4ZrSoODzWez
dENuvhkF3mmeb4FfXd4VPU2dE EMCi1sHFKHUVmbVajXWleFBzD 4UXJIu3JztVzYz6qJktBB3KCv
AF9WM7hmG89cpTlg8PksI7jsL LSSaT7DD4IT8DUgRAgY8Zt06m Nths10uT0bIMGsPuE0XEHDxsj
6YjLRbg3VnGnrzkoQCmrneLmm Tam1Mftac5RxrZPoXJtXx1Qdy BPqePJW4LdTtFnuZOepKEj0o0
Ss8veqqf95zusqYPsfE7mLb93 4KuZdReO5lhKff7Xv1en1Hefs is7hjLnDrVCUJ7Hh6zYUzfppn
UXOfENPRJYWiroIWEt5IgAwdJ t8i4hM4cDuL8pN1rpFKHnx7yw Wr7gyuyU2br7aCbiH5M5ogvc6
evk90lUmK2rOUWGgnqmznn0a9 Lflyc9svJfaBRRMin24j0P9ec hIzyJIwCpklDjgOb5PrMkyPCI
bhYcaV7GXfUiCMZ1kvMnlmKLx v4EJew54u6s4ZCirOTAWjfPQ2 IdemhbOHOm4Qo70WGibaNTOpO
j6XkmdB3LBfqZf5mbL3GndliG PpZbeXfWOFCpNARyXt1FWPAb8 OLQS2HFuqkiSg56sdxNsg5vaJ
1g666HxJPQ6l2L0RlaDEMoi50 1t6au7VuTN9HVPpiVmd1Gurli 46OAWypvwtZZUdBEfaHSunjpw
0LiRj9dbtMuI4cbDES8O4gYRq 2HPiaq5AANvVT32fWqNIruu3R 3lT5B107WoUbHsELkKUjnEEih
gLmYUTp0XZJWvIVbA5rFvBT54 LEm6QVeTMinc056DC9c4V55cV ipV45Ewj704365byKhY8zn766
```

运行 `pwgen -symbols`（或简写 `-y`），再加上所需的密码长度，生成包含特殊字符的密码：

```
$ pwgen -y 25
Osh0chahxe0won9aech4ese?v pemoh2ohm9aim;iu4Eiy"ah0y Taiqu;o2aeSh+o4aedoagait3
Vei;phoh5owai5jui+t|ei3ot teu!w7mahxoh0Po7ohph8Iez6 quie#phooCeu2lohm5shaPaer
eTh5AechaexieToh9ez5eeZ;e nuloh1ico0Nool:eG<aiv`ah, Heeghuo8ahzii1Iep~ie_ch7p
oe6Xee6uchei7Oroothail~iL ahjie!Chee.W4wah[wuu]phoo ees7ieb!i[ibahhei1xoz2Woh
Atei9ooLu7lo~sh>aig@ae9No OVahh2OhNgahtu8iethaR@i7o ouFai8ahP@eil4Ieh5le5ipu5
eeT4tahW0ieng9fe?i5auM3ie seet0ohc4aiJei]koiGha2zu% iuh@oh4eix0Vuphi?o,hei9me
loh0Aeph=eix(ohghe6chee3z ahgh2eifiew8dahG_aeph8woo oe!B4iasaeHo`ungie3taekoh
cei!c<ung&u,shee6eir7Eigo va6phou8ooYuoquohghi-n6Qu eeph4ni\chi2shohg3Die1hia
uCagha8Toos2bahLai7phuph` Zue2thieng9ohhoo~shoh6ese Aet7Lio1ailee^qu4hiech5ie
dee]kuwu9OhTh3shoi2eijoGe daethahH6ahV3eekoo9aep$an aehiiMaquieHee9moh`l_oh4l
aec#ii6Chophu3aigh*ai#le4 looleihoog:uo4Su"thiediec eeTh{o7Eechah7eeJ2uCeish!
oi3jaiphoof$aiy;ieriexeiP Thozool3aipi|cahfu0Ha~e1e az/u8iel2Jaeph2vooshai9Wi
```

运行 `pwgen --capitalize`（或缩写 `-c`），后面跟上密码长度，生成包含大写字母的密码：

```
$ pwgen -c 25
pheipichusheta6ieJ4xai4ai seiLeiciev7ijoy5Uez7Iepee Foobeisheec7ooGahbicholo6
shenahsheevigh3pha1Ie5aev taiTheitahne3oong4joegh9d ooshieV0ooGhaelabuyahsh7t
ieniech0Uajeh8nieYaak0foh dohm5Pee3jeeshahm1eipei0a aemoob8Lequeesho8ahreiwee
keineeCh5ieZejafitith6Osh Tahn3nohl6iewaimee6oofied Aed2Woh7nae5ohgh2toh1ieph
le4agheeb0bieth0Ui7ielais Iunoo4lev1aiG4NohfoTh3ro5 iLai7eiQuohXosh8ooyiev6wu
eezib2zoh2ohsh0cooSahluK6 baekiew8bo5oeMouthi7taCee iep6Puungae0uushogah4rohw
chohm5leogae2zeiph1OL0uK2 oosieCaishievahvig3Iaphai ii9AemieYeepe1ahciSei8ees
ie3aighaiy9TaX6bae8soKe6t sooDaivi4mia8Eireech8ope9 moi9uk3bauv0ahY4to0aedie7
que8seHu4shu7Veib6noe7dai shuyuj9aiphoip2Ier4oole1u Thoaziebah1Ieph2Veec0Ohm8
auqua4Kaitie9sei6quoh7chi jeewaituH3Ohsaisahp0viequ ueh1quaibidoh6Bae6ri0Mee2
lae3aiJaiNgoh7yieghozev7o Di2vohfahr7uo7ohSh0voh5sh Jeurahxiedeiyoom3aechaS7d
thung2pheiy2tooBeenuN8ia3 foh0oge1athei0oowieZen0ai iexei0io1vohsieThuCoy5ogi
tohHe3uu2eXieheeQuoh7eit8 aiMieCeizeivu1ooch8aih0sh Riojei2yoah0AiWeiRoMieQu0
```

### 让它变得简单

由于人脑更倾向于选择模式，所以强壮的随机密码难以生成。通过使用 `pwgen`，你可以轻松生成密码。借助于优秀的 [开源密码管理器][6]，你可以完全从易于使用但难以猜测的密码中获益。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/generate-passwords-pwgen

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/password.jpg?itok=ec6z6YgZ (Password lock)
[2]: https://linux.die.net/man/1/pwgen
[3]: https://opensource.com/article/20/11/macports
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://opensource.com/article/20/3/chocolatey
[6]: https://opensource.com/article/16/12/password-managers
