[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with OpenTaxSolver)
[#]: via: (https://opensource.com/article/20/2/do-your-taxes-open-source-way)
[#]: author: (Jessica Cherry https://opensource.com/users/jrepka)

Getting started with OpenTaxSolver
======
If you're a United States citizen, learn how to do your own state tax
returns with OpenTaxSolver.
![A document flying away][1]

OpenTaxSolver is an open source application for US taxpayers to calculate their state and federal income tax returns. Before I get into the software, I want to share some of the information I learned when researching this article. I spent about five hours a day for a week looking into open source options for doing your taxes, and I learned about a lot more than just tax software.

The Internal Revenue Service's (IRS's) [Use of federal tax information (FTI) in open source software][2] webpage offers a large amount of information, and it's especially relevant to anyone who may want to start their own open source tax software project. To hit the finer points:

  * Federal tax information (FTI) can be used in any open source software
  * Software creators mush follow all security laws and compliance requirements
  * Any such software must be supported either by a vendor or a community
  * The software must be approved by the federal government



One other reason researching this topic was rather difficult (but ultimately rewarding) is that, by federal law, the major tax software companies are required to provide their services for free to any person earning under $69,000 per year. About 70% of Americans fit into this category, and if you are one of them, you can check the IRS's [Free File][3] webpage for links to free filing software from well-known companies. (The IRS reminds you that "you are responsible for determining your eligibility for one of the Free File Online offers.")

Please share this information broadly—knowledge is power, and not everyone can (or wants to) use open source software to do their taxes for reasons including:

  * Lack of computer or software access
  * Low computer competence
  * Age or disability
  * Discomfort with doing taxes



If you don't fall into any of these categories and want to do your taxes the open source way, continue reading to learn about OpenTaxSolver.

### About OpenTaxSolver

[OpenTaxSolver][4] is meant to be used with the IRS's [tax booklet][5], which is published yearly. This booklet provides detailed information for doing your taxes, such as rules around tax credits and write-offs.

OpenTaxSolver cuts down on tax calculations when you fill out your tax forms and simplifies the hardest part of doing your taxes: the math. You still have to fill in your data and turn the paperwork in, but using the software means you can do it in about half of the time. Since OpenTaxSolver is running in beta, you have to double-check all of your number entries and information against the official IRS tax booklet after you use the software.

### Download and install OpenTaxSolver

First, [download the software][6]. There are versions for Linux, Windows, and macOS. If you're using one of the latter two, refer to the download page for installation instructions. I'm using my go-to operating system, Ubuntu Linux, which I installed by:

  1. Downloading the TGZ file from the website
  2. Extracting it to my desktop (but you can choose any location on your computer)
  3. Clicking on **Run_taxsolve_GUI**



![OpenTaxSolver installation][7]

### Enter your tax data

I'll walk through this example using random numbers (for obvious reasons). This walkthrough will explain how do federal taxes with OpenTaxSolver, but if you have to pay state taxes, do that before you begin your federal return.

To do the common Federal 1040 tax return, select **US 1040**, click **Start New Return**, and start answering some basic questions about your tax situation. For this example, I selected the following itemized deductions: mortgage interest, donations, and some random itemizable write-offs. If you don't know what these are or what may apply to you, head over to the IRS website or google "itemizable write-offs."

Next, begin entering the data from your tax documents.

![OpenTaxSolver][8]

![OpenTaxSolver][9]

After you finish entering all your data and filling out the entire form, save it by clicking the **Save** button, and then click **Compute Tax** on the bottom of the screen.

![OpenTaxSolver][10]

### Check your return and file your taxes

If you made any mistakes (such as mistyping something or putting an incorrect value in any field), it will show an error on the bottom of the preview after the computation finishes.

![OpenTaxSolver preview][11]

The preview also reports your marginal tax rate and what percentage of your income you are paying in taxes.

![OpenTaxSolver preview][12]

After you review the information in the preview, make any corrections, and finish your return, click **Fill-out PDF Forms**, and it will provide printable tax forms with all of your information filled in.

![Tax return][13]

If you entered your name, address, and social security number when entering your data, all of that information will also appear in the right places on the form. Double-check everything, print it, and mail your tax return to the IRS.

### Final notes

OpenTaxSolver gives you the opportunity to file your own federal and state taxes. As always, with any federal related tax information (or federal anything, for that matter), always double-check and use due diligence. I found this software very useful for expanding my knowledge about my taxes.

The OpenTaxSolver website includes a request for contributors, so if you want to start contributing to an open source project that helps everyone, this is one I'd definitely suggest.

And if you're someone who likes to wait until the last minute to pay your taxes, this [clock][14] tells you how much time you have until your taxes are due.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/do-your-taxes-open-source-way

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_odf_1109ay.png?itok=4CqrPAjt (A document flying away)
[2]: https://www.irs.gov/privacy-disclosure/use-of-federal-tax-information-fti-in-open-source-software
[3]: https://apps.irs.gov/app/freeFile/
[4]: http://opentaxsolver.sourceforge.net/index.html
[5]: https://www.irs.gov/pub/irs-pdf/i1040gi.pdf
[6]: http://opentaxsolver.sourceforge.net/download2019.html?button=+Download+OTS+
[7]: https://opensource.com/sites/default/files/uploads/tax2.png (OpenTaxSolver installation)
[8]: https://opensource.com/sites/default/files/uploads/tax1.png (OpenTaxSolver)
[9]: https://opensource.com/sites/default/files/uploads/tax7.png (OpenTaxSolver)
[10]: https://opensource.com/sites/default/files/uploads/tax6.png (OpenTaxSolver)
[11]: https://opensource.com/sites/default/files/uploads/tax3.png (OpenTaxSolver preview)
[12]: https://opensource.com/sites/default/files/uploads/tax4.png (OpenTaxSolver preview)
[13]: https://opensource.com/sites/default/files/uploads/tax5.png (Tax return)
[14]: https://countdown.onlineclock.net/countdowns/taxes/
