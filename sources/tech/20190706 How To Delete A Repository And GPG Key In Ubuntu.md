[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Delete A Repository And GPG Key In Ubuntu)
[#]: via: (https://www.ostechnix.com/how-to-delete-a-repository-and-gpg-key-in-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Delete A Repository And GPG Key In Ubuntu
======

![Delete A Repository And GPG Key In Ubuntu][1]

The other day we discussed how to [**list the installed repositories**][2] in RPM and DEB-based systems. Today, we are going to learn how to delete a repository along with its GPG key in Ubuntu. For those wondering, a repository (shortly **repo** ) is a central place where the developers keep the software packages. The packages in the repositories are thoroughly tested and built specifically for each version by Ubuntu developers. The users can download and install these packages on their Ubuntu system using **Apt** **package manager**. Ubuntu has four official repositories namely **Main** , **Universe** , **Restricted** and **Multiverse**.

Apart from the official repositories, there are many unofficial repositories maintained by developers (or package maintainers). The unofficial repositories usually have the packages which are not available in the official repositories. All packages are signed with pair of keys, a public and private key, by the package maintainer. As you already know, the public key is given out to the users and the private must be kept secret. Whenever you add a new repository in the sources list, you should also add the repository key if Apt package manager wants to trust the newly added repository. Using the repository keys, you can ensure that you’re getting the packages from the right person. Hope you got a basic idea about software repositories and repository keys. Now let us go ahead and see how to delete the repository and its key if it is no longer necessary in Ubuntu systems.

### Delete A Repository In Ubuntu

Whenever you add a repository using “add-apt-repository” command, it will be stored in **/etc/apt/sources.list** file.

To delete a software repository from Ubuntu and its derivatives, just open the /etc/apt/sources.list file and look for the repository entry and delete it.

```
$ sudo nano /etc/apt/sources.list
```

As you can see in the below screenshot, I have added [**Oracle Virtualbox**][3] repository in my Ubuntu system.

![][4]

virtualbox repository

To delete this repository, simply remove the entry. Save and close the file.

If you have added PPA repositories, look into **/etc/apt/sources.list.d/** directory and delete the respective entry.

Alternatively, you can delete the repository using “add-apt-repository” command. For example, I am deleting the [**Systemback**][5] repository like below.

```
$ sudo add-apt-repository -r ppa:nemh/systemback
```

Finally, update the software sources list using command:

```
$ sudo apt update
```

### Delete Repository keys

We use “apt-key” command to add the repository keys. First, let us list the added keys using command:

```
$ sudo apt-key list
```

This command will list all added repository keys.

```
/etc/apt/trusted.gpg
--------------------
pub rsa1024 2010-10-31 [SC]
3820 03C2 C8B7 B4AB 813E 915B 14E4 9429 73C6 2A1B
uid [ unknown] Launchpad PPA for Kendek

pub rsa4096 2016-04-22 [SC]
B9F8 D658 297A F3EF C18D 5CDF A2F6 83C5 2980 AECF
uid [ unknown] Oracle Corporation (VirtualBox archive signing key) <[email protected]>
sub rsa4096 2016-04-22 [E]

/etc/apt/trusted.gpg.d/ubuntu-keyring-2012-archive.gpg
------------------------------------------------------
pub rsa4096 2012-05-11 [SC]
790B C727 7767 219C 42C8 6F93 3B4F E6AC C0B2 1F32
uid [ unknown] Ubuntu Archive Automatic Signing Key (2012) <[email protected]>

/etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg
------------------------------------------------------
pub rsa4096 2012-05-11 [SC]
8439 38DF 228D 22F7 B374 2BC0 D94A A3F0 EFE2 1092
uid [ unknown] Ubuntu CD Image Automatic Signing Key (2012) <[email protected]>

/etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg
------------------------------------------------------
pub rsa4096 2018-09-17 [SC]
F6EC B376 2474 EDA9 D21B 7022 8719 20D1 991B C93C
uid [ unknown] Ubuntu Archive Automatic Signing Key (2018) <[email protected]>
```

As you can see in the above output, the long (40 characters) hex value is the repository key. If you want APT package manager to stop trusting the key, simply delete it using command:

```
$ sudo apt-key del "3820 03C2 C8B7 B4AB 813E 915B 14E4 9429 73C6 2A1B"
```

Or, specify the last 8 characters only:

```
$ sudo apt-key del 73C62A1B
```

Done! The repository key has been deleted. Run the following command to update the repository lists:

```
$ sudo apt update
```

**Resource:**

  * [**Software repositories – Ubuntu Community Wiki**][6]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-delete-a-repository-and-gpg-key-in-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Delete-a-repository-in-ubuntu-720x340.png
[2]: https://www.ostechnix.com/find-list-installed-repositories-commandline-linux/
[3]: https://www.ostechnix.com/install-oracle-virtualbox-ubuntu-16-04-headless-server/
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/virtualbox-repository.png
[5]: https://www.ostechnix.com/systemback-restore-ubuntu-desktop-and-server-to-previous-state/
[6]: https://help.ubuntu.com/community/Repositories/Ubuntu
