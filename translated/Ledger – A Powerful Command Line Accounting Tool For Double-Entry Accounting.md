Ledger – A Powerful Command Line Accounting Tool For Double-Entry Accounting
==========
Whether you are a computer geek or a normal user, keeping account of expenses is always essential. While there are many popular GUI based accounting tools available for Linux (For example – [GNUCash][1]), working on a command line accounting tool is hard to imagine for most of the users. In this article, we will discuss a powerful command line accounting tool – **Ledger**.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-main.png)

**Ledger – Double-Entry Accounting Tool**

Ledger is a powerful command line tool for double-entry accounting. For those who are new to the term “Double-Entry”, it means that for every transaction there has to be a source. In a layman’s terms, this means, for every credit made into an account, there has to be a debit from an account. So, ledger keeps track of the movement of money and helps you understand your expenses.

Ledger does not have a database of its own, it relies on an expense sheet (a simple text file) maintained by the user. Though there is a particular format of the expense sheet that ledger understands.

For example, here is a sample expense sheet that I prepared :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-11.png)

A couple of points worth noting :

- All the lines under a category (For example – Shopping, Leisure or EMI) are tab indented
- Similarly, all the expense figures (including $) are also tab indented
- Being Double-Entry accounting tool, it is important to specify both credit and debit. Ledger will give error otherwise.

**A brief Tutorial**

Once the expense sheet is ready, here is how you can check the overall expenses :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-2.png)

So you can see that through **-f option**, you can specify your expense sheet name and **balance** is a ledger command that processes total payment records which are displayed categorically. Also, the debit payments are shown in RED while expenditure is shown in WHITE.

As discussed earlier, ledger requires user to enter correct debit-credit details. Here is an example of error when incorrect debit-credit relationship was mentioned in the expense sheet :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-3.png)

I just changed the shopping expense for shoes from $50 to $60 but did not change the payment figure. As you can see that ledger displayed error “**Transaction does not balance**“.

Apart from balance, you can use **register** command to display all the entries corresponding to a report-query.

For example :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/ledger-4.png)

So, you can see that in the example above -  **register** command was used with report-query shopping and all the transaction related to this category were displayed in output.

This was just a tip of an iceberg, ledger provides many other options (including report generation) that are worth trying. Visit the [man page][2] for more.

**Pros**

- A powerful and feature rich accounting tool
- Easy to use
- Coloured output.

**Cons**

- Expense file needs to be maintained separately
- Has a bit of learning curve

**Download/Install**

Here are some of the important links related to ledger command line tool :

- [Home Page][3]
- [Download][4]
- [Documentation][5]
- [A detailed review on LWN][6]


via: http://mylinuxbook.com/ledger-command-line-accounting-tool-2/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.gnucash.org/
[2]:http://www.ledger-cli.org/3.0/doc/ledger.1.html
[3]:http://www.ledger-cli.org/
[4]:http://www.ledger-cli.org/download.html
[5]:http://www.ledger-cli.org/2.6/ledger.pdf
[6]:http://lwn.net/Articles/501681/