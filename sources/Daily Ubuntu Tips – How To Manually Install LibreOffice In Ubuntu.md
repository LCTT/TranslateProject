乌龙茶 翻译中
Daily Ubuntu Tips – How To Manually Install LibreOffice In Ubuntu
================================================================================
This brief tutorial is going to show you how to manually install LibreOffice in Ubuntu. As you may already know, LibreOffice comes pre-installed in Ubuntu.

The version that comes with Ubuntu is customized to work well in Ubuntu. It’s also integrated with core Ubuntu application menu and other settings.

LibreOffice’s official version that’s on its [download page][1] is not what you get in Ubuntu by default. It’s not like you get a sub-standard edition, but it’s customized a bit and added to Ubuntu software repository.

If you want to the original and official version of LibreOffice for Linux, you must manually download it from it’s [download page][1]. That means, completely uninstalling the current version in Ubuntu and downloading the deb package from the official download page.

To do that you must first completely purge LibreOffice from Ubuntu.

### Uninstalling LibreOffice from Ubuntu ###

To install the official version of LibreOffice manually in Ubuntu, you must first uninstall the current version in Ubuntu. To uninstall LibreOffice in Ubuntu, run the commands below.

    sudo apt-get remove --purge libreoffice* && sudo apt-get autoremove

After running the commands above, restart your computer. When you log back in, download and download LibreOffice Linux .deb package from its [download page][1].

### Manually Installing LibreOffice in Ubuntu ###

After downloading the .deb package, open the terminal and go the Downloads folder in your home directory. By default, Firefox saves downloaded files there.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/libreofficemanualinstall.png)

Then run the commands below to extract the downloaded file which is mostly archived in .tar.gz file.

    tar -xvf LibreOffice_*.tar.gz

After extracting the downloaded .tar.gz file, you will see a new LibreOffice Deb folder in the Downloads folder. To begin LibreOffice manual installation, run the commands below.

    sudo dpkg -i LibreOffice_*/DEBS/*.deb

After running the above commands, LibreOffice will be installed and ready to use.

Next, go to Unity Dash and launch LibreOffice. This is how you install LibreOffice manually in Ubuntu.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/libreofficemanualinstall1.png)

If LibreOffice is installed manually in Ubuntu, you will mostly likely have to upgrade manually every time there are new versions or security updates.

Or you may just want Canonical (Ubuntu parent company) handle LibreOffice installation and patch / updates management via its repository.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-how-to-manually-install-libreoffice-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.libreoffice.org/download/
