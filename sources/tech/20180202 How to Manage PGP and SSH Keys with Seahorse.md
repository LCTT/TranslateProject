How to Manage PGP and SSH Keys with Seahorse
============================================================


![Seahorse](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fish-1907607_1920.jpg?itok=u07bav4m "Seahorse")
Learn how to manage both PGP and SSH keys with the Seahorse GUI tool.[Creative Commons Zero][6]

Security is tantamount to peace of mind. After all, security is a big reason why so many users migrated to Linux in the first place. But why stop with merely adopting the platform, when you can also employ several techniques and technologies to help secure your desktop or server systems.

One such technology involves keys—in the form of PGP and SSH. PGP keys allow you to encrypt and decrypt emails and files, and SSH keys allow you to log into servers with an added layer of security.

Sure, you can manage these keys via the command-line interface (CLI), but what if you’re working on a desktop with a resplendent GUI? Experienced Linux users may cringe at the idea of shrugging off the command line, but not all users have the same skill set and comfort level there. Thus, the GUI!

In this article, I will walk you through the process of managing both PGP and SSH keys through the [Seahorse][14] GUI tool. Seahorse has a pretty impressive feature set; it can:

*   Encrypt/decrypt/sign files and text.

*   Manage your keys and keyring.

*   Synchronize your keys and your keyring with remote key servers.

*   Sign and publish keys.

*   Cache your passphrase.

*   Backup both keys and keyring.

*   Add an image in any GDK supported format as a OpenPGP photo ID.

*   Create, configure, and cache SSH keys.

For those that don’t know, Seahorse is a GNOME application for managing both encryption keys and passwords within the GNOME keyring. But fear not, Seahorse is available for installation on numerous desktops. And since Seahorse is found in the standard repositories, you can open up your desktop’s app store (such as Ubuntu Software or Elementary OS AppCenter) and install. To do this, locate Seahorse in your distribution’s application store and click to install. Once you have Seahorse installed, you’re ready to start making use of a very handy tool.

Let’s do just that.

### PGP Keys

The first thing we’re going to do is create a new PGP key. As I said earlier, PGP keys can be used to encrypt email (with tools like [Thunderbird][15]’s [Enigmail][16] or the built-in encryption function with [Evolution][17]). A PGP key also allows you to encrypt files. Anyone with your public key will be able to decrypt those emails or files. Without a PGP key, no can do.

Creating a new PGP key pair is incredibly simple with Seahorse. Here’s what you do:

1.  Open the Seahorse app

2.  Click the + button in the upper left corner of the main pane

3.  Select PGP Key (Figure 1)

4.  Click Continue

5.  When prompted, type a full name and email address

6.  Click Create


![Seahorse](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_1.jpg?itok=khLOYC61 "Seahorse")
Figure 1: Creating a PGP key with Seahorse.[Used with permission][1]

While creating your PGP key, you can click to expand the Advanced key options section, where you can configure a comment for the key, encryption type, key strength, and expiration date (Figure 2).


![PGP](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_2.jpg?itok=eWiazwrn "PGP")
Figure 2: PGP key advanced options.[Used with permission][2]

The comment section is very handy to help you remember a key’s purpose (or other informative bits).
With your PGP created, double-click on it from the key listing. In the resulting window, click on the Names and Signatures tab. In this window, you can sign your key (to indicate you trust this key). Click the Sign button and then (in the resulting window) indicate how carefully you’ve checked this key and how others will see the signature (Figure 3).


![Key signing](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_3.jpg?itok=7USKG9fI "Key signing")
Figure 3: Signing a key to indicate trust level.[Used with permission][3]

Signing keys is very important when you’re dealing with other people’s keys, as a signed key will ensure your system (and you) you’ve done the work and can fully trust an imported key.

Speaking of imported keys, Seahorse allows you to easily import someone’s public key file (the file will end in .asc). Having someone’s public key on your system means you can decrypt emails and files sent to you from them. However, Seahorse has suffered a [known bug][18] for quite some time. The problem is that Seahorse imports using gpg version one, but displays with gpg version two. This means, until this long-standing bug is fixed, importing public keys will always fail. If you want to import a public PGP key into Seahorse, you’re going to have to use the command line. So, if someone has sent you the file olivia.asc, and you want to import it so it can be used with Seahorse, you would issue the command gpg2 --import olivia.asc. That key would then appear in the GnuPG Keys listing. You can open the key, click the I trust signatures button, and then click the Sign this key button to indicate how carefully you’ve checked the key in question.

### SSH Keys

Now we get to what I consider to be the most important aspect of Seahorse—SSH keys. Not only does Seahorse make it easy to generate an SSH key, it makes it easy to send that key to a server, so you can take advantage of SSH key authentication. Here’s how you generate a new key and then export it to a remote server.

1.  Open up Seahorse

2.  Click the + button

3.  Select Secure Shell Key

4.  Click Continue

5.  Give the key a description

6.  Click Create and Set Up

7.  Type and verify a passphrase for the key

8.  Click OK

9.  Type the address of the remote server and a remote login name found on the server (Figure 4)

10.  Type the password for the remote user

11.  Click OK


![SSH key](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_4.jpg?itok=ZxuxT8ry "SSH key")
Figure 4: Uploading an SSH key to a remote server.[Used with permission][4]

The new key will be uploaded to the remote server and is ready to use. If your server is set up for SSH key authentication, you’re good to go.

Do note, during the creation of an SSH key, you can click to expand the Advanced key options and configure Encryption Type and Key Strength (Figure 5).


![Advanced options](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_5.jpg?itok=vUT7pi0z "Advanced options")
Figure 5: Advanced SSH key options.[Used with permission][5]

### A must-use for new Linux users

Any new-to-Linux user should get familiar with Seahorse. Even with its flaws, Seahorse is still an incredibly handy tool to have at the ready. At some point, you will likely want (or need) to encrypt or decrypt an email/file, or manage secure shell keys for SSH key authentication. If you want to do this, while avoiding the command line, Seahorse is the tool to use.

 _Learn more about Linux through the free ["Introduction to Linux" ][13]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/how-manage-pgp-and-ssh-keys-seahorse

作者：[JACK WALLEN ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.linux.com/licenses/category/creative-commons-zero
[7]:https://www.linux.com/files/images/seahorse1jpg
[8]:https://www.linux.com/files/images/seahorse2jpg
[9]:https://www.linux.com/files/images/seahorse3jpg
[10]:https://www.linux.com/files/images/seahorse4jpg
[11]:https://www.linux.com/files/images/seahorse5jpg
[12]:https://www.linux.com/files/images/fish-19076071920jpg
[13]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[14]:https://wiki.gnome.org/Apps/Seahorse
[15]:https://www.mozilla.org/en-US/thunderbird/
[16]:https://enigmail.net/index.php/en/
[17]:https://wiki.gnome.org/Apps/Evolution
[18]:https://bugs.launchpad.net/ubuntu/+source/seahorse/+bug/1577198