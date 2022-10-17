[#]: subject: "How to Update Google Chrome on Ubuntu Linux"
[#]: via: "https://itsfoss.com/update-google-chrome-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Update Google Chrome on Ubuntu Linux
======
So, you managed to install Google Chrome browser on your Ubuntu system. And now you wonder how to keep the browser updated.

On Windows and macOS, when there is an update available on Chrome, you are notified in the browser itself and you can hit the update option from the browser.

Things are different in Linux. You don’t update Chrome from the browser. You update it with the system updates.

Yes. When there is a new update available on Chrome, Ubuntu notifies you via the system updater tool.

![Ubuntu sends notifications when a new version of Chrome is available][1]

You just have to click on the Install Now button, enter your account’s password when asked for it and have Chrome updated to a new version.

Let me tell you why you see the updates on the system level and how you can update Google Chrome in the command line.

### Method 1: Updating Google Chrome with system updates

How did you install Chrome in the first place? You got the deb installer file from the [Chrome website][2] and used it to [install Chrome on Ubuntu][3].

The thing is that when you do that, Google adds a repository entry into your system’s sources list. This way, your system trusts the packages coming from the Google repository.

![Google Chrome repository is added to the Ubuntu system][4]

For all such entries added to your system, the package updates are centralized through the Ubuntu Updater.

And this is why when there is an update available to Google Chrome (and other installed applications), your Ubuntu system sends you notification.

![Chrome update available with other applications via System Updater][5]

**Click the “Install Now” button and enter your password when asked for it**. Soon, the system will install all the upgradeable packages.

Depending on the update preference, the notification may not be immediate. If you want, you can manually run the updater tool and see what updates are available for your Ubuntu system.

![Run Software Updater to see what updates are available for your system][6]

### Method 2: Updating Chrome in the Ubuntu command line

If you prefer the terminal over the graphical interface, you can update Chrome with commands as well.

Open a terminal and run the following commands one by one:

```
sudo apt update 

sudo apt --only-upgrade install google-chrome-stable
```

The first command updates the package cache so that your system is aware of what packages can be upgraded.

The second command [only updates the single package][7] which is Google Chrome (installed as google-chrome-stable).

### Conclusion

As you can see, things are more streamlined in Ubuntu than in Windows. You get Chrome updated along with other system updates.

On a related note, you may learn about [removing google Chrome from Ubuntu][8] if you are unhappy with it.

Chrome is a fine browser. You can experiment with it by [using shortcuts in Chrome][9] as it makes the browsing experience even smoother.

Enjoy Chrome on Ubuntu!

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-google-chrome-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2021/06/chrome-edge-update-ubuntu.png
[2]: https://www.google.com/chrome/
[3]: https://itsfoss.com/install-chrome-ubuntu/
[4]: https://itsfoss.com/wp-content/uploads/2021/06/google-chrome-repo-ubuntu.png
[5]: https://itsfoss.com/wp-content/uploads/2021/06/chrome-edge-update-ubuntu.png
[6]: https://itsfoss.com/wp-content/uploads/2022/04/software-updater-ubuntu-22-04.jpg
[7]: https://itsfoss.com/apt-upgrade-single-package/
[8]: https://itsfoss.com/uninstall-chrome-from-ubuntu/
[9]: https://itsfoss.com/google-chrome-shortcuts/
