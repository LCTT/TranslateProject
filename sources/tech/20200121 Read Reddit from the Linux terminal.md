[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Read Reddit from the Linux terminal)
[#]: via: (https://opensource.com/article/20/1/open-source-reddit-client)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Read Reddit from the Linux terminal
======
Take brief mental breaks from your work with Reddit client Tuir in the
eleventh in our series on 20 ways to be more productive with open source
in 2020.
![Digital creative of a browser on the internet][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Read Reddit with Tuir

Taking short breaks is essential in staying productive. One of the places I like to go when taking a break is [Reddit][2], which can be a great resource if you want it to be. I find all kinds of articles there about DevOps, productivity, Emacs, chickens, and some ChromeOS projects I play with. These discussions can be valuable. I also follow a couple of subreddits that are just pictures of animals because I like pictures of animals (and not just chickens), and sometimes after a long work session, what I really need are kitten pictures.

![/r/emacs in Tuir][3]

When I'm reading Reddit (and not just looking at pictures of baby animals), I use [Tuir][4], which stands for Terminal UI for Reddit. Tuir is a feature-complete Reddit client and can be run on any system that runs Python. Installation is done through the pip Python installer and is exceptionally painless.

On its first run, Tuir will take you to the default article list on Reddit. The top and bottom of the screen have bars that list different commands. The top bar shows your location on Reddit, and the second line shows the commands filtered by the Reddit "Hot/New/Controversial/etc." categories. Filtering is invoked by pressing the number next to the filter you want to use.

![Filtering by Reddit's "top" category][5]

You can navigate through the list with the arrow keys, or with the **j**, **k**, **h**, and **l** keys, the same ones you use for Vi/Vim. The bottom bar has commands for navigating the app. If you want to jump to another subreddit, simply hit the **/** key to open a prompt and type the name of the subreddit you want to interact with.

![Logging in][6]

Some things aren't accessible unless you are logged in. Tuir will prompt you if you try to do something that requires logging in, like posting a new article (**c**) or up/down voting (**a** and **z**, respectively). To log in, press the **u** key. This will launch a browser to log in via OAuth2, and Tuir will save the token. Afterward, your username should appear in the top-right of the screen.

Tuir can also launch your browser to view images, load links, and so on. With a little tuning, it can even show images on the terminal (although I didn't manage to get that to work properly).

Overall, I'm pretty happy with Tuir for quickly catching up on Reddit when I need a break.

Tuir is one of two forks of the now-defunct [RTV][7]. The other is [TTRV][8], which isn't available via pip (yet) but has the same features. I'm looking forward to seeing how they differentiate themselves over time.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-reddit-client

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://www.reddit.com/
[3]: https://opensource.com/sites/default/files/uploads/productivity_11-1.png (/r/emacs in Tuir)
[4]: https://gitlab.com/ajak/tuir
[5]: https://opensource.com/sites/default/files/uploads/productivity_11-2.png (Filtering by Reddit's "top" category)
[6]: https://opensource.com/sites/default/files/uploads/productivity_11-3.png (Logging in)
[7]: https://github.com/michael-lazar/rtv
[8]: https://github.com/tildeclub/ttrv
