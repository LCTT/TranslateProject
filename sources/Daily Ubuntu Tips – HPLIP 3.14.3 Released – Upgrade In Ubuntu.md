Daily Ubuntu Tips – HPLIP 3.14.3 Released – Upgrade In Ubuntu
================================================================================
HP Linux Imaging and printing (HPLIP) is an open-source package sponsored by HP to deliver full feature HP printer drivers to the Linux community.

Installing this package which come default in Ubuntu allows full HP printer support in Ubuntu and other Linux distributions for thousands of HP printers. Support for more printers is being added regularly, which currently stands at over [2,300 HP printers][1].

This version, 3.14.3 adds support for even more printers, including support for HP DeskJet Ink Advantage 4640 e-All-in-One Printer series, HP LaserJet Pro MFP M126nw, support for Debian 6.0.9, 7.3, 7.4 and Fedora 20.

Besides adding support for new printers and distributions, some outstanding issues were also fixed in this release. Some of the fixes are; functionality alignment issues with HP OfficeJet 6100, issue that prevented a second fax queue in interactive more, and a missing No’ 6 3/4 Envelop media size for HP OfficeJet 7619 Series.

For more about this release, please check out its release page at [http://sourceforge.net/p/hplip/news/2014/03/hplip-3143-public-release-/][2]

Below is a complete list of newly support HP printers:

- HP DeskJet Ink Advantage 4640 e-All-in-One Printer series
- HP DeskJet Ink Advantage 4645 e-All-in-One Printer
- HP DeskJet Ink Advantage 4646 e-All-in-One Printer
- HP DeskJet Ink Advantage 4648 e-All-in-One Printer
- HP LaserJet Pro MFP M125a
- HP LaserJet Pro MFP M125nw
- HP LaserJet Pro MFP M125rnw
- HP LaserJet Pro MFP M126a
- HP LaserJet Pro MFP M126nw
- HP LaserJet Pro MFP M127fp

To install / upgrade to this version, press **Ctrl – Alt – T** on your keyboard to open the terminal. When it opens, run the commands below to download the package.

    wget http://prdownloads.sourceforge.net/hplip/hplip-3.14.3.run

Next, run the commands below to run the installation.

    sh hplip-3.14.3.run

Follow the wizard to guide you when installing. It’s pretty simple. For a complete step-by-step guide on installing it, please check this post out.

http://www.liberiangeek.net/2013/02/hp-linux-imaging-and-printer-hplip-version-3-13-2-releasedadds-support-for-more-printers/

After installing, you may have to restart your machine.

![](http://www.liberiangeek.net/wp-content/uploads/2014/03/hplipubuntu3143.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/03/daily-ubuntu-tips-hplip-3-14-3-released-upgrade-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://hplipopensource.com/hplip-web/supported_devices/index.html
[2]:http://sourceforge.net/p/hplip/news/2014/03/hplip-3143-public-release-/