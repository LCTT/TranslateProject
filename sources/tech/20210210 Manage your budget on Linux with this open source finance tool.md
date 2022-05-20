[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage your budget on Linux with this open source finance tool)
[#]: via: (https://opensource.com/article/21/2/linux-skrooge)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Manage your budget on Linux with this open source finance tool
======
Make managing your finances easier with Skrooge, an open source
budgeting tool.
![2 cents penny money currency][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. This article is about personal financial management.

Personal finances can be difficult to manage. It can be frustrating and even scary when you don't have enough money to get by without financial assistance, and it can be surprisingly overwhelming when you do have the money you need but no clear notion of where it all goes each month. To make matters worse, we're often told to "make a budget" as if declaring the amount of money you can spend each month will somehow manifest the money you need. The bottom line is that making a budget is hard, and not meeting your financial goals is discouraging. But it's still important, and Linux has several tools that can help make the task manageable.

### Money management

As with anything else in life, we all have our own ways of keeping track of our money. I used to take a simple and direct approach: My paycheck was deposited into an account, and I'd withdraw some percentage in cash. Once the cash was gone from my wallet, I had to wait until the next payday to spend anything. It only took one day of missing out on lunch to learn that I had to take my goals seriously, and I adjusted my spending behavior accordingly. For the simple lifestyle I had at the time, it was an effective means of keeping myself honest with my income, but it didn't translate well to online business transactions, long-term utility contracts, investments, and so on.

As I continue to refine the way I track my finances, I've learned that personal accounting is always an evolving process. We each have unique financial circumstances, which inform what kind of solution we can or should use to track our income and debt. If you're out of work, then your budgeting goal is likely to spend as little as possible. If you're working but paying off a student loan, then your goal probably favors sending money to the bank. And if you're working but planning for retirement, then you're probably trying to save as much as you can.

The thing to remember about a budget is that it's meant to compare your financial reality with your financial _goals_. You can't avoid some expenses, but after those, you get to set your own priorities. If you don't hit your goals, you can adjust your own behavior or rewrite your goals so that they better reflect reality. Adapting your financial plan doesn't mean you've failed. It just means that your initial projection wasn't accurate. During hard times, you may not be able to hit any budget goals, but if you keep up with your budget, you'll learn a lot about what it takes financially to maintain your current lifestyle (whatever it may be). Over time, you can learn to adjust settings you may never have realized were available to you. For instance, people are moving to rural towns for the lower cost of living now that remote work is a widely accepted option. It's pretty stunning to see how such a lifestyle shift can alter your budget reports.

The point is that budgeting is an often undervalued activity, and in no small part because it's daunting. It's important to realize that you can budget, no matter your level of expertise or interest in finances. Whether you [just use a LibreOffice spreadsheet][2], or try a dedicated financial application, you can set goals, track your own behavior, and learn a lot of valuable lessons that could eventually pay dividends.

### Open source accounting

There are several dedicated [personal finance applications for Linux][3], including [HomeBank][4], [Money Manager EX][5], [GNUCash][6], [KMyMoney][7], and [Skrooge][8]. All of these applications are essentially ledgers, a place you can retreat to at the end of each month (or whenever you look at your accounts), import data from your bank, and review how your expenditures align with whatever budget you've set for yourself.

![Skrooge interface with financial data displayed][9]

Skrooge

I use Skrooge as my personal budget tracker. It's an easy application to set up, even with multiple bank accounts. Skrooge, as with most open source finance apps, can import multiple file formats, so my workflow goes something like this:

  1. Log in to my banks.
  2. Export the month's bank statement as QIF files.
  3. Open Skrooge.
  4. Import the QIF files. Each gets assigned to their appropriate accounts automatically.
  5. Review my expenditures compared to the budget goals I've set for myself. If I've gone over, then I dock next month's goals (so that I'll ideally spend less to make up the difference). If I've come in under my goal, then I move the excess to December's budget (so I'll have more to spend at the end of the year).



I only track a subset of the household budget in Skrooge. Skrooge makes that process easy through a dynamic database that allows me to categorize multiple transactions at once with custom tags. This makes it easy for me to extract my personal expenditures from general household and utility expenses, and I can leverage these categories when reviewing the autogenerated reports Skrooge provides.

![Skrooge budget pie chart][10]

Skrooge budget pie chart

Most importantly, the popular Linux financial apps allow me to manage my budget the way that works best for me. For instance, my partner prefers to use a LibreOffice spreadsheet, but with very little effort, I can extract a CSV file from the household budget, import it into Skrooge, and use an updated set of data. There's no lock-in, no incompatibility. The system is flexible and agile, allowing us to adapt our budget and our method of tracking expenses as we learn more about effective budgeting and about what life has in store.

### Open choice

Money markets worldwide differ, and the way we each interact with them also defines what tools we can use. Ultimately, your choice of what to use for your finances is a decision you must make based on your own requirements. And one thing open source does particularly well is provide its users the freedom of choice.

When setting my own financial goals, I appreciate that I can use whatever application fits in best with my style of personal computing. I get to retain control of how I process the data in my life, even when it's data I don't necessarily enjoy having to process. Linux and its amazing set of applications make it just a little less of a chore.

Try some financial apps on Linux and see if you can inspire yourself to set some goals and save money!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-skrooge

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/Medical%20Costs%20Transparency_1.jpg?itok=CkZ_J88m (2 cents penny money currency)
[2]: https://opensource.com/article/20/3/libreoffice-templates
[3]: https://opensource.com/life/17/10/personal-finance-tools-linux
[4]: http://homebank.free.fr/en/index.php
[5]: https://www.moneymanagerex.org/download
[6]: https://opensource.com/article/20/2/gnucash
[7]: https://kmymoney.org/download.html
[8]: https://apps.kde.org/en/skrooge
[9]: https://opensource.com/sites/default/files/skrooge.jpg
[10]: https://opensource.com/sites/default/files/skrooge-pie_0.jpg
