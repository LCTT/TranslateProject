GOLinux翻译中

How to manage passwords from the command line on Linux
如何在Linux上使用命令行管理密码
================================================================================
With password-based authentication so prevalent online these days, you may need or already use some sort of password management tool to keep track of all the passwords you are using. There are various online or offline services or software tools for that matter, and they vary in terms of their sophistication, user interface or target environments (e.g., enterprises or end users). For example, there are a few GUI-based password managers for end users, such as [KeePass(X)][1].
在基于密码的认证在网络盛行的今天，你可能需要或者已经使用了某种密码管理工具来跟踪管理你正在使用的所有密码。有各种各样的在线或离线服务或者软件工具用于完成此类事情，而这些工具因复杂程度、用户界面或者目标环境（如企业或终端用户）的不同而各不相同。例如，有一些是为终端用户开发基于图形化的密码管理器，如[KeePass(X)][1]。
For those of you who do not want any kind of GUI dependency for password management, I will describe how to manage passwords from the command line by using [pass][2], **a simple command-line utility for password management**.
对于那些不想要依赖图形化进行密码管理的用户，笔者将会讲述如何在命令行下使用 [pass][2]来管理密码，**这是一个简单的用于命令行管理密码的工具**。
The pass utility is in fact a shell script frontend which uses several other tools (e.g., gpg, pwgen, git, xsel) to manage user's password info using OpenPGP. Each password is encrypted with gpg utility, and stored in a local password store. Password info can be retrieved either via terminal or self-clearing clipboard interface.
该密码工具实际上是一个shell脚本编写的前端，其中调用了几个其它工具（如gpg，pwgen，git，xsel）来使用OpenGPG管理用户的密码信息。各个密码使用gpg工具进行加密，并存储到本地密码仓库中。密码信息可以通过终端或者自清除的剪贴板工具取回。
The pass utility is quite flexible and extremely simple to use. You can store each password info in an OpenPGP-protected plain text file, and group different password files into multiple categories. It supports bash auto completion feature, so it is very convenient to fill in commands or long password names using TAB key.
该密码工具相当灵活，并且使用起来及其简单。你可以将各个密码信息存储到一个OpenGPG保护的普通文本文件，并且将密码文件分组放到多个类目中。它支持bash自动补全特性，因此可以很方便地使用TAB键来补全命令或者很长的秘密名称。
### Install pass on Linux ###
### 在Linux上安装pass ###
To install pass on Debian, Ubuntu or Linux Mint:
在Debian，Ubuntu或者Linux Mint上安装pass：

    $ sudo apt-get install pass
    $ echo "source /etc/bash_completion.d/password-store" >> ~/.bashrc

To install pass on Fedora:
在Fedora上安装pass：

    $ sudo yum install pass
    $ echo "source /etc/bash_completion.d/password-store" >> ~/.bashrc

To install pass on CentOS, first [enable EPEL repository][3] and then run:
在CentOS上安装pass，首先[启用EPEL仓库][3]，然后执行以下命令：

    $ sudo yum install pass
    $ echo "source /etc/bash_completion.d/password-store" >> ~/.bashrc

To install pass on Archlinux:
在Archlinux上安装pass：

    $ sudo pac -S pass
    $ echo "source /etc/bash_completion.d/password-store" >> ~/.bashrc

### Initialize Local Password Store ###
### 初始化本地密码仓库 ###
Before using pass utility, you need to do one-time initialization step which involves creating a GPG key pair (if you don't have one) and a local password store.
在使用密码工具之前，你需要执行一次初始化步骤，该步骤包括创建一个GPG密钥对（如果你还没有）以及一个本地密码仓库。
First, create a GPG key pair (i.e., public/private keys) as follows. If you already have your own GPG key pair, you can skip this step.
首先，通过以下步骤创建一个GPG密钥对（即：公钥/私钥）。如果已经创建了自己的GPG密钥对，可以跳过此步骤。

    $ gpg --gen-key 

It will ask you a series of questions as shown below. If you are not sure, you can accept default answers. As part of key generation, you will set a passphrase for your secret key, which is essentially the master password required to access any password info stored in local password store. A successfully generated key pair will be stored in ~/.gnupg
执行该步骤，会询问你如下问题。如果你不确定，可以选择接受默认回答。作为密钥生成部分，你将要为你的密钥创建一个加密口令，这个口令本质上是你访问存储在本地密码仓库中的任何密码信息时的主密码。成功创建密钥对后，创建的密钥对会存储在~/.gnupg目录中。
![](https://farm3.staticflickr.com/2922/13965806430_a19596da60_z.jpg)

Next, initialize the local password store by running the following command. For <gpg-id>, enter the email address associated your GPG key created above.接下来，运行以下命令来初始化本地密码仓库。对于<gpg-id>，输入上面创建密钥对时的关联电子邮件地址。


    $ pass init <gpg-id> 

This command will create a password store under ~/.password-store directory.
该命令会在~/.password-store目录中创建一个密码仓库。

### Manage Passwords from a Terminal with pass ###
### 在终端使用pass管理密码 ### 
#### Insert new password info ####
### 插入新密码信息 ### 
To insert new password info into local password store, use the following format.
要将新的密码信息插入到本地密码仓库中，请遵循以下命令格式：

    $ pass insert <password-name> 

<password-name> is an arbitrary name you define, and can be hierarchical (e.g., "finance/tdbank", "online/gmail.com"), in which case the password info will be created in corresponding sub-directories under ~/.password-store
<password-name>是你定义的专有名称，并且可以分级（如 "finance/tdbank", "online/gmail.com"）。在这种情况下，密码信息可以存储到~/.password-store目录下对应的子目录中。
If you want to insert password info as multi-lines, use "-m" option as follows. Type in password info in any format as you like, and press Ctrl+D to finish.
如果你想要分多行插入密码信息，请像以下命令一样使用"-m"选项。以你自己喜欢的任何格式来输入密码信息，然后按Ctrl+D来结束。

    $ pass insert <password-name> -m 

![](https://farm6.staticflickr.com/5564/14129264286_4315cb386b_o_d.jpg)
注：此图片暂时无法访问，不过可以直接访问flickr地址：https://www.flickr.com/photos/xmodulo/14129264286/ 文章发布的时候注意此处

#### View a list of all password names ####
#### 查看所有密码名称列表 ####

To view the list of all stored password names, simply type "pass":
要查看所有存储的密码名称列表，只需输入"pass"命令：

    $ pass 

![](https://farm3.staticflickr.com/2905/13965804498_92b0af83cf_o.jpg)

#### Retrieve password info from password store ####
#### 从密码仓库中取回密码信息 ####
To access the content of a particular password listing, simply use the command below:
要访问特定密码列表中的内容，只需使用以下命令：

    $ pass <password-name> 

For example:
例如：

    $ pass email/gmail.com 

You will be asked to enter the passphrase to unlock the secret key.
会要求你输入密码口令来解锁密钥。

If you want the password to be copied to the clipboard, instead of appearing in the terminal screen, use this command instead:
如果你想要将密码复制到剪贴板，而不是显示到终端屏幕上，使用以下命令：

    $ pass -c email/gmail.com 

Once copied to the clipboard, the password will automatically be cleared from the clipboard after 45 seconds.
一旦密码被复制到剪贴板，剪贴板在45秒后会被自动清空。

#### Generate and store a new password in password store ####
#### 在密码仓库中生成并存储新密码 ####
With `pass`, you can also generate a new random password which you can use for any purpose. pass will use pwgen utility to generate a good random password. You can specify the length of a password, or generate a password with or without symbols.
使用`pass`命令，你也可以生成一个新的随机密码，该密码可用于任何目的。pass工具将会使用pwgen工具来生成一个好的随机密码。你可以指定密码的长度，或者生成是否带有符号的密码。
For example, to generate a 10-character password with no symbol, and store it under "email/new_service.com" listing:
例如，要生成一个具有10个字符不带符号的密码，并将它存储到 "email/new_service.com"列表中：

    $ pass generate email/new_service.com 10 -n 

#### Remove password info ####
#### 移除密码信息 ####
Removing existing password info is easy:
要移除现存的密码信息是很容易的：

    $ pass rm email/gmail.com 

To summarize, pass is extremely flexible, portable, and more importantly, easy to use. I highly recommend pass to anyone looking for a simple means to organize any kind of private info in a secure fashion, without relying on GUI dependency.
针对以上小结，pass是及其灵活，便于携带，并且更为重要的是，易于使用的一个工具。对于正在寻找能简单而行之有效地，安全地并且不依赖图形化管理任何私人信息的工具的人，笔者强烈推荐pass。
--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/manage-passwords-command-line-linux.html

译者：[GOLinux](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/08/how-to-manage-multiple-passwords-on-linux.html
[2]:http://www.zx2c4.com/projects/password-store/
[3]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
