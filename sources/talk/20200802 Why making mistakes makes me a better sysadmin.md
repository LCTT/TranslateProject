[#]: collector: (lujun9972)
[#]: translator: (Starryi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why making mistakes makes me a better sysadmin)
[#]: via: (https://opensource.com/article/20/8/sysadmin-mistakes)
[#]: author: (Ben Cotton https://opensource.com/users/bcotton)

Why making mistakes makes me a better sysadmin
======
The trick is to not make the same mistake twice.
![failure sign at a party, celebrating failure][1]

I've been a [Fedora][2] Linux contributor for a little over a decade now. Fedora has a large community of developers and users, each with a unique set of skills ranging from being a particularly discerning user to being an amazing programmer. I like this because it inspires and motivates me to develop new skills of my own.

For me, the best way to develop skills has always been to make mistakes. Like, really mess things up. It doesn't really matter what kind of mistake it is because it's less about the mistake itself and more about what I learn in the process of having to dig myself out of whatever hole I managed to get myself into.

### Why mistakes are good

I remember my first computer mistake. My family's first computer was an Epson laptop that my uncle gave us when he upgraded. It had a blazing fast 10 MHz processor and a carrying handle because it was so heavy. I loved that machine.

It ran DOS, but it had a text-based menu application to make it a little friendlier for the novice user. Hard Disk Menu had ten "pages," each of which could have ten commands configured. We had a page for games, another for "boring stuff" like word processors and spreadsheets, etc.

Hard Disk Menu had some other features that, when I got bored of playing the games, I would explore. At some point, I decided that I should make use of the account feature. It didn't change what applications appeared, but it would prevent unauthorized access, sort of. You could just drop to the DOS shell instead, but still, it was a nice try.

I created accounts for myself, my parents, and my sisters. My parents were a little annoyed, but they humored me. Everything was fine for a while. Then my sister forgot her password. My parents told me to remove the passwords. But without my sister's password, I couldn't remove the password on her account (it was the early 90s, a much simpler time). What to do? What to do?

For a little while, we kept going with the attempted passwords until one day when I decided I'd try something I hadn't done yet. When I was first creating the accounts, I set a master password. What would happen if I typed the master password in place of my sister's password?

If you're thinking, "of course that didn't work," then you're clearly not familiar with the naivete of security policies back in the 90s. With the master password (it was "worf," by the way, a reference to the USS Enterprise-D's Klingon security chief, for those of you who may not be Star Trek: TNG fans) in hand, I was able to remove all of the passwords. Everyone in the family could use the computer without hassle again.

### The importance of a dry-run

Since then, I've gone on to make bigger and better mistakes. Like the time in my first sysadmin job when I was shuffling some data around to reconfigure a storage array. At one point, I accidentally got the source and destination paths backward. Of course, it was an rsync with the `--delete` flag. Whoops!

Thankfully, my own account was among those that went "poof." That helped the apology go down a little easier with the rest of the affected users. Even better for us all, we had backups, so by the end of the day, everyone had their files back. And I learned a valuable lesson about using the `--dry-run` flag before running a destructive sync.

### Dealing with mistakes the right way

I don't mind making mistakes. I've amassed a LOT of practice over the years. The trick, I've learned, is never to make the same mistake twice. Learning from my mistakes is what has allowed me to advance in my skills and career, and find new mistakes to make. As a Linux sysadmin, I've always tried to make my mistakes in a safe environment (test platforms are great), make sure that I recover from my mistakes (backups FTW!), and to leave a note for Future Ben, so he didn't repeat my mistakes (documentation is your friend). And of course, admitting my mistakes and clearly communicating to my users when things go wrong. If I keep this up, maybe one day I'll feel like I know what I'm doing!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/sysadmin-mistakes

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_failure_celebrate.png?itok=LbvDAEZF (failure sign at a party, celebrating failure)
[2]: http://getfedora.org
