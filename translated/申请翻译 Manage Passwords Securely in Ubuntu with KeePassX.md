保护密码的利器：Ubuntu 之 KeePassX
================================================================================
**With security issues becoming more and more important, the emphasis on secure passwords (as well as other methods like multiple step authentication) has never been greater.**

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/security-key.jpg)

With that in mind I recently tried out several secure password managers to try and find something secure, but also easy to use and cross-platform.

First, I went to [LastPass][1]. It’s probably the most known tool for managing your passwords, and since it’s based on the web, it’s the most **cross platform** of them all. However, I found the interface lacking, and the number of tools and options on offer was overwhelming.

Next, I tried [KeePass 2][2]. While this is a perfectly capable app, 
very similar to the tool I’m going to talk about in a minute, it doesn’t provide official Linux packages, 
and the community ports, while serviceable, aren’t the nicest looking apps out there. So I tried other apps.

My favourite of all those I tested was **KeePassX**. It started out as a Linux port of KeePass, 
but eventually evolved as its own app. It bests KeePass 2 with a nicer, more native looking interface.
在所有的试用过的软件中，我最喜欢的是**KeePassX**. KeePassX起初是作为linux的一个分支，但是后来逐渐演变为属于自己的应用程序。
凭借更漂亮、更为本地化的接口，KeePassX 2 打败了KeePass 2。
## Using KeePassX in Ubuntu ##

Conveniently, KeePassX already has packages in Ubuntu available for installation.
更为方便的是，KeePassX已经提供在ubuntu上安装的人软件包。

Install keepassx from the command line or **install it from the Software Centre**:
从命令行安装KeePassX或者**从软件管理中心安装**：
- [Install KeePassX from the Ubuntu Software Centre][3]

When you open it, you’ll see a blank window. Use the first button on the toolbar to create a new database. 
You can either protect it by using key files, or a password. You probably want a password 
which is quite easy to remember and type — you’ll be typing it in a lot,
 but on the other hand you don’t want anyone else accessing your database.
打开它，你会看到一个空白窗口。点击工具条上的按钮创建一个数据库。可以使用密钥文件或者密码保护刚刚创建的数据库。
你很可能使用密码，因为只需要记住它并输入就行了 - 你可能会键入许多字符，但是另一方面，你不会让其他人进入你的数据库。


Next, you need to save it somewhere. I saved mine in my Dropbox, so I can access it from multiple locations. 
Dropbox uses two factor authentication, so if anyone wants to get into my Dropbox to access this database, 
they’ll also need to have my phone, which makes the process secure enough.
接下来，你得把它存到某个位置。我保存在我的Dropbox里面，这样我可以从多个地方获取。Dropbox使用双重认证，所以如果有人想进到我的
Dropbox里面，他就得用到我的手机，这样的方式是相当安全的。

Alternatively, you can use other services like Google Drive and Skydrive which both use standard [Authenticator][4] apps, 
or Box which uses SMS for two factor authentication.
另外，你可以使用其他的服务，比如Google Drive和Skydrive，它们都使用标准认证器[4];再比如Box，Box使用SMS进行双重认证。

Of course, if you’re **really** worried about your passwords, 
you probably won’t want to save it where other parties can theoretically access it.
当然，如果**的的确确**担心自己的密码，你很可能不打算把密码存到其他的一些组织团体，因为理论上密码是可以被他们获取到的。
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/Screenshot-from-2013-10-11-190130.png)

*The main screen of KeePassX in Ubuntu*
*Ubuntu中KeePassX的主界面*

Using the app is actually pretty straightforward. You can add groups, and into those groups you can add keys.
 KeePassX includes a handy password generator whenever you need to input a password. 
 I tend to generate my passwords with all the basic characters and special characters selected as well, 
 at 20 characters long, but that of course depends on what the website accepts.
使用该应用还是相当直接的。你可以添加分组，然后在分组里添加密码。KeePassX带有一个很方便的密码生成器，
当你需要输入一个密码的时候可以使用该生成器，而不用自己构思一个。我倾向于使用所有基本的字符以及挑选的特殊的字符来生成密码，
20个字符的长度，当然这得看网站接不接受了。

It’s important to note that some websites don’t always tell you how long a password they’ll accept, 
and opt to just put a limit on the input box. If your pasted in password doesn’t quite look long enough,
 it probably isn’t. It’s happened to me a few times.
需要注意一点，有些网站并不告诉你他们接受多长字符的密码，而且倾向于只在输入框限制输入。如果你粘贴进去的密码看起来没那么长，
事实上可能不是那么一回事，也有可能是被截断了。这种情况我碰到过几次。
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/Screenshot-from-2013-10-11-190025.png)

*KeePassX password generator*
*KeePassX 密码生成器*

n my everyday usage of KeePassX, I’ve noticed a few things that should make using it a bit easier:
根据日常的使用经验，我积累了一些小的技巧，使得操作KeePassX更简单一些。

**Copy & Paste Paranoia**
**疯狂地复制粘贴**

You might be worried about the notion of copying and pasting passwords.
 It sure is more efficient than typing them out manually. By default, 
 KeePassX clears the clipboard about a minute, 
 but you can shrink this in the settings. 
 You don’t need to be worried about someone else pasting the password 
 and viewing it on your computer. 
 You can also use a feature called AutoType, which types your password automatically, 
 but this is a bit useless since for some reason it puts the password together with the username in the same field.
像这样复制粘贴密码，你可能会比较担心。可以肯定的是这比手动输入高效多了。
默认情况下，KeePassX会在一分钟之内清空粘贴板，也可以设置更短的时间，
所以不必担心有人会在你电脑上把密码粘贴下来查看。你也可以开启一个AutoType的特性，该特性会自动输入密码，
不过出于某种原因，它会把密码紧跟着用户名输入到同一个地方，这样一来该特性似乎用处不大。
**Database Dilemma**
**数据库的困境**

If you save the database in the cloud, don’t set the password to the
 cloud service to something completely random. 
It’s no good having the password to it saved inside the cloud 
if you can’t access the cloud. It might seem obvious, 
but it’s not something I originally realised.
如果你把数据库存放到云端，就不要为云端服务设置完全随机的密码。
如果你不能进入到云，但是又把云密码存储到云里边，这是完全没有益处的。
这看起来似乎很明显，但是刚开始我却没有意识到这一点。
**SECURE ALL THE PASSWORDS**

Whipping out your phone constantly while at work or school to access your most commonly used accounts can be a pain, 
so keep that in mind when settings passwords.
为了查看经常使用的账号，工作或者学习的时候频繁地掏手机也是一件挺痛苦的事儿，所以设置密码的时候不妨想象一下这种情形，哈。
## The future ##

If you’ve looked into KeePass 2 and KeePassX previously, you might’ve noticed that they use different database formats.
如果你以前也深入了解过KeePass 2和KeePassX，或许会注意到二者使用不同的数据库格式。

KeePass 2 uses a newer version of the format, which offers things like custom fields. 
Even though KeePassX is not yet ready for the newer .kdbx format,
 a new version of it is in development which supports this format.
KeePass 2使用一种新的版本格式，比如允许自定义字段。尽管KeePassX目前还不支持新的.kdbx格式，正在开发中的新的版本会加上这一点。

You can view the new version of KeePassX, with a vastly improved interface below. 
You can also download it to compile it yourself on [GitHub][6].
可以预览一下新版本的KeePassX，界面大为改善。你也可以从GitHub上[6]下载后自己安装。
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/Screenshot-from-2013-10-11-19_33_23.png)

*Main screen of KeePassX 2.0 *
*KeePassX 2.0 主界面*
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/Screenshot-from-2013-10-11-19_34_14.png)

*Details of a single password*
*密码项的一些细节*
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/Screenshot-from-2013-10-11-19_34_44.png)

*Additional attributes of a single password *
*密码项的附加属性*
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/Screenshot-from-2013-10-11-19_35_18.png)

*Entry history, most likely replacing the ‘Backup’ folder from the previous version*
*历史登陆信息，比如从先前的版本替换掉"Backup"文件夹之类的*
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/Screenshot-from-2013-10-11-19_35_51.png)

*Settings in KeePassX 2.0 *
*KeePassX 2.0 中的配置*
## Other devices ##
## 其他建议 ##
As I said in the beggining of my post, **I was looking for something cross platform**. 
This is a great advantage of the .kdb format — there are quite a few apps currently supporting it. 
KeePassX is also much easier to get running on Mac OS X than KeePass 2, and runs fine on Windows too.
正如本文开头所说，**我在寻找能够跨平台的东西**。
这正是.kdb格式的优点 - 很多应用都支持这种格式。KeePassX 在 Mac OS X上运行起来要比KeePass 2容易得多，
在windows上也可以。
On Android I use [KeePassDroid][6], which works solidly both on my phone and tablet.
Android系统上，我使用KeePassDroid[6]，在我的手机和平板上运行都很稳定。
--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2013/10/manage-passwords-securely-keepassx

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:https://lastpass.com/
[2]:http://keepass.info/index.html
[3]:http://apt.ubuntu.com/p/keepassx
[4]:https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en
[5]:https://github.com/keepassx/keepassx
[6]:https://play.google.com/store/apps/details?id=com.android.keepass&hl=en_GB
