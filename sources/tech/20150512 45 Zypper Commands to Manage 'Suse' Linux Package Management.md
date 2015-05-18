zhangboyue 翻译中
45 Zypper Commands to Manage ‘Suse’ Linux Package Management
================================================================================
SUSE (Software and System Entwicklung (Germany) meaning Software and System Development, in English) Linux lies on top of Linux Kernel brought by Novell. SUSE comes in two pack. One of them is called OpenSUSE, which is freely available (free as in speech as well as free as in wine). It is a community driven project packed with latest application support, the latest stable release of OpenSUSE Linux is 13.2.

The other is SUSE Linux Enterprise which is a commercial Linux Distribution designed specially for enterprise and production. SUSE Linux Enterprise edition comes with a variety of Enterprise Applications and features suited for production environment, the latest stable release of SUSE Linux Enterprise Edition is 12.

You may like to check the detailed installation instruction of SUSE Linux Enterprise Server at:

- [Installation of SUSE Linux Enterprise Server 12][1]

Zypper and YaST are the Package Manager for SUSE Linux, which works on top of RPM.

YaST which stands for Yet another Setup Tool is a tool that works on OpenSUSE and SUSE Enterprise edition to administer, setup and configure SUSE Linux.

Zypper is the command line interface of ZYpp package manager for installing, removing and updating SUSE. ZYpp is the package management engine that powers both Zypper and YaST.

Here in this article we will see Zypper in action, which will be installing, updating, removing and doing every other thing a package manager can do. Here we go…

**Important** : Remember all these command are meant for system wide changes hence must be run as root, else the command will fail.

### Getting Basic Help with Zypper ###

1. Run zypper without any option, will give you a list of all global options and commands.

    # zypper
    
    Usage:
    	zypper [--global-options] 

2. To get help on a specific command say ‘in’ (install), run the below commands.

    # zypper help in
    OR
    # zypper help install
    
    install (in) [options] <capability|rpm_file_uri> ...
    
    Install packages with specified capabilities or RPM files with specified
    location. A capability is NAME[.ARCH][OP], where OP is one
    of <, <=, =, >=, >.
    
      Command options:
        --from <alias|#|URI>    Select packages from the specified repository.
    -r, --repo <alias|#|URI>    Load only the specified repository.
    -t, --type            Type of package (package, patch, pattern, product, srcpackage).
                                Default: package.
    -n, --name                  Select packages by plain name, not by capability.
    -C, --capability            Select packages by capability.
    -f, --force                 Install even if the item is already installed (reinstall),
                                downgraded or changes vendor or architecture.
        --oldpackage            Allow to replace a newer item with an older one.
                                Handy if you are doing a rollback. Unlike --force
                                it will not enforce a reinstall.
        --replacefiles          Install the packages even if they replace files from other,
                                already installed, packages. Default is to treat file conflicts
                                as an error. --download-as-needed disables the fileconflict check.
    ......

3. Search for a package (say gnome-desktop) before installing.

    # zypper se gnome-desktop
    
    Retrieving repository 'openSUSE-13.2-Debug' metadata ............................................................[done]
    Building repository 'openSUSE-13.2-Debug' cache .................................................................[done]
    Retrieving repository 'openSUSE-13.2-Non-Oss' metadata ......................................................... [done]
    Building repository 'openSUSE-13.2-Non-Oss' cache ...............................................................[done]
    Retrieving repository 'openSUSE-13.2-Oss' metadata ..............................................................[done]
    Building repository 'openSUSE-13.2-Oss' cache ...................................................................[done]
    Retrieving repository 'openSUSE-13.2-Update' metadata ...........................................................[done]
    Building repository 'openSUSE-13.2-Update' cache ................................................................[done]
    Retrieving repository 'openSUSE-13.2-Update-Non-Oss' metadata ...................................................[done]
    Building repository 'openSUSE-13.2-Update-Non-Oss' cache ........................................................[done]
    Loading repository data...
    Reading installed packages...
    
    S | Name                                  | Summary                                                   | Type      
    --+---------------------------------------+-----------------------------------------------------------+-----------
      | gnome-desktop2-lang                   | Languages for package gnome-desktop2                      | package   
      | gnome-desktop2                        | The GNOME Desktop API Library                             | package   
      | libgnome-desktop-2-17                 | The GNOME Desktop API Library                             | package   
      | libgnome-desktop-3-10                 | The GNOME Desktop API Library                             | package   
      | libgnome-desktop-3-devel              | The GNOME Desktop API Library -- Development Files        | package   
      | libgnome-desktop-3_0-common           | The GNOME Desktop API Library -- Common data files        | package   
      | gnome-desktop-debugsource             | Debug sources for package gnome-desktop                   | package   
      | gnome-desktop-sharp2-debugsource      | Debug sources for package gnome-desktop-sharp2            | package   
      | gnome-desktop2-debugsource            | Debug sources for package gnome-desktop2                  | package   
      | libgnome-desktop-2-17-debuginfo       | Debug information for package libgnome-desktop-2-17       | package   
      | libgnome-desktop-3-10-debuginfo       | Debug information for package libgnome-desktop-3-10       | package   
      | libgnome-desktop-3_0-common-debuginfo | Debug information for package libgnome-desktop-3_0-common | package   
      | libgnome-desktop-2-17-debuginfo-32bit | Debug information for package libgnome-desktop-2-17       | package   
      | libgnome-desktop-3-10-debuginfo-32bit | Debug information for package libgnome-desktop-3-10       | package   
      | gnome-desktop-sharp2                  | Mono bindings for libgnome-desktop                        | package   
      | libgnome-desktop-2-devel              | The GNOME Desktop API Library -- Development Files        | package   
      | gnome-desktop-lang                    | Languages for package gnome-desktop                       | package   
      | libgnome-desktop-2-17-32bit           | The GNOME Desktop API Library                             | package   
      | libgnome-desktop-3-10-32bit           | The GNOME Desktop API Library                             | package   
      | gnome-desktop                         | The GNOME Desktop API Library                             | srcpackage

4. Get information on a pattern package (say lamp_server) using following command.

    # zypper info -t pattern lamp_server
    
    Loading repository data...
    Reading installed packages...
    
    
    Information for pattern lamp_server:
    ------------------------------------
    Repository: openSUSE-13.2-Update
    Name: lamp_server
    Version: 20141007-5.1
    Arch: x86_64
    Vendor: openSUSE
    Installed: No
    Visible to User: Yes
    Summary: Web and LAMP Server
    Description: 
      Software to set up a Web server that is able to serve static, dynamic, and interactive content (like a Web shop). This includes Apache HTTP Server, the database management system MySQL,
      and scripting languages such as PHP, Python, Ruby on Rails, or Perl.
    Contents:
    
    S | Name                          | Type    | Dependency
    --+-------------------------------+---------+-----------
      | apache2-mod_php5              | package |           
      | php5-iconv                    | package |           
    i | patterns-openSUSE-base        | package |           
    i | apache2-prefork               | package |           
      | php5-dom                      | package |           
      | php5-mysql                    | package |           
    i | apache2                       | package |           
      | apache2-example-pages         | package |           
      | mariadb                       | package |           
      | apache2-mod_perl              | package |           
      | php5-ctype                    | package |           
      | apache2-doc                   | package |           
      | yast2-http-server             | package |           
      | patterns-openSUSE-lamp_server | package |    

5. To open zypper shell session run the below command.

    # zypper shell
    OR
    # zypper sh
    
    zypper> help
      Usage:
    	zypper [--global-options] 

**Note**: On Zypper shell type ‘help‘ to get a list of global options and commands.

### Zypper Repository Management ###

#### Listing Defined Repositories ####

6. Use zypper repos or zypper lr commands to list all the defined repositories.

    # zypper repos
    OR
    # zypper lr
    
     | Alias                     | Name                               | Enabled | Refresh
    --+---------------------------+------------------------------------+---------+--------
    1 | openSUSE-13.2-0           | openSUSE-13.2-0                    | Yes     | No     
    2 | repo-debug                | openSUSE-13.2-Debug                | Yes     | Yes    
    3 | repo-debug-update         | openSUSE-13.2-Update-Debug         | No      | Yes    
    4 | repo-debug-update-non-oss | openSUSE-13.2-Update-Debug-Non-Oss | No      | Yes    
    5 | repo-non-oss              | openSUSE-13.2-Non-Oss              | Yes     | Yes    
    6 | repo-oss                  | openSUSE-13.2-Oss                  | Yes     | Yes    
    7 | repo-source               | openSUSE-13.2-Source               | No      | Yes    
    8 | repo-update               | openSUSE-13.2-Update               | Yes     | Yes    
    9 | repo-update-non-oss       | openSUSE-13.2-Update-Non-Oss       | Yes     | Yes    

7. List zypper URI on the table.

    # zypper lr -u
    
    # | Alias                     | Name                               | Enabled | Refresh | URI                                                            
    --+---------------------------+------------------------------------+---------+---------+----------------------------------------------------------------
    1 | openSUSE-13.2-0           | openSUSE-13.2-0                    | Yes     | No      | cd:///?devices=/dev/disk/by-id/ata-VBOX_CD-ROM_VB2-01700376    
    2 | repo-debug                | openSUSE-13.2-Debug                | Yes     | Yes     | http://download.opensuse.org/debug/distribution/13.2/repo/oss/ 
    3 | repo-debug-update         | openSUSE-13.2-Update-Debug         | No      | Yes     | http://download.opensuse.org/debug/update/13.2/                
    4 | repo-debug-update-non-oss | openSUSE-13.2-Update-Debug-Non-Oss | No      | Yes     | http://download.opensuse.org/debug/update/13.2-non-oss/        
    5 | repo-non-oss              | openSUSE-13.2-Non-Oss              | Yes     | Yes     | http://download.opensuse.org/distribution/13.2/repo/non-oss/   
    6 | repo-oss                  | openSUSE-13.2-Oss                  | Yes     | Yes     | http://download.opensuse.org/distribution/13.2/repo/oss/       
    7 | repo-source               | openSUSE-13.2-Source               | No      | Yes     | http://download.opensuse.org/source/distribution/13.2/repo/oss/
    8 | repo-update               | openSUSE-13.2-Update               | Yes     | Yes     | http://download.opensuse.org/update/13.2/                      
    9 | repo-update-non-oss       | openSUSE-13.2-Update-Non-Oss       | Yes     | Yes     | http://download.opensuse.org/update/13.2-non-oss/        

8. List repository priority and list by priority.

    # zypper lr -P
    
    # | Alias                     | Name                               | Enabled | Refresh | Priority
    --+---------------------------+------------------------------------+---------+---------+---------
    1 | openSUSE-13.2-0           | openSUSE-13.2-0                    | Yes     | No      |   99    
    2 | repo-debug                | openSUSE-13.2-Debug                | Yes     | Yes     |   99    
    3 | repo-debug-update         | openSUSE-13.2-Update-Debug         | No      | Yes     |   99    
    4 | repo-debug-update-non-oss | openSUSE-13.2-Update-Debug-Non-Oss | No      | Yes     |   99    
    5 | repo-non-oss              | openSUSE-13.2-Non-Oss              | Yes     | Yes     |   85    
    6 | repo-oss                  | openSUSE-13.2-Oss                  | Yes     | Yes     |   99    
    7 | repo-source               | openSUSE-13.2-Source               | No      | Yes     |   99    
    8 | repo-update               | openSUSE-13.2-Update               | Yes     | Yes     |   99    
    9 | repo-update-non-oss       | openSUSE-13.2-Update-Non-Oss       | Yes     | Yes     |   99    

#### Refreshing Repositories ####

9. Use commands zypper refresh or zypper ref to refresh zypper repositories.

    # zypper refresh
    OR
    # zypper ref
    
    Repository 'openSUSE-13.2-0' is up to date.
    Repository 'openSUSE-13.2-Debug' is up to date.
    Repository 'openSUSE-13.2-Non-Oss' is up to date.
    Repository 'openSUSE-13.2-Oss' is up to date.
    Repository 'openSUSE-13.2-Update' is up to date.
    Repository 'openSUSE-13.2-Update-Non-Oss' is up to date.
    All repositories have been refreshed.

10. To refresh a specific repository say ‘repo-non-oss‘, type:

    # zypper refresh repo-non-oss
    
    Repository 'openSUSE-13.2-Non-Oss' is up to date.
    Specified repositories have been refreshed.

11. To force update a repository say ‘repo-non-oss‘, type:

    # zypper ref -f repo-non-oss 
    
    Forcing raw metadata refresh
    Retrieving repository 'openSUSE-13.2-Non-Oss' metadata ............................................................[done]
    Forcing building of repository cache
    Building repository 'openSUSE-13.2-Non-Oss' cache ............................................................[done]
    Specified repositories have been refreshed.

#### Modifying Repositories ####

Here, we use ‘zypper modifyrepo‘ or ‘zypper mr‘ commands to disable, enable zypper repositories.

12. Before disabling repository, you must know that in Zypper, every repository has its own unique number, that is used to disable or enable a repository.

Let’s say you want to disable repository ‘repo-oss‘, to disable first you need to its number by typing following command.

    # zypper lr
    
    # | Alias                     | Name                               | Enabled | Refresh
    --+---------------------------+------------------------------------+---------+--------
    1 | openSUSE-13.2-0           | openSUSE-13.2-0                    | Yes     | No     
    2 | repo-debug                | openSUSE-13.2-Debug                | Yes     | Yes    
    3 | repo-debug-update         | openSUSE-13.2-Update-Debug         | No      | Yes    
    4 | repo-debug-update-non-oss | openSUSE-13.2-Update-Debug-Non-Oss | No      | Yes    
    5 | repo-non-oss              | openSUSE-13.2-Non-Oss              | Yes     | Yes    
    6 | repo-oss                  | openSUSE-13.2-Oss                  | No      | Yes    
    7 | repo-source               | openSUSE-13.2-Source               | No      | Yes    
    8 | repo-update               | openSUSE-13.2-Update               | Yes     | Yes    
    9 | repo-update-non-oss       | openSUSE-13.2-Update-Non-Oss       | Yes     | Yes    

Do you see in the above output, that the repository ‘repo-oss‘ having number 6, to disable this you need to specify number 6 along with following command.

    # zypper mr -d 6
    
    Repository 'repo-oss' has been successfully disabled.

13. To enable again same repository ‘repo-oss‘, which appears at number 6 (as shown in above example).

    # zypper mr -e 6
    
    Repository 'repo-oss' has been successfully enabled.

14. Enable auto-refresh and rpm file ‘caching‘ for a repo say ‘repo-non-oss‘ and set its priority to say 85.

    # zypper mr -rk -p 85 repo-non-oss
    
    Repository 'repo-non-oss' priority has been left unchanged (85)
    Nothing to change for repository 'repo-non-oss'.

15. Disable rpm file caching for all the repositories.

    # zypper mr -Ka
    
    RPM files caching has been disabled for repository 'openSUSE-13.2-0'.
    RPM files caching has been disabled for repository 'repo-debug'.
    RPM files caching has been disabled for repository 'repo-debug-update'.
    RPM files caching has been disabled for repository 'repo-debug-update-non-oss'.
    RPM files caching has been disabled for repository 'repo-non-oss'.
    RPM files caching has been disabled for repository 'repo-oss'.
    RPM files caching has been disabled for repository 'repo-source'.
    RPM files caching has been disabled for repository 'repo-update'.
    RPM files caching has been disabled for repository 'repo-update-non-oss'.

16. Enable rpm file caching for all the repositories.

    # zypper mr -ka
    
    RPM files caching has been enabled for repository 'openSUSE-13.2-0'.
    RPM files caching has been enabled for repository 'repo-debug'.
    RPM files caching has been enabled for repository 'repo-debug-update'.
    RPM files caching has been enabled for repository 'repo-debug-update-non-oss'.
    RPM files caching has been enabled for repository 'repo-non-oss'.
    RPM files caching has been enabled for repository 'repo-oss'.
    RPM files caching has been enabled for repository 'repo-source'.
    RPM files caching has been enabled for repository 'repo-update'.
    RPM files caching has been enabled for repository 'repo-update-non-oss'.

17. Disable rpm file caching for remote repositories.

    # zypper mr -Kt
    
    RPM files caching has been disabled for repository 'repo-debug'.
    RPM files caching has been disabled for repository 'repo-debug-update'.
    RPM files caching has been disabled for repository 'repo-debug-update-non-oss'.
    RPM files caching has been disabled for repository 'repo-non-oss'.
    RPM files caching has been disabled for repository 'repo-oss'.
    RPM files caching has been disabled for repository 'repo-source'.
    RPM files caching has been disabled for repository 'repo-update'.
    RPM files caching has been disabled for repository 'repo-update-non-oss'.

18. Enable rpm file caching for remote repositories.

    # zypper mr -kt
    
    RPM files caching has been enabled for repository 'repo-debug'.
    RPM files caching has been enabled for repository 'repo-debug-update'.
    RPM files caching has been enabled for repository 'repo-debug-update-non-oss'.
    RPM files caching has been enabled for repository 'repo-non-oss'.
    RPM files caching has been enabled for repository 'repo-oss'.
    RPM files caching has been enabled for repository 'repo-source'.
    RPM files caching has been enabled for repository 'repo-update'.
    RPM files caching has been enabled for repository 'repo-update-non-oss'.

#### Adding Repositories ####

You may make use of any of the two commands – ‘zypper addrepo‘ or ‘zypper ar‘. You may use repo url or alias to add Repository.

19. Add a repository say “http://download.opensuse.org/update/12.3/”.

    # zypper ar http://download.opensuse.org/update/11.1/ update
    
    Adding repository 'update' .............................................................................................................................................................[done]
    Repository 'update' successfully added
    Enabled     : Yes                                      
    Autorefresh : No                                       
    GPG check   : Yes                                      
    URI         : http://download.opensuse.org/update/11.1/

20. Rename a repository. It will change the alias only. You may use command ‘zypper namerepo‘ or ‘zypper nr‘. To rename aka change alias of a repo that appears at number 10 (zypper lr) to upd8, run the below command.

    # zypper nr 10 upd8
    
    Repository 'update' renamed to 'upd8'.

#### Removing Repositories ####

21. Remove a repository. It will remove the repository from the system. You may use the command ‘zypper removerepo‘ or ‘zypper rr‘. To remove a repo say ‘upd8‘, run the below command.

    # zypper rr upd8
    
    # Removing repository 'upd8' .........................................................................................[done]
    Repository 'upd8' has been removed.

### Package Management using Zypper ###

#### Install a Package with Zypper ####

22. With Zypper, we can install packages based upon capability name. For example, to install a package (say Mozilla Firefox) using capability name.

    # zypper in MozillaFirefox
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    The following 128 NEW packages are going to be installed:
      adwaita-icon-theme at-spi2-atk-common at-spi2-atk-gtk2 at-spi2-core cantarell-fonts cups-libs desktop-file-utils fontconfig gdk-pixbuf-query-loaders gstreamer gstreamer-fluendo-mp3 
      gstreamer-plugins-base gtk2-branding-openSUSE gtk2-data gtk2-immodule-amharic gtk2-immodule-inuktitut gtk2-immodule-thai gtk2-immodule-vietnamese gtk2-metatheme-adwaita 
      gtk2-theming-engine-adwaita gtk2-tools gtk3-data gtk3-metatheme-adwaita gtk3-tools hicolor-icon-theme hicolor-icon-theme-branding-openSUSE libasound2 libatk-1_0-0 libatk-bridge-2_0-0 
      libatspi0 libcairo2 libcairo-gobject2 libcanberra0 libcanberra-gtk0 libcanberra-gtk2-module libcanberra-gtk3-0 libcanberra-gtk3-module libcanberra-gtk-module-common libcdda_interface0 
      libcdda_paranoia0 libcolord2 libdrm2 libdrm_intel1 libdrm_nouveau2 libdrm_radeon1 libFLAC8 libfreebl3 libgbm1 libgdk_pixbuf-2_0-0 libgraphite2-3 libgstapp-1_0-0 libgstaudio-1_0-0 
      libgstpbutils-1_0-0 libgstreamer-1_0-0 libgstriff-1_0-0 libgsttag-1_0-0 libgstvideo-1_0-0 libgthread-2_0-0 libgtk-2_0-0 libgtk-3-0 libharfbuzz0 libjasper1 libjbig2 libjpeg8 libjson-c2 
      liblcms2-2 libLLVM libltdl7 libnsssharedhelper0 libogg0 liborc-0_4-0 libpackagekit-glib2-18 libpango-1_0-0 libpciaccess0 libpixman-1-0 libpulse0 libsndfile1 libsoftokn3 libspeex1 
      libsqlite3-0 libstartup-notification-1-0 libtheoradec1 libtheoraenc1 libtiff5 libvisual libvorbis0 libvorbisenc2 libvorbisfile3 libwayland-client0 libwayland-cursor0 libwayland-server0 
      libX11-xcb1 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-render0 libxcb-shm0 libxcb-sync1 libxcb-util1 libxcb-xfixes0 libXcomposite1 libXcursor1 libXdamage1 libXevie1 
      libXfixes3 libXft2 libXi6 libXinerama1 libxkbcommon-0_4_3 libXrandr2 libXrender1 libxshmfence1 libXtst6 libXv1 libXxf86vm1 Mesa Mesa-libEGL1 Mesa-libGL1 Mesa-libglapi0 
      metatheme-adwaita-common MozillaFirefox MozillaFirefox-branding-openSUSE mozilla-nss mozilla-nss-certs PackageKit-gstreamer-plugin pango-tools sound-theme-freedesktop 
    
    The following 10 recommended packages were automatically selected:
      gstreamer-fluendo-mp3 gtk2-branding-openSUSE gtk2-data gtk2-immodule-amharic gtk2-immodule-inuktitut gtk2-immodule-thai gtk2-immodule-vietnamese libcanberra0 libpulse0 
      PackageKit-gstreamer-plugin 
    
    128 new packages to install.
    Overall download size: 77.2 MiB. Already cached: 0 B  After the operation, additional 200.0 MiB will be used.
    Continue? [y/n/? shows all options] (y): y
    Retrieving package cantarell-fonts-0.0.16-1.1.noarch                                                                                                   (1/128),  74.1 KiB (115.6 KiB unpacked)
    Retrieving: cantarell-fonts-0.0.16-1.1.noarch.rpm .........................................................................................................................[done (63.4 KiB/s)]
    Retrieving package hicolor-icon-theme-0.13-2.1.2.noarch                                                                                                (2/128),  40.1 KiB ( 50.5 KiB unpacked)
    Retrieving: hicolor-icon-theme-0.13-2.1.2.noarch.rpm ...................................................................................................................................[done]
    Retrieving package sound-theme-freedesktop-0.8-7.1.2.noarch                                                                                            (3/128), 372.6 KiB (460.3 KiB unpacked)

23. Install a package (say gcc) using version.

    # zypper in 'gcc<5.1'
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    The following 13 NEW packages are going to be installed:
      cpp cpp48 gcc gcc48 libasan0 libatomic1-gcc49 libcloog-isl4 libgomp1-gcc49 libisl10 libitm1-gcc49 libmpc3 libmpfr4 libtsan0-gcc49 

    13 new packages to install.
    Overall download size: 14.5 MiB. Already cached: 0 B  After the operation, additional 49.4 MiB will be used.
    Continue? [y/n/? shows all options] (y): y

24. Install a package (say gcc) for architecture (say i586).

    # zypper in gcc.i586
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    The following 13 NEW packages are going to be installed:
      cpp cpp48 gcc gcc48 libasan0 libatomic1-gcc49 libcloog-isl4 libgomp1-gcc49 libisl10 libitm1-gcc49 libmpc3 libmpfr4 libtsan0-gcc49 
    
    13 new packages to install.
    Overall download size: 14.5 MiB. Already cached: 0 B  After the operation, additional 49.4 MiB will be used.
    Continue? [y/n/? shows all options] (y): y
    Retrieving package libasan0-4.8.3+r212056-2.2.4.x86_64                                                                                                  (1/13),  74.2 KiB (166.9 KiB unpacked)
    Retrieving: libasan0-4.8.3+r212056-2.2.4.x86_64.rpm .......................................................................................................................[done (79.2 KiB/s)]
    Retrieving package libatomic1-gcc49-4.9.0+r211729-2.1.7.x86_64                                                                                          (2/13),  14.3 KiB ( 26.1 KiB unpacked)
    Retrieving: libatomic1-gcc49-4.9.0+r211729-2.1.7.x86_64.rpm ...............................................................................................................[done (55.3 KiB/s)]

25. Install a package (say gcc) for specific architecture (say i586) and specific version (say <5.1),

    # zypper in 'gcc.i586<5.1'
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    The following 13 NEW packages are going to be installed:
      cpp cpp48 gcc gcc48 libasan0 libatomic1-gcc49 libcloog-isl4 libgomp1-gcc49 libisl10 libitm1-gcc49 libmpc3 libmpfr4 libtsan0-gcc49 
    
    13 new packages to install.
    Overall download size: 14.4 MiB. Already cached: 129.5 KiB  After the operation, additional 49.4 MiB will be used.
    Continue? [y/n/? shows all options] (y): y
    In cache libasan0-4.8.3+r212056-2.2.4.x86_64.rpm                                                                                                        (1/13),  74.2 KiB (166.9 KiB unpacked)
    In cache libatomic1-gcc49-4.9.0+r211729-2.1.7.x86_64.rpm                                           (2/13),  14.3 KiB ( 26.1 KiB unpacked)
    In cache libgomp1-gcc49-4.9.0+r211729-2.1.7.x86_64.rpm                                             (3/13),  41.1 KiB ( 90.7 KiB unpacked)

26. Install a Package (say libxine) from repository (amarok).

    # zypper in amarok upd:libxine1
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    The following 202 NEW packages are going to be installed:
      amarok bundle-lang-kde-en clamz cups-libs enscript fontconfig gdk-pixbuf-query-loaders ghostscript-fonts-std gptfdisk gstreamer gstreamer-plugins-base hicolor-icon-theme 
      hicolor-icon-theme-branding-openSUSE htdig hunspell hunspell-tools icoutils ispell ispell-american kde4-filesystem kdebase4-runtime kdebase4-runtime-branding-openSUSE kdelibs4 
      kdelibs4-branding-openSUSE kdelibs4-core kdialog libakonadi4 l
    .....

27. Install a Package (say git) using name (-n).

    # zypper in -n git
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    The following 35 NEW packages are going to be installed:
      cvs cvsps fontconfig git git-core git-cvs git-email git-gui gitk git-svn git-web libserf-1-1 libsqlite3-0 libXft2 libXrender1 libXss1 perl-Authen-SASL perl-Clone perl-DBD-SQLite perl-DBI 
      perl-Error perl-IO-Socket-SSL perl-MLDBM perl-Net-Daemon perl-Net-SMTP-SSL perl-Net-SSLeay perl-Params-Util perl-PlRPC perl-SQL-Statement perl-Term-ReadKey subversion subversion-perl tcl 
      tk xhost 
    
    The following 13 recommended packages were automatically selected:
      git-cvs git-email git-gui gitk git-svn git-web perl-Authen-SASL perl-Clone perl-MLDBM perl-Net-Daemon perl-Net-SMTP-SSL perl-PlRPC perl-SQL-Statement 
    
    The following package is suggested, but will not be installed:
      git-daemon 
    
    35 new packages to install.
    Overall download size: 15.6 MiB. Already cached: 0 B  After the operation, additional 56.7 MiB will be used.
    Continue? [y/n/? shows all options] (y): y

28. Install a package using wildcards. For example, install all php5 packages.

    # zypper in php5*
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    Problem: php5-5.6.1-18.1.x86_64 requires smtp_daemon, but this requirement cannot be provided
      uninstallable providers: exim-4.83-3.1.8.x86_64[openSUSE-13.2-0]
                       postfix-2.11.0-5.2.2.x86_64[openSUSE-13.2-0]
                       sendmail-8.14.9-2.2.2.x86_64[openSUSE-13.2-0]
                       exim-4.83-3.1.8.i586[repo-oss]
                       msmtp-mta-1.4.32-2.1.3.i586[repo-oss]
                       postfix-2.11.0-5.2.2.i586[repo-oss]
                       sendmail-8.14.9-2.2.2.i586[repo-oss]
                       exim-4.83-3.1.8.x86_64[repo-oss]
                       msmtp-mta-1.4.32-2.1.3.x86_64[repo-oss]
                       postfix-2.11.0-5.2.2.x86_64[repo-oss]
                       sendmail-8.14.9-2.2.2.x86_64[repo-oss]
                       postfix-2.11.3-5.5.1.i586[repo-update]
                       postfix-2.11.3-5.5.1.x86_64[repo-update]
     Solution 1: Following actions will be done:
      do not install php5-5.6.1-18.1.x86_64
      do not install php5-pear-Auth_SASL-1.0.6-7.1.3.noarch
      do not install php5-pear-Horde_Http-2.0.1-6.1.3.noarch
      do not install php5-pear-Horde_Image-2.0.1-6.1.3.noarch
      do not install php5-pear-Horde_Kolab_Format-2.0.1-6.1.3.noarch
      do not install php5-pear-Horde_Ldap-2.0.1-6.1.3.noarch
      do not install php5-pear-Horde_Memcache-2.0.1-7.1.3.noarch
      do not install php5-pear-Horde_Mime-2.0.2-6.1.3.noarch
      do not install php5-pear-Horde_Oauth-2.0.0-6.1.3.noarch
      do not install php5-pear-Horde_Pdf-2.0.1-6.1.3.noarch
    ....

29. Install a Package (say lamp_server) using pattern (group of packages).

    # zypper in -t pattern lamp_server
    
    ading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    The following 29 NEW packages are going to be installed:
      apache2 apache2-doc apache2-example-pages apache2-mod_perl apache2-prefork patterns-openSUSE-lamp_server perl-Data-Dump perl-Encode-Locale perl-File-Listing perl-HTML-Parser 
      perl-HTML-Tagset perl-HTTP-Cookies perl-HTTP-Daemon perl-HTTP-Date perl-HTTP-Message perl-HTTP-Negotiate perl-IO-HTML perl-IO-Socket-SSL perl-libwww-perl perl-Linux-Pid 
      perl-LWP-MediaTypes perl-LWP-Protocol-https perl-Net-HTTP perl-Net-SSLeay perl-Tie-IxHash perl-TimeDate perl-URI perl-WWW-RobotRules yast2-http-server 
    
    The following NEW pattern is going to be installed:
      lamp_server 
    
    The following 10 recommended packages were automatically selected:
      apache2 apache2-doc apache2-example-pages apache2-mod_perl apache2-prefork perl-Data-Dump perl-IO-Socket-SSL perl-LWP-Protocol-https perl-TimeDate yast2-http-server 
    
    29 new packages to install.
    Overall download size: 7.2 MiB. Already cached: 1.2 MiB  After the operation, additional 34.7 MiB will be used.
    Continue? [y/n/? shows all options] (y): 

30. Install a Package (say nano) and remove a package (say vi) in one go.

    # zypper in nano -vi
    
    Loading repository data...
    Reading installed packages...
    '-vi' not found in package names. Trying capabilities.
    Resolving package dependencies...
    
    The following 2 NEW packages are going to be installed:
      nano nano-lang 
    
    The following package is going to be REMOVED:
      vim 
    
    The following recommended package was automatically selected:
      nano-lang 
    
    2 new packages to install, 1 to remove.
    Overall download size: 550.0 KiB. Already cached: 0 B  After the operation, 463.3 KiB will be freed.
    Continue? [y/n/? shows all options] (y): 
    ...

31. Install a rpm package (say teamviewer).

    # zypper in teamviewer*.rpm
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    The following 24 NEW packages are going to be installed:
      alsa-oss-32bit fontconfig-32bit libasound2-32bit libexpat1-32bit libfreetype6-32bit libgcc_s1-gcc49-32bit libICE6-32bit libjpeg62-32bit libpng12-0-32bit libpng16-16-32bit libSM6-32bit 
      libuuid1-32bit libX11-6-32bit libXau6-32bit libxcb1-32bit libXdamage1-32bit libXext6-32bit libXfixes3-32bit libXinerama1-32bit libXrandr2-32bit libXrender1-32bit libXtst6-32bit 
      libz1-32bit teamviewer 
    
    The following recommended package was automatically selected:
      alsa-oss-32bit 
    
    24 new packages to install.
    Overall download size: 41.2 MiB. Already cached: 0 B  After the operation, additional 119.7 MiB will be used.
    Continue? [y/n/? shows all options] (y): 
    ..
    
#### Remove a Package with Zypper ####

32. To remove any package, you can use ‘zypper remove‘ or ‘zypper rm‘ commands. For example, to remove a package (say apache2), run:

    # zypper remove apache2
    Or
    # zypper rm apache2
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    The following 2 packages are going to be REMOVED:
      apache2 apache2-prefork 
    
    2 packages to remove.
    After the operation, 4.2 MiB will be freed.
    Continue? [y/n/? shows all options] (y): y
    (1/2) Removing apache2-2.4.10-19.1 ........................................................................[done]
    (2/2) Removing apache2-prefork-2.4.10-19.1 ................................................................[done]
 
#### Updating Packages using Zypper ####

33. Update all packages. You may use commands ‘zypper update‘ or ‘zypper up‘.

    # zypper up
    OR
    # zypper update
    
    Loading repository data...
    Reading installed packages...
    Nothing to do.

34. Update specific packages (say apache2 and openssh).

    # zypper up apache2 openssh
    
    Loading repository data...
    Reading installed packages...
    No update candidate for 'apache2-2.4.10-19.1.x86_64'. The highest available version is already installed.
    No update candidate for 'openssh-6.6p1-5.1.3.x86_64'. The highest available version is already installed.
    Resolving package dependencies...
    
    Nothing to do.

35. Install a package say (mariadb) if not installed, if installed update it.

    # zypper in mariadb
    
    Loading repository data...
    Reading installed packages...
    'mariadb' is already installed.
    No update candidate for 'mariadb-10.0.13-2.6.1.x86_64'. The highest available version is already installed.
    Resolving package dependencies...
    
    Nothing to do.

#### Install Source and Build Dependencies ####
    
You may use ‘zypper source-install‘ or ‘zypper si‘ commands to build packages from source.

36. Install source packages and build their dependencies for a package (say mariadb).

    # zypper si mariadb
    
    Reading installed packages...
    Loading repository data...
    Resolving package dependencies...
    
    The following 36 NEW packages are going to be installed:
      autoconf automake bison cmake cpp cpp48 gcc gcc48 gcc48-c++ gcc-c++ libaio-devel libarchive13 libasan0 libatomic1-gcc49 libcloog-isl4 libedit-devel libevent-devel libgomp1-gcc49 libisl10 
      libitm1-gcc49 libltdl7 libmpc3 libmpfr4 libopenssl-devel libstdc++48-devel libtool libtsan0-gcc49 m4 make ncurses-devel pam-devel readline-devel site-config tack tcpd-devel zlib-devel 
    
    The following source package is going to be installed:
      mariadb 
    
    36 new packages to install, 1 source package.
    Overall download size: 71.5 MiB. Already cached: 129.5 KiB  After the operation, additional 183.9 MiB will be used.
    Continue? [y/n/? shows all options] (y): y

37. Install only the source for a package (say mariadb).

    # zypper in -D mariadb
    
    Loading repository data...
    Reading installed packages...
    'mariadb' is already installed.
    No update candidate for 'mariadb-10.0.13-2.6.1.x86_64'. The highest available version is already installed.
    Resolving package dependencies...
    
    Nothing to do.

38. Install only the build dependencies for a packages (say mariadb).

    # zypper si -d mariadb
    
    Reading installed packages...
    Loading repository data...
    Resolving package dependencies...
    
    The following 36 NEW packages are going to be installed:
      autoconf automake bison cmake cpp cpp48 gcc gcc48 gcc48-c++ gcc-c++ libaio-devel libarchive13 libasan0 libatomic1-gcc49 libcloog-isl4 libedit-devel libevent-devel libgomp1-gcc49 libisl10 
      libitm1-gcc49 libltdl7 libmpc3 libmpfr4 libopenssl-devel libstdc++48-devel libtool libtsan0-gcc49 m4 make ncurses-devel pam-devel readline-devel site-config tack tcpd-devel zlib-devel 
    
    The following package is recommended, but will not be installed due to conflicts or dependency issues:
      readline-doc 
    
    36 new packages to install.
    Overall download size: 33.7 MiB. Already cached: 129.5 KiB  After the operation, additional 144.3 MiB will be used.
    Continue? [y/n/? shows all options] (y): y

#### Zypper in Scripts and Applications ####

39. Install a Package (say mariadb) without interaction of user.

    # zypper --non-interactive in mariadb
    
    Loading repository data...
    Reading installed packages...
    'mariadb' is already installed.
    No update candidate for 'mariadb-10.0.13-2.6.1.x86_64'. The highest available version is already installed.
    Resolving package dependencies...
    
    Nothing to do.

40. Remove a Package (say mariadb) without interaction of user.

    # zypper --non-interactive rm mariadb
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    The following package is going to be REMOVED:
      mariadb 
    
    1 package to remove.
    After the operation, 71.8 MiB will be freed.
    Continue? [y/n/? shows all options] (y): y
    (1/1) Removing mariadb-10.0.13-2.6.1 .............................................................................[done]

41. Output zypper in xml.

    # zypper --xmlout
    
    
    
      Usage:
    	zypper [--global-options] <command> [--command-options] [arguments]
    
      Global Options
    ....

42. Generate quiet output at installation.

    # zypper --quiet in mariadb
    
    The following NEW package is going to be installed:
      mariadb 
    
    1 new package to install.
    Overall download size: 0 B. Already cached: 7.8 MiB  After the operation, additional 71.8 MiB will be used.
    Continue? [y/n/? shows all options] (y): 
    ...

43. Generate quiet output at UN-installation.

    # zypper --quiet rm mariadb

44. Auto agree to Licenses/Agreements.

    # zypper patch --auto-agree-with-licenses
    
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    
    Nothing to do.

#### Clean Zypper Cache and View History ####

45. If you want to clean zypper cache only, you can use following command.

    # zypper clean
    
    All repositories have been cleaned up.

If you want to clean metadata and package cache at once you may like to pass –all/-a with zypper as.

    # zypper clean -a
    
    All repositories have been cleaned up.

46. To view logs of any installed, updated or removed packages through zypper, are logged in /var/log/zypp/history. You may cat it to view or may use filter to get a custom output.

    # cat /var/log/zypp/history
    
    2015-05-07 15:43:03|install|boost-license1_54_0|1.54.0-10.1.3|noarch||openSUSE-13.2-0|0523b909d2aae5239f9841316dafaf3a37b4f096|
    2015-05-07 15:43:03|install|branding-openSUSE|13.2-3.6.1|noarch||openSUSE-13.2-0|6609def94b1987bf3f90a9467f4f7ab8f8d98a5c|
    2015-05-07 15:43:03|install|bundle-lang-common-en|13.2-3.3.1|noarch||openSUSE-13.2-0|ca55694e6fdebee6ce37ac7cf3725e2aa6edc342|
    2015-05-07 15:43:03|install|insserv-compat|0.1-12.2.2|noarch||openSUSE-13.2-0|6160de7fbf961a279591a83a1550093a581214d9|
    2015-05-07 15:43:03|install|libX11-data|1.6.2-5.1.2|noarch||openSUSE-13.2-0|f1cb58364ba9016c1f93b1a383ba12463c56885a|
    2015-05-07 15:43:03|install|libnl-config|3.2.25-2.1.2|noarch||openSUSE-13.2-0|aab2ded312a781e93b739b418e3d32fe4e187020|
    2015-05-07 15:43:04|install|wireless-regdb|2014.06.13-1.2|noarch||openSUSE-13.2-0|be8cb16f3e92af12b5ceb977e37e13f03c007bd1|
    2015-05-07 15:43:04|install|yast2-trans-en_US|3.1.0-2.1|noarch||openSUSE-13.2-0|1865754e5e0ec3c149ac850b340bcca55a3c404d|
    2015-05-07 15:43:04|install|yast2-trans-stats|2.19.0-16.1.3|noarch||openSUSE-13.2-0|b107d2b3e702835885b57b04d12d25539f262d1a|
    2015-05-07 15:43:04|install|cracklib-dict-full|2.8.12-64.1.2|x86_64||openSUSE-13.2-0|08bd45dbba7ad44e3a4837f730be76f55ad5dcfa|
    ......

#### Upgrade Suse Using Zypper ####

47. You can use ‘dist-upgrade‘ option with zypper command to upgrade your current Suse Linux to most recent version.

    # zypper dist-upgrade
    
    You are about to do a distribution upgrade with all enabled repositories. Make sure these repositories are compatible before you continue. See 'man zypper' for more information about this command.
    Building repository 'openSUSE-13.2-0' cache .....................................................................[done]
    Retrieving repository 'openSUSE-13.2-Debug' metadata ............................................................[done]
    Building repository 'openSUSE-13.2-Debug' cache .................................................................[done]
    Retrieving repository 'openSUSE-13.2-Non-Oss' metadata ..........................................................[done]
    Building repository 'openSUSE-13.2-Non-Oss' cache ...............................................................[done]

That’s all for now. Hope this article would help you in managing you SUSE System and Server specially for newbies. If you feel that I left certain commands (Human are erroneous) you may provide us with the feedback in the comments so that we can update the article. Keep Connected, Keep Commenting, Stay tuned. Kudos!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/zypper-commands-to-manage-suse-linux-package-management/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/installation-of-suse-linux-enterprise-server-12/
