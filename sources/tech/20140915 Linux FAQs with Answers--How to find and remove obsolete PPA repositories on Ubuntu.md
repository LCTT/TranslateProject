Linux FAQs with Answers--How to find and remove obsolete PPA repositories on Ubuntu
================================================================================
> **Question**: I was trying to re-synchronize package index files by running apt-get update. But I am getting the following "404 Not Found" errors. Looks like I cannot fetch the latest index from some third-party PPA repositories that I've added before. How can I clean up such broken and old PPA repositories?

    Err http://ppa.launchpad.net trusty/main amd64 Packages
      404  Not Found
    Err http://ppa.launchpad.net trusty/main i386 Packages
      404  Not Found
    W: Failed to fetch http://ppa.launchpad.net/finalterm/daily/ubuntu/dists/trusty/main/binary-amd64/Packages  404  Not Found
    
    W: Failed to fetch http://ppa.launchpad.net/finalterm/daily/ubuntu/dists/trusty/main/binary-i386/Packages  404  Not Found
    
    E: Some index files failed to download. They have been ignored, or old ones used instead.

When you attempt to update APT package indexes, "404 Not Found" errors can often happen after distro upgrade. That is, after you upgraded your Ubuntu release, some third-party PPA repositories which you added on the old release are no longer supported on the upgraded release. In that case, you can **identify and purge those broken PPA repositories** as follows.

First, find out the PPAs which cause "404 Not Found" failures.

    $ sudo apt-get update | grep "Failed" 

![](https://farm6.staticflickr.com/5580/14972354938_0e1e1f3db6_z.jpg)

In this example, the PPA repository which is no longer supported in Ubuntu Trusty is "ppa:finalterm/daily".

Go ahead and [remove the PPA repository][1]（注：此文原文在同一个更新中，文件名：“20140915 Linux FAQs with Answers--How to remove PPA repository from command line on Ubuntu.md”）.

     $ sudo add-apt-repository --remove ppa:finalterm/daily 

You have to repeat this process for every obsolete PPA repository that you found from above.

![](https://farm4.staticflickr.com/3844/15158541642_1fc8f92c77_z.jpg)

After removing all obsolete PPA repositories, re-run "apt-get update" to check all of them have been successfully removed.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/find-remove-obsolete-ppa-repositories-ubuntu.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/how-to-remove-ppa-repository-from-command-line-on-ubuntu.html