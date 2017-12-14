translating---geekpi

Cheat – A Collection Of Practical Linux Command Examples
======
Many of us very often checks **[Man Pages][1]** to know about command switches
(options), it shows you the details about command syntax, description,
details, and available switches but it doesn 't has any practical examples.
Hence, we are face some trouble to form a exact command format which we need.

Are you really facing the trouble on this and want a better solution? i would
advise you to check about cheat utility.

#### What Is Cheat

[Cheat][2] allows you to create and view interactive cheatsheets on the
command-line. It was designed to help remind *nix system administrators of
options for commands that they use frequently, but not frequently enough to
remember.

#### How to Install Cheat

Cheat package was developed using python, so install pip package to install
cheat on your system.

For **`Debian/Ubuntu`** , use [apt-get command][3] or [apt command][4] to
install pip.

```

    [For Python2]
    
    
    $ sudo apt install python-pip python-setuptools
    
    
    
    [For Python3]
    
    
    $ sudo apt install python3-pip
    
```

pip doesn't shipped with **`RHEL/CentOS`** system official repository so,
enable [EPEL Repository][5] and use [YUM command][6] to install pip.

```

    $ sudo yum install python-pip python-devel python-setuptools
    
```

For **`Fedora`** system, use [dnf Command][7] to install pip.

```

     [For Python2]
    
    
    $ sudo dnf install python-pip
    
    
    
    [For Python3]
    
    
    $ sudo dnf install python3
    
```

For **`Arch Linux`** based systems, use [Pacman Command][8] to install pip.

```

     [For Python2]
    
    
    $ sudo pacman -S python2-pip python-setuptools
    
    
    
    [For Python3]
    
    
    $ sudo pacman -S python-pip python3-setuptools
    
```

For **`openSUSE`** system, use [Zypper Command][9] to install pip.

```

     [For Python2]
    
    
    $ sudo pacman -S python-pip
    
    
    
    [For Python3]
    
    
    $ sudo pacman -S python3-pip
    
```

pip is a python module bundled with setuptools, it's one of the recommended
tool for installing Python packages in Linux.

```

    $ sudo pip install cheat
    
```

#### How to Use Cheat

Run `cheat` followed by corresponding `command` to view the cheatsheet, For
demonstration purpose, we are going to check about `tar` command examples.

```

    $ cheat tar
    # To extract an uncompressed archive:
    tar -xvf /path/to/foo.tar
    
    # To create an uncompressed archive:
    tar -cvf /path/to/foo.tar /path/to/foo/
    
    # To extract a .gz archive:
    tar -xzvf /path/to/foo.tgz
    
    # To create a .gz archive:
    tar -czvf /path/to/foo.tgz /path/to/foo/
    
    # To list the content of an .gz archive:
    tar -ztvf /path/to/foo.tgz
    
    # To extract a .bz2 archive:
    tar -xjvf /path/to/foo.tgz
    
    # To create a .bz2 archive:
    tar -cjvf /path/to/foo.tgz /path/to/foo/
    
    # To extract a .tar in specified Directory:
    tar -xvf /path/to/foo.tar -C /path/to/destination/
    
    # To list the content of an .bz2 archive:
    tar -jtvf /path/to/foo.tgz
    
    # To create a .gz archive and exclude all jpg,gif,... from the tgz
    tar czvf /path/to/foo.tgz --exclude=\*.{jpg,gif,png,wmv,flv,tar.gz,zip} /path/to/foo/
    
    # To use parallel (multi-threaded) implementation of compression algorithms:
    tar -z ... -> tar -Ipigz ...
    tar -j ... -> tar -Ipbzip2 ...
    tar -J ... -> tar -Ipixz ...
    
```

Run the following command to see what cheatsheets are available.

```

    $ cheat -l
    
```

Navigate to help page for more details.

```

    $ cheat -h
    
```


--------------------------------------------------------------------------------

via: https://www.2daygeek.com/cheat-a-collection-of-practical-linux-command-examples/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com
[1]:https://www.2daygeek.com/linux-color-man-pages-configuration-less-most-command/
[2]:https://github.com/chrisallenlane/cheat
[3]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]:https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[6]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[8]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[9]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
