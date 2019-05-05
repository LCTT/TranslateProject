[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 apps to manage personal finances in Fedora)
[#]: via: (https://fedoramagazine.org/3-apps-to-manage-personal-finances-in-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

3 apps to manage personal finances in Fedora
======

![][1]

There are numerous services available on the web for managing your personal finances. Although they may be convenient, they also often mean leaving your most valuable personal data with a company you can’t monitor. Some people are comfortable with this level of trust.

Whether you are or not, you might be interested in an app you can maintain on your own system. This means your data never has to leave your own computer if you don’t want. One of these three apps might be what you’re looking for.

### HomeBank

HomeBank is a fully featured way to manage multiple accounts. It’s easy to set up and keep updated. It has multiple ways to categorize and graph income and liabilities so you can see where your money goes. It’s available through the official Fedora repositories.

![A simple account set up in HomeBank with a few transactions.][2]

To install HomeBank, open the _Software_ app, search for _HomeBank_ , and select the app. Then click _Install_ to add it to your system. HomeBank is also available via a Flatpak.

### KMyMoney

The KMyMoney app is a mature app that has been around for a long while. It has a robust set of features to help you manage multiple accounts, including assets, liabilities, taxes, and more. KMyMoney includes a full set of tools for managing investments and making forecasts. It also sports a huge set of reports for seeing how your money is doing.

![A subset of the many reports available in KMyMoney.][3]

To install, use a software center app, or use the command line:

```
$ sudo dnf install kmymoney
```

### GnuCash

One of the most venerable free GUI apps for personal finance is GnuCash. GnuCash is not just for personal finances. It also has functions for managing income, assets, and liabilities for a business. That doesn’t mean you can’t use it for managing just your own accounts. Check out [the online tutorial and guide][4] to get started.

![Checking account records shown in GnuCash.][5]

Open the _Software_ app, search for _GnuCash_ , and select the app. Then click _Install_ to add it to your system. Or use _dnf install_ as above to install the _gnucash_ package.

It’s now available via Flathub which makes installation easy. If you don’t have Flathub support, check out [this article on the Fedora Magazine][6] for how to use it. Then you can also use the _flatpak install GnuCash_ command with a terminal.

* * *

*Photo by _[_Fabian Blank_][7]_ on *[ _Unsplash_][8].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/3-apps-to-manage-personal-finances-in-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/personal-finance-3-apps-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2019/04/Screenshot-from-2019-04-28-16-16-16-1024x637.png
[3]: https://fedoramagazine.org/wp-content/uploads/2019/04/Screenshot-from-2019-04-28-16-27-10-1-1024x649.png
[4]: https://www.gnucash.org/viewdoc.phtml?rev=3&lang=C&doc=guide
[5]: https://fedoramagazine.org/wp-content/uploads/2019/04/Screenshot-from-2019-04-28-16-41-27-1024x631.png
[6]: https://fedoramagazine.org/install-flathub-apps-fedora/
[7]: https://unsplash.com/photos/pElSkGRA2NU?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/money?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
