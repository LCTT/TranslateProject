[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Linux to do your taxes)
[#]: via: (https://opensource.com/article/21/2/linux-tax-software)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Use Linux to do your taxes
======
Taxes are a necessary thing. See how OpenTaxSolver can make filing with
the IRS much easier.
![The capitol building and a dollar bill][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Here's how to use Linux to do your taxes.

Unless you want to be arrested, you generally have to pay taxes. If you live outside your country of birth, you probably even have to pay taxes twice or thrice. However unpleasant, taxes are a common thread among all computer users, and so it stands to reason that a computer ought to be able to help you pay your taxes. One of the complexities of this, though, is that each country is different in its requirements. For instance, in New Zealand, my income taxes are calculated automatically by my employer and the IRD. I don't have to account for tax rates, much less _file taxes_ the way US citizens do.

This system drastically improves my available accounting software choices because none of my potential options need to have a contract with a tax agency to work correctly. If you're in the US, though, your tax application choices fully integrated with the IRS are limited, and none of them are open source.

### Tax applications

In the US, you have three options. You can:

  * Use [Free File online][2] with the IRS directly
  * Try an IRS-approved application in WINE (a compatibility layer allowing Windows applications to run on Linux)
  * Use the excellent [OpenTaxSolver][3] bundle



### WINE

WINE is not an emulator but a compatibility layer you can enable on Linux. Many Windows applications can launch and run as if they were native Linux applications. It's a technology that's been used for gaming for years, and it's most recently gotten a boost from gaming giant Valve Software, which uses the project in conjunction with their Steam client. You can install WINE from the software center of your Linux distribution or a terminal.

On Fedora or RHEL:


```
`$ sudo dnf install wine`
```

On Debian, Elementary, Pop, and similar:


```
`$ sudo apt install wine`
```

WINE isn't an application itself, so you don't use it directly. When you launch the install wizard for your tax application, it opens because WINE is installed on your system, and you proceed through the installer as usual.

A word of warning, though: tax applications by necessity release new versions every year, so keeping up with all the components required for system compatibility is difficult. WINE can't guarantee that an application will function as expected, and the time to find that out isn't when you're rushing to get your taxes done by the filing deadline. If you want to use WINE for a tax application you rely upon, investigate compatibility first.

### Free File

Lately, the IRS has made an online tax filing system available to almost anyone running a browser. It's an easy way to ensure compliance with federal taxes and a quick way to submit. All you need is a web browser, and [Linux has plenty of browsers you can choose from][4].

### OpenTaxSolver

Functionally, applications that get the IRS's approval are really only interactive compendiums of tax rules. You enter the data, you select what you believe to be accurate for your situation, and the application verifies your choices with the rules it has access to. And that's exactly what OpenTaxSolver does, but without the pretense of being an application that files your taxes for you. With OpenTaxSolver, you [download the latest version of the software][5], launch it, and fill out each question as prompted.

![OpenTaxSolver user interface][6]

OpenTaxSolver interface

In the end, you have a PDF that you print, sign, and mail. Depending on your state, OpenTaxSolver may be able to help you with your local taxes, too. Luckily, every state I've lived in has had very simple tax forms, so OpenTaxSolver's help is less vital for those.

OpenTaxSolver is simple enough not to get in your way but helpful enough to help remove the dread of filling out tax paperwork seemingly written to come across as a not very enjoyable riddle.

### The Linux advantage

Before switching to Linux, I resented that filing taxes forced me to either not use my computer (a device specifically designed to _compute_ numerical data) or to pay for a specific software that usually advertised itself as a clever way to get out of paying as much tax as I would likely calculate on my own. There never seemed to be a great answer to making taxes painless while avoiding mistakes, and without spending extra money. With Linux, I can file my US taxes with the help of OpenTaxSolver, for no extra cost, and on the platform of my choice. Try filing on Linux this year, and see if you can learn to love taxes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-tax-software

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/govt_money%20votes_1.png?itok=uLMdIPrn (The capitol building and a dollar bill)
[2]: https://www.irs.gov/filing/free-file-do-your-federal-taxes-for-free
[3]: https://opensource.com/article/20/2/open-source-taxes
[4]: https://opensource.com/article/19/7/open-source-browsers
[5]: http://opentaxsolver.sourceforge.net/download.html
[6]: https://opensource.com/sites/default/files/ots.jpg
