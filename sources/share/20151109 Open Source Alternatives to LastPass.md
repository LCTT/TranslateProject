Open Source Alternatives to LastPass
================================================================================
LastPass is a cross-platform password management program. For Linux, it is available as a plugin for Firefox, Chrome, and Opera. LastPass Sesame is available for Ubuntu/Debian and Fedora. There is also a version of LastPass compatible with Firefox Portable for installing on a USB key. And with LastPass Pocket for Ubuntu/Debian, Fedora and openSUSE, there's good coverage. While LastPass is a highly rated service, it is proprietary software. And LastPass has recently been absorbed by LogMeIn. If you're looking for an open source alternative, this article is for you.

We all face information overload. Whether you conduct business online, read for your job, or just read for pleasure, the internet is a vast source of information. Retaining that information on a long-term basis can be difficult. However, it is essential to recall certain items of information immediately. Passwords are one such example.

As a computer user, you face the dilemma of choosing the same password or a unique password for each service or web site you use. Matters are complicated because some sites place restrictions on the selection of the password. For example, a site may insist on a minimum number of characters, capital letters, numerals, and other characters which make choosing the same password for each site to be impossible. More importantly, there are good security reasons not to duplicate passwords. This inevitably means that individuals will simply have too many passwords to remember. One solution is to keep the passwords in written form. However, this is also highly insecure.

Instead of trying to remember an endless array of passwords, a popular solution is to use password manager software. In fact, this type of software is an essential tool for the active internet user. It makes it easy to retrieve, manage and secure all of your passwords. Most passwords are encrypted, either by the program or the filesystem. Consequently, the user only has to remember a single password. Password managers encourage users to choose unique, non-intuitive strong passwords for each service.

To provide an insight into the quality of software available for Linux, I introduce 4 excellent open source alternatives to LastPass. 

### KeePassX ###

![KeePassX in action](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-KeePassX.png)

KeePassX is a multi-platform port of KeePass, an open source and cross-platform password manager. This utility helps you to manage your passwords in a secure way. You can put all your passwords in one database, which is locked with one master key or a key-disk. This lets users only need to remember one single master password or insert the key-disk to unlock the whole database.

The databases are encrypted using the algorithms AES (alias Rijndael) or Twofish using a 256 bit key.

Features include:

- Extensive management- title for each entry for better identification:
    - Determine different expiration dates
    - Insertion of attachments
    - User-defined symbols for groups and entries
    - Fast entry duplication
    - Sorting entries in groups
- Search function: in specific groups or in the complete database
- Auto-Type, a feature that allows you to e.g. log in to a web page by pressing a single key combination. KeePassX does the rest of the typing for you. Auto-Type reads the title of currently active window on your screen and matches it to the configured database entries
- Database security with access to the KeePassX database being granted either with a password, a key-file (e.g. a CD or a memory-stick) or both
- Automatic generation of secure passwords
- Precaution features, quality indicator for chosen passwords hiding all passwords behind asterisks
- Encryption- either the Advanced Encryption Standard (AES) or the Twofish algorithm are used, with encryption of the database in 256 bit sized increments
- Import and export of entries. Import from PwManager (*.pwm) and KWallet (*.xml) files, Export as textfile (*.txt)

- Website: [www.keepassx.org][1]
- Developer: KeePassX Team
- License: GNU GPL v2
- Version Number: 0.4.3

### Encryptr ###

![Encryptr in action](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Encryptr.png)

Encryptr is an open source zero-knowledge cloud-based password manager / e-wallet powered by Crypton. Crypton is a JavaScript library that allows developers to write web applications where the server knows nothing of the contents a user is storing.

Encryptr stores your sensitive data like passwords, credit card data, PINs, or access codes, in the cloud. However, because it was built on the zero-knowledge Crypton framework, Encryptr ensures that only the user has the ability to access or read the confidential information.

Being cross-platform, it allows users to securely access their confidential data from a single account from the cloud, no matter where they are.

Features include:

- Very secure Zero-Knowledge Crypton Framework only ever encrypts or decrypts your data locally on your device
- Simple to use
- Cloud based
- Stores three types of data it stores passwords, credit card numbers and general key/value pairs
- Optional "Notes" field to all entries
- Filtering / searching the entry list
- Local encrypted caching of entries to speed up load time

- Website: [encryptr.org][2]
- Developer: Tommy Williams
- License: GNU GPL v3
- Version Number: 1.2.0

### RatticDB ###

![RatticDB in action](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-RatticDB.png)

RatticDB is an open source Django based password management service.

RatticDB is built to be 'Password Lifecycle Management' and not simply a 'Password Storage Engine'. RatticDB aims to help you keep track of what passwords need to be changed and when. It does not include application level encryption.

Features include:

- Simple ACL scheme
- Change Queue feature that allows users to see when they need to update passwords for the applications they use
- Ansible configurations
- 
- Website: [rattic.org][3]
- Developer: Daniel Hall
- License: GNU GPL v2
- Version Number: 1.3.1

### Seahorse ###

![Seahorse in action](http://www.linuxlinks.com/portal/content/reviews/Security/Screenshot-Seahorse.png)

Seahorse is a Gnome front end for GnuPG - the Gnu Privacy Guard program. Its goal is to provide an easy to use Key Management Tool, along with an easy to use interface for encryption operations.

It is a tool for secure communications and data storage. Data encryption and digital signature creation can easily be performed through a GUI and Key Management operations can easily be carried out through an intuitive interface.

Additionally, Seahorse includes a Gedit plugin, can handle files using Nautilus, an applet for managing stuff put in the clipboard and an agent for storing private passphrases, as well as a GnuPG and OpenSSH key manager.

Features include:

- Encrypt/decrypt/sign files and text
- Manage your keys and keyring
- Synchronize your keys and your keyring with key servers
- Sign keys and publish
- Cache your passphrase so you don't have to keep typing it
- Backup your keys and keyring
- Add an image in any GDK supported format as a OpenGPG photo ID
- Create SSH keys, configure them, cache them
- Internationalization support

- Website: [www.gnome.org/projects/seahorse][4]
- Developer: Jacob Perkins, Jose Carlos, Garcia Sogo, Jean Schurger, Stef Walter, Adam Schreiber
- License: GNU GPL v2
- Version Number: 3.18.0

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20151108125950773/LastPassAlternatives.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.keepassx.org/
[2]:https://encryptr.org/
[3]:http://rattic.org/
[4]:http://www.gnome.org/projects/seahorse/