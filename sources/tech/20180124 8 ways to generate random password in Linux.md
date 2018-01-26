8 ways to generate random password in Linux
======
Learn 8 different ways to generate random password in Linux using Linux native commands or third party utilities.

![][1]

In this article, we will walk you through various different ways to generate random password in Linux terminal. Few of them are using native Linux commands and others are using third party tools or utilities which can easily be installed on Linux machine. Here we are looking at native commands like `openssl`, [dd][2], `md5sum`, `tr`, `urandom` and third party tools like mkpasswd, randpw, pwgen, spw, gpg, xkcdpass, diceware, revelation, keepaasx, passwordmaker.

These are actually ways to get some random alphanumeric string which can be utilized as password. Random passwords can be used for new users so that there will be uniqueness no matter how large your user base is. Without any further delay lets jump into those 15 different ways to generate random password in Linux.

##### Generate password using mkpasswd utility

`mkpasswd` comes with install of `expect` package on RHEL based systems. On Debian based systems `mkpasswd` comes with package `whois`. Trying to install `mkpasswd` package will results in error -

No package mkpasswd available. on RHEL system and E: Unable to locate package mkpasswd in Debian based.

So install their parent packages as mentioned above and you are good to go.

Run `mkpasswd` to get passwords

```
root@kerneltalks# mkpasswd << on RHEL
zt*hGW65c
 
root@kerneltalks# mkpas
```

Command behaves differently on different systems so work accordingly. There are many switches which can be used to control length etc parameters. You can explore them from man pages.

##### Generate password using openssl

Openssl comes in build with almost all the Linux distributions. We can use its random function to get alphanumeric string generated which can be used as password.

```
root@kerneltalks # openssl rand -base64 10
nU9LlHO5nsuUvw==
```

Here, we are using `base64` encoding with random function and last digit for argument to `base64` encoding.

##### Generate password using urandom

Device file `/dev/urandom` is another source of getting random characters. We are using `tr` function and trimming output to get random string to use as password.

```
root@kerneltalks # strings /dev/urandom |tr -dc A-Za-z0-9 | head -c20; echo
UiXtr0NAOSIkqtjK4c0X
```

##### dd command to generate password

We can even use /dev/urandom device along with [dd command ][2]to get string of random characters.

```
oot@kerneltalks# dd if=/dev/urandom bs=1 count=15|base64 -w 0
15+0 records in
15+0 records out
15 bytes (15 B) copied, 5.5484e-05 s, 270 kB/s
QMsbe2XbrqAc2NmXp8D0
```

We need to pass output through `base64` encoding to make it human readable. You can play with count value to get desired length. For much cleaner output, redirect std2 to `/dev/null`. Clean command will be -

```
oot@kerneltalks # dd if=/dev/urandom bs=1 count=15 2>/dev/null|base64 -w 0
F8c3a4joS+a3BdPN9C++
```

##### Using md5sum to generate password

Another way to get array of random characters which can be used as password is to calculate MD5 checksum! s you know checksum value is indeed looks like random characters grouped together we can use it as password. Make sure you use source as something variable so that you get different checksum every time you run command. For example `date` ! [date command][3] always yields changing output.

```
root@kerneltalks # date |md5sum
4d8ce5c42073c7e9ca4aeffd3d157102  -
```

Here we passed `date` command output to `md5sum` and get the checksum hash! You can use [cut command][4] to get desired length of output.

##### Generate password using pwgen

`pwgen` package comes with [repositories like EPEL][5]. `pwgen` is more focused on generating passwords which are pronounceable but not a dictionary word or not in plain English. You may not find it in standard distribution repo. Install the package and run `pwgen` command. Boom !

```
root@kerneltalks # pwgen
thu8Iox7 ahDeeQu8 Eexoh0ai oD8oozie ooPaeD9t meeNeiW2 Eip6ieph Ooh1tiet
cootad7O Gohci0vo wah9Thoh Ohh3Ziur Ao1thoma ojoo6aeW Oochai4v ialaiLo5
aic2OaDa iexieQu8 Aesoh4Ie Eixou9ph ShiKoh0i uThohth7 taaN3fuu Iege0aeZ
cah3zaiW Eephei0m AhTh8guo xah1Shoo uh8Iengo aifeev4E zoo4ohHa fieDei6c
aorieP7k ahna9AKe uveeX7Hi Ohji5pho AigheV7u Akee9fae aeWeiW4a tiex8Oht
```
You will be presented with list of passwords at your terminal! What else you want? Ok. You still want to explore, `pwgen` comes with many custom options which can be referred for man page.

##### Generate password using gpg tool

GPG is a OpenPGP encryption and signing tool. Mostly gpg tool comes pre-installed (at least it is on my RHEL7). But if not you can look for `gpg` or `gpg2` package and [install][6] it.

Use below command to generate password from gpg tool.

```
root@kerneltalks # gpg --gen-random --armor 1 12
mL8i+PKZ3IuN6a7a
```

Here we are passing generate random byte sequence switch (`--gen-random`) of quality 1 (first argument) with count of 12 (second argument). Switch `--armor` ensures output is `base64` encoded.

##### Generate password using xkcdpass

Famous geek humor website [xkcd][7], published a very interesting post about memorable but still complex passwords. You can view it [here][8]. So `xkcdpass` tool took inspiration from this post and did its work! Its a python package and available on python's official website [here][9]

All installation and usage instructions are mentioned on that page. Here is install steps and outputs from my test RHEL server for your reference.

```
root@kerneltalks # wget https://pypi.python.org/packages/b4/d7/3253bd2964390e034cf0bba227db96d94de361454530dc056d8c1c096abc/xkcdpass-1.14.3.tar.gz#md5=5f15d52f1d36207b07391f7a25c7965f
--2018-01-23 19:09:17--  https://pypi.python.org/packages/b4/d7/3253bd2964390e034cf0bba227db96d94de361454530dc056d8c1c096abc/xkcdpass-1.14.3.tar.gz
Resolving pypi.python.org (pypi.python.org)... 151.101.32.223, 2a04:4e42:8::223
Connecting to pypi.python.org (pypi.python.org)|151.101.32.223|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 871848 (851K) [binary/octet-stream]
Saving to: ‘xkcdpass-1.14.3.tar.gz’
 
100%[==============================================================================================================================>] 871,848     --.-K/s   in 0.01s
 
2018-01-23 19:09:17 (63.9 MB/s) - ‘xkcdpass-1.14.3.tar.gz’ saved [871848/871848]
 
 
root@kerneltalks # tar -xvf xkcdpass-1.14.3.tar.gz
xkcdpass-1.14.3/
xkcdpass-1.14.3/examples/
xkcdpass-1.14.3/examples/example_import.py
xkcdpass-1.14.3/examples/example_json.py
xkcdpass-1.14.3/examples/example_postprocess.py
xkcdpass-1.14.3/LICENSE.BSD
xkcdpass-1.14.3/MANIFEST.in
xkcdpass-1.14.3/PKG-INFO
xkcdpass-1.14.3/README.rst
xkcdpass-1.14.3/setup.cfg
xkcdpass-1.14.3/setup.py
xkcdpass-1.14.3/tests/
xkcdpass-1.14.3/tests/test_list.txt
xkcdpass-1.14.3/tests/test_xkcdpass.py
xkcdpass-1.14.3/tests/__init__.py
xkcdpass-1.14.3/xkcdpass/
xkcdpass-1.14.3/xkcdpass/static/
xkcdpass-1.14.3/xkcdpass/static/eff-long
xkcdpass-1.14.3/xkcdpass/static/eff-short
xkcdpass-1.14.3/xkcdpass/static/eff-special
xkcdpass-1.14.3/xkcdpass/static/fin-kotus
xkcdpass-1.14.3/xkcdpass/static/ita-wiki
xkcdpass-1.14.3/xkcdpass/static/legacy
xkcdpass-1.14.3/xkcdpass/static/spa-mich
xkcdpass-1.14.3/xkcdpass/xkcd_password.py
xkcdpass-1.14.3/xkcdpass/__init__.py
xkcdpass-1.14.3/xkcdpass.1
xkcdpass-1.14.3/xkcdpass.egg-info/
xkcdpass-1.14.3/xkcdpass.egg-info/dependency_links.txt
xkcdpass-1.14.3/xkcdpass.egg-info/entry_points.txt
xkcdpass-1.14.3/xkcdpass.egg-info/not-zip-safe
xkcdpass-1.14.3/xkcdpass.egg-info/PKG-INFO
xkcdpass-1.14.3/xkcdpass.egg-info/SOURCES.txt
xkcdpass-1.14.3/xkcdpass.egg-info/top_level.txt
 
 
root@kerneltalks # cd xkcdpass-1.14.3
 
root@kerneltalks # python setup.py install
running install
running bdist_egg
running egg_info
writing xkcdpass.egg-info/PKG-INFO
writing top-level names to xkcdpass.egg-info/top_level.txt
writing dependency_links to xkcdpass.egg-info/dependency_links.txt
writing entry points to xkcdpass.egg-info/entry_points.txt
reading manifest file 'xkcdpass.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
writing manifest file 'xkcdpass.egg-info/SOURCES.txt'
installing library code to build/bdist.linux-x86_64/egg
running install_lib
running build_py
creating build
creating build/lib
creating build/lib/xkcdpass
copying xkcdpass/xkcd_password.py -> build/lib/xkcdpass
copying xkcdpass/__init__.py -> build/lib/xkcdpass
creating build/lib/xkcdpass/static
copying xkcdpass/static/eff-long -> build/lib/xkcdpass/static
copying xkcdpass/static/eff-short -> build/lib/xkcdpass/static
copying xkcdpass/static/eff-special -> build/lib/xkcdpass/static
copying xkcdpass/static/fin-kotus -> build/lib/xkcdpass/static
copying xkcdpass/static/ita-wiki -> build/lib/xkcdpass/static
copying xkcdpass/static/legacy -> build/lib/xkcdpass/static
copying xkcdpass/static/spa-mich -> build/lib/xkcdpass/static
creating build/bdist.linux-x86_64
creating build/bdist.linux-x86_64/egg
creating build/bdist.linux-x86_64/egg/xkcdpass
copying build/lib/xkcdpass/xkcd_password.py -> build/bdist.linux-x86_64/egg/xkcdpass
copying build/lib/xkcdpass/__init__.py -> build/bdist.linux-x86_64/egg/xkcdpass
creating build/bdist.linux-x86_64/egg/xkcdpass/static
copying build/lib/xkcdpass/static/eff-long -> build/bdist.linux-x86_64/egg/xkcdpass/static
copying build/lib/xkcdpass/static/eff-short -> build/bdist.linux-x86_64/egg/xkcdpass/static
copying build/lib/xkcdpass/static/eff-special -> build/bdist.linux-x86_64/egg/xkcdpass/static
copying build/lib/xkcdpass/static/fin-kotus -> build/bdist.linux-x86_64/egg/xkcdpass/static
copying build/lib/xkcdpass/static/ita-wiki -> build/bdist.linux-x86_64/egg/xkcdpass/static
copying build/lib/xkcdpass/static/legacy -> build/bdist.linux-x86_64/egg/xkcdpass/static
copying build/lib/xkcdpass/static/spa-mich -> build/bdist.linux-x86_64/egg/xkcdpass/static
byte-compiling build/bdist.linux-x86_64/egg/xkcdpass/xkcd_password.py to xkcd_password.pyc
byte-compiling build/bdist.linux-x86_64/egg/xkcdpass/__init__.py to __init__.pyc
creating build/bdist.linux-x86_64/egg/EGG-INFO
copying xkcdpass.egg-info/PKG-INFO -> build/bdist.linux-x86_64/egg/EGG-INFO
copying xkcdpass.egg-info/SOURCES.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
copying xkcdpass.egg-info/dependency_links.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
copying xkcdpass.egg-info/entry_points.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
copying xkcdpass.egg-info/not-zip-safe -> build/bdist.linux-x86_64/egg/EGG-INFO
copying xkcdpass.egg-info/top_level.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
creating dist
creating 'dist/xkcdpass-1.14.3-py2.7.egg' and adding 'build/bdist.linux-x86_64/egg' to it
removing 'build/bdist.linux-x86_64/egg' (and everything under it)
Processing xkcdpass-1.14.3-py2.7.egg
creating /usr/lib/python2.7/site-packages/xkcdpass-1.14.3-py2.7.egg
Extracting xkcdpass-1.14.3-py2.7.egg to /usr/lib/python2.7/site-packages
Adding xkcdpass 1.14.3 to easy-install.pth file
Installing xkcdpass script to /usr/bin
 
Installed /usr/lib/python2.7/site-packages/xkcdpass-1.14.3-py2.7.egg
Processing dependencies for xkcdpass==1.14.3
Finished processing dependencies for xkcdpass==1.14.3
```

Now running xkcdpass command will give you random set of dictionary words like below -

```
root@kerneltalks # xkcdpass
broadside unpadded osmosis statistic cosmetics lugged
```

You can use these words as input to other commands like `md5sum` to get random password (like below) or you can even use Nth letter of each words to form your password!

```
oot@kerneltalks # xkcdpass |md5sum
45f2ec9b3ca980c7afbd100268c74819  -
 
root@kerneltalks # xkcdpass |md5sum
ad79546e8350744845c001d8836f2ff2  -
```
Or even you can use all those words together as such a long password which is easy to remember for a user and very hard to crack using computer program.

There are tools like [Diceware][10], [KeePassX][11], [Revelation][12], [PasswordMaker][13] for Linux which can be considered for making strong random passwords.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/tips-tricks/8-ways-to-generate-random-password-in-linux/

作者：[kerneltalks][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://a1.kerneltalks.com/wp-content/uploads/2018/01/different-ways-to-generate-password-in-linux.png
[2]:https://kerneltalks.com/commands/learn-dd-command-with-examples/
[3]:https://kerneltalks.com/commands/date-time-management-using-timedatectl-command/
[4]:https://kerneltalks.com/linux/cut-command-examples/
[5]:https://kerneltalks.com/package/how-to-install-epel-repository/
[6]:https://kerneltalks.com/tools/package-installation-linux-yum-apt/
[7]:https://xkcd.com/
[8]:https://xkcd.com/936/
[9]:https://pypi.python.org/pypi/xkcdpass/
[10]:http://world.std.com/~reinhold/diceware.html
[11]:https://www.keepassx.org/
[12]:https://packages.debian.org/sid/gnome/revelation
[13]:https://passwordmaker.org/
