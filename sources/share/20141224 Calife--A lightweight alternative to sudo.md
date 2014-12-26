Calife – A lightweight alternative to sudo
================================================================================
Calife requests user's own password for becoming login (or root, if no login is provided), and switches to that user and group ID after verifying proper rights to do so. A shell is then executed. If calife is executed by root, no password is requested and a shell with the appropriate user ID is executed.

The invoked shell is the user's own except when a shell is specified in the configuration file calife.auth.

If "-" is specified on the command line, user's profile files are read as if it was a login shell.

This is not the traditional behavior of su.

Only users specified in calife.auth can use calife to become another one with this method.

calife.auth is installed as /etc/calife.auth

### Calife Features ###

Here is an extensive list of features:

you keep your environment variables and shell aliases intact
it has start and end of session logging
you can have a list of all permitted logins for each calife user. That way, you can give a user newsmaster’s rights without giving out the root password
you can specify a group in the configuration file instead of the logins of all administrators: Juste use @staff or %staff and all members of the staff group will have access to calife
calife can also be used to become users even if they have no home directory or even no shell. That’s very practical if you want to become uucp or even bin
you can make calife runs a specific system-wide script at the end of the session (to send a mailabout what was done as root for example)

### Install calife in ubuntu ###

Open the terminal and run the following command

    sudo apt-get install calife

### Using Calife ###

### Syntax ###

    calife [-] [login]

Check calife manpage for more details

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/calife-a-lightweight-alternative-to-sudo.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]: