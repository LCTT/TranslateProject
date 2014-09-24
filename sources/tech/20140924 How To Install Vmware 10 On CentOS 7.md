How To Install Vmware 10 On CentOS 7
================================================================================
I will give you my experience install of vmware 10.0.3 on centos 7. Normally it will not work with centos 7, because it’s running with lower kernel version 3.10.

1 – Download and install with normal way( no problem about  this ). The only problem is when you try vmware program later.

### How to fix this? ###

**1 – Go to /usr/lib/vmware/modules/source.**

    cd /usr/lib/vmware/modules/source

**2 – Decompress vmnet.tar.**

    tar -xvf vmnet.tar

**3 – Go to vmnet-only directory.**

    cd vmnet-only

**4 – Edit filter.c file.**

    vi filter.c

On line 206 and 259 replace string from:

    #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0)

to

    #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 0, 0)

Save and exit.

**5 – Back to folder before.**

    cd ../

**6 – Compress the folder again.**

    tar -uvf vmnet.tar vmnet-only

**7 – Remove the old directory.**

    rm -fr vmnet-only

**8 – Start your vmware and Enjoy.**

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_008.png)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-vmware-10-centos-7/

作者： M.el Khamlichi
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出