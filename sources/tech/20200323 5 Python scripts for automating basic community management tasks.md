[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Python scripts for automating basic community management tasks)
[#]: via: (https://opensource.com/article/20/3/automating-community-management-python)
[#]: author: (Rich Bowen https://opensource.com/users/rbowen)

5 Python scripts for automating basic community management tasks
======
If you have to do something three times, try to automate it.
![shapes of people symbols][1]

I've [written before about what a community manager does][2], and if you ask ten community managers, you'll get 12 different answers. Mostly, though, you do what the community needs for you to do at any given moment. And a lot of it can be repetitive.

Back when I was a sysadmin, I had a rule: if I had to do something three times, I'd try to automate it. And, of course, these days, with awesome tools like Ansible, there's a whole science to that.

Some of what I do on a daily or weekly basis involves looking something up in a few places and then generating some digest or report of that information to publish elsewhere. A task like that is a perfect candidate for automation. None of this is [rocket surgery][3], but when I've shared some of these scripts with colleagues, invariably, at least one of them turns out to be useful.

[On GitHub][4], I have several scripts that I use every week. None of them are complicated, but they save me a few minutes every time. Some of them are in Perl because I'm almost 50. Some of them are in Python because a few years ago, I decided I needed to learn Python. Here's an overview:

### **[tshirts.py][5]**

This simple script takes a number of Tshirts that you're going to order for an event and tells you what the size distribution should be. It spreads them on a normal curve (also called a bell curve), and, in my experience, this coincides pretty well with what you'll actually need for a normal conference audience. You might want to adjust the script to slightly larger if you're using it in the USA, slightly smaller if you're using it in Europe. YMMV.

Usage:


```
[rbowen@sasha:community-tools/scripts]$ ./tshirts.py                                                                                                                                                          
How many shirts? 300
For a total of 300 shirts, order:

30.0 small
72.0 medium
96.0 large
72.0 xl
30.0 2xl
```

### **[followers.py][6]**

This script provides me with the follower count for Twitter handles I care about.

This script is only 14 lines long and isn't exciting, but it saves me perhaps ten minutes of loading web pages and looking for a number.

You'll need to edit the feeds array to add the accounts you care about:


```
feeds = [
        'centosproject',
        'centos'
        ];
```

NB: It probably won't work if you're running it outside of English-speaking countries, because it's just a simple screen-scraping script that reads HTML and looks for particular information buried within it. So when the output is in a different language, the regular expressions won't match.

Usage:


```
[rbowen@sasha:community-tools/scripts]$ ./followers.py                                                                                                                                                                          
centosproject: 11,479 Followers
centos: 18,155 Followers
```

### **[get_meetups][7]**

This script fits into another category—API scripts. This particular script uses the [meetup.com][8] API to look for meetups on a particular topic in a particular area and time range so that I can report them to my community. Many of the services you rely on provide an API so that your scripts can look up information without having to manually look through web pages. Learning how to use those APIs can be frustrating and time-consuming, but you'll end up with skills that will save you a LOT of time.

_Disclaimer: [meetup.com][8] changed their API in August of 2019, and I have not yet updated this script to the new API, so it doesn't actually work right now. Watch this repo for a fixed version in the coming weeks._

### **[centos-announcements.pl][9]**

This script is considerably more complicated and extremely specific to my use case, but you probably have a similar situation. This script looks at a mailing list archive—in this case, the centos-announce mailing list—and finds messages that are in a particular format, then builds a report of those messages. Reports come in a couple of different formats—one for my monthly newsletter and one for scheduling messages (via Hootsuite) for Twitter.

I use Hootsuite to schedule content for Twitter, and they have a convenient CSV (comma-separated value) format that lets you bulk-schedule a whole week of tweets in one go. Auto-generating that CSV from various data sources (i.e., mailing lists, blogs, other web pages) can save you a lot of time. Do note, however, that this should probably only be used for a first draft, which you then examine and edit yourself so that you don't end up auto-tweeting something you didn't intend to.

### **[reporting.pl][10]**

This script is also fairly specific to my particular needs, but the concept itself is universal. I send out a monthly mailing to the [CentOS SIGs][11] (Special Interest Groups), which are scheduled to report in that given month. This script simply tells me which SIGs those are this month, and writes the email that needs to go to them.

It does not actually send that email, however, for a couple of reasons. One, I may wish to edit those messages before they go out. Two, while scripts sending email worked great in the old days, these days, they're likely to result in getting spam-filtered.

### In conclusion

There are some other scripts in that repo that are more or less specific to my particular needs, but I hope at least one of them is useful to you, and that the variety of what's there inspires you to automate something of your own. I'd love to see your handy automation script repos, too; link to them in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/automating-community-management-python

作者：[Rich Bowen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rbowen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/Open%20Pharma.png?itok=GP7zqNZE (shapes of people symbols)
[2]: http://drbacchus.com/what-does-a-community-manager-do/
[3]: https://6dollarshirts.com/rocket-surgery
[4]: https://github.com/rbowen/centos-community-tools/tree/master/scripts
[5]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/tshirts.py
[6]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/followers.py
[7]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/get_meetups
[8]: http://meetup.com
[9]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/centos-announcements.pl
[10]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/sig_reporting/reporting.pl
[11]: https://wiki.centos.org/SpecialInterestGroup
