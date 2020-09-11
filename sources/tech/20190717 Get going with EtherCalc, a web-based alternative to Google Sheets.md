[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get going with EtherCalc, a web-based alternative to Google Sheets)
[#]: via: (https://opensource.com/article/19/7/get-going-ethercalc)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitthttps://opensource.com/users/greg-phttps://opensource.com/users/marcobravo)

Get going with EtherCalc, a web-based alternative to Google Sheets
======
EtherCalc is an open source spreadsheet that makes it easy to work
remotely and collaborate with others.
![Open data brain][1]

Spreadsheets can be very useful—and not just for [managing your finances][2]. That said, desktop spreadsheets have their limitations. The biggest is that you need to be at your computer to use one. On top of that, collaborating on a spreadsheet can quickly become a messy affair.

Enter [EtherCalc][3], an open source, web-based spreadsheet. While not as fully featured as a desktop spreadsheet, EtherCalc packs enough features for most people.

Let's take a look at how to get started using it.

### Getting EtherCalc

If you're self-hosting, you can [download the code][4], get it through [Sandstorm.io][5], or use npm (the Node.js package manager) to install it on a server.

But what if you don't have a server? You can use one of the many hosted instances of EtherCalc—for example, at [EtherCalc.org][6], the [instance hosted][7] by the folks at [Framasoft][8], or use it through [Sandstorm Oasis][9].

### What can you use EtherCalc for?

Just about everything you'd use a desktop spreadsheet for. That could be to balance your budget, track your savings, record your income, schedule meetings, or take an inventory of your possessions.

I've used EtherCalc to track time on freelance projects, to create invoices for those projects, and even to share article ideas with my fellow [Opensource.com community moderators][10]. How you use EtherCalc is up to your needs and your imagination.

### Working with EtherCalc

The first step is to create a spreadsheet.

![Empty EtherCalc spreadsheet][11]

If you've used a desktop or web-based spreadsheet before, EtherCalc will look somewhat familiar. As with any spreadsheet, you type what you need to type in the cells on the sheet. The includes column headings, labels, and functions (more on those in a moment).

Before you do anything else, bookmark the URL to your spreadsheet. EtherCalc uses randomly generated URLs—for example, <https://ethercalc.org/9krfqj2en6cke>—which aren't easy to remember.

### Formatting your spreadsheet

To add formatting to your spreadsheet, highlight the cell or cells that you want to format and click the **Format** menu.

![EtherCalc's Format menu][12]

You can add borders and padding, change fonts and their attributes, align text, and change the format of numbers, for example to dates or currency formats. When you're done, click the **Save to:** button to apply the formatting.

### Adding functions

_Functions_ enable you to add data, manipulate data, and make calculations in a spreadsheet. They can do a lot more, too.

To add a function to your spreadsheet, click a cell. Then, click the **Function** button on the toolbar.

![EtherCalc Function button][13]

That opens a list all of the functions EtherCalc supports, along with a short description of what each function does.

![EtherCalc Functions list][14]

Select the function you want to use, then click **Paste**. EtherCalc adds the function, along with an opening parenthesis, to the cell. Type what you need to after the parenthesis, then type a closing parenthesis. For example, if you want to total up all the numbers in column B in the spreadsheet using the _=SUM()_ function, type _B1:B21_ and close the parenthesis.

![Entering a function in EtherCalc ][15]

You can also add functions by double-clicking in a cell and typing them. There's no reference in the documentation for EtherCalc's functions. However, it does support [OpenFormula][16] (a standard for math formulas that spreadsheets support). If you're not familiar with spreadsheet functions, you can look up what you need in the [OpenFormula specification][17] or this handy dandy [reference to LibreOffice Calc's functions][18].

### Collaborating with others

Earlier this year, I worked with two friends on a content strategy project. I'm in New Zealand, one friend is in British Columbia, and the other is in Toronto. Since we were working across time zones, each of us needed access to the spreadsheet we were using to track and coordinate our work. Emailing a LibreOffice Calc file wasn't an option. Instead, we turned to EtherCalc, and it worked very well.

Collaborating with EtherCalc starts with sharing your spreadsheet's URL with your collaborators. You can tell when someone else is working on the spreadsheet by the blue border that appears around one or more cells.

![Collaborating in EtherCalc][19]

You and your collaborators can enter information into the spreadsheet simultaneously. All you need to remember is to respect the sanctity of those blue borders.

The **Comment** tab comes in handy when you need to ask a question, include additional information, or make a note to follow up on something. To add a comment, click the tab, and type what you need to type. When you're finished, click **Save**.

![Adding a comment in EtherCalc][20]

You can tell when a cell has a comment by the small red triangle in the top-right corner of the cell. Hold your mouse pointer over it to view the comment.

![Viewing a comment in EtherCalc][21]

### Final thoughts

EtherCalc doesn't do everything that, say, [LibreOffice Calc][22] or [Gnumeric][23] can do. And there's nothing wrong with that. In this case, the [80/20 rule][24] applies.

If you need a simple spreadsheet and one that you can work on with others, EtherCalc is a great choice. It takes a bit of getting used to, but once you do, you'll have no problems using EtherCalc.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/get-going-ethercalc

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitthttps://opensource.com/users/greg-phttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_opendata_0613mm.png?itok=UIjD_jhK (Open data brain)
[2]: https://opensource.com/article/17/8/budget-libreoffice-calc
[3]: https://ethercalc.net/
[4]: https://github.com/audreyt/ethercalc
[5]: https://sandstorm.io
[6]: https://ethercalc.org
[7]: https://accueil.framacalc.org/en/
[8]: https://opensource.com/article/18/8/framasoft
[9]: https://oasis.sandstorm.io/
[10]: https://opensource.com/community-moderator-program
[11]: https://opensource.com/sites/default/files/uploads/ethercalc-empty-spreadsheet.png (Empty EtherCalc spreadsheet)
[12]: https://opensource.com/sites/default/files/uploads/ethercalc-formatting.png (EtherCalc's Format menu)
[13]: https://opensource.com/sites/default/files/uploads/ethercalc-function.png (EtherCalc Function button)
[14]: https://opensource.com/sites/default/files/uploads/ethercalc-function-list.png (EtherCalc Functions list)
[15]: https://opensource.com/sites/default/files/uploads/ethercalc-function-example.png (Entering a function in EtherCalc )
[16]: https://en.wikipedia.org/wiki/OpenFormula
[17]: https://docs.oasis-open.org/office/v1.2/os/OpenDocument-v1.2-os-part2.html
[18]: https://help.libreoffice.org/Calc/Functions_by_Category
[19]: https://opensource.com/sites/default/files/uploads/ethercalc-collaborators.png (Collaborating in EtherCalc)
[20]: https://opensource.com/sites/default/files/uploads/ethercalc-add-comment.png (Adding a comment in EtherCalc)
[21]: https://opensource.com/sites/default/files/uploads/ethercalc-view-comment.png (Viewing a comment in EtherCalc)
[22]: https://www.libreoffice.org/discover/calc/
[23]: http://www.gnumeric.org/
[24]: https://en.wikipedia.org/wiki/Pareto_principle
