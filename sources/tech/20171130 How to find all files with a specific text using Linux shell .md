translating by lujun9972
How to find all files with a specific text using Linux shell 
------
### Objective

The following article provides some useful tips on how to find all files within any specific directory or entire file-system containing any specific word or string.

### Difficulty

EASY

### Conventions

*   # - requires given command to be executed with root privileges either directly as a root user or by use of sudo command

*   $ - given command to be executed as a regular non-privileged user

### Examples

### Find all files with a specific string non-recursively

The first command example will search for a string

`stretch`

in all files within

`/etc/`

directory while excluding any sub-directories:

```
# grep -s stretch /etc/*
/etc/os-release:PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
/etc/os-release:VERSION="9 (stretch)"
```
`-s`

grep option will suppress error messages about nonexistent or unreadable files. The output shows filenames as well as prints the actual line containing requested string.

### Find all files with a specific string recursively

The above command omitted all sub-directories. To search recursively means to also traverse all sub-directories. The following command will search for a string

`stretch`

in all files within

`/etc/`

directory including all sub-directories:

```
# grep -R stretch /etc/*
/etc/apt/sources.list:# deb cdrom:[Debian GNU/Linux testing _Stretch_ - Official Snapshot amd64 NETINST Binary-1 20170109-05:56]/ stretch main
/etc/apt/sources.list:#deb cdrom:[Debian GNU/Linux testing _Stretch_ - Official Snapshot amd64 NETINST Binary-1 20170109-05:56]/ stretch main
/etc/apt/sources.list:deb http://ftp.au.debian.org/debian/ stretch main
/etc/apt/sources.list:deb-src http://ftp.au.debian.org/debian/ stretch main
/etc/apt/sources.list:deb http://security.debian.org/debian-security stretch/updates main
/etc/apt/sources.list:deb-src http://security.debian.org/debian-security stretch/updates main
/etc/dictionaries-common/words:backstretch
/etc/dictionaries-common/words:backstretch's
/etc/dictionaries-common/words:backstretches
/etc/dictionaries-common/words:homestretch
/etc/dictionaries-common/words:homestretch's
/etc/dictionaries-common/words:homestretches
/etc/dictionaries-common/words:outstretch
/etc/dictionaries-common/words:outstretched
/etc/dictionaries-common/words:outstretches
/etc/dictionaries-common/words:outstretching
/etc/dictionaries-common/words:stretch
/etc/dictionaries-common/words:stretch's
/etc/dictionaries-common/words:stretched
/etc/dictionaries-common/words:stretcher
/etc/dictionaries-common/words:stretcher's
/etc/dictionaries-common/words:stretchers
/etc/dictionaries-common/words:stretches
/etc/dictionaries-common/words:stretchier
/etc/dictionaries-common/words:stretchiest
/etc/dictionaries-common/words:stretching
/etc/dictionaries-common/words:stretchy
/etc/grub.d/00_header:background_image -m stretch `make_system_path_relative_to_its_root "$GRUB_BACKGROUND"`
/etc/os-release:PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
/etc/os-release:VERSION="9 (stretch)"
```

The above

`grep`

command example lists all files containing string

`stretch`

. Meaning the lines with

`stretches`

,

`stretched`

etc. are also shown. Use grep's

`-w`

option to show only a specific word:

```
# grep -Rw stretch /etc/*
/etc/apt/sources.list:# deb cdrom:[Debian GNU/Linux testing _Stretch_ - Official Snapshot amd64 NETINST Binary-1 20170109-05:56]/ stretch main
/etc/apt/sources.list:#deb cdrom:[Debian GNU/Linux testing _Stretch_ - Official Snapshot amd64 NETINST Binary-1 20170109-05:56]/ stretch main
/etc/apt/sources.list:deb http://ftp.au.debian.org/debian/ stretch main
/etc/apt/sources.list:deb-src http://ftp.au.debian.org/debian/ stretch main
/etc/apt/sources.list:deb http://security.debian.org/debian-security stretch/updates main
/etc/apt/sources.list:deb-src http://security.debian.org/debian-security stretch/updates main
/etc/dictionaries-common/words:stretch
/etc/dictionaries-common/words:stretch's
/etc/grub.d/00_header:background_image -m stretch `make_system_path_relative_to_its_root "$GRUB_BACKGROUND"`
/etc/os-release:PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
/etc/os-release:VERSION="9 (stretch)"
```

The above commands may produce an unnecessary output. The next example will only show all file names containing string

`stretch`

within

`/etc/`

directory recursively:

```
# grep -Rl stretch /etc/*
/etc/apt/sources.list
/etc/dictionaries-common/words
/etc/grub.d/00_header
/etc/os-release
```

All searches are by default case sensitive which means that any search for a string

`stretch`

will only show files containing the exact uppercase and lowercase match. By using grep's

`-i`

option the command will also list any lines containing

`Stretch`

,

`STRETCH`

,

`StReTcH`

etc., hence, to perform case-insensitive search.

```
# grep -Ril stretch /etc/*
/etc/apt/sources.list
/etc/dictionaries-common/default.hash
/etc/dictionaries-common/words
/etc/grub.d/00_header
/etc/os-release
```

Using

`grep`

command it is also possible to include only specific files as part of the search. For example we only would like to search for a specific text/string within configuration files with extension

`.conf`

. The next example will find all files with extension

`.conf`

within

`/etc`

directory containing string

`bash`

:

```
# grep -Ril bash /etc/*.conf
OR
# grep -Ril --include=\*.conf bash /etc/*
/etc/adduser.conf
```
`--exclude`

option we can exclude any specific filenames:

```
# grep -Ril --exclude=\*.conf bash /etc/*
/etc/alternatives/view
/etc/alternatives/vim
/etc/alternatives/vi
/etc/alternatives/vimdiff
/etc/alternatives/rvim
/etc/alternatives/ex
/etc/alternatives/rview
/etc/bash.bashrc
/etc/bash_completion.d/grub
/etc/cron.daily/apt-compat
/etc/cron.daily/exim4-base
/etc/dictionaries-common/default.hash
/etc/dictionaries-common/words
/etc/inputrc
/etc/passwd
/etc/passwd-
/etc/profile
/etc/shells
/etc/skel/.profile
/etc/skel/.bashrc
/etc/skel/.bash_logout
```

Same as with files grep can also exclude specific directories from the search. Use

`--exclude-dir`

option to exclude directory from search. The following search example will find all files containing string

`stretch`

within

`/etc`

directory and exclude

`/etc/grub.d`

from search:

```
# grep --exclude-dir=/etc/grub.d -Rwl stretch /etc/*
/etc/apt/sources.list
/etc/dictionaries-common/words
/etc/os-release
```

By using

`-n`

option grep will also provide an information regarding a line number where the specific string was found:

```
# grep -Rni bash /etc/*.conf
/etc/adduser.conf:6:DSHELL=/bin/bash
```

The last example will use

`-v`

option to list all files NOT containing a specific keyword. For example the following search will list all files within

`/etc/`

directory which do not contain string

`stretch`

:

```
# grep -Rlv stretch /etc/*
```

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-find-all-files-with-a-specific-text-using-linux-shell

作者：[Lubos Rendek][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
