(翻译中 runningwater)
di – Disk Information Utility, Better Than df
================================================================================
If you are a Linux command line user, you would have definitely used the df command to check disk usage for file systems. Though df is a popular command but still it does not provide some advanced features like actual disk space that is available to a user, various useful display formats etc. There is another command line utility available that not only provides these advanced features but also all the features that df provides. In this article, we will discuss the disk information utility — **di**.

**NOTE** – If you want to more about df, check out [the df command tutorial][1].

### di – The Disk Information Utility ###

![](http://mylinuxbook.com/wp-content/uploads/2013/10/di-main.png)

It is evident from this snapshot of di’s manual page that this utility provides some valuable features and hence makes it worth using. Lets try out some practical examples of this utility.

### Testing Environment ###

- OS – Ubuntu 13.04
- Shell – Bash 4.2.45
- Application – di 4.30

### A Brief Tutorial ###

Here are some of the examples of di utility :

**1. The Default Output**

By default di command produces output in human readable format.

Here is an example :

    $ di
    Filesystem         Mount               Size     Used    Avail %Used  fs Type 
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4    
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs

So you can see that the disk usage figures are displayed in gigabytes (G) and Megabytes(M). This is definitely better than the default output that df produces.

**2. Print All Fields Like Mount Points, Special Device Names etc Using – A Option**

The option -A can be used to print mount points, special device names etc at full length.

Here is an example :

    $ di -A
    Mount fs Type  Filesystem 
         Options                             
            Size     Used     Free %Used  %Free 
            Size     Used    Avail %Used  %Free 
            Size     Used    Avail %Used  
           Inodes     Iused     Ifree %Iused
    /     ext4     /dev/sda6  
        rw,errors=remount-ro                
           28.1G    20.2G     8.0G   72%    28%  
           28.1G    21.6G     6.5G   77%    23%  
           26.7G    20.2G     6.5G   75%  
          1884160    389881   1494279   21% 
    /dev  devtmpfs udev       
        rw,mode=0755                        
            1.5G     0.0G     1.5G    0%   100%  
            1.5G     0.0G     1.5G    0%   100%  
            1.5G     0.0G     1.5G    0%  
           381805       571    381234    0% 
    /run  tmpfs    tmpfs      
        rw,noexec,nosuid,size=10%,mode=0755 
          300.2M     0.9M   299.3M    0%   100%  
          300.2M     0.9M   299.3M    0%   100%  
          300.2M     0.9M   299.3M    0%  
           384191       549    383642    0%

So you can see that all the fields — that can also be used for debugging purposes — are printed in the output.

**3. Print All Mounted Devices Using -a Option**

Here is an example :

    $ di -a
    Filesystem         Mount               Size     Used    Avail %Used  fs Type        
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4           
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs       
    devpts             /dev/pts            0.0M     0.0M     0.0M    0%  devpts         
    proc               /proc               0.0M     0.0M     0.0M    0%  proc           
    binfmt_misc        /proc/sys/fs/bi     0.0M     0.0M     0.0M    0%  binfmt_misc    
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs          
    none               /run/lock           0.0M     0.0M     0.0M    0%  tmpfs          
    none               /run/shm            0.0M     0.0M     0.0M    0%  tmpfs          
    none               /run/user           0.0M     0.0M     0.0M    0%  tmpfs          
    gvfsd-fuse         /run/user/himan     0.0M     0.0M     0.0M    0%  fuse.gvfsd-fuse
    sysfs              /sys                0.0M     0.0M     0.0M    0%  sysfs          
    none               /sys/fs/cgroup      0.0M     0.0M     0.0M    0%  tmpfs          
    none               /sys/fs/fuse/co     0.0M     0.0M     0.0M    0%  fusectl        
    none               /sys/kernel/deb     0.0M     0.0M     0.0M    0%  debugfs        
    none               /sys/kernel/sec     0.0M     0.0M     0.0M    0%  securityfs

So you can see that all the information related to all the mounted devices was printed.

**4. Print Comma Separated Values Through -c Option**

The option -c can be used to print command separated values enclosed with double quotes.

Here is an example :

    $ di -c
    s,m,b,u,v,p,T
    /dev/sda6,/,"28.1G","20.2G","6.5G",77%,ext4
    udev,/dev,"1.5G","0.0G","1.5G",0%,devtmpfs
    tmpfs,/run,"300.2M","0.9M","299.3M",0%,tmpfs

So you can see that the comma separated values were printed in the output.

**5. Print Size In Gigabytes Through -g Option**

Here is an example :

    $ di -g
    Filesystem         Mount              Gibis     Used    Avail %Used  fs Type 
    /dev/sda6          /                   28.1     20.2      6.5   77%  ext4    
    udev               /dev                 1.5      0.0      1.5    0%  devtmpfs
    tmpfs              /run                 0.3      0.0      0.3    0%  tmpfs

So you can see that all the size related values were printed in gigabytes.

Similarly you can use -k and -m options to display the size in kilobytes and megabytes respectively.

**6. Display Information Related To Specific File-system Type Through -I Option**

Suppose you want to display disk information related to only tmpfs filesystems. Here is how you can do it through -I option :

    $ di -I tmpfs
    Filesystem         Mount               Size     Used    Avail %Used  fs Type
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs  
    none               /run/lock           5.0M     0.0M     5.0M    0%  tmpfs  
    none               /run/shm            1.5G     0.0G     1.5G    0%  tmpfs  
    none               /run/user         100.0M     0.0M   100.0M    0%  tmpfs  
    none               /sys/fs/cgroup      0.0M     0.0M     0.0M    0%  tmpfs

So you can see that information related to only tmpfs type file systems was displayed in the output.

**7. Skip The Header Line In Output Through -n Option**

If you are trying to parse the output of this command through a script (or a program) and want the di command to skip the display of header line then it can be made possible through -n option.

Here is an example :

    $ di -n
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4    
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs

So you can see that the header line was not displayed in the output.

**8. Print A Totals Line Below The List Of Filesystems Through -t Option**

If it is desired to display the totals of all the relevant columns, use -t option.

Here is an example :

    $ di -t
    Filesystem         Mount               Size     Used    Avail %Used  fs Type 
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4    
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs   
                       Total              29.9G    20.2G     8.3G   72%

Observe that the last row consists of the totals of values for all file systems.

**9. Sort The Output Through -s Option**

The option -s can be used to sort the output of this command.

Here is how you can reverse sort the output :

    $ di -sr
    Filesystem         Mount               Size     Used    Avail %Used  fs Type
    tmpfs              /run              300.2M     0.9M   299.3M    0%  tmpfs
    udev               /dev                1.5G     0.0G     1.5G    0%  devtmpfs
    /dev/sda6          /                  28.1G    20.2G     6.5G   77%  ext4

So you can use the sub-option ‘r’ along with -s to reverse sort the output.

Similarly, you can do several other types of sorts using -s option. Here is an excerpt from the man page for your reference:

    -s sort-type
    Use sort-type to sort the output. The out‐
    put of di is normally sorted by mount
    point. The following sort flags may be
    used to change the sort order: m – by mount
    point (default); n – leave unsorted (as it
    appears in the mount table); s – by special
    device name; t – by filesystem type; r -
    reverse the sort order.

    These sort options may be combined in any
    order. e.g.: di -stsrm – by type, special,
    reversed mount; di -strsrm – by type,
    reversed special, mount.

**10. Specify Output Format Strings Through -f Option**

You can specify the output format string through a combination of -f option and a sub-option.

For instance, to print the name of the mount point, use -fm.

Here is an example :

    $ di -fm
    Mount          
    /              
    /dev           
    /run

So you can see that only mount names were printed in the output.

Similarly, to print file system type, use -ft.

Here is an example :

    $ di -ft
    fsType 
    ext4   
    devtmpf
    tmpfs

If you want to have a quick look then here is a snapshot of other formatting options available :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/di-1.png)

For complete set of options, refer to the [man page of di command][2].

### Download/Install ###

Here are some of the important links related to di command :

- [Home Page][3]
- [Download Link][4]

The command line utility di can also be downloaded and installed through command line by using apt, yum etc. Ubuntu users can download this command from Ubuntu Software Centre too.

### Pros ###

- Provides many advanced features
- OS independent

### Cons ###

- Does not come pre-installed on most of the Linux distributions
- Lots of option to learn

### Conclusion ###

To conclude, di command provides some very useful features over and above what df command provides. If you are looking for a df-like but advanced disk information related command line utility then di is the ideal choice. Try it out, it does what it promises.

**Have you ever tried di or any other df-like utility? Share your experience with us.**

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/di-a-disk-information-utility/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.expertslogin.com/linux-command/linux-df-command/
[2]:http://www.manpagez.com/man/1/di/
[3]:http://www.gentoo.com/di/
[4]:http://freecode.com/projects/diskinfo