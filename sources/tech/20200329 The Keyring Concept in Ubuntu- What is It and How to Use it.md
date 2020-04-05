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
如果你使用ubuntu里的自动登录功能或者其他的Linux发行版, 你可能遇到过这种弹出消息：

**Enter password to unlock your login keyring 请输入密码解锁你的登录密钥环
The login keyring did not get unlocked when you logged into your computer. 当你登录时登录密钥环未被解锁**

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
在现实生活中你为什么要用一个钥匙环(也叫钥匙链)? 你用它把一把或多把钥匙挂到一起, 以便于携带和寻找。

It’s the same concept in Linux. The keyring feature allows your system to group various passwords together and keep it one place.
Linux里也是类似的。密钥环功能使您的系统可以将各种密码放在一起，并将其保存在一个地方。

Most desktop environments like GNOME, KDE, Xfce etc use an implementation of [gnome-keyring][5] to provide this keyring feature in Linux.
大多数Linux桌面环境像GNOME, KDE, Xfce等采用gnome的密钥环实现来提供这个功能。

This keyring keeps your ssh keys, GPG keys and keys from applications that use this feature, like Chromium browser. By default, the **keyring is locked with a master password** which is often the login password of the account.
该密钥环保存了ssh密钥，GPG密钥以及使用此功能的应用程序（例如Chromium浏览器）的密钥。 默认情况下，**“密钥环”通过主密码来保护**，该密码通常是帐户的登录密码。

Every user on your system has its own keyring with (usually) the same password as that of the user account itself. When you login to your system with your password, your keyring is unlocked automatically with your account’s password.
系统上的每个用户都有自己的密钥环，（通常）密码与用户帐户本身的密码相同。 当您使用密码登录系统时，您的密匙环将使用您帐户的密码自动解锁。

The problem comes when you [switch to auto-login in Ubuntu][1]. This means that you login to the system without entering the password. In such case, your keyring is not unlocked automatically.
当您[启用Ubuntu中的自动登录功能时][1]时，就有问题了。这意味着您无需输入密码即可登录系统。 在这种情况下，您的密钥环不会自动解锁。

#### Keyring is a security feature

Remember I told you that the keyring was a security feature? Now imagine that on your Linux desktop, you are using auto-login. Anyone with access to your desktop can enter the system without password but you have no issues with that perhaps because you use it to browse internet only.

But if you use a browser like Chromium or [Google Chrome in Ubuntu][6], and use it to save your login-password for various websites, you have an issue on your hand. Anyone can use the browser and login to the websites for which you have saved password in your browser. That’s risky, isn’t it?

This is why when you try to use Chrome, it will ask you to unlock the keyring repeatedly. This ensures that only the person who knows the keyring’s password (i.e. the account password) can use the saved password in browser for logging in to their respective websites.

If you keep on cancelling the prompt for keyring unlock, it will eventually go away and let you use the browser. However, the saved password won’t be unlocked and you’ll see ‘sync paused’ in Chromium/Chrome browsers.

![Sync paused in Google Chrome][7]

#### If this keyring always exited, why you never saw it?

That’s a valid question if you have never seen this keyring thing in your Linux system.

If you never used automatic login (or changed your account’s password), you might not even have realized that this feature exists.

This is because when you login to your system with your password, your keyring is unlocked automatically with your account’s password.

Ubuntu (and other distributions) asks for password for common admin tasks like modifying users, installing new software etc irrespective of whether you auto login or not. But for regular tasks like using a browser, it doesn’t ask for password because keyring is already unlocked.

When you switch to automatic login, you don’t enter the password for login anymore. This means that the keyring is not unlocked and hence when you try to use a browser which uses the keyring feature, it will ask to unlock the keyring.

#### You can easily manage the keyring and passwords

Where is this keyring located? At the core, it’s a daemon (a program that runs automatically in the background).

Don’t worry. You don’t have to ‘fight the daemon’ in the terminal. Most desktop environments come with a graphical application that interacts with this daemon. On KDE, there is KDE Wallet, on GNOME and others, it’s called Password and Keys (originally known as [Seahorse][8]).

![Password And Keys App in Ubuntu][9]

You can use this GUI application to see what application use the keyring to manage/lock passwords.

As you can see, my system has the login keyring which is automatically created. There is also a keyrings for storing GPG and SSH keys. The [Certificates][10] is for keeping the certificates (like HTTPS certificates) issued by a certificate authority.

![Password and Keys application in Ubuntu][11]

You can also use this application to manually store passwords for website. For example, I created a new password-protected keyring called ‘Test’ and stored a password in this keyring manually.

This is slightly better than keeping a list of passwords in a text file. At least in this case your passwords can be viewed only when you unlock the keyring with password.

![Saving New Password Seahorse][12]

One potential problem here is that if you format your system, the manually saved passwords are definitely lost. Normally, you make backup of personal files, not of all the user specific data such as keyring files.

There is way to handle that. The keyring data is usually stored in ~/.local/share/keyrings directory. You can see all the keyrings here but you cannot see its content directly. If you remove the password of the keyring (I’ll show the steps in later section of this article), you can read the content of the keyring like a regular text file. You can copy this unlocked keyring file entirely and import it in the Password and Keys application on some other Linux computer (running this application).

So, let me summarize what you have learned so far:

  * Most Linux has this ‘keyring feature’ installed and activated by default
  * Each user on a system has its own keyring
  * The keyring is normally locked with the account’s password
  * Keyring is unlocked automatically when you login with your password
  * For auto-login, the keyring is not unlocked and hence you are asked to unlock it when you try to use an application that uses keyring
  * Not all browsers or application use the keyring feature
  * There is a GUI application installed to interact with keyring
  * You can use the keyring to manually store passwords in encrypted format
  * You can change the keyring password on your own
  * You can export (by unlocking the keyring first) and import it on some other computer to get your manually saved passwords



### Change keyring password

Suppose you changed your account password. Now when you login, your system tries to unlock the keyring automatically using the new login password. But the keyring still uses the old login password.

In such a case, you can change the keyring password to the new login password so that the keyring gets unlocked automatically as soon as you login to your system.

Open the Password and Keys application from the menu:

![Look for Password and Keys app in the menu][9]

Now, right click on the Login keyring and click on Change Password:

![Change Keyring Password][13]

What if you don’t remember the old login password?

You probably know that it is [easy to reset forgotten password in Ubuntu][14]. The problem comes with the keyring in such cases. You changed the account password but you don’t remember the old account password that is still used by the keyring.

Now you cannot change it because you don’t know the old password. What to do now?

In such a case, you’ll have to remove the entire keyring itself. You can do that from the Passwords and Keys application:

![Delete Keyring Ubuntu][15]

It will ask for your confirmation:

![Delete Keyring][16]

Alternatively, you may also manually delete the keyring files in ~/.local/share/keyrings directory.

When the old keyring is removed and you try to use Chrome/Chromium, it will ask you to create new keyring.

![New Keyring Password][17]

You can use the new login password so that the keyring gets unlocked automatically.

### Disable keyring password

In cases where you want to use automatic login but don’t want to unlockk keyring manually, you may choose to disable the keyring with a workaround. Keep in mind that you are disabling a security feature so think twice before doing so.

The process is similar to changing keyring password. Open Password and Keys application and go on to change the keyring password.

The trick is that when it asks to change the password, don’t enter a new password and hit Continue instead. This will remove any password from the keyring.

![Disable Keyring password by not setting any password at all][18]

This way, the keyring will have no password and it remains unlocked all the time.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-keyring/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
