5 open source alternatives to Mint and Quicken for personal finance
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_whitehurst_money.png?itok=ls-SOzM0)

Editor's note: This article was originally published in January 2016 and has been updated to add two great additional tools.

When asked about personal goals, getting a better handle on personal finances is high on most people's list. Whether this means making and sticking to a budget, reducing unnecessary expenses, or simply getting a better understanding of their financial situation, pretty much any approach to personal finance is dependent on having a good idea of the numbers inside a person's bank accounts, where they come from, and where they go.

Determining which tools allow you to best organize your finances depends a little bit on your situation. Do you primarily make purchases electronically, or do you rely heavily on cash? Is archiving and organizing receipts important for you come tax time? Do you operate a small business and need a more powerful tool that can manage the more complex finances of sales, customers, employees, and business expenses? Or do you use multiple currencies (perhaps Bitcoin?) and want to keep track of those values as well?

Just as no two people have identical bank accounts, there's no single personal finance tool that works best for everybody. For some, automation and simplicity are their main goals; for others, customization and having lots of features matter most; while still others would benefit most from a large community to provide support. Let's take a look at five popular options for open source financial software tools, and a sixth option as well--old-fashioned spreadsheets. Each of these tools was designed with Linux in mind, but there are builds for other operating systems as well.

### GnuCash

First up, let's take a look at [GnuCash][1]. GnuCash is a reasonably full-featured accounting application that is suitable for both personal use and managing a small business. First released in 1998, GnuCash is a stable option packaged for most major Linux distributions with Windows and Mac ports available. It features multi-entry bookkeeping, can import from a wide range of formats, handles multiple currencies, helps create budgets, prints checks, creates custom reports in Scheme, and can import from online banks and pull stock quotes directly. While not the kitchen sink, it can handle most financial needs readily out of the box.

One reason I particularly like GnuCash as an option is the availability of a [mobile application][2] that complements, rather than emulates, its desktop companion. The mobile app makes it easy for you to track expenses on the go and import them into the desktop version for more detailed management (although, unfortunately, it does not provide direct syncing).

GnuCash hosts a public mirror of its [source code][3], which is primarily written in C, on GitHub. Given its long and complex history, portions of the code are made available under a number of mutually compatible [licenses][4], primarily the GPL, but the code repository has the full details.

### HomeBank

[HomeBank][5] is another personal financial management option that is both easy to use and full of charting and reporting options. Most Linux users can find a packaged version in their usual repositories, and Windows users can install via a direct download. There are other unsupported ports available as well.

HomeBank has a similar feature set to what you might expect from other tools: import from Quicken, Microsoft Money, or other common formats; duplicate-transaction detection; multiple account types; split transactions; budgeting tools; and more. HomeBank also sports translation into 56 languages, so it's probably available in a language you speak.

HomeBank's source code is available in [Launchpad][6], and it is licensed as open source under the [GPL version 2][7].

### KMyMoney

[KMyMoney][8] is a member of the [KDE][9] family of applications and touts three main goals: accuracy, which is of the utmost importance for a financial tool; ease of use, to ensure you start and keep using it; and familiar features, designed to made KMyMoney a simple transition if you are coming over from one of its proprietary alternatives.

To achieve these goals, KMyMoney hosts a number of features that you would expect from a modern money manager: institution and account management, tagging, QIF import, reconciliation, scheduling, ledger management, investment tracking, forecasting, and multiple currencies. While it doesn't offer some of the small business features found in GnuCash or other personal finance managers, this might actually make it easier for an individual who doesn't want to be overwhelmed with unneeded options.

KMyMoney manages a [Git repository][10] where you can find its code base, and it is made available as open source under the [GPL version 2][7]. While designed for Linux, it has been successfully ported to Windows and Mac OS as well.

### Money Manager Ex

[Money Manager Ex][11] is a cross-platform, open source personal finance manager. In addition to running on the typical platforms (Windows, Linux, and MacOS), there's also a [mobile application][12], and cloud synchronization allows you to track your finances across devices. If you'd rather not install the software on your computer, you can run it directly from a USB key. Financial data is stored in a non-proprietary SQLite Database protected with AES encryption.

It also offers the key money management features you'd find in similar applications. For example, you can use it to track checking, savings, credit card, and stock accounts, as well as fixed assets and recurring transactions; generate financial reports; and create budgets. It imports and exports QIF and CSV data, and also exports to HTML. It's available in 24 languages and supports multiple currencies.

Money Manager Ex's source code is available on [GitHub][13]. It's available as open source under the [GPL version 2][7].

### Skrooge

[Skrooge][14] is another KDE-powered personal finance management application. It can import data in a wide variety of formats; the usual QIF and CSV, but also QFX and other formats used by banks, as well as KMY (KMyMoney), SQLITE, GNC (GnuCash), GSB (Grisbi), XHB (Homebank), MMB (Money Manager Ex), and MNY (Microsoft Money). Data can be exported in QIF and CSV, as well as KMY, JSON, and XML. This makes it easy to migrate to Skrooge from other money management software (and vice versa).

Because it's KDE-based, it can run on Linux, BSD, Solaris, and MacOS, and possibly on Windows. It offers the usual features you'd look for in an application to track your expenses, income, and investments, and allows you to view your data in tables and a variety of charts.

Skrooge's source code is available in its [Git repository][15], and it's made open source under the [GPL version 3][16].

### Spreadsheets

While all five of these options are well-supported and regularly updated, my final pitch is to not even use a personal finance tool at all, but instead to use spreadsheets to manage your financial data. Yes, there's a lot to be said for having a dedicated budgeting tool. There's less reinventing of the wheel involved, and you don't have to worry as much about messing up complex formulas. You also have the peace of mind of knowing that there are others out there who have exactly the same setup and can help you out when you get stuck. And you also need to be careful to not store personally identifiable information like account numbers in plain text, particularly if you store or back up your data to a shared location.

But the vanilla spreadsheet isn't a terrible tool either. In terms of the ease of customization, it can't be beat. Custom charts and graphs are easy to generate, and you can track additional data alongside your accounts to get a clearer picture of your spending. Open source tools like [LibreOffice Calc][17] or [Gnumetric][18] offer great functionality and expandability to track your finances your way.

Personally, I use a mix of tools. I use a personal finance tool to store the raw data and for getting an idea of what my accounts look like at a glance. But for more complex operations, I turn to a trusty spreadsheet to drill down to exactly what I want to know, particularly when I want to pair the data with other personal information I collect. For example, I have a device in my car that tracks trips via GPS; by pulling out gasoline purchases, I can pair this information to see my exact cost per mile for every trip. Or I can pair restaurant spending with the personal health metrics I collect to see the correlation between how often I eat out and how my weight fluctuates.

So how do you choose? Most of the five personal finance managers here (as well as less-frequently updated options [Economizzer][19] and [Grisbi][20]) offer similar feature sets; the devil is in the details. Sometimes, your personal preferences will dictate a particular killer feature that only one of the options hosts. The best way to find out is to dive in and start using one, and if it's not working for you, migrate your accounts to another to see if it better meets your needs. If you're managing business transactions or just need more powerful options, you might also look around at the variety of [open source ERP solutions][21] available, which have better tools for managing complex business asset tracking and reporting needs.

Whichever tool you decide to use, why not make open source the way to get control of your financial picture?

--------------------------------------------------------------------------------

via: https://opensource.com/life/17/10/personal-finance-tools-linux

作者：[Jason Baker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:http://www.gnucash.org/
[2]:https://play.google.com/store/apps/details?id=org.gnucash.android&hl=en
[3]:https://github.com/Gnucash/
[4]:https://github.com/Gnucash/gnucash/blob/master/LICENSE
[5]:http://homebank.free.fr/index.php
[6]:https://code.launchpad.net/homebank
[7]:http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[8]:https://kmymoney.org/
[9]:https://www.kde.org/
[10]:https://quickgit.kde.org/?p=kmymoney.git
[11]:https://www.moneymanagerex.org/
[12]:https://www.moneymanagerex.org/features/android-version
[13]:https://github.com/moneymanagerex/moneymanagerex
[14]:https://skrooge.org/
[15]:https://cgit.kde.org/skrooge.git/
[16]:https://www.gnu.org/licenses/gpl.html
[17]:https://www.libreoffice.org/discover/calc/
[18]:http://www.gnumeric.org/
[19]:http://www.economizzer.org/
[20]:http://www.grisbi.org/
[21]:https://opensource.com/resources/top-4-open-source-erp-systems
