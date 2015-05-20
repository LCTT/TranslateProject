Linux FAQs with Answers--How to fix “Encountered a section with no Package: header” error on Raspbian
================================================================================
> **Question**: I installed fresh Rasbian on Raspberry Pi. But when I tried to update APT package index by running sudo apt-get update, it throws the following error:

    E: Encountered a section with no Package: header
    E: Problem with MergeList /var/lib/dpkg/status
    E: The package lists or status file could not be parsed or opened.

> I then cannot install any package on Raspbian. How can I solve this error?

![](https://farm8.staticflickr.com/7704/17445484636_05ba81722f_c.jpg)

The error saying "Problem with MergeList /var/lib/dpkg/status" indicates that the status file got corrupted for some reason, and so cannot be parsed. This status file contains information about installed deb packages, and thus needs to be carefully backed up.

In this case, since this is freshly installed Raspbian, you can safely remove the status file, and re-generate it as follows.

    $ sudo rm /var/lib/dpkg/status
    $ sudo touch /var/lib/dpkg/status
    $ sudo apt-get update 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/encountered-section-with-no-package-header-error.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni