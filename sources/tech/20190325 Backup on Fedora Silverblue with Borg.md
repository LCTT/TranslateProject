[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Backup on Fedora Silverblue with Borg)
[#]: via: (https://fedoramagazine.org/backup-on-fedora-silverblue-with-borg/)
[#]: author: (Steven Snow https://fedoramagazine.org/author/jakfrost/)

Backup on Fedora Silverblue with Borg
======

![][1]

When it comes to backing up a Fedora Silverblue system, some of the traditional tools may not function as expected. BorgBackup (Borg) is an alternative available that can provide backup capability for your Silverblue based systems. This how-to explains the steps for using BorgBackup 1.1.8 as a layered package to back up Fedora Silverblue 29 system.

On a normal Fedora Workstation system, _dnf_ is used to install a package. However, on Fedora Silverblue, _rpm-ostree install_ is used to install new software. This is termed layering on the Silverblue system, since the core ostree is an immutable image and the rpm package is layered onto the core system during the install process resulting in a new local image with the layered package.

> “BorgBackup (short: Borg) is a deduplicating backup program. Optionally, it supports compression and authenticated encryption.”
>
> From the Borg website

Additionally, the main way to interact with Borg is via the command line. Reading the Quick Start guide it becomes apparent that Borg is well suited to scripting. In fact, it is pretty much necessary to use some form of shell script when performing repeated thorough backup’s of a system. A basic script is provided in the [Borg Quick Start guide][2] , as a point to get started.

### Installing Borg

In a terminal, type the following command to install BorgBackup as a layered package:

```
$rpm-ostree install borgbackup
```
This installs BorgBackup to the Fedora Silverblue system. To use it, reboot into the new ostree with:

```
$systemctl reboot
```

Now Borg is installed, and ready to use.

### Some notes about Silverblue and its file system, layered packages and flatpaks

#### The file system

Silverblue is an immutable operating system based on ostree, with support for layering rpm’s through the use of rpm-ostree. At the user level, this means the path that appears as _/home_ in a flatpak, will actually be _/var/home_ to the system. For programs like Borg, and other backup tools this is important to remember since they often require the actual path, so in this example that would be _/var/home_ instead of just _/home_.

Before starting a backup it’s a good idea to understand where potential data could be stored, and then if that data should be backed up. Silverblue’s file system layout is very specific with respect to what is writable and what is not. On Silverblue _/etc_ and _/var_ are the only places that are not immutable, therefore writable. On a single user system, typically the user home directory would be a likely choice for data backup. Normally excluding Downloads, but including Documents and more. Also, _/etc_ is a logical choice for some configuration options you don’t want to go through again. Take notes of what to exclude from your home directory and from _/etc_. Some files and subdirectories of /etc you need root or sudo privileges to access.

#### Flatpaks

Flatpak applications store data in your home directory under _$HOME/.var/app/flatpakapp_ , regardless of whether they were installed as user or system. If installed at a user level, there is also data found in _$HOME/.local/share/flatpak/app/_ , or if installed at a system level it will be found in _/var/lib/flatpak/app_ For the purposes of this article, it was enough to list the flatpak’s installed and redirect the output to a file for backing up. Reasoning that if there is a need to reinstall them (flatpaks) the list file could be used to do it from. For a more robust approach, examining the flatpak file system layouts can be done [here.][3]

#### Layering and rpm-ostree

There is no easy way for a user to retrieve the layered package information aside from the

$rpm-ostree status

command. Which shows the current and previous ostree commit’s layered packages, and if any commits are pinned they would be listed too. Below is the output on my system, note the LayeredPackages label at the end of each commit listing.

![][4]

The command

$ostree log

is useful to retrieve a history of commits for the system. Type it in your terminal to see the output.

### Preparing the backup repo

In order to use Borg to back up a system, you need to first initialize a Borg repo. Before initializing, the decision must be made to use encryption (or not) and if so, what mode.

With Borg the data can be protected using 256-bit AES encryption. The integrity and authenticity of the data, which is encrypted on the clientside, is verified using HMAC-SHA256. The encryption modes are listed below.

#### Encryption modes

Hash/MAC | Not encrypted no auth | Not encrypted, but authenticated | Encrypted (AEAD w/ AES) and authenticated
---|---|---|---
SHA-256 | none | authenticated | repokey keyfile
BLAKE2b | n/a | authenticated-blake2 | repokey-blake2 keyfile-blake2

The encryption mode decided on was keyfile-blake2, which requires a passphrase to be entered as well as the keyfile being needed.

Borg can use the following compression types which you can specify at backup creation time.

  * lz4 (super fast, low compression)
  * zstd (wide range from high speed and low compression to high compression and lower speed)
  * zlib (medium speed and compression)
  * lzma (low speed, high compression)



For compression lzma was chosen at setting 6, the highest sensible compression level. The initial backup took 4 minutes 59.98 seconds to complete, while subsequent ones have taken less than 20 seconds as a rule.

#### Borg init

To be able to perform backups with Borg, first, create a directory for your Borg repo:

```
$mkdir borg_testdir
```

and then change to it.

```
$cd borg_testdir
```

Next, initialize the Borg repo with the borg init command:

```
$borg init -e=keyfile-blake2 .
```

Borg will prompt for your passphrase, which is case sensitive, and at creation must be entered twice. A suitable passphrase of alpha-numeric characters and symbols, and of a reasonable length should be created. It can be changed later on if needed without affecting the keyfile, or your encrypted data. The keyfile can be exported and should be for backup purposes, along with the passphrase, and stored somewhere secure.

#### Creating a backup

Next, create a test backup of the Documents directory, remember on Silverblue the actual path to the user Documents directory is _/var/home/username/Documents_. In practice on Silverblue, it is suitable to use _~/_ or _$HOME_ to indicate your home directory. The distinction between the actual path and environment variables being the real path does not change whereas the environment variable can be changed. From within the Borg repo, type the following command

```
$borg create .::borgtest /var/home/username/Documents
```

and that will create a backup of the Documents directory named **borgtest**. To break down the command a bit; **create** requires a **repo location** , in this case **.** since we are in the **top level** of the **repo**. That makes the path **.::borgtest** for the backup name. Finally **/var/home/username/Documents** is the location of the data we are backing up.

The following command

```
$borg list
```

returns a listing of your backups, after a few days it look similar to this:

![Output of borg list command in my backup repo.][5]

To delete the test backup, type the following in the terminal

```
$borg delete .::borgtest
```

at this time Borg will prompt for the encryption passphrase in order to delete the backup.

### Pulling it together into a shell script

As mentioned Borg is an eminently script friendly tool. The Borg documentation links provided are great places to find out more about BorgBackup, and there is more. The example script provided by Borg was modified to suit this article. Below is a version with the basic parts that others could use as a starting point if desired. It tries to capture the three information pieces of the system and apps mentioned earlier. The output of _flatpak list_ , _rpm-ostree status_ , and _ostree log_ as human readable files given the same names each time so overwritten each time. The repo setup had to be changed since the original example is for a remote server login with ssh, and this was intended to be used locally. The other changes mostly involved correcting directory paths, tailoring the excluded content to suit this systems home directory, and choosing the compression.
```
#!/bin/sh



# This gets the ostree commit data, this file is overwritten each time

sudo ostree log fedora-workstation:fedora/29/x86_64/silverblue > ostree.log



rpm-ostree status > rpm-ostree-status.lst



# Flatpaks get listed too

flatpak list > flatpak.lst



# Setting this, so the repo does not need to be given on the commandline:

export BORG_REPO=/var/home/usernamehere/borg_testdir



# Setting this, so you won't be asked for your repository passphrase:(Caution advised!)

export BORG_PASSPHRASE='usercomplexpassphrasehere'



# some helpers and error handling:

info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }

trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM



info "Starting backup"



# Backup the most important directories into an archive named after

# the machine this script is currently running on:

borg create                         \

    --verbose                       \

    --filter AME                    \

    --list                          \

    --stats                         \

    --show-rc                       \

    --compression auto,lzma,6       \

    --exclude-caches                \

    --exclude '/var/home/*/borg_testdir'\

    --exclude '/var/home/*/Downloads/'\

    --exclude '/var/home/*/.var/'   \

    --exclude '/var/home/*/Desktop/'\

    --exclude '/var/home/*/bin/'    \

                                    \

    ::'{hostname}-{now}'            \

    /etc                            \

    /var/home/ssnow                 \



    backup_exit=$?



    info "Pruning repository"



    # Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly

    # archives of THIS machine. The '{hostname}-' prefix is very important to

    # limit prune's operation to this machine's archives and not apply to

    # other machines' archives also:



    borg prune                          \

        --list                          \

        --prefix '{hostname}-'          \

        --show-rc                       \

        --keep-daily    7               \

        --keep-weekly   4               \

        --keep-monthly  6               \



    prune_exit=$?



    # use highest exit code as global exit code

    global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))



    if [ ${global_exit} -eq 0 ]; then

        info "Backup and Prune finished successfully"

    elif [ ${global_exit} -eq 1 ]; then

        info "Backup and/or Prune finished with warnings"

    else

        info "Backup and/or Prune finished with errors"

    fi



    exit ${global_exit}
```

This listing is missing some more excludes that were specific to the test system setup and backup intentions, and is very basic with room for customization and improvement. For this test to write an article it wasn’t a problem having the passphrase inside of a shell script file. Under normal use it is better to enter the passphrase each time when performing the backup.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/backup-on-fedora-silverblue-with-borg/

作者：[Steven Snow][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jakfrost/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/03/borg-816x345.jpg
[2]: https://borgbackup.readthedocs.io/en/stable/quickstart.html
[3]: https://github.com/flatpak/flatpak/wiki/Filesystem
[4]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-18-17-11-21-1024x285.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-18-18-56-03.png
