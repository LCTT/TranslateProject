[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using LibreOffice for your open source budgeting tool)
[#]: via: (https://opensource.com/article/20/3/libreoffice-open-source-budget)
[#]: author: (Jess Weichler https://opensource.com/users/cyanide-cupcake)

Using LibreOffice for your open source budgeting tool
======
Figure out where your money is going with this LibreOffice Calc budget
template.
![scientific calculator][1]

Budgets can be intimidating for beginners. It can feel overwhelming to think about money, much less about how to keep track of it. But it's important to know where your money is coming and going.

In this article, I'll step through a sample budget by explaining the logic behind important money decisions as well as the formulas you need to automate the process. Fortunately, LibreOffice makes it easy for anyone to keep their yearly budget in check, even the math-averse.

### Getting started

Begin by downloading and installing [LibreOffice][2], if you don't already have it. Next, download my [LibreOffice Calc template][3], which you can use as a starting point to create your own budget to meet your spending and savings goals.

It's important to interact with your spreadsheet frequently. You can input transactions as they happen, daily, or weekly. You even could save up your receipts to calculate all your expenses at the end of the month, but this can be a hard slog. You want budgeting to be as quick and easy as possible.

### Categories

The first step to creating a budget is to decide on the categories you want to track. These categories can be as simple or as complex as you like. Think about what is useful to your personal situation and financial goals. You can easily add or change categories as your needs change.

The template has a number of example categories you can start with. There is no right or wrong way to choose categories; your budget has to work for you. Look through the list in Column A of the **Budget** tab and decide which ones to keep, which to delete, and any others you want to add. Then edit that list to align with your personal income and expense situation.

#### Create category drop-down menus

![Budget categories][4]

The template uses a drop-down menu to make it easy to assign categories to income and expenses. You can view them on the **Monthly** sheets (accessed with the tabs at the bottom of the LibreOffice window). Click on a cell in Column C, and a drop-down arrow will appear on the right. Click the arrow, and you'll see the example categories. You may need to change some of them so that they will match the categories in your budget (Column A of the **Budget** tab).

To add or remove categories from the dropdown menu, click on Column C in a Monthly sheet to select all **Category** cells. Then, in the main menu, select **Data** &gt; **Validity**. This opens up a dialog box.

In **Validity**, select the **Criteria** tab, then click on the arrow to the right of **Allow**, set it to **List**, and type the categories you want to use in the **Entries** box. Type one category per line. Make sure to use the exact same categories you used on the **Budget** sheet in Column A.

### Estimating your budget

Once you have defined your categories, it's time to estimate how much you expect to earn and spend. You can calculate these amounts monthly, yearly, or using a mix of the two.

Your first year of budgeting estimates won't be perfect, and you may be surprised at how much or little you spend on certain categories. But doing this will help you get a realistic idea of where your money is going. You can make adjustments in your second year to create a more accurate budget based upon what you spend in year one.

In Column B (**Monthly Estimate**) of the **Budget** tab, enter your anticipated _monthly_ income and expenses for each category (an exception is the **Charity** row, which is automatically calculated as a percentage of your income). For _annual_ expenses and income (e.g., taxes, insurance, tuition, etc.), enter them in Column P (**Yearly Estimate**).

#### Calculating the annual cost of monthly expenses

Most expenses occur monthly. To find the yearly cost of a monthly expense, multiply your monthly estimate by 12. You could do this manually for each category, but it is much easier to use formulas.

Formulas are automated calculations that determine the value of a cell. Formulas do all the heavy lifting, so you don't have to do a lot of sums in your head.

In the template, you can use the **Yearly Estimate** column to make an equation to annualize a monthly expense or income. In a cell in Column P, type this:


```
`=SUM(x*12)`
```

but change _x_ to the name of the **Monthly Estimate** cell you want to use. (For example, to calculate the annual cost of your phone service using the template, the formula would read **=SUM(B12*13)**.)

#### Calculating the monthly cost of yearly expenses

You may pay some expenses, such as car insurance, only once a year. You can either ignore these expenses in the monthly estimates or put money aside for them in your budget each month.

If you want to do the latter, you need to divide your **Yearly Estimate** by 12 and put that amount into your monthly budget. To do so, place this equation in the appropriate cell in the **Monthly Estimate** column:


```
`=SUM(x/12)`
```

where _x_ is the corresponding **Yearly Estimate** cell on your spreadsheet (from Column P).

#### Finding percentages

If you want to donate or save a percentage of your income, there's a function for that, too!

The common recommendation is to put aside 20% of your take-home pay for savings. While I don't focus on this too much, I do find it helpful to see if I'm meeting my savings goals from month to month.

For instance, Row 32 of the **Budget** tab template uses this formula to calculate the 20% of your income that you should allocate to savings:


```
`=SUM(B2*0.2)`
```

This same method can be used if you give a percentage (e.g., 10%) of your income to charity (Row 21 of the template):


```
`=SUM(B2*-0.1)`
```

This formula uses a negative percentage because donating to charity is an expense.

### Entering monthly income and expenses

The template pulls data totals from the **Monthly** sheets (the tabs at the bottom of the spreadsheet) to populate Columns C through N on the **Budget** sheet.

It's useful to place each month's transactions on separate sheets of your budget spreadsheet. By keeping your receipts from purchases and entering them into each month's sheet, you create a digital record of your money.

Enter income as positive numbers and expenses as negative numbers. Select the appropriate category using the drop-down in the **Category** column.

In LibreOffice, the **SUMIF** function can look at values in a specific column and extract only the ones that occur next to a specific word. My template uses a **SUMIF** formula to extract values based on the adjacent category in order to enter an amount in the correct cell on the **Budget** tab. For example, to enter January's internet expenses into the **Budget** spreadsheet, enter this formula in cell C12:


```
`=SUMIF(january.$C:$C,A12,january.$D:$D)`
```

This looks at January's Column C and, if it sees an entry that contains the word in A12 on the **Budget** tab (Internet), then it extracts the number from Column D on the **January** tab and enters that value into the cell that contains the formula on the **Budget** tab (C12).

### Analyzing your budget data

#### Adding a range of numbers to calculate YTD spending

To see how much you have spent overall this year to date (YTD), select the cell where you want to display that data (in the template, it's cell O29, under the **YTD** column), and enter the following formula to total the range of numbers corresponding to your monthly **Total Expense**:


```
`=SUM(x:y)`
```

Instead of _x_ and _y_, enter the first cell and the last cell in the range. You can type them in manually, but it's easier and less error-prone to just click and drag from the first to last cell. LibreOffice does the calculation and enters the appropriate values.

#### Seeing how you're doing on your budget

A big part of budgeting is comparing your estimates to your actual income and expenses. In the template, this is the **Budget** tab's Column Q. This column subtracts the contents of each cell in Column O (**YTD**) from Column P (**Yearly Estimate**). 


```
`=SUM(x-y)`
```

where _x_ and _y_ equal the corresponding cells from Column P and O. For example, using the template to calculate how much you've spent on Utilities compared to your budget, you would enter **=SUM(P11-O11)**.

![Budget overview][5]

### Tracking expenses

Now that your yearly budget is set up, you are ready to start meeting your financial goals.

It's important to look at your budget often—and it's equally important to do so without guilt. Think of this process as gathering data so that you can adjust your estimates for the next year. The primary goal of budgeting is to understand your own spending habits and refine either your expectations or your behavior so that you can plan better for how your income is used.

Which open source tools and apps do you use to budget? Tell us in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/libreoffice-open-source-budget

作者：[Jess Weichler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cyanide-cupcake
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calculator_money_currency_financial_tool.jpg?itok=2QMa1y8c (scientific calculator)
[2]: https://www.libreoffice.org/download/download/
[3]: https://opensource.com/sites/default/files/uploads/budget_template_0.ods
[4]: https://opensource.com/sites/default/files/uploads/imagebudget_cat.png (Budget categories)
[5]: https://opensource.com/sites/default/files/uploads/imagebudget_overview.png (Budget overview)
