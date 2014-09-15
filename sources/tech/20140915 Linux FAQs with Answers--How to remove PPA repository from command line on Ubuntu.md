Linux FAQs with Answers--How to remove PPA repository from command line on Ubuntu
================================================================================
> **Question**: I added a third-party PPA repository on my Ubuntu box some time ago. How can I remove the PPA repository? 

A Personal Package Archives (PPA) is a Ubuntu way to allow independent developers and contributors to build and distribute any custom packages as a third-party APT repository via Launchpad. If you are a Ubuntu user, chances are that you have added some popular third-party PPA repositories to your Ubuntu system. If you want to remove any pre-configured PPA repository, here is how to do it.

Suppose you have a third-party PPA repository named "ppa:webapps/preview" added on your Ubuntu system, as follows.

    $ sudo add-apt-repository ppa:webapps/preview

If you want to **delete a PPA repository alone**, run the following command.

     $ sudo add-apt-repository --remove ppa:someppa/ppa 

Note that the above command does not touch any packages installed or upgraded from the PPA itself.

If you want to **delete a PPA repository as well as all packages installed/upgraded from the PPA**, you can use ppa-purge command.

To install ppa-purge package:

    $ sudo apt-get install ppa-purge 

To remove a PPA repository and all its packages from the command line:

    $ sudo ppa-purge ppa:webapps/preview 

These methods can be useful when you [identify and purge broken PPA repositories][1]（注：此文原文在同一个更新中，文件名：“20140915 Linux FAQs with Answers--How to find and remove obsolete PPA repositories on Ubuntu.md”） after distro upgrade.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/how-to-remove-ppa-repository-from-command-line-on-ubuntu.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/find-remove-obsolete-ppa-repositories-ubuntu.html