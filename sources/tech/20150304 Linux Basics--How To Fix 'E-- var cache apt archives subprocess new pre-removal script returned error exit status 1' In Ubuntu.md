Translating---geekpi

Linux Basics: How To Fix “E: /var/cache/apt/archives/ subprocess new pre-removal script returned error exit status 1″ In Ubuntu
================================================================================
![](https://1102047360.rsc.cdn77.org/wp-content/uploads/2014/04/ubuntu-790x558.png)

Today, I got a problem while updating VirtualBox to the latest version.

> E: /var/cache/apt/archives/ subprocess new pre-removal script returned error exit status 1

![](https://www.unixmen.com/wp-content/uploads/2015/03/Update-Manager_0011.png)

### Solution: ###

I googled a bit and found the solution. Here is what I did to solve the problem.

    sudo apt-get clean
    sudo apt-get update && sudo apt-get upgrade

This will almost fix the problem.

If you still end up with the same error, then try the following commands:

    sudo dpkg --configure -a
    sudo apt-get -f install

Or, you can manually download the latest version from [Oracle VirtualBox][1] site and install it as shown below.

    sudo apt-get update 
    sudo dpkg -i virtualbox-4.3_4.3.24-98716~Ubuntu~raring_amd64.deb 
    sudo apt-get -f install
    sudo apt-get autoclean && sudo apt-get autoremove

Cheers!

--------------------------------------------------------------------------------

via: https://www.unixmen.com/linux-basics-how-to-fix-e-varcacheaptarchives-subprocess-new-pre-removal-script-returned-error-exit-status-1-in-ubuntu/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/sk/
[1]:https://www.virtualbox.org/wiki/Downloads
