KeeWeb – An Open Source, Cross Platform Password Manager
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/keeweb-720x340.png)

If you’ve been using the internet for any amount of time, chances are, you have a lot of accounts on a lot of websites. All of those accounts must have passwords, and you have to remember all those passwords. Either that, or write them down somewhere. Writing down passwords on paper may not be secure, and remembering them won’t be practically possible if you have more than a few passwords. This is why Password Managers have exploded in popularity in the last few years. A password Manager is like a central repository where you store all your passwords for all your accounts, and you lock it with a master password. With this approach, the only thing you need to remember is the Master password.

**KeePass** is one such open source password manager. KeePass has an official client, but it’s pretty barebones. But there are a lot of other apps, both for your computer and for your phone, that are compatible with the KeePass file format for storing encrypted passwords. One such app is **KeeWeb**.

KeeWeb is an open source, cross platform password manager with features like cloud sync, keyboard shortcuts and plugin support. KeeWeb uses Electron, which means it runs on Windows, Linux, and Mac OS.

### Using KeeWeb Password Manager

When it comes to using KeeWeb, you actually have 2 options. You can either use KeeWeb webapp without having to install it on your system and use it on the fly or simply install KeeWeb client in your local system.

**Using the KeeWeb webapp**

If you don’t want to bother installing a desktop app, you can just go to [**https://app.keeweb.info/**][1] and use it as a password manager.

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-webapp.png)

It has all the features of the desktop app. Obviously, this requires you to be online when using the app.

**Installing KeeWeb on your Desktop**

If you like the comfort and offline availability of using a desktop app, you can also install it on your desktop.

If you use Ubuntu/Debian, you can just go to [**releases pages**][2] and download KeeWeb latest **.deb** file, which you can install via this command:

```
$ sudo dpkg -i KeeWeb-1.6.3.linux.x64.deb

```

If you’re on Arch, it is available in the [**AUR**][3], so you can install using any helper programs like [**Yay**][4]:

```
$ yay -S keeweb

```

Once installed, launch it from Menu or application launcher. This is how KeeWeb default interface looks like:

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-desktop-client.png)

### General Layout

KeeWeb basically shows a list of all your passwords, along with all your tags to the left. Clicking on a tag will filter the list to only passwords of that tag. To the right, all the fields for the selected account are shown. You can set username, password, website, or just add a custom note. You can even create your own fields and mark them as secure fields, which is great when storing things like credit card information. You can copy passwords by just clicking on them. KeeWeb also shows the date when an account was created and modified. Deleted passwords are kept in the trash, where they can be restored or permanently deleted.

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-general-layout.png)

### KeeWeb Features

**Cloud Sync**

One of the main features of KeeWeb is the support for a wide variety of remote locations and cloud services.
Other than loading local files, you can open files from:

  1. WebDAV Servers
  2. Google Drive
  3. Dropbox
  4. OneDrive



This means that if you use multiple computers, you can synchronize the password files between them, so you don’t have to worry about not having all the passwords available on all devices.

**Password Generator**

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-password-generator.png)

Along with encrypting your passwords, it’s also important to create new, strong passwords for every single account. This means that if one of your account gets hacked, the attacker won’t be able to get in to your other accounts using the same password.

To achieve this, KeeWeb has a built-in password generator, that lets you generate a custom password of a specific length, including specific type of characters.

**Plugins**

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-plugins.png)

You can extend KeeWeb functionality with plugins. Some of these plugins are translations for other languages, while others add new functionality, like checking **<https://haveibeenpwned.com>** for exposed passwords.

**Local Backups**

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-backup.png)

Regardless of where your password file is stored, you should probably keep local backups of the file on your computer. Luckily, KeeWeb has this feature built-in. You can backup to a specific path, and set it to backup periodically, or just whenever the file is changed.


### Verdict

I have actually been using KeeWeb for several years now. It completely changed the way I store my passwords. The cloud sync is basically the feature that makes it a done deal for me. I don’t have to worry about keeping multiple unsynchronized files on multiple devices. If you want a great looking password manager that has cloud sync, KeeWeb is something you should look at.



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/keeweb-an-open-source-cross-platform-password-manager/

作者：[EDITOR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[1]: https://app.keeweb.info/
[2]: https://github.com/keeweb/keeweb/releases/latest
[3]: https://aur.archlinux.org/packages/keeweb/
[4]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
