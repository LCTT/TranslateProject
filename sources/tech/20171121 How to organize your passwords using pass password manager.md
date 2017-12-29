translating by lujun9972
How to organize your passwords using pass password manager
======

### Objective

Learn to organize your passwords using the "pass" password manager on linux

### Requirements

  * Root permissions needed to install required packages

### Difficulty

EASY

### Conventions

  * **#** \- requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
  * **$** \- given command to be executed as a regular non-privileged user
### Introduction

If you have the good habit to never use the same password for more than one purpose, you have probably already felt the need for a password manager. There are many alternatives to choose from on linux, both proprietary (if you dare) and open source. If you, like me, think that simplicity it's the way to go, you may be interested in knowing however to use the `pass` utility.

### First steps

Pass it's a password manager that it's really a wrapper on well trusted and useful tools that you probably already use every day, like `gpg` and `git`. Although graphical interfaces exists for it, it is designed to work from command line: therefore it will work even on headless machines.

### Step 1 - installation

Pass it's easily available on the majority of linux distributions, you can obtain via package manager:

#### Fedora
```
# dnf install pass
```

#### RHEL and CentOS

Pass is not available in the official repositories, but you can obtain it from `epel`. To make the latter source available on CentOS7, all you have to do is:
```
# yum install epel-release
```

On Red Hat Enterprise Linux, however, the package that enables this extra source it's not available; you can download it from the official EPEL site.

#### Debian and Ubuntu
```
# apt-get install pass
```

#### Arch Linux
```
# pacman -S pass
```

### Initialize the password store

Once we have `pass` installed, we can begin to use it and configure it. First of all, since pass relies on `gpg` to encrypt our passwords and store it in a secure way, we must have a `gpg keypair` already in place.

First thing to do is to initialize the `password store`: this is simply the directory where all your gpg-encrypted password will be saved. By default it will be created as a hidden directory inside your `$HOME`, however you can specify an alternative path, by using the `PASSWORD_STORE_DIR` environment variable. Let's proceed:
```
$ pass init
```

The `password-store` directory will be created. Now, let's try to store our first password:
```
$ pass edit mysite
```

At this point an instance of our default text editor will be opened, and all we have to do is to enter our password in it. The file will be encrypted using gpg, and stored as `mysite.gpg` inside the password-store directory.

Pass stores encrypted files in a directory tree, which means that we can logically group more files in subdirectories to obtain a better organization, we will just have to specify it on file creation, for example:
```
$ pass edit foo/bar
```

Just as above, this will prompt for password insertion, but the file will be created inside the `foo` subdirectory of the password store. To visualize the file structure, all we have to do is to use the `pass` command without any arguments:
```

$ pass
Password Store
├── foo
│   └── bar
└── mysite

```

Whenever we need to modify our password, we will just have to repeat the same command used to create it, as shown above.

### Access the passwords

There are basically two ways we can access our password: the first one is to display it on the terminal, by using:
```
pass mysite
```

However a better way is to let pass copy it directly to the clipboard, by using the `-c` option:
```
pass -c mysite
```

In this case the clipboard will be cleared after `45` seconds. In both cases, a prompt will appear where you will have to insert your gpg password.

### Generate passwords

Pass can also generate (and automatically store) secure passwords for us. Say we want to generate a password composed by 15 characters: alphanumeric and symbols. The command to use will be:
```
pass generate mysite 15
```

If we want our password to contain only alphanumeric characters we can use the `--no-symbols` option. The generated password will displayed onscreen. Alternatively, it can be copied directly to the clipboard, using the `--clip` or `-c` option. You can even generate a QR code, by using the `-q` or `--qrcode` option:

![qrcode][1]

As you can see from the screenshot above, the qrcode has been generated, but since a password for `mysite` already existed at the time we invoked the command, pass showed a prompt to let us confirm that we want to override it.

Pass uses the `/dev/urandom` device as a (pseudo) random data generator to create the passwords, while it uses the `xclip` utility to copy them to the clipboard, and `qrencode` to display them as qrcodes. This modularity is, in my opinion, its greatest strength: it doesn't reinvent anything, it just wraps common used tools to reach its goal.

You can also rename, copy or delete files from the password store, respectively using the `pass mv`, `pass cp`, or `pass rm` commands.

### Using the password store as a git repository

Another great feature of `pass` is that it can treat the password store as a git repository: letting us manage our password more easily, under a version control system.
```
pass git init
```

This will create the git repository, and automatically create a commit with all the existing files. The next step is to specify the remote repository to track:
```
pass git remote add <name> <url>
```

We can manage this repository just like we do with all other repository we use. The only "difference" is that every time we add or modify a password, `pass` will automatically add the file to the index and create a commit.

A graphical interface exists for `pass`, it is called `qtpass` and it's available also for Windows and MacOs. It's also possible to access the password store from firefox, using the `PassFF` extension. You will find more detailed informations on the project site. Go on an try `pass`, you will not regret it!


--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-organize-your-passwords-using-pass-password-manager

作者：[Egidio Docile][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
[1]:/images/pass-manager-qrcode.png
