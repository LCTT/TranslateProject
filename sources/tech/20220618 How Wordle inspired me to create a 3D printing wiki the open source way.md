[#]: subject: "How Wordle inspired me to create a 3D printing wiki the open source way"
[#]: via: "https://opensource.com/article/22/6/3d-printing-wordle-crowdsourcing"
[#]: author: "Adam Bute https://opensource.com/users/buteadam"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How Wordle inspired me to create a 3D printing wiki the open source way
======
3D printing is a lot like a game of Wordle. I aim to solve the puzzle by creating crowdsourced documentation and databases.

![Lots of people in a crowd.][1]

Image by: Opensource.com

You decide to buy a 3D printer. You do your research, and you settle on an open system that uses resin as its material. You spend a nice chunk of money, and after a few weeks of waiting, it finally arrives.

You unbox it. It's gorgeous. You do some small assembly, pour in the liquid resin, and you're ready to go. You fire up the software. It asks you to type in the correct parameters for the material. You check the bottle but you can't see any parameters. You check online, but still can't find anything.

A bit confused, you write an email to the manufacturer, asking if they could point you in the right direction. The manufacturer tells you they also don't know the parameters, but they are pretty sure they exist, and you should try to guess them yourself. Baffled, you start wondering whether this is really what resin printing is like, or if you've been duped by this company.

### A bad game of Wordle

Unfortunately, this is really what resin printing is like. When you buy a new material, you have to do what's called resin validation. It's essentially making a guess for the parameters and adjusting the numbers based on your results. That's if your guess was decent and anything even comes out of the printer.

It's a lot like playing a game of Wordle, except none of the blocks ever turn green. All you can do is eyeball whether the print looks slightly better or worse with each iteration, and then try again. Finally, at one point you say “looks good to me,” and that's that.

![An image of Wordle][2]

If that sounds like a deeply unsatisfying game to you, you'd be correct. It's also way too long, often taking days, and wasting a good amount of resin in the process. Resin is expensive. At least Wordle is free.

### A little help from above?

So why don't these manufacturers, who know their material best, share the print parameters? Well, their arguments are somewhat reasonable. There are millions of possible combinations of printers and resins, and they can't possibly cover all of them. And even between two printers which are the same model, there can be tiny variations, which affect the numbers slightly.

But ‘slightly' is an important word. If users got a good baseline, they could easily adjust the settings if they needed to. At least it would be much quicker than starting from scratch. To be fair, some companies do give recommended settings, but it's hard to trust even these numbers. There are many crafty manufacturers who publish fake, untested settings, just to lure customers in.

The truth is that resin validation is expensive. Resin companies are almost invariably small businesses, strapped for cash, who just can't afford to spend on resin validation. So, they outsource this work to the end user. But this creates a kind of absurd situation in the resin printing world. Instead of one man at one company doing the validation work once, hundreds of people do the same work over and over again just to come to the same conclusion.

### Makers to the rescue

So what does the maker community do? They try to fix the problem themselves. Reddit and Facebook groups are full of people happily sharing screenshots of a new setting they figured out. Nice gesture, but not very useful. Some ingenious community members created live resin setting spreadsheets that are updated based on user submissions. These are fantastic resources, and universally loved, but they too have their limitations.

They are messy, rarely updated, and there's no way to tell whether the settings actually work. And because anonymous users host them, they are sometimes turned into spam, or randomly deleted. Most recently the biggest community spreadsheet was unexpectedly deleted, erasing years' worth of crowdsourced data with it.

![Image of a community spreadsheet][3]

### Making a resin setting database

I'm a bit of an egghead myself and I really enjoy organizing things. I had the idea to collect all these settings from manufacturers and communities, and put it on a nice website. I registered the domain [makertrainer.com][4] and used two awesome open source tools to build the site: [MediaWiki][5] and [DataTables][6].

![Image of Maker Trainer][7]

I made it a wiki so that anyone could contribute, but made certain spam or vandalism could be easily undone. I also added some buttons to allow users to vote on whether a setting worked or not. I posted it in some communities to see if people would find it useful, and the response has been overwhelming. I didn't realize this at the time, but I accidentally created the [biggest resin setting database on the internet][8]. Users kept spreading it on social media, blog posts, YouTube and so on. With so many people submitting new settings, the database grows larger daily.

![Image of resin settings][9]

The fact that people are so enthusiastic shows just how much of a void there is for documentation in 3D printing. There's a lot of practical experience scattered amongst makers, most of which is never written down or shared publicly. Everyone needs to do a better job recording practical knowledge in addition to theory. Otherwise, the next generation of makers will commit the same mistakes again. The database is a small contribution in this regard, but I hope it can continue to grow, and make 3D printing just a little easier for everyone.

Image by: (Adam Bute, CC BY-SA 40)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/3d-printing-wordle-crowdsourcing

作者：[Adam Bute][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/buteadam
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/BUSINESS_community_1.png
[2]: https://opensource.com/sites/default/files/2022-06/bad_wordle.png
[3]: https://opensource.com/sites/default/files/2022-06/community_spreadsheet.png
[4]: http://makertrainer.com/
[5]: https://www.mediawiki.org/wiki/MediaWiki
[6]: https://datatables.net/
[7]: https://opensource.com/sites/default/files/2022-06/Maker_Trainer.png
[8]: https://hackaday.com/2022/05/13/open-database-shares-resin-3d-printing-settings/
[9]: https://opensource.com/sites/default/files/2022-06/resin_settings_table.png
