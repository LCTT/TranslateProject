Pass – A Simple command-line Password Manager for Linux
============================================================


Keep tracking the password is one of the big challenge to everyone now a days since we has multiple password like email, bank, social media, online portal, and ftp, etc.,.

Password managers are become very famous due to the demand and usage. In Linux so many alternatives are available, GUI based and CLI based. Today we are going to discuss about CLI based password manager called pass.

[pass][2] is a simple command line password manager for Linux which stores password inside of a `gpg` encrypted file. These encrypted files are organized in well folder hierarchies.

All passwords live in `~/.password-store`, and it provides simple commands for adding, editing, generating, and retrieving passwords.

Suggested Read : [KeePass – A Best Password Management Tool To Store/Secure Passwords][3]

It is a very short and simple shell script. It’s capable of temporarily putting passwords on your clipboard and tracking password changes using git.

This is a small shell script which use few default tools like gnupg, tree and git, there are active community offering GUI & extensions for pass.

#### How to Install Pass in Linux

Pass is available in the repositories of most major distributions. So, use your distribution package manager to get installed.

For Debian based systems, use [apt-get][4] or [apt package manager][5] to install pass.

```
$ sudo apt-get install pass
```

For RHEL/CentOS based systems, use [yum package manager][6] to install pass.

```
$ sudo yum install pass
```

For Fedora system, use [dnf package manager][7] to install pass.

```
$ sudo dnf install pass
```

For openSUSE system, use [zypper package manager][8] to install pass.

```
$ sudo zypper in password-store
```

For Arch Linux based systems, use [pacman package manager][9] to install pass.

```
$ pacman -S pass
```

#### How to generate GPG key pair

Make sure you have your own GPG key pair. If no, create a GPG key pair by running following command on terminal and follow the instructions.

```
$ gpg --gen-key
```

The above command will ask a series of questions to create a GPG key pair, so input the required details carefully and few question you can leave default answer which is enough.

#### Initiate the password store

If you got a GPG key pair then initialize the local password store by running the following command, you can pass either `email-id or gpg-id`.

```
$ pass init 2daygeek@gmail.com
mkdir: created directory '/home/magi/.password-store/'
Password store initialized for 2daygeek@gmail.com
```

The above command will create a password store under `~/.password-store` directory.

pass command is offering simple syntax to manage password. Let’s see one by one like adding, editing, generating, and retrieving passwords.

Check the hierarchical tree by firing below command.

```
$ pass
or
$ pass ls
or
$ pass show
Password Store
```

I didn’t see any tree hierarchical, so we will create our own based on our requirement.

#### Insert a new password info

We are going to save gmail id and its password by running below command.

```
$ pass insert eMail/2daygeek@gmail.com
mkdir: created directory '/home/magi/.password-store/eMail'
Enter password for eMail/2daygeek@gmail.com: 
Retype password for eMail/2daygeek@gmail.com:
```

Do the same until you insert all your entries. Saving Facebook credential.

```
$ pass insert Social/Facebook_2daygeek
mkdir: created directory '/home/magi/.password-store/Social'
Enter password for Social/Facebook_2daygeek: 
Retype password for Social/Facebook_2daygeek: 
```

We can list all the existing passwords in the store.

```
$ pass show
Password Store
├── 2g
├── Bank
├── eMail
│   ├── 2daygeek@gmail.com
│   └── magesh.maruthamuthu@gmail.com
├── eMail
├── Social
│   ├── Facebook_2daygeek
│   └── Gplus_2daygeek
├── Social
└── Sudha
    └── sudha21.magesh@gmail.com
```

#### Show existing password

Run the following command to retrieve password info from password store, It will ask you to enter the passphrase to unlock.
 [![](http://www.2daygeek.com/wp-content/uploads/2017/06/pass-command-line-package-manager-for-linux-1.png)][10] 

```
$ pass eMail/2daygeek@gmail.com
*******
```

#### Copy the password in clipboard

To copy the password directly onto the clipboard temporarily instead of printing on terminal, use the following command which is more secure method and it will clear the password automatically after 45 seconds.

```
$ pass -c eMail/magesh.maruthamuthu@gmail.com
Copied eMail/magesh.maruthamuthu@gmail.com to clipboard. Will clear in 45 seconds.
```

#### Generate a new password

If you want to generate hard and guess password instead of odd one, it will do by using the pwgen utility internally.

```
$ pass generate eMail/2daygeek@gmail.com 15
An entry already exists for eMail/2daygeek@gmail.com. Overwrite it? [y/N] y
The generated password for eMail/2daygeek@gmail.com is:
y!NZ<%T)5Iwym_S
```

To generate password without symbols.

```
$ pass generate eMail/2daygeek@gmail.com 15 -n
An entry already exists for eMail/2daygeek@gmail.com. Overwrite it? [y/N] y
The generated password for eMail/2daygeek@gmail.com is:
TP9ACLyzUZUwBwO
```

#### Edit existing password

Insert a new password or edit an existing password using editor. When you run below command it will open the file `/dev/shm/pass.wUyGth1Hv0rnh/6kOBG-eMail-2daygeek@gmail.com.txt` in text editor which contain the password. Just add new password then save and exit.

```
$ pass edit eMail/2daygeek@gmail.com

File: /dev/shm/pass.wUyGth1Hv0rnh/6kOBG-eMail-2daygeek@gmail.com.txt                                                                   
TP9ACLyzUZUwBwO
```

#### Remove a Password

To remove existing password. It will remove the entry from `~/.password-store` which is contain `.gpg`

```
$ pass rm eMail/2daygeek@gmail.com
Are you sure you would like to delete eMail/2daygeek@gmail.com? [y/N] y
removed '/home/magi/.password-store/eMail/2daygeek@gmail.com.gpg'
```

#### Multi-line Functionality

To save detailed info like, URL, username, password, pin, etc,., Use the following format. Make sure you have to add first entry as a password since it used to copy first line as a password when you use clipboard option, and the additional information on subsequent lines.

```
$ pass insert eMail/2daygeek@gmail.com -m
Enter contents of eMail/2daygeek@gmail.com and press Ctrl+D when finished:

H3$%hbhYT
URL : http://www.2daygeek.com
Info : Linux Tips & Tricks
Ftp User : 2g
```

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/pass-command-line-password-manager-linux/

作者：[2DAYGEEK ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/author/2daygeek/
[2]:https://www.passwordstore.org/
[3]:http://www.2daygeek.com/keepass-best-linux-password-manager-arch-linux-mint-ubuntu-debian-fedora-opensuse/
[4]:http://www.2daygeek.com/apt-get-apt-cache-command-examples/
[5]:http://www.2daygeek.com/apt-command-examples/
[6]:http://www.2daygeek.com/yum-command-examples/
[7]:http://www.2daygeek.com/dnf-command-examples/
[8]:http://www.2daygeek.com/zypper-command-examples/
[9]:http://www.2daygeek.com/pacman-command-examples/
[10]:http://www.2daygeek.com/wp-content/uploads/2017/06/pass-command-line-package-manager-for-linux-1.png
