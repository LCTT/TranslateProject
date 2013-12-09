Daily Ubuntu Tips – TeamViewer 9 Is Available For Download
================================================================================
TeamViewer, the popular remote support and desktop sharing tool has been updated to version 9 for Windows, Mac OS X and Linux computers, including Ubuntu. TeamViewer allows you to control any computer over the internet from anywhere.

It’s a also a great tool to have if you’re in the business or helping folks troubleshoot computer related issues such as virus removal and/or sharing your screen with someone who is at a remote location.

Here is an example of how this support tool can be used.

I recently got a call from my mother who was trying to figure out how to get a program installed. After spending few minutes over the phone trying to help her get the program without success, I decided to do it myself.

So we both download TeamViewer and within minutes, I was connected to her computer and installing the program myself.

That’s an example of how TeamViewer helps you get stuff done. If you’re going to be using TeamViewer to help your customers or clients, you may have to purchase a license to comply with the company’s policy.

Another reason I prefer TeamViewer over all other remote support tools is that it allows you to use the program without actually installing it, at least on Windows machines. If you only need to use it once, then just run it without taking up valuable disk space.

Now TeamViewer works on almost all operating systems, including Android and IOS.

Windows users can [download TeamViewer from here][1].

Ubuntu users can [download and run TeamViewer from this link][2].

To easily install TeamViewer in Ubuntu, run the commands below to download the installer.

    wget http://download.teamviewer.com/download/teamviewer_linux.deb

For **64-bit systems**, use the link below.

    wget http://download.teamviewer.com/download/teamviewer_linux_x64.deb

Finally, run the commands below to install it.

    sudo dpkg -i teamviewer_linux*.deb; sudo apt-get -f install

Enjoy!

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/teamviewer9ubuntu.png)

If the commands above don’t work for you, then go to TeamViewer [download page and download a copy][2].

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/12/daily-ubuntu-tips-teamviewer-9-is-available-for-download/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.teamviewer.com/en/download/windows.aspx
[2]:http://www.teamviewer.com/en/download/linux.aspx