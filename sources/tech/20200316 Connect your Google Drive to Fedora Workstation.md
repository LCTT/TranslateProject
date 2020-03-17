[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Connect your Google Drive to Fedora Workstation)
[#]: via: (https://fedoramagazine.org/connect-your-google-drive-to-fedora-workstation/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Connect your Google Drive to Fedora Workstation
======

![][1]

There are plenty of cloud services available where you can store important documents. Google Drive is undoubtedly one of the most popular. It offers a matching set of applications like Docs, Sheets, and Slides to create content. But you can also store arbitrary content in your Google Drive. This article shows you how to connect it to your [Fedora Workstation][2].

### Adding an account

Fedora Workstation lets you add an account either after installation during first startup, or at any time afterward. To add your account during first startup, follow the prompts. Among them is a choice of accounts you can add:

![][3]

Select Google and a login prompt appears for you to login, so use your Google account information.

![][4]

Be aware this information is only transmitted to Google, not to the GNOME project. The next screen asks you to grant access, which is required so your system’s desktop can interact with Google. Scroll down to review the access requests, and choose _Allow_ to proceed.

You can expect to receive notifications on mobile devices and Gmail that a new device — your system — accessed your Google account. This is normal and expected.

![][5]

If you didn’t do this at first startup, or you need to re-add your account, open the _Settings_ tool, and select _Online Accounts_ to add the account. The _Settings_ tool is available through the dropdown at right side of the Top Bar (the “gear” icon), or by opening the Overview and typing _settings_. Then proceed as described above.

### Using the Files app with Google Drive

Open the _Files_ app (formerly known as _nautilus_). Locations the Files app can access appear on the left side. Locate your Google account in the list.

When you select this account, the Files app shows the contents of your Google drive. Some files can be opened using your Fedora Workstation local apps, such as sound files or [LibreOffice][6]-compatible files (including Microsoft Office docs). Other files, such as Google app files like Docs, Sheets, and Slides, open using your web browser and the corresponding app.

Remember that if the file is large, it will take some time to receive over the network so you can open it.

You can also copy and paste files in your Google Drive storage from or to other storage connected to your Fedora Workstation. You can also use the built in functions to rename files, create folders, and organize them. For sharing and other advanced options, use Drive from your browser per normal.

Be aware that the Files app does not refresh contents in real time. If you add or remove files from other Google connected devices like your mobile phone or tablet, you may need to hit **Ctrl+R** to refresh the Files app view.

* * *

_Photo by [Beatriz Pérez Moya][7] on [Unsplash][8]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/connect-your-google-drive-to-fedora-workstation/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/gdrive-workstation-816x345.jpg
[2]: https://getfedora.org/workstation
[3]: https://fedoramagazine.org/wp-content/uploads/2020/03/firstboot-choices.jpg
[4]: https://fedoramagazine.org/wp-content/uploads/2020/03/firstboot-signin.jpg
[5]: https://fedoramagazine.org/wp-content/uploads/2020/03/firstboot-grantaccess.jpg
[6]: https://fedoramagazine.org/discover-hidden-gems-libreoffice/
[7]: https://unsplash.com/@beatriz_perez?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/s/photos/office-files?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
