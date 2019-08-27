[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing credentials with KeePassXC)
[#]: via: (https://fedoramagazine.org/managing-credentials-with-keepassxc/)
[#]: author: (Marco Sarti https://fedoramagazine.org/author/msarti/)

Managing credentials with KeePassXC
======

![][1]

A [previous article][2] discussed password management tools that use server-side technology. These tools are very interesting and suitable for a cloud installation.
In this article we will talk about KeePassXC, a simple multi-platform open source software that uses a local file as a database.
The main advantage of this type of password management is simplicity. No server-side technology expertise is required and can therefore be used by any type of user.

### Introducing KeePassXC

KeePassXC is an open source cross platform password manager: its development started as a fork of KeePassX, a good product but with a not very active development. It saves the secrets in an encrypted database with AES algorithm using 256 bit key, this makes it reasonably safe to save the database in a cloud drive storage such as pCloud or Dropbox.

In addition to the passwords, KeePassXC allows you to save various information and attachments in the encrypted wallet. It also has a valid password generator that helps the user to correctly manage his credentials.

### Installation

The program is available both in the standard Fedora repository and in the Flathub repository. Unfortunately the integration with the browser does not work with the application running in the sandbox, so I suggest to install the program via dnf:
```

```

sudo dnf install keepassxc
```

```

### Creating your wallet

To create a new database there are two important steps:

  * Choose the encryption settings: the default settings are reasonably safe, increasing the transform rounds also increases the decryption time.
  * Choose the master key and additional protections: the master key must be easy to remember (if you lose it your wallet is lost!) but strong enough, a passphrase with at least 4 random words can be a good choice. As additional protection you can choose a key file (remember: you must always have it available otherwise you cannot open the wallet) and / or a YubiKey hardware key.



![][3]

![][4]

The database file will be saved to the file system. If you want to share with other computers / devices you can save it on a USB key or in a cloud storage like pCloud or Dropbox. Of course, if you choose a cloud storage, a particularly strong master password is recommended, better if accompanied by additional protection.

### Creating your first entry

Once the database has been created, you can start creating your first entry. For a web login specify a username, password and url in the Entry tab. Optionally you can specify an expiration date for the credentials based on your personal policy: also by pressing the button on the right the favicon of the site is downloaded and associated as an icon of the entry, this is a nice feature.

![][5]

![][6]

KeePassXC also offers a good password / passphrase generator, you can choose length and complexity and check the degree of resistance to a brute force attack:

![][7]

### Browser integration

KeePassXC has an extension available for all major browsers. The extension allows you to fill in the login information for all the entries whose URL is specified.

Browser integration must be enabled on KeePassXC (Tools menu -&gt; Settings) specifying which browsers you intend to use:

![][8]

Once the extension is installed, it is necessary to create a connection with the database. To do this, press the extension button and then the Connect button: if the database is open and unlocked the extension will create an association key and save it in the database, the key is unique to the browser so I suggest naming it appropriately :

![][9]

When you reach the login page specified in the Url field and the database is unlocked, the extension will offer you all the credentials you have associated with that page:

![][10]

In this way, browsing with KeePassXC running you will have your internet credentials available without necessarily saving them in the browser.

### SSH agent integration

Another interesting feature of KeePassXC is the integration with SSH. If you have ssh-agent running KeePassXC is able to interact and add the ssh keys that you have uploaded as attachments to your entries.

First of all in the general settings (Tools menu -&gt; Settings) you have to enable the ssh agent and restart the program:

![][11]

At this point it is required to upload your ssh key pair as an attachment to your entry. Then in the “SSH agent” tab select the private key in the attachment drop-down list, the public key will be populated automatically. Don’t forget to select the two checkboxes above to allow the key to be added to the agent when the database is opened / unlocked and removed when the database is closed / locked:

![][12]

Now with the database open and unlocked you can log in ssh using the keys saved in your wallet.

The only limitation is in the maximum number of keys that can be added to the agent: ssh servers do not accept by default more than 5 login attempts, for security reasons it is not recommended to increase this value.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/managing-credentials-with-keepassxc/

作者：[Marco Sarti][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/msarti/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/keepassxc-816x345.png
[2]: https://fedoramagazine.org/manage-your-passwords-with-bitwarden-and-podman/
[3]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-07-33-27.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-07-48-21.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-08-30-07.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-08-43-11.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-08-49-22.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-48-09.png
[9]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-05-57.png
[10]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-13-29.png
[11]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-47-21.png
[12]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-46-35.png
