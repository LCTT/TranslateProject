[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with GnuCash)
[#]: via: (https://opensource.com/article/20/2/gnucash)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Getting started with GnuCash
======
Manage your personal or small business accounting with GnuCash.
![A dollar sign in a network][1]

For the past four years, I've been managing my personal finances with [GnuCash][2], and I'm quite satisfied with it. The open source (GPL v3) project has been growing and improving since its initial release in 1998, and the latest version, 3.8, released in December 2019, adds many improvements and bug fixes.

GnuCash is available for Windows, MacOS, and Linux. The application implements a double-entry bookkeeping system and can import a variety of popular open and proprietary file formats, including QIF, QFX, OFX, CSV, and more. This makes it easy to convert from other personal finance applications, including Quicken, which it was created to replicate.

With GnuCash, you can track personal finances as well as small business accounting and invoicing. It doesn't have an integrated payroll system; according to the documentation, you can track payroll expenses in GnuCash, but you have to calculate taxes and deductions outside the software.

### Installation

To install GnuCash on Linux:

  * On Red Hat, CentOS, or Fedora: **$ sudo dnf install gnucash**
  * On Debian, Ubuntu, or Pop_OS: **$ sudo apt install gnucash**



You can also install it from [Flathub][3], which is what I used on my laptop running Elementary OS. (All the screenshots in this article are from that installation.)

### Setup

After you install and launch the program, you will see a welcome screen that gives you the option to create a new set of accounts, import QIF files, or open a new user tutorial.

![GnuCash Welcome screen][4]

#### Personal accounts

If you choose the first option (as I did), GnuCash opens a screen to help you get up and running. It collects initial data and sets up your account preferences, such as your account types and names, business data (e.g., tax ID number), and preferred currency.

![GnuCash new account setup][5]

GnuCash supports personal bank accounts, business accounts, car loans, CD and money market accounts, childcare accounts, and more.

As an example, start by creating a simple checkbook. You can either enter your account's beginning balance or import existing account data in multiple formats.

![GnuCash import data][6]

#### Invoicing

GnuCash also supports small business functions, including customers, vendors, and invoicing. To create an invoice, enter the data in the **Business -&gt;Invoice** section.

![GnuCash create invoice][7]

Then you can either print the invoice on paper or export it to a PDF and email it to your customer.

![GnuCash invoice][8]

### Get help

If you have questions, there's an excellent Help section that's guide accessible from the far-right side of the menu bar.

![GnuCash help][9]

The project's website includes links to lots of helpful information, such as a great overview of GnuCash [features][10]. GnuCash also has [detailed documentation][11] available to download and read offline and a [wiki][12] with helpful information for users and developers.

You can find other files and documentation in the project's [GitHub][13] repository. The GnuCash project is volunteer-driven. If you would like to contribute, please check out [Getting involved][14] on the project's wiki.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/gnucash

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_whitehurst_money.png?itok=ls-SOzM0 (A dollar sign in a network)
[2]: https://www.gnucash.org/
[3]: https://flathub.org/apps/details/org.gnucash.GnuCash
[4]: https://opensource.com/sites/default/files/images/gnucash_welcome.png (GnuCash Welcome screen)
[5]: https://opensource.com/sites/default/files/uploads/gnucash_newaccountsetup.png (GnuCash new account setup)
[6]: https://opensource.com/sites/default/files/uploads/gnucash_importdata.png (GnuCash import data)
[7]: https://opensource.com/sites/default/files/uploads/gnucash_enter-invoice.png (GnuCash create invoice)
[8]: https://opensource.com/sites/default/files/uploads/gnucash_invoice.png (GnuCash invoice)
[9]: https://opensource.com/sites/default/files/uploads/gnucash_help.png (GnuCash help)
[10]: https://www.gnucash.org/features.phtml
[11]: https://www.gnucash.org/docs/v3/C/gnucash-help.pdf
[12]: https://wiki.gnucash.org/wiki/GnuCash
[13]: https://github.com/Gnucash
[14]: https://wiki.gnucash.org/wiki/GnuCash#Getting_involved_in_the_GnuCash_project
