Daily Ubuntu Tips – Skype Minor Update Fixes PulseAudio, 64-bit Issues
================================================================================
A minor update for Skype was recently released for Linux systems, including Ubuntu that fixes issues with PulseAudio 3.x and 4.x audio noise, resolves crash on Ubuntu/Debian 64-bit systems due to missing libasound2-plugins:i386 and others.

If you currently using Skype in Ubuntu you may want to upgrade to take advantage of these fixes. There isn’t anything new except resolving these bugs.

Here’s the full list of items that were fixed according to its changelog.

- **Workaround** for PulseAudio 3.x and 4.x audio noise issues
- **Bug fix** for crash when opening a chat with non-existent emoticon
- **Bug fix** for errant crash on Ubuntu/Debian 64-bit owing to missing libasound2-plugins:i386 dependency
- **Bug fix** for some dialpad numbers not working properly

For Ubuntu users, here’s how to upgrade.
If you already have Skype installed, you will want to remove it before upgrading as it may create a conflict with the current installation.

To remove Skype from Ubuntu, run the commands from the terminal console.

    sudo apt-get autoremove --purge skype

After uninstalling Skype, go to [Skype Download page][1] and get the latest version for Ubuntu. Save the download and open with Ubuntu Software Center.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/skypeubuntuupgrade.png)

Because Software Center must download additional Skype packages, installation might take some time so be patient.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/skypeubuntuupgrade1.png)

![](If you’re having issues installing Skype via Software Center, go to your Downloads folder and run the commands below to forcibly install Skype by running the commands below.)

    sudo dpkg -i skype-ubuntu*.deb; sudo apt-get -f install

After installing Skype, go to Unity Dash and launch the latest version which is 4.2.0.13 as time of this writing.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/skypeubuntuupgrade2.png)

That’s it! Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-skype-minor-update-fixes-pulseaudio-64-bit-issues/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.skype.com/en/download-skype/skype-for-computer/