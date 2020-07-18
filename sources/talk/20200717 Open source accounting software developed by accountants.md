[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open source accounting software developed by accountants)
[#]: via: (https://opensource.com/article/20/7/godbledger)
[#]: author: (Sean Darcy https://opensource.com/users/sean-darcy)

Open source accounting software developed by accountants
======
GoDBledger is open source accounting software that is both intuitive and
productive.
![Person using a laptop][1]

Over the last six months, I have been working on [GoDBLedger][2], an open source accounting system that I feel addresses some of the issues that plague current accounting software solutions. Even in my first year as a graduate accountant, the software frustrated me because I have seen what good software can be like and how much it can improve your productivity.

A great example of "good software" is a software developer's [Editor/IDE][3]. Developers love their editors, and there is a huge range that is highly customizable and allows for seamless coding experience. One of the major influencing factors for the existence of great software in this area is because developers are themselves the end users—they scratch their own itches and have immediate feedback on their designs.

The relationship between developers and their editor is fascinating because the editor's job is to facilitate the efficient transfer of the developer's ideas into the codebase.

As an accountant who loves programming in my spare time, I can see parallels between the accounting industry and software development. You can imagine the general ledger (a giant list of financial transactions) as a "codebase" that accountants work with, and it is the accountant's job to navigate and edit the general ledger before compiling it into various reports that an end user consumes—financial statements and tax returns, for example. This is similar to, for instance, the way the Red Hat Enterprise Linux codebase is maintained by developers, and then released officially as RHEL and CentOS to the world.

Unfortunately, when comparing the software between the two industries, I have found that navigating and editing the general ledger is not seamless, at least not when compared to my experiences when programming. Additionally, the compilation is slow and involves a lot of human labor to achieve; it can ultimately be as difficult as editing the general ledger itself.

So, given the parallels between accountants' and programmers' processes, why hasn't the accounting industry developed software to make editing the general ledger as efficient as an IDE editing a codebase? And why is compiling a set of financial statements from the general ledger not automated as is pushing code to production?

There are two influencing factors that I have noticed.

The first is the profit motive that drives both accountants and accounting software developers. Monetization can lead to inefficiencies in software because the most efficient end user is not always the most profitable. A profit-maximizing entity can extract more value from their users by taking actions to get control of the user's data, create walled gardens, and make it difficult for the user to change their software.

Accounting software has always existed in the realm of paid software. Because it plays such an important role in a business, it has always been easy to monetize. This is great for software developers who wish to make a profit, but unfortunately, it means that open source principles have had minimal influence on the shape and design of the software.

The second influencing factor is a lack of understanding of the general ledger as a data structure. The general ledger, in simple terms, is just a way to format a database of financial transactions. This data structure was designed in the 1600s, and it worked quite well within a physical book. At that point in time, working with the general ledger meant changing written text in the book as necessary, and accountants were professionals at maintaining this database. However, when relational databases were created, the structure never really got standardized and digitalized. Software packages implemented the general ledger within their own proprietary database structures, and accountants lost their ability to directly edit the database. Instead of managing the general ledger directly, the software only allowed for accountants to have restricted access.

### The result

Before TCP/IP got standardized, companies like AOL were creating their own proprietary environments and locking users into their walled gardens. Fortunately for the internet, they fell away to a free standard communication protocol. Unfortunately, the accounting industry did not do this, and we got stuck with "America Online."

Imagine that the software industry was ruled by a few big IDE software conglomerates which have decided to maximize their profits rather than maximizing developer efficiency. Your editor no longer saves code as text; instead, it is saved as a proprietary data format. You can not copy a codebase easily into another IDE, and if you do change editors, it's probably safe to assume that the codebase saved in the previous system is lost.

This is the state of the accounting software available today.

So what can accounting software developers learn from the open source community?

Open source means you can stand on the shoulders of giants and use codebases of other projects to influence and directly assist in the growth of your own project. If you are focusing on accountants' efficiency to edit the general ledger, you can review other software and copy the parts that work and ignore the parts that don't. In my case, I have been fortunate to leverage the great codebases of other accounting software such as [GNU Cash][4] and [Ledger-CLI][5], but there is another interesting area that has a lot to contribute—the open source servers that manage cryptocurrency nodes.

Accounting has struggled with the transition from physical ledgers to computers, but thankfully the cryptocurrency community has already developed a lot of open source software for maintaining a database of transactions.

The general ledger is a data structure to record financial transactions—just like a blockchain.

### What this means

My accounting system has been heavily influenced by [Geth (Go Ethereum)][6] and [Prysmatic Labs][7]—[Prysm][7], as there are a lot of talented developers working on these projects. They have provided the base for a server that manages financial transactions. Combining this with a database schema that was heavily influenced by GNU Cash means the heavy work behind designing an accounting system has already been done.

The result is [GoDBLedger][2], with source code available on [github.com/darcys22/godbledger][8].

It is also written in Golang to leverage the already good code that exists in this area, and because Golang tends to be good for servers of this nature.

I've talked a lot about how accountants should be able to work with the general ledger as seamlessly as a programmer can work on their codebase. I truly look forward to the day when I can create and edit journal entries with the same efficiency that I navigate and edit code using my text editor of choice. GoDBLedger is my first step toward achieving this. The next steps will be toward developing this "IDE" that communicates with GoDBLedger and its underlying database. Fortunately for me, there are already a lot of good open source database projects that I'll be able to leverage for this.

### How to use GoDBLedger

GoDBLedger is usable today! You can fire up a server that maintains a database for your financial transactions, and it will look and feel familiar to anyone who has run a cryptocurrency node before.

The end goal is for it to act as the central server for receiving financial transactions and storing them in the database. It lives in the background, always running so that other systems can communicate financial data to it as needed.

![GoDBledger operational flow chart][9]

Right now, if you are comfortable with a command line and scripts that communicate to systems using RPC, then you can play with GoDBLedger and experience double-entry bookkeeping on a level lower than all other software (and only slightly above directly manipulating the SQL database).

For instance, with GoDBLedger running, you can add entries in the interactive mode of ledger-cli:


```
$ ~/godbledger/ledger_cli journal
Journal Entry Wizard
\--------------------
Enter the date (yyyy-mm-dd): 2019-06-30
Enter the Journal Descripion: Get Money Get Paid!

Line item #1
Enter the line Descripion: Income is good yo
Enter the Account: Revenue:Sales
Enter the Amount: -1000
Would you like to enter more line items? (n to stop):

Line item #2
Enter the line Descripion: Cash is better
Enter the Account: Asset:Cash
Enter the Amount: 1000
Would you like to enter more line items? (n to stop): n

&amp;{Get Money Get Paid!
 2019-06-30 00:00:00 +0000 UTC [{Revenue:Sales
 Income is good yo
 -1000/1} {Asset:Cash
 Cash is better
 1000/1}] stuff}
```

However, the same entry can be made using JSON:


```
`$ ~/godbledger/ledger_cli jsonjournal '{"Payee":"Darcy Financial","Date":"2019-06-30T00:00:00Z","AccountChanges":[{"Name":"Asset:Cash","Description":"Cash is better","Currency":"USD","Balance":"100"},{"Name":"Revenue:Sales","Description":"Income is good yo","Currency":"USD","Balance":"-100"}],"Signature":"anythingHereCurrently"}'`
```

You can view a report with the `reporter` command:


```
$ ~/godbledger/reporter trialbalance

   ACCOUNT    | BALANCE AT 20 FEBRUARY 2020
\--------------+----------------------------
Asset:Cash    |                        1000
              |
Revenue:Sales |                       -1000
              |
```

Read the [quickstart on the Github Wiki][10] for more information. I've also developed a few [example scripts using Python][11] to show how you can send transactions from your own software. Additionally, I have made an [example "trading bot"][12] that saves every trade it does to GoDBLedger.

if you're interested in a procedural system to keep tracking of your accounts, try GoDBLedger.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/godbledger

作者：[Sean Darcy][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sean-darcy
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://godbledger.com/
[3]: https://www.redhat.com/en/topics/middleware/what-is-ide
[4]: https://www.gnucash.org/
[5]: https://www.ledger-cli.org/
[6]: https://github.com/ethereum/go-ethereum
[7]: https://github.com/prysmaticlabs/prysm
[8]: https://github.com/darcys22/godbledger
[9]: https://opensource.com/sites/default/files/uploads/godbledger_flow.png (GoDBledger operational flow chart)
[10]: https://github.com/darcys22/godbledger/wiki/Quickstart
[11]: https://github.com/darcys22/godbledger-pythonclient
[12]: https://github.com/darcys22/Trading-Simulator
