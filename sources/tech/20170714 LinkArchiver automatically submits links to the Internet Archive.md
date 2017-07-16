LinkArchiver automatically submits links to the Internet Archive
============================================================

### Links shared on Twitter can be preserved in perpetuity with no effort on the user's part.

 
![LinkArchiver automatically submits links to the Internet Archive](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/internet_archive_building_sanfran.jpg?itok=pm9eVwbC "LinkArchiver automatically submits links to the Internet Archive")
Image credits : 

Internet Archive HQ by Beatrice Murch; CC BY ([on Flickr][3])

The internet is forever, except when it isn't. "Link rot"—where once-valid links to websites become broken over time as pages move or sites go offline—is a real problem for people who try to do research online. The [Internet Archive ][4]helps solve this problem by making submitted content available in the "Wayback Machine."

The difficulty, of course, is getting people to remember to submit links for archival.

This is where Parker Higgins's new Twitter bot comes in. The [@LinkArchiver][5] account automatically submits links from accounts it follows to the Internet Archive. If a Twitter user follows [@LinkArchiver][6], it will follow back and continue to add links even if the user unfollows the bot. This means links shared on Twitter can be preserved in perpetuity with no effort on the user's part.

The low-effort aspect is very appealing to Higgins. "I'm most excited by how passive the whole set-up is," he told Opensource.com. "If you rely on people to pick and choose what is  _important_  to archive, you miss a lot of the most important stuff. By just grabbing a copy of every link as it's posted, this bot should help ensure we don't end up missing that context."

After initially developing the bot, Higgins contacted the Internet Archive. His concerns that the automation would cause problems were quickly dispelled. "It's effectively a rounding error in terms of the traffic they handle," he says, though he did give API requests a custom user-agent string at their request. The scalability concerns are on the Twitter side: The service limits an account's number of followers and the rate of new followers. This constrains the abilities on a single instance of LinkArchiver.

Fortunately, LinkArchiver is available on [GitHub][7] under the AGPLv3 license.

With a small server and a Twitter account, anyone can run this bot. Higgins envisions people running LinkArchiver instances that focus on a particular interest or social circle. "One thing that occurs to me is that you could turn off the follow-back behavior and curate the following list to a specific group or interest. For example, one bot could follow a group of friends or classmates, or major media outlets, or every U.S. Senator and Representative and archive the links they tweet."

This is not Higgins's first foray into Twitter bots: [@securethenews][8], [@pomological][9], and the ever-popular [@choochoobot][10] are among his previous work. These bots are all write-only. LinkArchiver is the first interactive bot he has developed, which required learning several new skills. This effort was done as part of Higgins' participation in [Recurse Center][11], a 12-week retreat of sorts for programmers.

Higgins encourages pull requests and additional instances of LinkArchiver bots.

--------------------------------------------------------------------------------

作者简介：

Ben Cotton - Ben Cotton is a meteorologist by training and a high-performance computing engineer by trade. Ben works as a technical evangelist at Cycle Computing. He is a Fedora user and contributor, co-founded a local open source meetup group, and is a member of the Open Source Initiative and a supporter of Software Freedom Conservancy. 

via: https://opensource.com/article/17/7/linkarchiver-automatically-submits-links-internet-archive

作者：[Ben Cotton ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://opensource.com/article/17/7/linkarchiver-automatically-submits-links-internet-archive?rate=Z9DDX962B5JWk6LID_iia3S7H9s7ZMF8cGTVlNLvCs8
[2]:https://opensource.com/user/30131/feed
[3]:https://www.flickr.com/photos/blmurch/5079018246/
[4]:https://archive.org/
[5]:https://twitter.com/linkarchiver
[6]:https://twitter.com/linkarchiver
[7]:https://github.com/thisisparker/linkarchiver
[8]:https://twitter.com/securethenews
[9]:https://twitter.com/pomological
[10]:https://twitter.com/choochoobot
[11]:https://www.recurse.com/
[12]:https://opensource.com/users/bcotton
[13]:https://opensource.com/users/bcotton
