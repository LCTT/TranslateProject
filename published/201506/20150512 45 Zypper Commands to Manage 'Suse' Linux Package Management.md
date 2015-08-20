用于 ‘Suse‘ Linux 包管理的 Zypper 命令大全
======================================================================
SUSE（ Software and System Entwicklung，即软件和系统开发。其中‘entwicklung‘是德语，意为开发）Linux 是由 Novell 公司在 Linux 内核基础上建立的操作系统。SUSE Linux 有两个发行分支。其中之一名为 openSUSE，这是一款自由而且免费的操作系统 （free as in speech as well as free as in wine）。该系统由开源社区开发维护，支持一些最新版本的应用软件，其最新的稳定版本为 13.2。
      
另外一个分支是 SUSE Linux 企业版。该分支是一个为企业及商业化产品设计的 Linux 发行版，包含了大量的企业应用以及适用于商业产品生产环境的特性。其最新的稳定版本为 12。
       
以下的链接包含了安装企业版 SUSE Linux 服务器的详细信息。

- [如何安装企业版 SUSE Linux 12][1]

Zypper 和 Yast 是 SUSE Linux 平台上的软件包管理工具，他们的底层使用了 RPM（LCTT 译者注：RPM 最初指  Redhat Pacakge Manager ，现普遍解释为递归短语 RPM Package Manager 的缩写）。

Yast（Yet another Setup Tool ）是 OpenSUSE 以及企业版 SUSE 上用于系统管理、设置和配置的工具。

Zypper 是软件包管理器ZYpp的命令行接口，可用于安装、删除SUSE Linux上的软件以及进行系统更新。ZYpp为Zypper和Yast提供底层支持。

本文将介绍实际应用中常见的一些Zypper命令。这些命令用来进行安装、更新、删除等任何软件包管理器所能够胜任的工作。

**重要** : 切记所有的这些命令都将在系统全局范围内产生影响，所以必须以 root 身份执行，否则命令将失败。

### 获取基本的 Zypper 帮助信息 ###

1. 不带任何选项的执行 zypper, 将输出该命令的全局选项以及子命令列表（LCTT 译者注：全局选项，global option，控制台命令的输入分为可选参数和位置参数两大类。按照习惯，一般可选参数称为选项'option'，而位置参数称为参数 'argument'）。

    <pre><code>#  zypper
        Usage:
        zypper [--global-options]</code></pre>

2. 获取一个具体的子命令的帮助信息，比如 'in' (install)，可以执行下面的命令

    <pre><code># zypper help in</code></pre>
    或者
    <pre><code># zypper help install
    install (in) [options] {capability | rpm_file_uri}
    
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
    ...... </code></pre>

3. 安装之前搜索一个安转包（以 gnome-desktop 为例 ）

    <pre><code># zypper se gnome-desktop
    
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
      | libgnome-desktop-2-devel              | The GNOME Desktop API Library -- Development Files        | packag
      | gnome-desktop-lang                    | Languages for package gnome-desktop                       | package
      | libgnome-desktop-2-17-32bit           | The GNOME Desktop API Library                             | package
      | libgnome-desktop-3-10-32bit           | The GNOME Desktop API Library                             | package
      | gnome-desktop                         | The GNOME Desktop API Library                             | srcpackage</code></pre>

4. 获取一个模式包的信息（以 lamp_server 为例）。

    <pre><code># zypper info -t pattern lamp_server
    
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
      | patterns-openSUSE-lamp_server | package |</code></pre>    

5. 开启一个Zypper Shell 的会话。

    <pre><code># zypper shell </code></pre>
    或者
    <pre><code># zypper sh </code></pre>
    
    <pre><code>zypper> help
      Usage:
    	zypper [--global-options]</code></pre>

**注意**:在 Zypper shell里面可以通过键入 ‘help‘ 获得全局选项以及子命令的列表。
### Zypper 软件库管理 ###

#### 列举已定义的软件库 ####

6. 使用 'zypper repos' 或者 'zypper lr' 来列举所有已定以的软件库。

    <pre><code># zypper repos</code></pre>
    或者
    <pre><code># zypper lr
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
    9 | repo-update-non-oss       | openSUSE-13.2-Update-Non-Oss       | Yes     | Yes</code></pre> 

7. 在表格里面显示 zypper URI

    <pre><code># zypper lr -u
      | Alias                     | Name                               | Enabled | Refresh | URI
    --+---------------------------+------------------------------------+---------+---------+----------------------------------------------------------------
    1 | openSUSE-13.2-0           | openSUSE-13.2-0                    | Yes     | No      | cd:///?devices=/dev/disk/by-id/ata-VBOX_CD-ROM_VB2-01700376
    2 | repo-debug                | openSUSE-13.2-Debug                | Yes     | Yes     | http://download.opensuse.org/debug/distribution/13.2/repo/oss/
    3 | repo-debug-update         | openSUSE-13.2-Update-Debug         | No      | Yes     | http://download.opensuse.org/debug/update/13.2/
    4 | repo-debug-update-non-oss | openSUSE-13.2-Update-Debug-Non-Oss | No      | Yes     | http://download.opensuse.org/debug/update/13.2-non-oss/
    5 | repo-non-oss              | openSUSE-13.2-Non-Oss              | Yes     | Yes     | http://download.opensuse.org/distribution/13.2/repo/non-oss/
    6 | repo-oss                  | openSUSE-13.2-Oss                  | Yes     | Yes     | http://download.opensuse.org/distribution/13.2/repo/oss/
    7 | repo-source               | openSUSE-13.2-Source               | No      | Yes     | http://download.opensuse.org/source/distribution/13.2/repo/oss/
    8 | repo-update               | openSUSE-13.2-Update               | Yes     | Yes     | http://download.opensuse.org/update/13.2/
    9 | repo-update-non-oss       | openSUSE-13.2-Update-Non-Oss       | Yes     | Yes     | http://download.opensuse.org/update/13.2-non-oss/</code></pre>        

8. 根据优先级列举软件库。

    <pre><code># zypper lr -P
      | Alias                     | Name                               | Enabled | Refresh | Priority
    --+---------------------------+------------------------------------+---------+---------+---------
    1 | openSUSE-13.2-0           | openSUSE-13.2-0                    | Yes     | No      |   99
    2 | repo-debug                | openSUSE-13.2-Debug                | Yes     | Yes     |   99
    3 | repo-debug-update         | openSUSE-13.2-Update-Debug         | No      | Yes     |   99
    4 | repo-debug-update-non-oss | openSUSE-13.2-Update-Debug-Non-Oss | No      | Yes     |   99
    5 | repo-non-oss              | openSUSE-13.2-Non-Oss              | Yes     | Yes     |   85
    6 | repo-oss                  | openSUSE-13.2-Oss                  | Yes     | Yes     |   99
    7 | repo-source               | openSUSE-13.2-Source               | No      | Yes     |   99
    8 | repo-update               | openSUSE-13.2-Update               | Yes     | Yes     |   99
    9 | repo-update-non-oss       | openSUSE-13.2-Update-Non-Oss       | Yes     | Yes     |   99</code></pre>    

#### 刷新软件库 ####

9. 使用 'zypper refresh' or 'zypper ref' 来刷新 zypper 软件库。

    <pre><code># zypper refresh </code></pre>
    或者    
    <pre><code># zypper ref
    Repository 'openSUSE-13.2-0' is up to date.
    Repository 'openSUSE-13.2-Debug' is up to date.
    Repository 'openSUSE-13.2-Non-Oss' is up to date.
    Repository 'openSUSE-13.2-Oss' is up to date.
    Repository 'openSUSE-13.2-Update' is up to date.
    Repository 'openSUSE-13.2-Update-Non-Oss' is up to date.
    All repositories have been refreshed. </code></pre>

10. 刷新一个指定的软件库（以 'repo-non-oss' 为例 ）。

    <pre><code># zypper refresh repo-non-oss
    Repository 'openSUSE-13.2-Non-Oss' is up to date.
    Specified repositories have been refreshed. </code></pre>

11. 强制更新一个软件库（以 'repo-non-oss' 为例 ）。

    <pre><code># zypper ref -f repo-non-oss 
    Forcing raw metadata refresh
    Retrieving repository 'openSUSE-13.2-Non-Oss' metadata ............................................................[done]
    Forcing building of repository cache
    Building repository 'openSUSE-13.2-Non-Oss' cache ............................................................[done]
    Specified repositories have been refreshed.</code></pre>

#### 修改软件库 ####

本文中我们使用‘zypper modifyrepo‘ 或者 ‘zypper mr‘ 来关闭或者开启 zypper 软件库。

12. 在关闭一个软件库之前，我们需要知道在 zypper 中，每一个软件库有一个唯一的标示数字与之关联，该数字用于打开或者关闭与之相联系的软件库。假设我们需要关闭 'repo-oss' 软件库，那么我们可以通过以下的法来获得该软件库的标志数字。

    <pre><code># zypper lr
      | Alias                     | Name                               | Enabled | Refresh
    --+---------------------------+------------------------------------+---------+--------
    1 | openSUSE-13.2-0           | openSUSE-13.2-0                    | Yes     | No
    2 | repo-debug                | openSUSE-13.2-Debug                | Yes     | Yes
    3 | repo-debug-update         | openSUSE-13.2-Update-Debug         | No      | Yes
    4 | repo-debug-update-non-oss | openSUSE-13.2-Update-Debug-Non-Oss | No      | Yes
    5 | repo-non-oss              | openSUSE-13.2-Non-Oss              | Yes     | Yes
    6 | repo-oss                  | openSUSE-13.2-Oss                  | No      | Yes
    7 | repo-source               | openSUSE-13.2-Source               | No      | Yes
    8 | repo-update               | openSUSE-13.2-Update               | Yes     | Yes
    9 | repo-update-non-oss       | openSUSE-13.2-Update-Non-Oss       | Yes     | Yes</code></pre>    
从以上输出的列表中我们可以看到 'repo-oss' 库的标示数字是 6，因此通过以下的命令来关闭该库。

    <pre><code># zypper mr -d 6
    Repository 'repo-oss' has been successfully disabled.</code></pre>

13. 如果需要再次开启软件库 ‘repo-oss‘, 接上例，与之相关联的标示数字为 6。

    <pre><code># zypper mr -e 6
    Repository 'repo-oss' has been successfully enabled.</code></pre>

14. 针对某一个软件库（以 'repo-non-oss' 为例 ）开启自动刷新( auto-refresh )和 rpm 缓存，并设置该软件库的优先级，比如85。

    <pre><code># zypper mr -rk -p 85 repo-non-oss
    Repository 'repo-non-oss' priority has been left unchanged (85)
    Nothing to change for repository 'repo-non-oss'.</code></pre>

15. 对所有的软件库关闭 rpm 文件缓存。

    <pre><code># zypper mr -Ka
    RPM files caching has been disabled for repository 'openSUSE-13.2-0'.
    RPM files caching has been disabled for repository 'repo-debug'.
    RPM files caching has been disabled for repository 'repo-debug-update'.
    RPM files caching has been disabled for repository 'repo-debug-update-non-oss'.
    RPM files caching has been disabled for repository 'repo-non-oss'.
    RPM files caching has been disabled for repository 'repo-oss'.
    RPM files caching has been disabled for repository 'repo-source'.
    RPM files caching has been disabled for repository 'repo-update'.
    RPM files caching has been disabled for repository 'repo-update-non-oss'.</pre></code>

16. 对所有的软件库开启 rpm 文件缓存。
    <pre><code># zypper mr -ka
    RPM files caching has been enabled for repository 'openSUSE-13.2-0'.
    RPM files caching has been enabled for repository 'repo-debug'.
    RPM files caching has been enabled for repository 'repo-debug-update'.
    RPM files caching has been enabled for repository 'repo-debug-update-non-oss'.
    RPM files caching has been enabled for repository 'repo-non-oss'.
    RPM files caching has been enabled for repository 'repo-oss'.
    RPM files caching has been enabled for repository 'repo-source'.
    RPM files caching has been enabled for repository 'repo-update'.
    RPM files caching has been enabled for repository 'repo-update-non-oss'.</code></pre>

17. 关闭远程库的 rpm 文件缓存
    <pre><code># zypper mr -Kt
    RPM files caching has been disabled for repository 'repo-debug'.
    RPM files caching has been disabled for repository 'repo-debug-update'.
    RPM files caching has been disabled for repository 'repo-debug-update-non-oss'.
    RPM files caching has been disabled for repository 'repo-non-oss'.
    RPM files caching has been disabled for repository 'repo-oss'.
    RPM files caching has been disabled for repository 'repo-source'.
    RPM files caching has been disabled for repository 'repo-update'.
    RPM files caching has been disabled for repository 'repo-update-non-oss'.</code></pre>

18. 开启远程软件库的 rpm 文件缓存。
    <pre><code># zypper mr -kt
    RPM files caching has been enabled for repository 'repo-debug'.
    RPM files caching has been enabled for repository 'repo-debug-update'.
    RPM files caching has been enabled for repository 'repo-debug-update-non-oss'.
    RPM files caching has been enabled for repository 'repo-non-oss'.
    RPM files caching has been enabled for repository 'repo-oss'.
    RPM files caching has been enabled for repository 'repo-source'.
    RPM files caching has been enabled for repository 'repo-update'.
    RPM files caching has been enabled for repository 'repo-update-non-oss'.</pre></code>

#### 增加新的软件库 ####

可以通过这两个 zypper 指令 – 'zypper addrepo' 和 'zypper ar' 来增加新的软件库。在此过程中可以使用 URL 或者软件库的别名。

19. 增加一个新的软件库（ 以 “http://download.opensuse.org/update/12.3/” 为例 ）。

    <pre><code># zypper ar http://download.opensuse.org/update/11.1/ update
    Adding repository 'update' .............................................................................................................................................................[done]
    Repository 'update' successfully added
    Enabled     : Yes
    Autorefresh : No
    GPG check   : Yes
    URI         : http://download.opensuse.org/update/11.1/</code></pre>

20. 更改一个软件库的名字，这将仅仅改变软件库的别名。 命令 'zypper namerepo' 或者 'zypperr nr' 可以胜任此工作。例如更改标示数字为10的软件库的名字为 'upd8'，或者说将标示数字为10的软件库的别名改为 'upd8'，可以使用下面的命令。

    <pre><code># zypper nr 10 upd8
    Repository 'update' renamed to 'upd8'.</code></pre>

#### 删除软件库 ####

21. 删除一个软件库。要从系统删除一个软件库可以使 'zypper removerepo' 或者 'zypper rr'。例如以下的命令可以删除软件库 'upd8'

    <pre><code># zypper rr upd8
    # Removing repository 'upd8' .........................................................................................[done]
    Repository 'upd8' has been removed.</code></pre>

### 使用 zypper 进行软件包管理 ###

#### 用 zypper 安装一个软件包 ####

22. 在 zypper 中，我们可以通过软件包的功能名称来安装一个软件包。以 Firefox 为例，以下的命令可以用来安装该软件包。

    <pre><code># zypper in MozillaFirefox
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
    Retrieving package sound-theme-freedesktop-0.8-7.1.2.noarch                                                                                            (3/128), 372.6 KiB (460.3 KiB unpacked) </code></pre>

23. 安装指定版本号的软件包，(以 gcc 5.1 为例)。

    <pre><code># zypper in 'gcc<5.1'
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...

    The following 13 NEW packages are going to be installed:
      cpp cpp48 gcc gcc48 libasan0 libatomic1-gcc49 libcloog-isl4 libgomp1-gcc49 libisl10 libitm1-gcc49 libmpc3 libmpfr4 libtsan0-gcc49

    13 new packages to install.
    Overall download size: 14.5 MiB. Already cached: 0 B  After the operation, additional 49.4 MiB will be used.
    Continue? [y/n/? shows all options] (y): y </code></pre>

24. 为特定的CPU架构安装软件包（以兼容 i586 的 gcc 为例）。

    <pre><code># zypper in gcc.i586
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
    Retrieving: libatomic1-gcc49-4.9.0+r211729-2.1.7.x86_64.rpm ...............................................................................................................[done (55.3 KiB/s)] </code></pre>
 
25. 为特定的CPU架构安装指定版本号的软件包（以兼容 i586 且版本低于5.1的 gcc 为例）

    <pre><code># zypper in 'gcc.i586<5.1'
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
    In cache libgomp1-gcc49-4.9.0+r211729-2.1.7.x86_64.rpm                                             (3/13),  41.1 KiB ( 90.7 KiB unpacked) </code></pre>

26. 从指定的软件库里面安装一个软件包，例如从 amarok 中安装 libxine。

    <pre><code># zypper in amarok upd:libxine1
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...
    The following 202 NEW packages are going to be installed:
      amarok bundle-lang-kde-en clamz cups-libs enscript fontconfig gdk-pixbuf-query-loaders ghostscript-fonts-std gptfdisk gstreamer gstreamer-plugins-base hicolor-icon-theme
      hicolor-icon-theme-branding-openSUSE htdig hunspell hunspell-tools icoutils ispell ispell-american kde4-filesystem kdebase4-runtime kdebase4-runtime-branding-openSUSE kdelibs4
      kdelibs4-branding-openSUSE kdelibs4-core kdialog libakonadi4 l
    .....</code></pre>

27. 通过指定软件包的名字安装软件包。

    <pre><code># zypper in -n git
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
    Continue? [y/n/? shows all options] (y): y </code></pre>

28. 通过通配符来安装软件包，例如，安装所有 php5 的软件包。

    <pre><code># zypper in php5*
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
    ....</code></pre>

29. 使用模式名称（模式名称是一类软件包的名字）来批量安装软件包。

    <pre><code># zypper in -t pattern lamp_server
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
    Continue? [y/n/? shows all options] (y): </code></pre>

30. 使用一行命令安装一个软件包同时卸载另一个软件包，例如在安装 nano 的同时卸载 vi

    <pre><code># zypper in nano -vi
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
    ...</code></pre>

31. 使用 zypper 安装 rpm 软件包。

    <pre><code># zypper in teamviewer*.rpm
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
    ..</code></pre>

#### 使用 zypper 卸载软件包 ####

32. 命令 ‘zypper remove‘ 和 ‘zypper rm‘ 用于卸载软件包。例如卸载 apache2:

    <pre><code># zypper remove apache2 </code></pre>
    或者
    <pre><code># zypper rm apache2
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...

    The following 2 packages are going to be REMOVED:
      apache2 apache2-prefork

    2 packages to remove.
    After the operation, 4.2 MiB will be freed.
    Continue? [y/n/? shows all options] (y): y
    (1/2) Removing apache2-2.4.10-19.1 ........................................................................[done]
    (2/2) Removing apache2-prefork-2.4.10-19.1 ................................................................[done] </code></pre>
 
#### 使用Zypper 进行软件包更新 ####

33. 更新所有的软件包，可以使用 ‘zypper update‘ 或者 ‘zypper up‘。

    <pre><code># zypper up </code></pre>
    或者
    <pre><code># zypper update

    Loading repository data...
    Reading installed packages...
    Nothing to do. </code></pre>

34. 更新指定的软件包，例如更新 apache2 以及 openssh。

    <pre><code> zypper up apache2 openssh
    Loading repository data...
    Reading installed packages...
    No update candidate for 'apache2-2.4.10-19.1.x86_64'. The highest available version is already installed.
    No update candidate for 'openssh-6.6p1-5.1.3.x86_64'. The highest available version is already installed.
    Resolving package dependencies...

    Nothing to do.</code></pre>

35. 安装一个软件库，例如 mariadb，如果该库存在则更新之。

    <pre><code># zypper in mariadb
    Loading repository data...
    Reading installed packages...
    'mariadb' is already installed.
    No update candidate for 'mariadb-10.0.13-2.6.1.x86_64'. The highest available version is already installed.
    Resolving package dependencies...

    Nothing to do.</code></pre>

#### 安装源文件并且构建依赖关系 ####
    
命令 ‘zypper source-install‘ 或者 ‘zypper si‘ 可以用于从源文件编译软件包

36. 安装某一个软件包的源文件及其依赖关系，例如 mariadb。

    <pre><code># zypper si mariadb
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
    Continue? [y/n/? shows all options] (y): y </code></pre>

37. 仅为某一个软件包安装源文件，例如 mariadb

    <pre><code># zypper in -D mariadb
    Loading repository data...
    Reading installed packages...
    'mariadb' is already installed.
    No update candidate for 'mariadb-10.0.13-2.6.1.x86_64'. The highest available version is already installed.
    Resolving package dependencies...

    Nothing to do. </code></pre>

38. 仅为某一个软件包安装依赖关系，例如 mariadb

    <pre><code># zypper si -d mariadb
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
    Continue? [y/n/? shows all options] (y): y</code></pre>

#### 在脚本和应用中调用 Zypper （非交互式） ####

39. 安装一个软件包，并且在安装过程中跳过与用户的交互, 例如 mariadb。

    <pre><code># zypper --non-interactive in mariadb
    Loading repository data...
    Reading installed packages...
    'mariadb' is already installed.
    No update candidate for 'mariadb-10.0.13-2.6.1.x86_64'. The highest available version is already installed.
    Resolving package dependencies...

    Nothing to do.</code></pre>

40. 卸载一个软件包，并且在卸载过程中跳过与用户的交互，例如 mariadb

    <pre><code># zypper --non-interactive rm mariadb
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...

    The following package is going to be REMOVED:
      mariadb

    1 package to remove.
    After the operation, 71.8 MiB will be freed.
    Continue? [y/n/? shows all options] (y): y
    (1/1) Removing mariadb-10.0.13-2.6.1 .............................................................................[done] </code></pre>

41. 以 XML 格式显示 zypper 的输出。

    <pre><code># zypper --xmlout
      Usage:
    	zypper [--global-options] <command> [--command-options] [arguments]

      Global Options
    ....</code></pre>

42. 在安装过程中禁止详细信息输出到屏幕。

    <pre><code># zypper --quiet in mariadb
    The following NEW package is going to be installed:
      mariadb

    1 new package to install.
    Overall download size: 0 B. Already cached: 7.8 MiB  After the operation, additional 71.8 MiB will be used.
    Continue? [y/n/? shows all options] (y):
    ...</code></pre>

43. 在卸载过程中禁止详细信息输出到屏幕

    <pre><code># zypper --quiet rm mariadb </code></pre>

44. 自动地同意版权或者协议。

    <pre><code># zypper patch --auto-agree-with-licenses
    Loading repository data...
    Reading installed packages...
    Resolving package dependencies...

    Nothing to do.</code></pre>

#### 清除 Zypper 缓存以及查看历史信息 ####

45. 以下指令可以用来清理Zypper缓存。

    <pre><code># zypper clean
    All repositories have been cleaned up.</code></pre>

如果需要一次性地清理元数据以及软件包缓存，可以通过 -all 或 -a 选项来达到目的

    <pre><code># zypper clean -a
    All repositories have been cleaned up.</code></pre>

46. 查看 Zypper 的历史信息。任何通过 Zypper 进行的软件包管理动作，包括安装、更新以及卸载都会在 /var/log/zypp/history中保留历史信息。可以通过 cat 来查看此文件，或者通过过滤器来筛选希望看到的信息。

    <pre><code> cat /var/log/zypp/history
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
    ......</code></pre>

#### 使用 Zypper 进行SUSE系统升级 ####

47. 可以使用 Zypper 命令的 'dist-upgrade' 选项来将当前的 SUSE Linux 升级至最新版本。

    <pre><code># zypper dist-upgrade
    You are about to do a distribution upgrade with all enabled repositories. Make sure these repositories are compatible before you continue. See 'man zypper' for more information about this command.
    Building repository 'openSUSE-13.2-0' cache .....................................................................[done]
    Retrieving repository 'openSUSE-13.2-Debug' metadata ............................................................[done]
    Building repository 'openSUSE-13.2-Debug' cache .................................................................[done]
    Retrieving repository 'openSUSE-13.2-Non-Oss' metadata ..........................................................[done]
    Building repository 'openSUSE-13.2-Non-Oss' cache ...............................................................[done]</code></pre>

正文至此结束。希望本文可以帮助读者尤其是新手们管理SUSE Linux系统和服务器。如果您觉得某些比较重要的命令被作者漏掉了，请在评论部分写下您的返回，作者将根据评论对文章进行更新。保持联络，保持评论，多谢支持。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/zypper-commands-to-manage-suse-linux-package-management/

作者：[Avishek Kumar][a]
译者：[张博约](https://github.com/zhangboyue)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/installation-of-suse-linux-enterprise-server-12/
