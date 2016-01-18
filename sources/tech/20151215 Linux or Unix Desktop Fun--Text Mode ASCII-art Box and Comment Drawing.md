翻译中
Linux / Unix Desktop Fun: Text Mode ASCII-art Box and Comment Drawing
================================================================================
Boxes command is a text filter and a little known tool that can draw any kind of ASCII art box around its input text or code for fun and profit. You can quickly create email signatures, or create regional comments in any programming language. This command was intended to be used with the vim text editor, but can be tied to any text editor which supports filters, as well as from the command line as a standalone tool.

### Task: Install boxes ###

Use the [apt-get command][1] to install boxes under Debian / Ubuntu Linux:

    $ sudo apt-get install boxes

Sample outputs:

    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following NEW packages will be installed:
      boxes
    0 upgraded, 1 newly installed, 0 to remove and 6 not upgraded.
    Need to get 0 B/59.8 kB of archives.
    After this operation, 205 kB of additional disk space will be used.
    Selecting previously deselected package boxes.
    (Reading database ... 224284 files and directories currently installed.)
    Unpacking boxes (from .../boxes_1.0.1a-2.3_amd64.deb) ...
    Processing triggers for man-db ...
    Setting up boxes (1.0.1a-2.3) ...

RHEL / CentOS / Fedora Linux users, use the [yum command to install boxes][2] (first [enable EPEL repo as described here][3]):

    # yum install boxes

Sample outputs:

    Loaded plugins: rhnplugin
    Setting up Install Process
    Resolving Dependencies
    There are unfinished transactions remaining. You might consider running yum-complete-transaction first to finish them.
    --> Running transaction check
    ---> Package boxes.x86_64 0:1.1-8.el6 will be installed
    --> Finished Dependency Resolution
    Dependencies Resolved
    ==========================================================================
     Package        Arch            Version               Repository     Size
    ==========================================================================
    Installing:
     boxes          x86_64          1.1-8.el6             epel           64 k
    Transaction Summary
    ==========================================================================
    Install       1 Package(s)
    Total download size: 64 k
    Installed size: 151 k
    Is this ok [y/N]: y
    Downloading Packages:
    boxes-1.1-8.el6.x86_64.rpm                         |  64 kB     00:00
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
      Installing : boxes-1.1-8.el6.x86_64                                 1/1
    Installed:
      boxes.x86_64 0:1.1-8.el6
    Complete!

FreeBSD user can use the port as follows:

    cd /usr/ports/misc/boxes/ && make install clean

Or, add the package using the pkg_add command:

    # pkg_add -r boxes

### Draw any kind of box around some given text ###

Type the following command:

    echo "This is a test" | boxes

Or specify the name of the design to use:

    echo -e "\n\tVivek Gite\n\tvivek@nixcraft.com\n\twww.cyberciti.biz" | boxes -d dog

Sample outputs:

![Unix / Linux: Boxes Command To Draw Various Designs](http://s0.cyberciti.org/uploads/l/tips/2012/06/unix-linux-boxes-draw-dog-design.png)

Fig.01: Unix / Linux: Boxes Command To Draw Various Designs

#### How do I list all designs? ####

The syntax is:

    boxes option
    pipe | boxes options
    echo "text" | boxes -d foo
    boxes -l
 
The -d design option sets the name of the design to use. The syntax is:

    echo "Text" | boxes -d design
    pipe | boxes -d desig

The -l option list designs. It produces a listing of all available box designs in the config file, along with a sample box and information about it's creator:

    boxes -l
    boxes -l | more
    boxes -l | less

Sample outputs:

    43 Available Styles in "/etc/boxes/boxes-config":
    -------------------------------------------------
    ada-box (Neil Bird ):
        ---------------
        --           --
        --           --
        ---------------
    ada-cmt (Neil Bird ):
        --
        -- regular Ada
        -- comments
        --
    boy (Joan G. Stark ):
                        .-"""-.
                       / .===. \
                       \/ 6 6 \/
                       ( \___/ )
          _________ooo__\_____/______________
         /                                   \
        |   joan stark   spunk1111@juno.com   |
        |     VISIT MY ASCII ART GALLERY:     |
        | http://www.geocities.com/SoHo/7373/ |
         \_______________________ooo_________/  jgs
                        |  |  |
                        |_ | _|
                        |  |  |
                        |__|__|
                        /-'Y'-\
                       (__/ \__)
    ....
    ...
    output truncated
    ..

### How do I filter text via boxes while using vi/vim text editor? ###

You can use any external command with vi or vim. In this example, [insert current date and time][4], enter:

    !!date

OR

    :r !date

You need to type above command in Vim to read the output from the date command. This will insert the date and time after the current line:

    Tue Jun 12 00:05:38 IST 2012

You can do the same with boxes command. Create a sample shell script or a c program as follows:

    #!/bin/bash
    Purpose: Backup mysql database to remote server.
    Author: Vivek Gite
    Last updated on: Tue Jun, 12 2012

Now type the following (move cursor to the second line i.e. line which starts with "Purpose: ...")

    3!!boxes

And voila you will get the output as follows:

    #!/bin/bash
    /****************************************************/
    /* Purpose: Backup mysql database to remote server. */
    /* Author: Vivek Gite           */
    /* Last updated on: Tue Jun, 12 2012                */
    /****************************************************/

This video will give you an introduction to boxes command:

注：youtube 视频
<iframe width="595" height="446" frameborder="0" src="http://www.youtube.com/embed/glzXjNvrYOc?rel=0"></iframe>

(Video:01: boxes command in action. BTW, this is my first video so go easy on me and let me know what you think.)

See also

- boxes man page

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/tips/unix-linux-draw-any-kind-of-boxes-around-text-editor.html

作者：Vivek Gite 
译者：[zky001](https://github.com/zky001)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html
[2]:http://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[3]:http://www.cyberciti.biz/faq/fedora-sl-centos-redhat6-enable-epel-repo/
[4]:http://www.cyberciti.biz/faq/vim-inserting-current-date-time-under-linux-unix-osx/
