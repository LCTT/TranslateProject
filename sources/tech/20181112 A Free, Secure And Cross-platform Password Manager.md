A Free, Secure And Cross-platform Password Manager
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-Password-Manager-720x340.png)

In this modern Internet era, you will surely have multiple accounts on lot of websites. It could be a personal or official mail account, social or professional network account, GitHub account, and ecommerce account etc. So you should have several different passwords for different accounts. I am sure that you are already aware that setting up same password to multiple accounts is crazy and dangerous practice. If an attacker managed to breach one of your accounts, it’s highly likely he/she will try to access other accounts you have with the same password. So, it is **highly recommended to set different passwords** to different accounts.

However, remembering several passwords might be difficult. You can write them in a paper. But it is not an efficient method either and you might lose them over a period of time. This is where the password managers comes in help. The password managers are like a repository where you can store all your passwords for different accounts and lock them down with a master password. By this way, all you need to remember is just the master password. We already have reviewed an open source password manager named [**KeeWeb**][1]. Today, we are going to see yet another password manager called **Buttercup**.

### About Buttercup

Buttercup is a free, open source, secure and cross-platform password manager written using **NodeJS**. It helps you to store all your login credentials of different accounts in an encrypted archive, which can be stored in your local system or any remote services like DropBox, ownCloud, NextCloud and WebDAV-based services. It uses strong **256bit AES encryption** method to save your sensitive data with a master password. So, no one can access your login details except those who have the master password. Buttercup currently supports Linux, Mac OS and Windows. It is also available a browser extension and mobile app. so, you can access the same archive you use on the desktop application and browser extension in your Android or iOS devices as well.

### Installing Buttercup Password Manager

Buttercup is currently available as **.deb** , **.rpm** packages, portable AppImage and tar archives for Linux platform. Head over to the [**releases pages**][2] and download and install the version you want to use.

Buttercup desktop application is also available in [**AUR**][3], so you can install on Arch-based systems using AUR helper programs, such as [**Yay**][4], as shown below:

```
$ yay -S buttercup-desktop
```

If you have downloaded the portable AppImage file, make it executable using command:

```
$ chmod +x buttercup-desktop-1.11.0-x86_64.AppImage
```

Then, launch it using command:

```
$ ./buttercup-desktop-1.11.0-x86_64.AppImage
```

Once you run this command, it will prompt whether you like to integrate Buttercup AppImage with your system. If you choose ‘Yes’, this will add it to your applications menu and install icons. If you don’t do this, you can still launch the application by double-clicking on the AppImage or using the above command from the Terminal.

### Add archives

When you launch it for the first time, you will see the following welcome screen:
![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-1.png)

We haven’t added any archives yet, so let us add one. To do so, click on the “New Archive File” button and type the name of the archive file and choose the location to save it.
![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-2.png)

You can name it as you wish. I named it mine as “mypass”. The archives will have extension **.bcup** at the end and saved in the location of your choice.

If you already have created one, simply choose it by clicking on “Open Archive File”.

Next, buttercup will prompt you to enter a master password to the newly created archive. It is recommended to provide a strong password to protect the archives from the unauthorized access.

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-3.png)

We have now created an archive and secured it with a master password. Similarly, you can create any number of archives and protect them with a password.

Let us go ahead and add the account details in the archives.

### Adding entries (login credentials) in the archives

Once you created or opened the archive, you will see the following screen.

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-4.png)

It is like a vault where we are going to save our login credentials of different online accounts. As you can see, we haven’t added any entries yet. Let us add some.

To add a new entry, click “ADD ENTRY” button on the lower right corner and enter your account information you want to save.

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-5-1.png)

If you want to add any extra detail, there is an “ADD NEW FIELD” option right under the each entry. Just click on it and add as many as fields you want to include in the entries.

Once you added all entries, you will see them on the right pane of the Buttercup interface.

![][6]

### Creating new groups

You can also group login details under different name for easy recognition. Say for example, you can group all your mail accounts under a distinct name named “my_mails”. By default, your login details will be saved under “General” group. To create a new group, click “NEW GROUP” button and provide the name for the group. When creating new entries inside a new group, just click on the group name and start adding the entries as shown above.

### Manage and access login details

The data stored in the archives can be edited, moved to different groups, or entirely deleted at anytime. For instance, if you want to copy the username or password to clipboard, right click on the entry and choose “Copy to Clipboard” option.

![][7]

To edit/modify the data in the future, just click “Edit” button under the selected entry.

### Save archives on remote location

By default, Buttercup will save your data on the local system. However, you can save them on different remote services, such as Dropbox, ownCloud/NextCloud, WebDAV-based service.

To connect to these services, go to **File - > Connect Cloud Sources**.

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-8.png)

And, choose the service you want to connect and authorize it to save your data.

![][8]

You can also connect those services from the Buttercup welcome screen while adding the archives.

### Import/Export

Buttercup allows you to import or export data to or from other password managers, such as 1Password, Lastpass and KeePass. You can also export your data and access them from another system or device, for example on your Android phone. You can export Buttercup vaults to CSV format as well.

![][9]

Buttercup is a simple, yet mature and fully functional password manager. It is being actively developed for years. If you ever in need of a password manager, Buttercup might a good choice. For more details, refer the project website and github page.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/buttercup-a-free-secure-and-cross-platform-password-manager/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/keeweb-an-open-source-cross-platform-password-manager/
[2]: https://github.com/buttercup/buttercup-desktop/releases/latest
[3]: https://aur.archlinux.org/packages/buttercup-desktop/
[4]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[6]: http://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-6.png
[7]: http://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-7.png
[8]: http://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-9.png
[9]: http://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-10.png
