Translating by MjSeven

3 password managers for the Linux command line
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/password.jpg?itok=ec6z6YgZ)
We all want our passwords to be safe and secure. To do that, many people turn to password management applications like [KeePassX][1] or [Bitwarden][2].

If you spend a lot of time in a terminal window and are looking for a simpler solution, you'll want to check out one of the many password managers for the Linux command line. They're quick, easy to use, and secure.

Let's take a look at three of them.

### Titan

[Titan][3] is a password manager that doubles as a file-encryption tool. I'm not sure how well Titan works at encrypting files; I only looked at it as a password manager. In that capacity, it does a solid job.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/titan.png?itok=5QoQ1aY7)

Titan stores your passwords in an encrypted [SQLite database][4], which you create and add a master passphrase to when you first fire up the application. Tell Titan to add a password and it asks for a name to identify it, a username, the password itself, a URL, and a comment about the password.

You can get Titan to generate a password for you, and you can search your database by an entry's name or numeric ID, by the name or comment, or using regular expressions. Viewing a specific password, however, can be a bit clunky. You either have to list all passwords and scroll through them to find the one you want to use, or you can view the password by listing the details of an entry using its numeric ID (if you know it).

### Gopass

[Gopass][5] is billed as "the team password manager." Don't let that put you off. It's also great for personal use.


![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gopass.png?itok=1Uodlute)

Gopass is an update of the venerable Unix and Linux [Pass][6] password manager written in the Go programming language. In true Linux fashion, you can either [compile the source code][7] or [use an installer][8] to get gopass on your computer.

Before you start using gopass, make sure you have [GNU Privacy Guard (GPG)][9] and [Git][10] on your system. The former encrypts and decrypts your password store, and the latter signs commits to a [Git repository][11]. If gopass is for personal use, you still need Git. You just don't need to worry about signing commits. If you're interested, you can learn about those dependencies [in the documentation][12].

When you first start gopass, you need to create a password store and generate a [secret key][13] to secure that store. When you want to add a password (which gopass refers to as a secret), gopass asks you for information such as a URL, a username, and a note about the secret. You can have gopass generate the password for the secret you're adding, or you can enter one yourself.

As you need to, you can edit, view, or delete passwords. You can also view a specific password or copy it to your clipboard to paste it into a login form or window.

### Kpcli

The open source password manager of choice for many people is either [KeePass][14] or [KeePassX][15]. [Kpcli][16] brings the features of KeePass and KeePassX to your nearest terminal window.
![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/kpcli.png?itok=kMmOHTJz)
Kpcli is a keyboard-driven shell that does most of what its graphical cousins can do. That includes opening a password database; adding and editing passwords and groups (which help you organize your passwords); or even renaming or deleting passwords and groups.

When you need to, you can copy a username and password to your clipboard to paste into a login form. To keep that information safe, kpcli also has a command to clear the clipboard. Not bad for a little terminal app.

Do you have a favorite command-line password manager? Why not share it by leaving a comment?

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/3-password-managers-linux-command-line

作者：[Scott Nesbitt][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://www.keepassx.org/
[2]:https://opensource.com/article/18/3/managing-passwords-bitwarden
[3]:https://www.titanpasswordmanager.org/
[4]:https://en.wikipedia.org/wiki/SQLite
[5]:https://www.justwatch.com/gopass/
[6]:https://www.passwordstore.org/
[7]:https://github.com/justwatchcom/gopass
[8]:https://justwatch.com/gopass/#install
[9]:https://www.gnupg.org
[10]:https://git-scm.com/
[11]:https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository
[12]:https://github.com/justwatchcom/gopass/blob/master/docs/setup.md
[13]:http://searchsecurity.techtarget.com/definition/private-key
[14]:https://keepass.info/
[15]:https://www.keepassx.org
[16]:http://kpcli.sourceforge.net/
