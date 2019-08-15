[#]: collector: (lujun9972)
[#]: translator: (scvoet)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Add ‘New Document’ Option In Right Click Context Menu In Ubuntu 18.04)
[#]: via: (https://www.ostechnix.com/how-to-add-new-document-option-in-right-click-context-menu-in-ubuntu-18-04/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Add ‘New Document’ Option In Right Click Context Menu In Ubuntu 18.04
======

![Add 'New Document' Option In Right Click Context Menu In Ubuntu 18.04 GNOME desktop][1]

The other day, I was collecting reference notes for [**Linux package managers**][2] on various online sources. When I tried to create a text file to save those notes, I noticed that the ‘New document’ option is missing in my Ubuntu 18.04 LTS desktop. I thought somehow the option is gone in my system. After googling a bit, It turns out to be the “new document” option is not included in Ubuntu GNOME editions. Luckily, I have found an easy solution to add ‘New Document’ option in right click context menu in Ubuntu 18.04 LTS desktop.

As you can see in the following screenshot, the “New Doucment” option is missing in the right-click context menu of Nautilus file manager.

![][3]

new document option is missing in right-click context menu ubuntu 18.04

If you want to add this option, just follow the steps given below.

### Add ‘New Document’ Option In Right Click Context Menu In Ubuntu

First, make sure you have **~/Templates** directory in your system. If it is not available create one like below.

```
$ mkdir ~/Templates
```

Next open the Terminal application and cd into the **~/Templates** folder using command:

```
$ cd ~/Templates
```

Create an empty file:

```
$ touch Empty\ Document
```

Or,

```
$ touch "Empty Document"
```

![][4]

Now open your Nautilus file manager and check if “New Doucment” option is added in context menu.

![][5]

Add ‘New Document’ Option In Right Click Context Menu In Ubuntu 18.04

As you can see in the above screenshot, the “New Document” option is back again.

You can also additionally add options for different files types like below.

```
$ cd ~/Templates

$ touch New\ Word\ Document.docx
$ touch New\ PDF\ Document.pdf
$ touch New\ Text\ Document.txt
$ touch New\ PyScript.py
```

![][6]

Add options for different files types in New Document sub-menu

Please note that all files should be created inside the **~/Templates** directory.

Now, open the Nautilus and check if the newly created file types are present in “New Document” sub-menu.

![][7]

If you want to remove any file type from the sub-menu, simply remove the appropriate file from the Templates directory.

```
$ rm ~/Templates/New\ Word\ Document.docx
```

I am wondering why this option has been removed in recent Ubuntu GNOME editions. I use it frequently. However, it is easy to re-enable this option in couple minutes.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-add-new-document-option-in-right-click-context-menu-in-ubuntu-18-04/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Add-New-Document-Option-In-Right-Click-Context-Menu-1-720x340.png
[2]: https://www.ostechnix.com/linux-package-managers-compared-appimage-vs-snap-vs-flatpak/
[3]: https://www.ostechnix.com/wp-content/uploads/2019/07/new-document-option-missing.png
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/Create-empty-document-in-Templates-directory.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Add-New-Document-Option-In-Right-Click-Context-Menu-In-Ubuntu.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/07/Add-options-for-different-files-types.png
[7]: https://www.ostechnix.com/wp-content/uploads/2019/07/Add-New-Document-Option-In-Right-Click-Context-Menu.png
