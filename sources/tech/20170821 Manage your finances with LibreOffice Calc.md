translating---geekpi

Manage your finances with LibreOffice Calc
============================================================

### Do you wonder where all your money goes? This well-designed spreadsheet can answer that question at a glance.

![Get control of your finances with LibreOffice Calc](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_WorkInPublic.png?itok=7nAi_Db_ "Get control of your finances with LibreOffice Calc")
Image by : opensource.com

If you're like most people, you don't have a bottomless bank account. You probably need to watch your monthly spending carefully.

There are many ways to do that, but that quickest and easiest way is to use a spreadsheet. Many folks create a very basic spreadsheet to do the job, one that consists of two long columns with a total at the bottom. That works, but it's kind of blah.

I'm going to walk you through creating a more scannable and (I think) more visually appealing personal expense spreadsheet using LibreOffice Calc.

Say you don't use LibreOffice? That's OK. You can use the information in this article with spreadsheet tools like [Gnumeric][7], [Calligra Sheets][8], or [EtherCalc][9].

### Start by making a list of your expenses

Don't bother firing up LibreOffice Calc just yet. Sit down with pen and paper and list your regular monthly expenses. Take your time, go through your records, and note everything, no matter how small. Don't worry about how much you're spending. Focus on where you're putting your money.

Once you've done that, group your expenses under headings that make the most sense to you. For example, group your gas, electric, and water bills under the heading Utilities. You might also want to have a group of expenses with a name like Various for those unexpected expenses we all run into each month.

### Create the spreadsheet

Start LibreOffice Calc and create an empty spreadsheet. Leave three blank rows at the top of the spreadsheet. We'll come back to them.

There's a reason you grouped your expenses: Those groups will become blocks on the spreadsheet. Let's start by putting your most important expense group (e.g., Home) at the top of the spreadsheet.

Type that expense group's name in the first cell of the fourth row from the top of sheet. Make it stand out by putting it in a larger (12 points is good), bold font.

In the row below that heading, add the following three columns:

*   Expense

*   Date

*   Amount

Type the names of the expenses within that group into the cells under the Expense column.

Next, select the cells under the Date heading. Click the **Format** menu and select **Number Format > Date**. Repeat that for the cells under the Amount heading, and choose **Number Format > Currency**.

You'll have something that looks like this:

### [spreadsheet-expense-block.png][1]

![A group of expenses](https://opensource.com/sites/default/files/u128651/spreadsheet-expense-block.png "A group of expenses")

That's one group of expenses out of the way. Instead of creating a new block for each expense group, copy what you created and paste it beside the first block. I recommend having rows of three blocks, with an empty column between them.

You'll have something like this:

### [spreadsheet-expense-rows.png][2]

![A row of expenses](https://opensource.com/sites/default/files/u128651/spreadsheet-expense-rows.png "A row of expenses")

Repeat that for all your expense groups.

### Total it all up

It's one thing to see all your individual expenses, but you'll also want to view totals for each group of expenses and for all of your expenses together.

Let's start by totaling the amounts for each expense group. You can get LibreOffice Calc to do that automatically. Highlight a cell at the bottom of the Amount column and then click the **Sum** button on the Formula toolbar.

### [spreadsheet-sum-button.png][3]

![The Sum button](https://opensource.com/sites/default/files/u128651/spreadsheet-sum-button.png "The Sum button")

Click the first cell in the Amount column and drag the cursor to the last cell in the column. Then, press Enter.

### [spreadsheet-totaled-expenses.png][4]

![An expense block with a total](https://opensource.com/sites/default/files/u128651/spreadsheet-totaled-expenses.png "An expense block with a total")

Now let's do something with the two or three blank rows you left at the top of the spreadsheet. That's where you'll put the grand total of all your expenses. I advise putting it up there so it's visible whenever you open the file.

In one of the cells at the top left of the sheet, type something like Grand Total or  _T_ otal for the Month. Then, in the cell beside it, type **=SUM()**. That's the LibreOffice Calc function that adds the values of specific cells on a spreadsheet.

Instead of manually entering the names of the cells to add, press and hold Ctrl on your keyboard. Then click the cells where you totaled each group of expenses on your spreadsheet.

### Finishing up

You have a sheet for a tracking a month's expenses. Having a spreadsheet for a single month's expenses is a bit of a waste. Why not use it to track your monthly expenses for the full year instead?

Right-click on the tab at the bottom of the spreadsheet and select **Move or Copy Sheet**. In the window that pops up, click **-move to end position-** and press Enter. Repeat that until you have 12 sheets—one for each month. Rename each sheet for each month of the year, then save the spreadsheet with a descriptive name like  _Monthly Expenses 2017.ods_ .

Now that your setup is out of the way, you're ready to use the spreadsheet. While using a spreadsheet to track your expenses won't, by itself, put you on firmer financial footing, it can help you keep on top of and control what you're spending each month.

--------------------------------------------------------------------------------
作者简介：

Scott Nesbitt - I'm a long-time user of free/open source software, and write various things for both fun and profit. I don't take myself too seriously. You can find me at these fine establishments on the web: Twitter, Mastodon, GitHub,

----------------

via: https://opensource.com/article/17/8/budget-libreoffice-calc

作者：[Scott Nesbitt ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/file/366811
[2]:https://opensource.com/file/366831
[3]:https://opensource.com/file/366821
[4]:https://opensource.com/file/366826
[5]:https://opensource.com/article/17/8/budget-libreoffice-calc?rate=C87fXAfGoIpA1OuF-Zx1nv-98UN9GgbFUz4tl_bKug4
[6]:https://opensource.com/user/14925/feed
[7]:http://www.gnumeric.org/
[8]:https://www.calligra.org/sheets/
[9]:https://ethercalc.net/
[10]:https://opensource.com/users/scottnesbitt
[11]:https://opensource.com/users/scottnesbitt
[12]:https://opensource.com/article/17/8/budget-libreoffice-calc#comments
