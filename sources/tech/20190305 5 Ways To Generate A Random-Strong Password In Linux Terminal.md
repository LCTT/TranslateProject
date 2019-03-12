[#]: collector: (lujun9972)
[#]: translator: (leommxj)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Ways To Generate A Random/Strong Password In Linux Terminal)
[#]: via: (https://www.2daygeek.com/5-ways-to-generate-a-random-strong-password-in-linux-terminal/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

5 Ways To Generate A Random/Strong Password In Linux Terminal
======

Recently we had written an article about **[password strength and password score check][1]** in our website.

It will help you to validate your password strength and score.

We can manually create few passwords which we required but if you would like to generate a password for multiple users or servers, what will be the solution.

Yes, there are many utilities are available in Linux to fulfill this requirements. However, I’m going to include the best five password generators in this article.

These tools are generates a strong random passwords for you. Navigate to the following article if you would like to update the password on multiple users and servers.

These tools are easy to use, that’s why i preferred to go with it. By default it will generate a strong password and if you would like to generate a super strong password then use the available options.

It will help you to generate a super strong password in the following combination. It should have minimum 12-15 characters length, that includes Alphabets (Lower case & Upper case), Numbers and Special Characters.

These tools are below.

  * `pwgen:` The pwgen program generates passwords which are designed to be easily memorized by humans, while being as secure as possible.
  * `openssl:` The openssl program is a command line tool for using the various cryptography functions of OpenSSL’s crypto library from the shell.
  * `gpg:` OpenPGP encryption and signing tool
  * `mkpasswd:` generate new password, optionally apply it to a user
  * `makepasswd:` makepasswd generates true random passwords using /dev/urandom, with the emphasis on security over pronounceability.
  * `/dev/urandom file:` The character special files /dev/random and /dev/urandom (present since Linux 1.3.30) provide an interface to the kernel’s random number generator.
  * `md5sum:` md5sum is a computer program that calculates and verifies 128-bit MD5 hashes.
  * `sha256sum:` The program sha256sum is designed to verify data integrity using the SHA-256 (SHA-2 family with a digest length of 256 bits).
  * `sha1pass:` sha1pass creates a SHA1 password hash. In the absence of a salt value on the command line, a random salt vector will be generated.



### How To Generate A Random Strong Password In Linux Using pwgen Command?

The pwgen program generates passwords which are designed to be easily memorized by humans, while being as secure as possible.

Human-memorable passwords are never going to be as secure as completely completely random passwords.

Use `-s` option to generate completely random, hard-to-memorize passwords. These should only be used for machine passwords as we can’t memorize.

For **`Fedora`** system, use **[DNF Command][2]** to install pwgen.

```
$ sudo dnf install pwgen
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install pwgen.

```
$ sudo apt install pwgen
```

For **`Arch Linux`** based systems, use **[Pacman Command][5]** to install pwgen.

```
$ sudo pacman -S pwgen
```

For **`RHEL/CentOS`** systems, use **[YUM Command][6]** to install pwgen.

```
$ sudo yum install pwgen
```

For **`openSUSE Leap`** system, use **[Zypper Command][7]** to install pwgen.

```
$ sudo zypper install pwgen
```

### How To Use pwgen Command In Linux?

It’s a simple and straight forward method. Use one of the below preferred examples for you. By default, it generates a human memorable password.

To do so, simple run the `pwgen` command on your terminal. It generates 160 passwords in a single shot. These 160 passwords are printer with 20 rows and 8 columns.

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

To generate a secure random password, use `-s` option with pwgen command.

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

If you would like to generate a strong five passwords with 14 characters length, use the following format.

```
$ pwgen -s 14 5
7YxUwDyfxGVTYD em2NT6FceXjPfT u8jlrljbrclcTi IruIX3Xu0TFXRr X8M9cB6wKNot1e
```

If you really want to generate a super strong random twenty passwords, use the following format.

```
$ pwgen -cnys 14 20
mQ3E=vfGfZ,5[B #zmj{i5|ZS){jg Ht_8i7OqJ%N`~2 443fa5iJ\W-L?] ?Qs$o=vz2vgQBR
^'Ry0Az|J9p2+0 t2oA/n7U_'|QRx EsX*%_(4./QCRJ ACr-,8yF9&eM[* !Xz1C'bw?tv50o
8hfv-fK(VxwQGS q!qj?sD7Xmkb7^ N#Zp\_Y2kr%!)~ 4*pwYs{bq]Hh&Y |4u=-Q1!jS~8=;
]{$N#FPX1L2B{h I|01fcK.z?QTz" l~]JD_,W%5bp.E +i2=D3;BQ}p+$I n.a3,.D3VQ3~&i
```

### How To Generate A Random Strong Password In Linux Using openssl Command?

The openssl program is a command line tool for using the various cryptography functions of OpenSSL’s crypto library from the shell.

Run the openssl command with the following format to generate a random strong password with 14 characters.

```
$ openssl rand -base64 14
WjzyDqdkWf3e53tJw/c=
```

If you would like to generate ten random strong password with 14 characters using openssl command then use the following for loop.

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

### How To Generate A Random Strong Password In Linux Using gpg Command?

gpg is the OpenPGP part of the GNU Privacy Guard (GnuPG). It is a tool to provide digital encryption and signing services using the OpenPGP standard. gpg features complete key management and all the bells and whistles you would expect from a full OpenPGP implementation.

Run the gpg command with the following format to generate a random strong password with 14 characters.

```
$ gpg --gen-random --armor 1 14
or
$ gpg2 --gen-random --armor 1 14
jq1mtY4gBa6gIuJrggM=
```

If you would like to generate ten random strong password with 14 characters using gpg command then use the following for loop.

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

### How To Generate A Random Strong Password In Linux Using mkpasswd Command?

mkpasswd generates passwords and can apply them automatically to users. With no arguments, mkpasswd returns a new password. It’s part of an expect package so, you have to install expect package to use mkpasswd command.

For **`Fedora`** system, use **[DNF Command][2]** to install mkpasswd.

```
$ sudo dnf install expect
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install mkpasswd.

```
$ sudo apt install expect
```

For **`Arch Linux`** based systems, use **[Pacman Command][5]** to install mkpasswd.

```
$ sudo pacman -S expect
```

For **`RHEL/CentOS`** systems, use **[YUM Command][6]** to install mkpasswd.

```
$ sudo yum install expect
```

For **`openSUSE Leap`** system, use **[Zypper Command][7]** to install mkpasswd.

```
$ sudo zypper install expect
```

Run the `mkpasswd` command in terminal to generate a random password.

```
$ mkpasswd
37_slQepD
```

Run the mkpasswd command with the following format to generate a random strong password with 14 characters.

```
$ mkpasswd -l 14
W1qP1uv=lhghgh
```

Run the mkpasswd command with the following format to generate a random strong password with 14 characters. It combinations of alphabetic (Lower & Upper case), Numeric number and special characters.

```
$ mkpasswd -l 14 -d 3 -C 3 -s 3
3aad!bMWG49"t,
```

If you would like to generate ten random strong password with 14 characters (It combination of alphabetic (Lower & Upper case), Numeric number and special characters) using mkpasswd command then use the following for loop.

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

### How To Generate A Random Strong Password In Linux Using makepasswd Command?

makepasswd generates true random passwords using /dev/urandom, with the emphasis on security over pronounceability. It can also encrypt plaintext passwords given on the command line.

Run the `makepasswd` command in terminal to generate a random password.

```
$ makepasswd
HdCJafVaN
```

Run the makepasswd command with the following format to generate a random strong password with 14 characters.

```
$ makepasswd --chars 14
HxJDv5quavrqmU
```

Run the makepasswd command with the following format to generate ten random strong password with 14 characters.

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

### How To Generate A Random Strong Password In Linux Using Multiple Commands?

Still if you are looking other options then you can use the following utilities to generate a random password in Linux.

**Using md5sum:** md5sum is a computer program that calculates and verifies 128-bit MD5 hashes.

```
$ date | md5sum
9baf96fb6e8cbd99601d97a5c3acc2c4 -
```

**Using /dev/urandom:** The character special files /dev/random and /dev/urandom (present since Linux 1.3.30) provide an interface to the kernel’s random number generator. File /dev/random has major device number 1 and minor device number 8. File /dev/urandom has major device number 1 and minor device number 9.

```
$ cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 14
15LQB9J84Btnzz
```

**Using sha256sum:** The program sha256sum is designed to verify data integrity using the SHA-256 (SHA-2 family with a digest length of 256 bits).

```
$ date | sha256sum
a114ae5c458ae0d366e1b673d558d921bb937e568d9329b525cf32290478826a -
```

**Using sha1pass:** sha1pass creates a SHA1 password hash. In the absence of a salt value on the command line, a random salt vector will be generated.

```
$ sha1pass
$4$9+JvykOv$e7U0jMJL2yBOL+RVa2Eke8SETEo$
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/5-ways-to-generate-a-random-strong-password-in-linux-terminal/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[leommx](https://github.com/leommxj)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-check-password-complexity-strength-and-score-in-linux/
[2]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
