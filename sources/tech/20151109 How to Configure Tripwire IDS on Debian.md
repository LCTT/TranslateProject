正在翻译：zky001
How to Configure Tripwire IDS on Debian
================================================================================
This article is about Tripwire installation and configuration on Debian OS. It is a host based Intrusion detection system (IDS)  for Linux environment. Prime function of tripwire IDS is to detect and report any unauthorized change (files and directories ) on linux system. After tripwire installation, baseline database created first, tripwire monitors and detects changes such as  new file addition/creation, file modification and user who changed it etc. If the changes are legitimate, you can accept the changes to update tripwire database.

### Installation and Configuration ###

Tripwire installation on Debian VM is shown below.

    # apt-get install tripwire

![installation](http://blog.linoxide.com/wp-content/uploads/2015/11/installation.png)

During installation, tripwire prompt for following configuration.

#### Site key Creation ####

Tripwire required a site passphrase  to secure the tw.cfg tripwire configuration file and tw.pol tripwire policy file. Tripewire encrypte both files using given passphrase.  Site passphrase is must even for a single instance tripwire.

![site key1](http://blog.linoxide.com/wp-content/uploads/2015/11/site-key1.png)

#### Local Key passphrase ####

Local passphrase is needed for the  protection of  tripwire database and report files . Local key used by the tripwire  to avoid unauthorized modification of tripwire baseline database.

![local key1](http://blog.linoxide.com/wp-content/uploads/2015/11/local-key1.png)

#### Tripwire configuration path ####

Tripwire configuration saved in the /etc/tripwire/twcfg.txt file. It is used to generate encrypted configuration file tw.cfg.

![configuration file](http://blog.linoxide.com/wp-content/uploads/2015/11/configuration-file.png)

**Tripwire Policy  path**

Tripwire saves policies in /etc/tripwire/twpol.txt  file . It is used for the generation of encrypted policy file tw.pol used by the tripwire.

![tripwire policy](http://blog.linoxide.com/wp-content/uploads/2015/11/tripwire-policy.png)

Final installation of  tripwire is shown in the following snapshot.

![installed tripewire1](http://blog.linoxide.com/wp-content/uploads/2015/11/installed-tripewire1.png)

#### Tripwire Configuration file (twcfg.txt) ####

Tripwire configuration file (twcfg.txt) details is given below. Paths of encrypted policy file (tw.pol), site key (site.key) and local key (hostname-local.key) etc are given below.

    ROOT         =/usr/sbin
    
    POLFILE       =/etc/tripwire/tw.pol
    
    DBFILE       =/var/lib/tripwire/$(HOSTNAME).twd
    
    REPORTFILE   =/var/lib/tripwire/report/$(HOSTNAME)-$(DATE).twr
    
    SITEKEYFILE   =/etc/tripwire/site.key
    
    LOCALKEYFILE =/etc/tripwire/$(HOSTNAME)-local.key
    
    EDITOR       =/usr/bin/editor
    
    LATEPROMPTING =false
    
    LOOSEDIRECTORYCHECKING =false
    
    MAILNOVIOLATIONS =true
    
    EMAILREPORTLEVEL =3
    
    REPORTLEVEL   =3
    
    SYSLOGREPORTING =true
    
    MAILMETHOD   =SMTP
    
    SMTPHOST     =localhost
    
    SMTPPORT     =25
    
    TEMPDIRECTORY =/tmp

#### Tripwire Policy Configuration ####

Configure tripwire configuration before generation of baseline database. It is necessary to disable few policies such as /dev , /proc ,/root/mail etc. Detailed policy file twpol.txt is given below.

    @@section GLOBAL
    TWBIN = /usr/sbin;
    TWETC = /etc/tripwire;
    TWVAR = /var/lib/tripwire;
    
    #
    # File System Definitions
    #
    @@section FS
    
    #
    # First, some variables to make configuration easier
    #
    SEC_CRIT      = $(IgnoreNone)-SHa ; # Critical files that cannot change
    
    SEC_BIN       = $(ReadOnly) ;        # Binaries that should not change
    
    SEC_CONFIG    = $(Dynamic) ;         # Config files that are changed
    # infrequently but accessed
    # often
    
    SEC_LOG       = $(Growing) ;         # Files that grow, but that
    # should never change ownership
    
    SEC_INVARIANT = +tpug ;              # Directories that should never
    # change permission or ownership
    
    SIG_LOW       = 33 ;                 # Non-critical files that are of
    # minimal security impact
    
    SIG_MED       = 66 ;                 # Non-critical files that are of
    # significant security impact
    
    SIG_HI        = 100 ;                # Critical files that are
    # significant points of
    # vulnerability
    
    #
    # Tripwire Binaries
    #
    (
    rulename = "Tripwire Binaries",
    severity = $(SIG_HI)
    )
    {
    $(TWBIN)/siggen            -> $(SEC_BIN) ;
    $(TWBIN)/tripwire        -> $(SEC_BIN) ;
    $(TWBIN)/twadmin        -> $(SEC_BIN) ;
    $(TWBIN)/twprint        -> $(SEC_BIN) ;
    }
    {
    /boot            -> $(SEC_CRIT) ;
    /lib/modules        -> $(SEC_CRIT) ;
    }
    
    (
    rulename = "Boot Scripts",
    severity = $(SIG_HI)
    )
    {
    /etc/init.d        -> $(SEC_BIN) ;
    #/etc/rc.boot        -> $(SEC_BIN) ;
    /etc/rcS.d        -> $(SEC_BIN) ;
    /etc/rc0.d        -> $(SEC_BIN) ;
    /etc/rc1.d        -> $(SEC_BIN) ;
    /etc/rc2.d        -> $(SEC_BIN) ;
    /etc/rc3.d        -> $(SEC_BIN) ;
    /etc/rc4.d        -> $(SEC_BIN) ;
    /etc/rc5.d        -> $(SEC_BIN) ;
    /etc/rc6.d        -> $(SEC_BIN) ;
    }
    
    (
    rulename = "Root file-system executables",
    severity = $(SIG_HI)
    )
    {
    /bin            -> $(SEC_BIN) ;
    /sbin            -> $(SEC_BIN) ;
    }
    
    #
    # Critical Libraries
    #
    (
    rulename = "Root file-system libraries",
    severity = $(SIG_HI)
    )
    {
    /lib            -> $(SEC_BIN) ;
    }
    
    #
    # Login and Privilege Raising Programs
    #
    (
    rulename = "Security Control",
    severity = $(SIG_MED)
    )
    {
    /etc/passwd        -> $(SEC_CONFIG) ;
    /etc/shadow        -> $(SEC_CONFIG) ;
    }
    {
    #/var/lock        -> $(SEC_CONFIG) ;
    #/var/run        -> $(SEC_CONFIG) ; # daemon PIDs
    /var/log        -> $(SEC_CONFIG) ;
    }
    
    # These files change the behavior of the root account
    (
    rulename = "Root config files",
    severity = 100
    )
    {
    /root                -> $(SEC_CRIT) ; # Catch all additions to /root
    #/root/mail            -> $(SEC_CONFIG) ;
    #/root/Mail            -> $(SEC_CONFIG) ;
    /root/.xsession-errors        -> $(SEC_CONFIG) ;
    #/root/.xauth            -> $(SEC_CONFIG) ;
    #/root/.tcshrc            -> $(SEC_CONFIG) ;
    #/root/.sawfish            -> $(SEC_CONFIG) ;
    #/root/.pinerc            -> $(SEC_CONFIG) ;
    #/root/.mc            -> $(SEC_CONFIG) ;
    #/root/.gnome_private        -> $(SEC_CONFIG) ;
    #/root/.gnome-desktop        -> $(SEC_CONFIG) ;
    #/root/.gnome            -> $(SEC_CONFIG) ;
    #/root/.esd_auth            -> $(SEC_CONFIG) ;
    #    /root/.elm            -> $(SEC_CONFIG) ;
    #/root/.cshrc                -> $(SEC_CONFIG) ;
    #/root/.bashrc            -> $(SEC_CONFIG) ;
    #/root/.bash_profile        -> $(SEC_CONFIG) ;
    #    /root/.bash_logout        -> $(SEC_CONFIG) ;
    #/root/.bash_history        -> $(SEC_CONFIG) ;
    #/root/.amandahosts        -> $(SEC_CONFIG) ;
    #/root/.addressbook.lu        -> $(SEC_CONFIG) ;
    #/root/.addressbook        -> $(SEC_CONFIG) ;
    #/root/.Xresources        -> $(SEC_CONFIG) ;
    #/root/.Xauthority        -> $(SEC_CONFIG) -i ; # Changes Inode number on login
    /root/.ICEauthority            -> $(SEC_CONFIG) ;
    }
    
    #
    # Critical devices
    #
    (
    rulename = "Devices & Kernel information",
    severity = $(SIG_HI),
    )
    {
    #/dev        -> $(Device) ;
    #/proc        -> $(Device) ;
    }

#### Tripwire Report ####

**tripwire –check** command checks the twpol.txt file and based on this file generates tripwire report which is shown below. If this is any error in the twpol.txt file, tripwire does not generate report.

![tripwire report](http://blog.linoxide.com/wp-content/uploads/2015/11/tripwire-report.png)

**Report in text form**

    root@VMdebian:/home/labadmin# tripwire --check
    
    Parsing policy file: /etc/tripwire/tw.pol
    
    *** Processing Unix File System ***
    
    Performing integrity check...
    
    Wrote report file: /var/lib/tripwire/report/VMdebian-20151024-122322.twr
    
    Open Source Tripwire(R) 2.4.2.2 Integrity Check Report
    
    Report generated by:         root
    
    Report created on:           Sat Oct 24 12:23:22 2015
    
    Database last updated on:     Never
    
    Report Summary:
    
    =========================================================
    
    Host name:                   VMdebian
    
    Host IP address:             127.0.1.1
    
    Host ID:                     None
    
    Policy file used:             /etc/tripwire/tw.pol
    
    Configuration file used:     /etc/tripwire/tw.cfg
    
    Database file used:           /var/lib/tripwire/VMdebian.twd
    
    Command line used:           tripwire --check
    
    =========================================================
    
    Rule Summary:
    
    =========================================================
    
    -------------------------------------------------------------------------------
    
    Section: Unix File System
    
    -------------------------------------------------------------------------------
    
    Rule Name                       Severity Level   Added   Removed Modified
    
    ---------                       --------------   -----   ------- --------
    
    Other binaries                 66               0       0       0      
    
    Tripwire Binaries               100               0       0       0      
    
    Other libraries                 66               0       0       0      
    
    Root file-system executables   100               0       0       0      
    
    Tripwire Data Files             100               0       0       0      
    
    System boot changes             100               0       0       0      
    
    (/var/log)
    
    Root file-system libraries     100               0       0       0      
    
    (/lib)
    
    Critical system boot files     100               0       0       0      
    
    Other configuration files       66               0       0       0      
    
    (/etc)
    
    Boot Scripts                   100               0       0       0      
    
    Security Control               66               0       0       0      
    
    Root config files               100               0       0       0      
    
    Invariant Directories           66               0       0       0      
    
    Total objects scanned: 25943
    
    Total violations found: 0
    
    =========================Object Summary:================================
    
    -------------------------------------------------------------------------------
    
    # Section: Unix File System
    
    -------------------------------------------------------------------------------
    
    No violations.
    
    ===========================Error Report:=====================================
    
    No Errors
    
    -------------------------------------------------------------------------------
    
    *** End of report ***
    
    Open Source Tripwire 2.4 Portions copyright 2000 Tripwire, Inc. Tripwire is a registered
    
    trademark of Tripwire, Inc. This software comes with ABSOLUTELY NO WARRANTY;
    
    for details use --version. This is free software which may be redistributed
    
    or modified only under certain conditions; see COPYING for details.
    
    All rights reserved.
    
    Integrity check complete.

### Conclusion ###

In this article, we learned installation and basic configuration of open source IDS tool Tripwire.  First it generates baseline database and detects any change (file/folder) by comparing it with already generated baseline. However, tripwire is not live monitoring IDS.

--------------------------------------------------------------------------------

via: http://linoxide.com/security/configure-tripwire-ids-debian/

作者：[nido][a]
译者：[译者zky001](https://github.com/zky001)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/naveeda/
