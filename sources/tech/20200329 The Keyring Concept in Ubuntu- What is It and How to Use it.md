[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Keyring Concept in Ubuntu: What is It and How to Use it?)
[#]: via: (https://itsfoss.com/ubuntu-keyring/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

The Keyring Concept in Ubuntu: What is It and How to Use it?
认识Ubuntu里的密钥环
======

If you use [automatic login in Ubuntu][1] or other Linux distributions, you might have come across a pop-up message of this sort:
如果您用过[ubuntu里的自动登录功能][1]或者其他的Linux发行版, 您可能遇到过这种弹出消息：

**Enter password to unlock your login keyring 请输入密码解锁您的登录密钥环
The login keyring did not get unlocked when you logged into your computer. 当您登录时登录密钥环未被解锁**

![Enter Password To Unlock Your Login Keyring Ubuntu][2]

It keeps on popping up several times before disappearing if you keep on clicking cancel. You may wonder why do you keep seeing this keyring message all the time?
你需要点击多次取消才能让它消失。你可能想知道为什么系统会一直提示这个密钥环消息框?

Let me tell you something. It’s not an error. It’s a security feature.
让我来告诉你答案。它其实并没有出错，它只是一个安全特性。

Surprised? Let me explain the keyring concept in Linux.
奇怪吗？下面就让我来解释下Linux里的密钥环概念。

### What is keyring in Linux and why is it used?
Linux里的密钥环是什么以及为什么需要它?

![][3]

Why do you use a keyring (also called [keychain][4]) in the real life? You use it to keep one or more keys grouped together so that they are easy to find and carry.
在现实生活中你为什么要用一个钥匙环(也叫[钥匙链][4])? 你用它把一把或多把钥匙挂到一起, 以便于携带和寻找。

It’s the same concept in Linux. The keyring feature allows your system to group various passwords together and keep it one place.
Linux里也是类似的。密钥环功能使您的系统可以将各种密码放在一起，并将其保存在一个地方。

Most desktop environments like GNOME, KDE, Xfce etc use an implementation of [gnome-keyring][5] to provide this keyring feature in Linux.
大多数Linux桌面环境像GNOME, KDE, Xfce等采用[gnome的密钥环][5]实现来提供这个功能。

This keyring keeps your ssh keys, GPG keys and keys from applications that use this feature, like Chromium browser. By default, the **keyring is locked with a master password** which is often the login password of the account.
该密钥环保存了ssh密钥，GPG密钥以及使用此功能的应用程序（例如Chromium浏览器）的密钥。 默认情况下，**“密钥环”通过主密码来保护**，该密码通常是帐户的登录密码。

Every user on your system has its own keyring with (usually) the same password as that of the user account itself. When you login to your system with your password, your keyring is unlocked automatically with your account’s password.
系统上的每个用户都有自己的密钥环，（通常）密码与用户帐户本身的密码相同。 当您使用密码登录系统时，您的密匙环将使用您帐户的密码自动解锁。

The problem comes when you [switch to auto-login in Ubuntu][1]. This means that you login to the system without entering the password. In such case, your keyring is not unlocked automatically.
当您[启用Ubuntu中的自动登录功能时][1]时，就有问题了。这意味着您无需输入密码即可登录系统。 在这种情况下，您的密钥环不会自动解锁。

#### Keyring is a security feature 密钥环是一个安全特性

Remember I told you that the keyring was a security feature? Now imagine that on your Linux desktop, you are using auto-login. Anyone with access to your desktop can enter the system without password but you have no issues with that perhaps because you use it to browse internet only.
记得我说过密钥环是一个安全特性吗？现在想象一下您在您的Linux电脑上开启了自动登录功能。有权访问您电脑的任何人无需密码就能进入您的系统。但是您可能不会在意，因为您只是用它来访问互联网。

But if you use a browser like Chromium or [Google Chrome in Ubuntu][6], and use it to save your login-password for various websites, you have an issue on your hand. Anyone can use the browser and login to the websites for which you have saved password in your browser. That’s risky, isn’t it?
但是，如果您使用Chromium或[Ubuntu中的Google Chrome][6]之类的浏览器，并使用它来保存各种网站的登录密码，那么您将遇到麻烦。任何人都可以使用浏览器并利用您在浏览器中保存的密码登录网站。那不就是风险吗？

This is why when you try to use Chrome, it will ask you to unlock the keyring repeatedly. This ensures that only the person who knows the keyring’s password (i.e. the account password) can use the saved password in browser for logging in to their respective websites.
这就是为什么当您使用Chrome时，它将重复地提示您先解锁密钥环。这确保了只有知道密钥环密码的人才能使用在浏览器中保存的密码来登录它们相关联的网站。

If you keep on cancelling the prompt for keyring unlock, it will eventually go away and let you use the browser. However, the saved password won’t be unlocked and you’ll see ‘sync paused’ in Chromium/Chrome browsers.
如果您继续取消解锁密钥环的提示，它最终将消失并允许您使用浏览器。但是，保存的密码将不会被解锁，您在Chromium/Chome浏览器上将会看到'同步暂停'的提示。

![Sync paused in Google Chrome][7]

#### If this keyring always exited, why you never saw it? 如果密钥环总是存在的，为什么您从来没有见过它呢?

That’s a valid question if you have never seen this keyring thing in your Linux system.
如果您在您的Linux系统上从没见过它的话，这就是一个有效的问题。

If you never used automatic login (or changed your account’s password), you might not even have realized that this feature exists.
如果您从没有用过自动登录功能(或者修改您的账户密码)，您可能都没有意识到这个特性的存在。

This is because when you login to your system with your password, your keyring is unlocked automatically with your account’s password.
这是因为当您通过您的密码登录系统时，您的密钥环被您的账户密码自动解锁了。

Ubuntu (and other distributions) asks for password for common admin tasks like modifying users, installing new software etc irrespective of whether you auto login or not. But for regular tasks like using a browser, it doesn’t ask for password because keyring is already unlocked.
Ubuntu(和其他发行版)对于通用的管理任务像修改用户, 安装新软件等需要输入密码，无论您是否是自动登录的。但是对于日常任务像使用浏览器，它不需要输入密码因为密钥环已经被解锁了。

When you switch to automatic login, you don’t enter the password for login anymore. This means that the keyring is not unlocked and hence when you try to use a browser which uses the keyring feature, it will ask to unlock the keyring.
当您切换到自动登录时，您不再需要输入登录密码。这意味着密钥环没有被自动解锁，因此当您使用利用了密钥环特性的浏览器时，它将提示您来解锁密钥环。

#### You can easily manage the keyring and passwords 您可以容易地管理密钥环和密码

Where is this keyring located? At the core, it’s a daemon (a program that runs automatically in the background).
这个密钥环放在哪里？它的核心是一个守护任务(一个后台自动运行的程序)。

Don’t worry. You don’t have to ‘fight the daemon’ in the terminal. Most desktop environments come with a graphical application that interacts with this daemon. On KDE, there is KDE Wallet, on GNOME and others, it’s called Password and Keys (originally known as [Seahorse][8]).
别担心。您不必通过终端来操作守护任务。大多数桌面环境都自带有图形化的应用程序可以和守护进程进行交互。KDE上有KDE钱包，GNOME和其他桌面上叫做密码和密钥(原来叫[海马][8])。

![Password And Keys App in Ubuntu][9] Ubuntu上的密码和密钥App

You can use this GUI application to see what application use the keyring to manage/lock passwords.
您可以用这个GUI程序来查看什么应用程序在用密钥环来管理/保护密码。

As you can see, my system has the login keyring which is automatically created. There is also a keyrings for storing GPG and SSH keys. The [Certificates][10] is for keeping the certificates (like HTTPS certificates) issued by a certificate authority.
您可以看到，我的系统有自动创建的登录密钥环。也有一个存储GPG和SSH密钥的密钥环。那个[证书][10]是用来保存证书机构颁发的证书(像HTTPS证书)的。

![Password and Keys application in Ubuntu][11] Ubuntu上的密码和密钥应用程序

You can also use this application to manually store passwords for website. For example, I created a new password-protected keyring called ‘Test’ and stored a password in this keyring manually.
您也可以使用这个应用程序来手动保存网站的密码。例如，我创建了一个新的叫做'Test'的被密码保护的密钥环，并手动存储了一个密码。

This is slightly better than keeping a list of passwords in a text file. At least in this case your passwords can be viewed only when you unlock the keyring with password.
这比保存一批密码在一个文本文件中要好一些。至少在这种情况下，您的密码只有在您通过密码解锁了密钥环时才允许被看到。

![Saving New Password Seahorse][12] 

One potential problem here is that if you format your system, the manually saved passwords are definitely lost. Normally, you make backup of personal files, not of all the user specific data such as keyring files.
一个潜在的问题是如果您格式化您的系统，手动保存的密码必然会丢失。通常，您会备份您的个人文件，但并不是所有的用户特定数据如密钥环文件。

There is way to handle that. The keyring data is usually stored in ~/.local/share/keyrings directory. You can see all the keyrings here but you cannot see its content directly. If you remove the password of the keyring (I’ll show the steps in later section of this article), you can read the content of the keyring like a regular text file. You can copy this unlocked keyring file entirely and import it in the Password and Keys application on some other Linux computer (running this application).
有一种办法能解决它。密钥环数据通常保存在~/.local/share/keyrings目录。在这里您可以看到所有的密钥环但是您不能直接看到它们的内容。如果您移除密钥环的密码(我会在这篇文章的后面描述操作步骤)，您可以像一个普通的文本文件一样读取密钥环的内容。您可以完整地拷贝这个解锁后的密钥环文件并在其他的Linux机器(安装了密码和密钥应用)上导入到密码和密钥应用程序。

So, let me summarize what you have learned so far:
来总结一下目前为止所学的内容：
  * Most Linux has this ‘keyring feature’ installed and activated by default 大多数Linux缺省已经安装并激活了密钥环特性
  * Each user on a system has its own keyring 系统上的每个用户都拥有他自己的密钥环
  * The keyring is normally locked with the account’s password 密钥环通常被账户密码锁定(保护)
  * Keyring is unlocked automatically when you login with your password 当您通过密码登录时密钥环会被自动解锁
  * For auto-login, the keyring is not unlocked and hence you are asked to unlock it when you try to use an application that uses keyring 对于自动登录，密钥环不会自动解锁，因此当您试图使用依赖密钥环的应用程序时会被提示先解锁它
  * Not all browsers or application use the keyring feature 并不是所有的浏览器或应用程序利用了密钥环特性
  * There is a GUI application installed to interact with keyring (Linux上)安装了一个GUI程序可以和密钥环交互
  * You can use the keyring to manually store passwords in encrypted format 您可以用密钥环来手动以加密格式来存储密码
  * You can change the keyring password on your own 您可以自己修改密钥环密码
  * You can export (by unlocking the keyring first) and import it on some other computer to get your manually saved passwords 您可以通过导出(需要先解锁密钥环)并导入(到其他计算机上)的方式来获取手工保存的密码。



### Change keyring password 修改密钥环密码

Suppose you changed your account password. Now when you login, your system tries to unlock the keyring automatically using the new login password. But the keyring still uses the old login password.
假设您修改了您的账户密码。当您登录时，您的系统试图通过新的登录密码来自动解锁密钥环。但是密钥环还在使用老的登录密码。

In such a case, you can change the keyring password to the new login password so that the keyring gets unlocked automatically as soon as you login to your system.
这种情况下，您可以修改密钥环密码为新的登录密码，这样密码环才能在您登录系统时自动解锁。

Open the Password and Keys application from the menu:
从菜单中打开密码和密钥应用程序：

![Look for Password and Keys app in the menu][9]

Now, right click on the Login keyring and click on Change Password:
在登录密钥环上右击并点击修改密码：

![Change Keyring Password][13]

What if you don’t remember the old login password?
如果您不记得老的登录密码怎么办？

You probably know that it is [easy to reset forgotten password in Ubuntu][14]. The problem comes with the keyring in such cases. You changed the account password but you don’t remember the old account password that is still used by the keyring.
您可能知道[Ubuntu上复位忘记的密码是很容易的][14]。但是密钥环在这种场景下还是有问题。您修改了账户密码但是您不记得仍然被密钥环使用的老的账户密码。

Now you cannot change it because you don’t know the old password. What to do now?
您不能修改它因为您不知道老的密码。怎么办？

In such a case, you’ll have to remove the entire keyring itself. You can do that from the Passwords and Keys application:
这种情况下，您将不得不移除整个密钥环。您可以通过密码和密钥应用程序来操作：

![Delete Keyring Ubuntu][15]

It will ask for your confirmation:
它会提示您进行确认：

![Delete Keyring][16]

Alternatively, you may also manually delete the keyring files in ~/.local/share/keyrings directory.
另外，您也可以手动删除~/.local/share/keyrings目录下的密钥环文件。

When the old keyring is removed and you try to use Chrome/Chromium, it will ask you to create new keyring.
老的密钥环文件被移除后，您再打开Chrome/Chromium时，它会提示您创建一个新的密钥环。

![New Keyring Password][17]

You can use the new login password so that the keyring gets unlocked automatically.
您可以用新的登录密码，密钥环就会被自动解锁了。

### Disable keyring password 禁用密钥环密码

In cases where you want to use automatic login but don’t want to unlockk keyring manually, you may choose to disable the keyring with a workaround. Keep in mind that you are disabling a security feature so think twice before doing so.
在您想用自动登录但又不想手动解锁密钥环时，您可以把禁用密钥环密码作为一个规避方法。记住您正在禁用一个安全特性，因此请三思。

The process is similar to changing keyring password. Open Password and Keys application and go on to change the keyring password.
操作步骤和修改密钥环相似。打开密码和密钥应用程序，然后修改密钥环密码。

The trick is that when it asks to change the password, don’t enter a new password and hit Continue instead. This will remove any password from the keyring.
技巧在于当它提示修改密码时，不要输入新密码，而是点击继续按钮。这将移除密钥环的密码。

![Disable Keyring password by not setting any password at all][18]

This way, the keyring will have no password and it remains unlocked all the time.
这种方法，密钥环没有密码保护并将一直处于解锁状态。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-keyring/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-automatic-logon/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/enter-password-to-unlock-your-login-keyring-ubuntu.jpg?ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/keyring-concept-ubuntu-1.png?ssl=1
[4]: https://en.wikipedia.org/wiki/Keychain
[5]: https://wiki.archlinux.org/index.php/GNOME/Keyring
[6]: https://itsfoss.com/install-chrome-ubuntu/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/sync-paused-keyring-ubuntu.jpg?ssl=1
[8]: https://wiki.debian.org/Seahorse
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/password-and-keys-app-ubuntu.jpg?ssl=1
[10]: https://help.ubuntu.com/lts/serverguide/certificates-and-security.html
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/keyring-pasword-ubuntu.png?ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/saving-new-password-seahorse.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/change-keyring-password.png?ssl=1
[14]: https://itsfoss.com/how-to-hack-ubuntu-password/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/delete-keyring-ubuntu.jpg?ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/delete-keyring.jpg?ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/new-keyring-password.jpg?ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/disable-keyring-password-ubuntu.png?ssl=1
