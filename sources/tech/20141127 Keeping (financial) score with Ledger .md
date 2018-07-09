translating---geekpi

Keeping (financial) score with Ledger –
======
I’ve used [Ledger CLI][1] to keep track of my finances since 2005, when I moved to Canada. I like the plain-text approach, and its support for virtual envelopes means that I can reconcile both my bank account balances and my virtual allocations to different categories. Here’s how we use those virtual envelopes to manage our finances separately.

Every month, I have an entry that moves things from my buffer of living expenses to various categories, including an allocation for household expenses. W- doesn’t ask for a lot, so I take care to be frugal with the difference between that and the cost of, say, living on my own. The way we handle it is that I cover a fixed amount, and this is credited by whatever I pay for groceries. Since our grocery total is usually less than the amount I budget for household expenses, any difference just stays on the tab. I used to write him cheques to even it out, but lately I just pay for the occasional additional large expense.

Here’s a sample envelope allocation:
```
2014.10.01 * Budget
 [Envelopes:Living]
 [Envelopes:Household] $500
 ;; More lines go here

```

Here’s one of the envelope rules set up. This one encourages me to classify expenses properly. All expenses are taken out of my “Play” envelope.
```
= /^Expenses/
 (Envelopes:Play) -1.0

```

This one reimburses the “Play” envelope for household expenses, moving the amount from the “Household” envelope into the “Play” one.
```
= /^Expenses:House$/
 (Envelopes:Play) 1.0
 (Envelopes:Household) -1.0

```

I have a regular set of expenses that simulate the household expenses coming out of my budget. For example, here’s the one for October.
```
2014.10.1 * House
 Expenses:House
 Assets:Household $-500

```

And this is what a grocery transaction looks like:
```
2014.09.28 * No Frills
 Assets:Household:Groceries $70.45
 Liabilities:MBNA:September $-70.45

```

Then `ledger bal Assets:Household` will tell me if I owe him money (negative balance) or not. If I pay for something large (ex: plane tickets, plumbing), the regular household expense budget gradually reduces that balance.

I picked up the trick of adding a month label to my credit card transactions from W-, who also uses Ledger to track his transactions. It lets me doublecheck the balance of a statement and see if the previous statement has been properly cleared.

It’s a bit of a weird use of the assets category, but it works out for me mentally.

Using Ledger to track it in this way lets me keep track of our grocery expenses and the difference between what I’ve actually paid and what I’ve budgeted for. If I end up spending more than I expected, I can move virtual money from more discretionary envelopes, so my budget always stays balanced.

Ledger’s a powerful tool. Pretty geeky, but maybe more descriptions of workflow might help people who are figuring things out!

More posts about: [finance][2] Tags: [ledger][3] | [See in index][4] // **[5 Comments »][5]**

--------------------------------------------------------------------------------

via: http://sachachua.com/blog/2014/11/keeping-financial-score-ledger/

作者：[Sacha Chua][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://sachachua.com
[1]:http://www.ledger-cli.org/
[2]:http://sachachua.com/blog/category/finance/
[3]:http://sachachua.com/blog/tag/ledger/
[4]:http://pages.sachachua.com/sharing/blog.html?url=http://sachachua.com/blog/2014/11/keeping-financial-score-ledger/
[5]:http://sachachua.com/blog/2014/11/keeping-financial-score-ledger/#comments
