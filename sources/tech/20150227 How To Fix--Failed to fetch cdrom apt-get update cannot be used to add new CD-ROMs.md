How To Fix: Failed to fetch cdrom apt-get update cannot be used to add new CD-ROMs
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/12/elementary_OS_Freya.jpg)

These days I am experimenting with Elementary OS Freya and during this, I encountered a very common updater error: **Failed to fetch cdrom Please use apt-cdrom to make this CD-ROM recognized by APT. apt-get update cannot be used to add new CD-ROMs**. The complete error looked like this after running the apt-get update command:

> W: Failed to fetch cdrom://elementary OS 0.3 _Freya_ – Daily amd64 (20150208)/dists/trusty/main/binary-amd64/Packages Please use apt-cdrom to make this CD-ROM recognized by APT. apt-get update cannot be used to add new CD-ROMs
> 
> W: Failed to fetch cdrom://elementary OS 0.3 _Freya_ – Daily amd64 (20150208)/dists/trusty/restricted/binary-amd64/Packages Please use apt-cdrom to make this CD-ROM recognized by APT. apt-get update cannot be used to add new CD-ROMs
> 
> E: Some index files failed to download. They have been ignored, or old ones used instead.

In this post, we shall see how to fix this error.

### Fix Failed to fetch cdrom apt-get update cannot be used to add new CD-ROMs error ###

The reason for this error is that cdrom has been included as one of the the sources here. And to fix this issue, we need to remove this from the list of software sources.

In Ubuntu, look for Software & Updates:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Software_Update_Ubuntu.jpeg)

In the first tab Ubuntu Software, look for the cdrom, if it’s checked, uncheck it.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/CDROM_Error_Update_Software_Sources.jpeg)

Close the Software Sources and run the update again. It should work fine now.

### Further troubleshoot: ###

The method described above should have fixed this **apt-get update cannot be used to add new CD-ROMs** error. But this was not the case for me because the option of cdrom was already grayed out as I was using live session.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/CDROM_Update_Error.png)

Now to fix our error, we shall take the command line route. Open a terminal and use the following line to see what is included in sources list:

    cat /etc/apt/sources.list

The output for me was as following:

    deb cdrom:[elementary OS 0.3 _Freya_ – Daily amd64 (20150208)]/ trusty main restricted
    deb http://archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse
    deb http://security.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
    deb-src http://security.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
    deb http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse

Look at the first line in the above list. It includes cdrom. We need to comment out this line by adding # in front of it to make it look like this:

    #deb cdrom:[elementary OS 0.3 _Freya_ – Daily amd64 (20150208)]/ trusty main restricted

To do that use the command below:

    sudo gedit /etc/apt/sources.list

Once you have edited the sources.list, run the apt-get update once again. The error apt-get update cannot be used to add new CD-ROMs should have been fixed. If you are facing any other update issue, do look at this article which is a collection of most [common Ubuntu update error fixes][1].

I hope you found this tutorial helpful. If you have any questions or suggestions, feel free to drop a comment.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-failed-fetch-cdrom-aptget-update-add-cdroms/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/fix-update-errors-ubuntu-1404/