Using Ledger for YNAB-like envelope budgeting
======
### Bye bye Elbank

I have to start this post with this: I will not be actively maintaining [Elbank][1] anymore, simply because I switched back to [Ledger][2]. If someone wants to take over, please contact me!

The main reason for switching is budgeting. While Elbank was a cool experiment, it is not an accounting software, and inherently lacks support for powerful budgeting.

When I started working on Elbank as a replacement for Ledger, I was looking for a reporting tool within Emacs that would fetch bank transactions automatically, so I wouldn’t have to enter transactions by hand (this is a seriously tedious task, and I grew tired of doing it after roughly two years, and finally gave up).

Since then, I learned about ledger-autosync and boobank, which I use to sync my bank statements with Ledger (more about that in another post).

### YNAB’s way of budgeting

I only came across [YNAB][3] recently. While I won’t use their software (being a non-free web application, and, you know… there’s no `M-x ynab`), I think that the principles behind it are really appealing for personal budgeting. I encourage you to [read more about it][4] (or grab a [copy of the book][5], it’s great), but here’s the idea.

  1. **Budget every euro** : Quite simple once you get it. Every single Euro you have should be in a budget envelope. You should assign a job to every Euro you earn (that’s called [zero-based][6], [envelope system][7]).

  2. **Embrace your true expenses** : Plan for larger and less frequent expenses, so when a yearly bill arrives, or your car breaks down, you’ll be covered.

  3. **Roll with the punches** : Address overspending as it happens by taking money overspent from another envelope. As long as you keep budgeting, you’re succeeding.

  4. **Age your money** : Spend less than you earn, so your money stays in the bank account longer. As you do that, the age of your money will grow, and once you reach the goal of spending money that is at least one month old, you won’t worry about that next bill.




### Implementation in Ledger

I assume that you are familiar with Ledger, but if not I recommend reading its great [introduction][8] and [tutorial][9].

The implementation in Ledger uses plain double-entry accounting. I took most of it from [Sacha][10], with some minor differences.

#### Budgeting new money

After each income transaction, I budget the new money:
```
2018-06-12 Employer
 Assets:Bank:Checking 1600.00 EUR
 Income:Salary -1600.00 EUR

2018-06-12 Budget
 [Assets:Budget:Food] 400.00 EUR
 [Assets:Budget:Rent] 600.00 EUR
 [Assets:Budget:Utilities] 600.00 EUR
 [Equity:Budget] -1600.00 EUR

```

Did you notice the square brackets around the accounts of the budget transaction? It’s a feature Ledger calls [virtual postings][11]. These postings are not considered real, and won’t be present in any report that uses the `--real` flag. This is exactly what we want, since it’s a budget allocation and not a “real” transaction. Therefore we’ll use the `--real` flag for all reports except for our budget report.

#### Automatically crediting budget accounts when spending money

Next, we need to credit the budget accounts each time we spend money. Ledger has another neat feature called [automated transactions][12] for this:
```
= /Expenses/
 [Assets:Budget:Unbudgeted] -1.0
 [Equity:Budget] 1.0

= /Expenses:Food/
 [Assets:Budget:Food] -1.0
 [Assets:Budget:Unbudgeted] 1.0

= /Expenses:Rent/
 [Assets:Budget:Rent] -1.0
 [Assets:Budget:Unbudgeted] 1.0

= /Expenses:Utilities/
 [Assets:Budget:Utilities] -1.0
 [Assets:Budget:Unbudgeted] 1.0

```

Every expense is taken out of the `Assets:Budget:Unbudgeted` account by default.

This forces me to budget properly, as `Assets:Budget:Unbudgeted` should always be 0 (if it is not the case I immediately know that there is something wrong going on).

All other automatic transactions take money out of the `Assets:Budget:Unbudgeted` account instead of `Equity:Budget` account.

#### A Budget report

This is the final piece of the puzzle. Here’s the budget report command:
```
ledger --empty -S -T -f ledger.dat bal ^assets:budget

```

If we have the following transactions:
```
2018/06/12 Groceries store
 Expenses:Food 123.00 EUR
 Assets:Bank:Checking

2018/06/12 Landlord
 Expenses:Rent 600.00 EUR
 Assets:Bank:Checking

2018/06/12 Internet provider
 Expenses:Utilities:Internet 40.00 EUR
 Assets:Bank:Checking

```

Here’s what the report looks like:
```
 837.00 EUR Assets:Budget
 560.00 EUR Utilities
 277.00 EUR Food
 0 Rent
 0 Unbudgeted
--------------------
 837.00 EUR

```

### Conclusion

Ledger is amazingly powerful, and provides a great framework for YNAB-like budgeting. In a future post I’ll explain how I automatically import my bank transactions using a mix of `ledger-autosync` and `weboob`.

--------------------------------------------------------------------------------

via: https://emacs.cafe/ledger/emacs/ynab/budgeting/2018/06/12/elbank-ynab.html

作者：[Nicolas Petton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://emacs.cafe/l
[1]:https://github.com/NicolasPetton/elbank
[2]:https://www.ledger-cli.org/
[3]:https://ynab.com
[4]:https://www.youneedabudget.com/method/
[5]:https://www.youneedabudget.com/book-order-now/
[6]:https://en.wikipedia.org/wiki/Zero-based_budgeting
[7]:https://en.wikipedia.org/wiki/Envelope_system
[8]:https://www.ledger-cli.org/3.0/doc/ledger3.html#Introduction-to-Ledger
[9]:https://www.ledger-cli.org/3.0/doc/ledger3.html#Ledger-Tutorial
[10]:http://sachachua.com/blog/2014/11/keeping-financial-score-ledger/
[11]:https://www.ledger-cli.org/3.0/doc/ledger3.html#Virtual-postings
[12]:https://www.ledger-cli.org/3.0/doc/ledger3.html#Automated-Transactions
