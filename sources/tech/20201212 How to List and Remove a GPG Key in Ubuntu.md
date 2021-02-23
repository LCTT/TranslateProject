[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to List and Remove a GPG Key in Ubuntu)
[#]: via: (https://www.2daygeek.com/how-to-list-and-remove-repository-gpg-key-in-ubuntu/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to List and Remove a GPG Key in Ubuntu
======

Some time ago we wrote an article about **[removing the PPA repository from the Ubuntu system][1]**.

The PPA repository keys will not be removed as part of removing the PPA repository, and they will remain on the system.

Today we are going to show you how to list and remove the added GPG keys from Ubuntu system.

### What’s GPG key?

The GPG key (it means Gnu Privacy Guard, aka GnuPG) is a free software which provides cryptographic privacy and authentication.

It allow users to communicate securely using public-key cryptography.

### How Does the GPG Key Work on Repository?

All packages are signed with a pair of keys consisting of a private key and a public key, by the package maintainer.

A user’s private key is kept secret and the public key may be given to anyone the user wants to communicate.

Whenever you add a new repository to your system, you must also add a repository key so that the APT Package Manager trusts the newly added repository.

Once you’ve added the repository keys, you can make sure you get the packages from the correct source.

### How to List Repository keys?

apt-key is used to manage the list of keys used by apt to authenticate packages. Trusted keys are stored in the following locations.

  * **/etc/apt/trusted.gpg** – Keyring of local trusted keys, new keys will be added here.
  * **/etc/apt/trusted.gpg.d/** – File fragments for the trusted keys, additional keyrings can be stored here (by other packages or the administrator).



Use the following command to list trusted keys with fingerprints.

```
$ sudo apt-key list

/etc/apt/trusted.gpg
--------------------
pub   rsa4096 2017-12-15 [SCEA]
      0A0F AB86 0D48 5603 32EF B581 B754 42BB DE9E 3B09
uid           [ unknown] https://packagecloud.io/AtomEditor/atom (https://packagecloud.io/docs#gpg_signing) [email protected]
sub   rsa4096 2017-12-15 [SEA]

pub   rsa4096 2016-04-22 [SC]
      B9F8 D658 297A F3EF C18D 5CDF A2F6 83C5 2980 AECF
uid           [ unknown] Oracle Corporation (VirtualBox archive signing key) [email protected]
sub   rsa4096 2016-04-22 [E]

pub   dsa1024 2007-03-08 [SC]
      4CCA 1EAF 950C EE4A B839 76DC A040 830F 7FAC 5991
uid           [ unknown] Google, Inc. Linux Package Signing Key [email protected]
sub   elg2048 2007-03-08 [E]

pub   rsa4096 2016-04-12 [SC]
      EB4C 1BFD 4F04 2F6D DDCC EC91 7721 F63B D38B 4796
uid           [ unknown] Google Inc. (Linux Packages Signing Authority) [email protected]
sub   rsa4096 2019-07-22 [S] [expires: 2022-07-21]

/etc/apt/trusted.gpg.d/numix_ubuntu_ppa.gpg
-------------------------------------------
pub   rsa1024 2013-08-13 [SC]
      43E0 7612 1739 DEE5 FB96 BBED 52B7 0972 0F16 4EEB
uid           [ unknown] Launchpad PPA for Numix Maintainers

/etc/apt/trusted.gpg.d/snwh_ubuntu_ppa.gpg
------------------------------------------
pub   rsa1024 2012-06-27 [SC]
      D320 D0C3 0B02 E64C 5B2B B274 3766 2239 8999 3A70
uid           [ unknown] Launchpad PPA for Sam Hewitt

/etc/apt/trusted.gpg.d/ubuntu-keyring-2012-archive.gpg
------------------------------------------------------
pub   rsa4096 2012-05-11 [SC]
      790B C727 7767 219C 42C8 6F93 3B4F E6AC C0B2 1F32
uid           [ unknown] Ubuntu Archive Automatic Signing Key (2012) [email protected]

/etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg
------------------------------------------------------
pub   rsa4096 2012-05-11 [SC]
      8439 38DF 228D 22F7 B374 2BC0 D94A A3F0 EFE2 1092
uid           [ unknown] Ubuntu CD Image Automatic Signing Key (2012) [email protected]

/etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg
------------------------------------------------------
pub   rsa4096 2018-09-17 [SC]
      F6EC B376 2474 EDA9 D21B 7022 8719 20D1 991B C93C
uid           [ unknown] Ubuntu Archive Automatic Signing Key (2018) [email protected]
```

### How to Delete/Remove Repository keys?

You can remove the repository key if it is no longer needed or if the repository has already been removed from the system.

It can be deleted by entering the full key with quotes as follows (which has a hex value of 40 characters).

```
$ sudo apt-key del "D320 D0C3 0B02 E64C 5B2B B274 3766 2239 8999 3A70"
OK
```

Alternatively, you can delete a key by entering only the last 8 characters.

```
$ sudo apt-key del 89993A70
OK
```

Once you have removed the repository key, run the command **[apt command][2]** to refresh the repository index.

```
$ sudo apt update
```

You can verify that the above GPG key has been removed by running the following command.

```
$ sudo apt-key list
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-list-and-remove-repository-gpg-key-in-ubuntu/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-remove-delete-ppas-on-ubuntu-linux-mint/
[2]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
