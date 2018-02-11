Fedora Workstation versus Server Edition
======
Obviously, Fedora Workstation is intended for use on workstations and Fedora Server Edition is intended for servers — but what exactly are the differences between the two editions?

This comparison was done with Fedora 27.

Fedora Workstation and Server Edition are shipped with slightly different defaults. The primary differences are found in the default storage media partitioning and the selection of programs and packages that are installed by default.

### Default partitioning

Fedora Workstation and Server Edition will create a 1 GiB Ext4-formatted /boot partition, plus an UEFI partition if needed. Both editions will also create a swap partition (storage-backed memory) based on the available system memory.

Fedora Server Edition creates an XFS-formatted / root partition up to 50 GiB in size. Fedora Workstation does the same, but uses the Ext4 file system for it’s root instead of XFS.

Fedora Workstation will create an additional Ext4-formatted /home partition out of the remaining disk sizes assuming the disk has at least 51 + swap GiB available.

Fedora Workstation defers the file system selection for all partitions to the default of the blivet partitioning tool. Server Edition explicitly overrides the default and sets XFS as the root file system.

### Configuration

There are some services that are configured differently between the two editions. Most notably is the differences in the default firewall configurations.

Fedora Workstation will reject any incoming TCP/UDP connection below port 1024 (privileged ports) except to ports TCP/22 (SSH), UDP/137+138 (Samba), and UDP/546 (DHCPv6 client); but otherwise allow TCP and UDP connections.

Fedora Server Edition will reject any incoming TCP/UDP connection except to ports TCP/22 (SSH), UDP/546 (DHCPv6 client), and TCP/9090 (Cockpit).

### Default packages

Advertisement

The most significant difference between the two editions is of course the selection of default packages. Fedora Server Edition installer will install the server-product-environment package group by default, and Fedora Workstation will install the workstation-product-environment group. The Server installer or any network-installer image will let users select from more groups and customize their installations.

The following overview shows packages that are unique to the defaults of each edition. Packages that are installed in both editions have been excluded to highlight the differences:

#### Fedora Server Edition

  * cockpit
  * cockpit-bridge
  * cockpit-networkmanager
  * cockpit-packagekit
  * cockpit-shell
  * cockpit-storaged
  * cockpit-ws
  * coolkey
  * ed
  * fedora-release-notes
  * fedora-release-server
  * irqbalance
  * nano
  * NetworkManager-team
  * rolekit
  * rsyslog
  * smartmontools
  * sscg
  * util-linux-user



#### Fedora Workstation

  * aajohan-comfortaa-fonts
  * abattis-cantarell-fonts
  * abrt-desktop
  * abrt-java-connector
  * adobe-source-han-sans-cn-fonts
  * adobe-source-han-sans-tw-fonts
  * adobe-source-han-serif-cn-fonts
  * adobe-source-han-serif-tw-fonts
  * adwaita-qt4
  * adwaita-qt5
  * alsa-plugins-pulseaudio
  * alsa-ucm
  * alsa-utils
  * at-spi2-atk
  * at-spi2-core
  * avahi
  * baobab
  * bluez-cups
  * caribou
  * caribou-gtk2-module
  * caribou-gtk3-module
  * cheese
  * colord
  * control-center
  * cups
  * cups-filters
  * cups-pk-helper
  * dconf
  * dejavu-sans-fonts
  * dejavu-sans-mono-fonts
  * dejavu-serif-fonts
  * desktop-backgrounds-gnome
  * eog
  * evince
  * evince-djvu
  * evince-nautilus
  * evolution
  * evolution-ews
  * evolution-help
  * fedora-bookmarks
  * fedora-productimg-workstation
  * fedora-release-workstation
  * fedora-user-agent-chrome
  * fedora-workstation-backgrounds
  * file-roller
  * file-roller-nautilus
  * firefox
  * foomatic
  * foomatic-db-ppds
  * fros-gnome
  * gdm
  * gedit
  * ghostscript
  * git
  * glib-networking
  * glibc-all-langpacks
  * glx-utils
  * gnome-backgrounds
  * gnome-bluetooth
  * gnome-boxes
  * gnome-calculator
  * gnome-calendar
  * gnome-characters
  * gnome-classic-session
  * gnome-clocks
  * gnome-color-manager
  * gnome-contacts
  * gnome-disk-utility
  * gnome-documents
  * gnome-font-viewer
  * gnome-getting-started-docs
  * gnome-initial-setup
  * gnome-logs
  * gnome-maps
  * gnome-screenshot
  * gnome-session-wayland-session
  * gnome-session-xsession
  * gnome-settings-daemon
  * gnome-shell
  * gnome-shell-extension-background-logo
  * gnome-software
  * gnome-system-monitor
  * gnome-terminal
  * gnome-terminal-nautilus
  * gnome-themes-standard
  * gnome-todo
  * gnome-user-docs
  * gnome-user-share
  * gnome-weather
  * gnu-free-mono-fonts
  * gnu-free-sans-fonts
  * gnu-free-serif-fonts
  * google-noto-emoji-fonts
  * google-noto-sans-lisu-fonts
  * google-noto-sans-mandaic-fonts
  * google-noto-sans-meetei-mayek-fonts
  * google-noto-sans-sinhala-fonts
  * google-noto-sans-tagalog-fonts
  * google-noto-sans-tai-tham-fonts
  * google-noto-sans-tai-viet-fonts
  * gstreamer1-plugins-bad-free
  * gstreamer1-plugins-good
  * gstreamer1-plugins-ugly-free
  * gutenprint
  * gutenprint-cups
  * gvfs-afc
  * gvfs-afp
  * gvfs-archive
  * gvfs-fuse
  * gvfs-goa
  * gvfs-gphoto2
  * gvfs-mtp
  * gvfs-smb
  * hplip
  * hyperv-daemons
  * ibus-gtk2
  * ibus-gtk3
  * ibus-hangul
  * ibus-kkc
  * ibus-libpinyin
  * ibus-libzhuyin
  * ibus-m17n
  * ibus-qt
  * ibus-rawcode
  * ibus-typing-booster
  * jomolhari-fonts
  * julietaula-montserrat-fonts
  * khmeros-base-fonts
  * libcanberra-gtk2
  * libcanberra-gtk3
  * liberation-mono-fonts
  * liberation-sans-fonts
  * liberation-serif-fonts
  * libproxy-mozjs
  * libreoffice-calc
  * libreoffice-emailmerge
  * libreoffice-graphicfilter
  * libreoffice-impress
  * libreoffice-math
  * libreoffice-writer
  * librsvg2
  * libsane-hpaio
  * lohit-assamese-fonts
  * lohit-bengali-fonts
  * lohit-devanagari-fonts
  * lohit-gujarati-fonts
  * lohit-gurmukhi-fonts
  * lohit-kannada-fonts
  * lohit-odia-fonts
  * lohit-tamil-fonts
  * lohit-telugu-fonts
  * lrzsz
  * mesa-dri-drivers
  * ModemManager
  * mousetweaks
  * mpage
  * nautilus
  * nautilus-sendto
  * naver-nanum-gothic-fonts
  * NetworkManager-adsl
  * NetworkManager-openconnect-gnome
  * NetworkManager-openvpn-gnome
  * NetworkManager-pptp-gnome
  * NetworkManager-ssh-gnome
  * NetworkManager-vpnc-gnome
  * nss-mdns
  * open-vm-tools-desktop
  * orca
  * PackageKit-command-not-found
  * PackageKit-gstreamer-plugin
  * PackageKit-gtk3-module
  * paktype-naskh-basic-fonts
  * paps
  * paratype-pt-sans-fonts
  * pinentry-gnome3
  * plymouth-system-theme
  * ppp
  * pulseaudio
  * pulseaudio-module-x11
  * pulseaudio-utils
  * qemu-guest-agent
  * qgnomeplatform
  * qt
  * qt-settings
  * qt-x11
  * qt5-qtbase
  * qt5-qtbase-gui
  * qt5-qtdeclarative
  * qt5-qtxmlpatterns
  * rdist
  * rhythmbox
  * rp-pppoe
  * rygel
  * samba-client
  * sane-backends-drivers-scanners
  * scl-utils
  * setroubleshoot
  * shotwell
  * sil-abyssinica-fonts
  * sil-mingzat-fonts
  * sil-nuosu-fonts
  * sil-padauk-fonts
  * simple-scan
  * smc-meera-fonts
  * spice-vdagent
  * stix-fonts
  * sushi
  * system-config-printer-udev
  * tabish-eeyek-fonts
  * thai-scalable-waree-fonts
  * totem
  * totem-nautilus
  * tracker
  * tracker-miners
  * unoconv
  * vlgothic-fonts
  * wvdial
  * xdg-desktop-portal
  * xdg-desktop-portal-gtk
  * xdg-user-dirs-gtk
  * xorg-x11-drv-armsoc
  * xorg-x11-drv-ati
  * xorg-x11-drv-evdev
  * xorg-x11-drv-fbdev
  * xorg-x11-drv-intel
  * xorg-x11-drv-libinput
  * xorg-x11-drv-nouveau
  * xorg-x11-drv-omap
  * xorg-x11-drv-openchrome
  * xorg-x11-drv-qxl
  * xorg-x11-drv-vesa
  * xorg-x11-drv-vmware
  * xorg-x11-drv-wacom
  * xorg-x11-server-Xorg
  * xorg-x11-utils
  * xorg-x11-xauth
  * xorg-x11-xinit
  * yelp



Unsurprisingly, Fedora Workstation installs [GNOME][1] and a complete desktop environment whereas Server Edition installs a base-system and headless management tools such as the [Cockpit server administration web interface][2].

There isn’t much going on here beyond what you’d expect to see. However, I’d like to see the remarkably useful Cockpit administration dashboard installed by default on Workstation edition as well.

#### Sources

  * [installclass.py][3], commit 40fc2d9f48, 2018-01-16, Anaconda repository, Red Hat installer project, GitHub
  * [installclasses/fedora_server.py][4], commit 8dfd840f72, 2018-01-10, Anaconda repository, Red Hat installer project, GitHub
  * [installclasses/fedora_workstation.py][5], commit 8dfd840f72, 2018-01-10, Anaconda repository, Red Hat installer project, GitHub
  * [comps-f27.xml.in][6], commit 2b71d398c4, 2018-01-02, fedora-comps repository, Pagure
  * [storage/partspec.py][7], commit 24fd015764, 2017-10-25, Anaconda repository, Red Hat installer project, GitHub
  * [installclasses/fedora.py][8], commit e2c9b82afb, 2017-08-01, Anaconda repository, Red Hat installer project, GitHub
  * [Anaconda][9], revision 495124, 2017-06-20, Fedora Project wiki
  * [FedoraServer.xml][10], commit 3bcc74d626, 2014-07-08, Thomas Woerner, rpms/firewalld.git, Fedora Project
  * [FedoraWorkstation.xml][11], commit 3bcc74d626, 2014-07-08, Thomas Woerner, rpms/firewalld.git, Fedora Project



--------------------------------------------------------------------------------

via: https://www.ctrl.blog/entry/fedora-server-vs-workstation

作者：[Daniel Aleksandersen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ctrl.blog
[1]:https://www.gnome.org/
[2]:http://cockpit-project.org/
[3]:https://github.com/rhinstaller/anaconda/blob/40fc2d9f4822e8960d55f1fc35dcb325460b81cf/pyanaconda/installclass.py
[4]:https://github.com/rhinstaller/anaconda/blob/8dfd840f725213603d581184f71eb7305c3e6b56/pyanaconda/installclasses/fedora_server.py
[5]:https://github.com/rhinstaller/anaconda/blob/8dfd840f725213603d581184f71eb7305c3e6b56/pyanaconda/installclasses/fedora_workstation.py
[6]:https://pagure.io/fedora-comps/blob/2b71d398c448ac6602a2c4d281179a1975512d7b/f/comps-f27.xml.in
[7]:https://github.com/rhinstaller/anaconda/blob/24fd01576426c3a3c6cc03d3ee1416b1e1457548/pyanaconda/storage/partspec.py
[8]:https://github.com/rhinstaller/anaconda/blob/e2c9b82afb3972f1243053c1633431b508bfef4a/pyanaconda/installclasses/fedora.py
[9]:https://fedoraproject.org/w/index.php?title=Anaconda&oldid=495124
[10]:https://src.fedoraproject.org/cgit/rpms/firewalld.git/tree/FedoraServer.xml?h=3bcc74d62620fec22b31bca27dc5e5b4fa3fb07e
[11]:https://src.fedoraproject.org/cgit/rpms/firewalld.git/tree/FedoraWorkstation.xml?h=3bcc74d62620fec22b31bca27dc5e5b4fa3fb07e
