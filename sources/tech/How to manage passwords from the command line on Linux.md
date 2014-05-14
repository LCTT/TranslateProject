How to manage passwords from the command line on Linux
================================================================================
With password-based authentication so prevalent online these days, you may need or already use some sort of password management tool to keep track of all the passwords you are using. There are various online or offline services or software tools for that matter, and they vary in terms of their sophistication, user interface or target environments (e.g., enterprises or end users). For example, there are a few GUI-based password managers for end users, such as [KeePass(X)][1].

For those of you who do not want any kind of GUI dependency for password management, I will describe how to manage passwords from the command line by using [pass][2], **a simple command-line utility for password management**.

The pass utility is in fact a shell script frontend which uses several other tools (e.g., gpg, pwgen, git, xsel) to manage user's password info using OpenPGP. Each password is encrypted with gpg utility, and stored in a local password store. Password info can be retrieved either via terminal or self-clearing clipboard interface.

The pass utility is quite flexible and extremely simple to use. You can store each password info in an OpenPGP-protected plain text file, and group different password files into multiple categories. It supports bash auto completion feature, so it is very convenient to fill in commands or long password names using TAB key.

### Install pass on Linux ###

To install pass on Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install pass
    $ echo "source /etc/bash_completion.d/password-store" >> ~/.bashrc

To install pass on Fedora:

    $ sudo yum install pass
    $ echo "source /etc/bash_completion.d/password-store" >> ~/.bashrc

To install pass on CentOS, first [enable EPEL repository][3] and then run:

    $ sudo yum install pass
    $ echo "source /etc/bash_completion.d/password-store" >> ~/.bashrc

To install pass on Archlinux:

    $ sudo pac -S pass
    $ echo "source /etc/bash_completion.d/password-store" >> ~/.bashrc

### Initialize Local Password Store ###

Before using pass utility, you need to do one-time initialization step which involves creating a GPG key pair (if you don't have one) and a local password store.

First, create a GPG key pair (i.e., public/private keys) as follows. If you already have your own GPG key pair, you can skip this step.

    $ gpg --gen-key 

It will ask you a series of questions as shown below. If you are not sure, you can accept default answers. As part of key generation, you will set a passphrase for your secret key, which is essentially the master password required to access any password info stored in local password store. A successfully generated key pair will be stored in ~/.gnupg

![](https://farm3.staticflickr.com/2922/13965806430_a19596da60_z.jpg)

Next, initialize the local password store by running the following command. For <gpg-id>, enter the email address associated your GPG key created above.

    $ pass init <gpg-id> 

This command will create a password store under ~/.password-store directory.

### Manage Passwords from a Terminal with pass ###

#### Insert new password info ####

To insert new password info into local password store, use the following format.

    $ pass insert <password-name> 

<password-name> is an arbitrary name you define, and can be hierarchical (e.g., "finance/tdbank", "online/gmail.com"), in which case the password info will be created in corresponding sub-directories under ~/.password-store

If you want to insert password info as multi-lines, use "-m" option as follows. Type in password info in any format as you like, and press Ctrl+D to finish.

    $ pass insert <password-name> -m 

![](https://farm6.staticflickr.com/5564/14129264286_4315cb386b_o_d.jpg)
注：此图片暂时无法访问，不过可以直接访问flickr地址：https://www.flickr.com/photos/xmodulo/14129264286/ 文章发布的时候注意此处

#### View a list of all password names ####

To view the list of all stored password names, simply type "pass":

    $ pass 

![](https://farm3.staticflickr.com/2905/13965804498_92b0af83cf_o.jpg)

#### Retrieve password info from password store ####

To access the content of a particular password listing, simply use the command below:

    $ pass <password-name> 

For example:

    $ pass email/gmail.com 

You will be asked to enter the passphrase to unlock the secret key.

If you want the password to be copied to the clipboard, instead of appearing in the terminal screen, use this command instead:

    $ pass -c email/gmail.com 

Once copied to the clipboard, the password will automatically be cleared from the clipboard after 45 seconds.

#### Generate and store a new password in password store ####

With `pass`, you can also generate a new random password which you can use for any purpose. pass will use pwgen utility to generate a good random password. You can specify the length of a password, or generate a password with or without symbols.

For example, to generate a 10-character password with no symbol, and store it under "email/new_service.com" listing:

    $ pass generate email/new_service.com 10 -n 

#### Remove password info ####

Removing existing password info is easy:

    $ pass rm email/gmail.com 

To summarize, pass is extremely flexible, portable, and more importantly, easy to use. I highly recommend pass to anyone looking for a simple means to organize any kind of private info in a secure fashion, without relying on GUI dependency.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/manage-passwords-command-line-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/08/how-to-manage-multiple-passwords-on-linux.html
[2]:http://www.zx2c4.com/projects/password-store/
[3]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html