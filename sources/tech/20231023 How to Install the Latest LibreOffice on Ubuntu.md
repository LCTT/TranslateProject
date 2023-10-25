[#]: subject: "How to Install the Latest LibreOffice on Ubuntu"
[#]: via: "https://itsfoss.com/install-libreoffice-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install the Latest LibreOffice on Ubuntu
======

LibreOffice comes preinstalled in Ubuntu.

However, if you opted for the minimal Ubuntu install, removed it for some other office suite, you can easily install it using this command:

```

    sudo apt install libreoffice

```

That's fine. But the LibreOffice version provided by the Ubuntu repository may not be the latest one.

If you are hearing about a new LibreOffice version release, most likely, you won't be getting the new release. That's because Ubuntu keeps it on a stable release.

And that's fine for most users. However, if you are not 'among most users' and you like to get the latest LibreOffice in Ubuntu, you can totally do that.

There are two ways to do that:

  * Use official PPA (recommended)
  * Download deb file from LibreOffice



Let's see them one by one.

### Method 1: Install latest LibreOffice via official PPA (recommended)

You can use the official “LibreOffice Fresh” PPA to install the latest stable release of LibreOffice on Ubuntu based distributions.

The PPA provides the latest stable release of the LibreOffice, not a development release. So, this makes it the ideal choice to get the newer LibreOffice version on Ubuntu.

You don’t even need to uninstall the previous version using this method. It will update the existing LibreOffice to the newer version.

```

    sudo add-apt-repository ppa:libreoffice/ppa
    sudo apt update
    sudo apt install libreoffice

```

Since you are adding a PPA, you'll also get updates on the newer version installed this way.

### Method 2: Get the binaries from the website (if you want)

You can always go to the [download section of the LibreOfiice website][1] and download the deb file of the latest version. You'll also see the option to download an older but LTS stable version.

![][2]

I believe you already [know how to install applications from a deb file][3]. Right click on the deb file, select to open it with Software Center. Once in software center, you can click the install button to install it.

### Conclusion

The downside of the second method is that if there is an update, you'll have to download the deb file again, remove the previous LibreOffice version and install the new version with the newly downloaded deb file.

In contrast, the PPA gives you update automatically with the system updates. That's the reason why I recommend the PPA, specially when it is maintained by the LibreOffice team itself.

By the way, here are some [tips on getting more out of LibreOffice][4]:

![][5]

I hope this quick tip helped you get the latest LibreOffice on Ubuntu-based distributions. Let me know if you have questions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-libreoffice-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.libreoffice.org/download/download-libreoffice
[2]: https://itsfoss.com/content/images/2023/10/download-libreoffice.png
[3]: https://itsfoss.com/install-deb-files-ubuntu/
[4]: https://itsfoss.com/libreoffice-tips/
[5]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
