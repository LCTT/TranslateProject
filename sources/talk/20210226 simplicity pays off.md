[#]: subject: "simplicity pays off"
[#]: via: "https://jao.io/blog/2021-02-26-simplicity-pays-off.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

simplicity pays off
======

i've been using [Bastian Bechtold][1]'s [org-static-blog][2] for this blog for more than a year now. Back in the day, i [mentioned][3] how well it integrated with my emacs workflow and how its simplicity was a big asset[1][4].

During this year, i've contributed several little features to the package, and it's always been an easy and natural process. The last instance has been prompted by [Sacha Chua][5] asking me whether an emacs-specifc RSS feed was available, in order to add this blog to [Planet Emacslife][6].

Turns out it _wasn't_ available: `org-static-blog` did know how to use tags, but didn't generate per-tag RSS feeds. Until yesterday. It was a question of half an hour and [a little PR][7] to add that functionality. If you check the changeset, you'll see that most of its 62 additions and 24 deletions are just a bit of refactoring that make adding the feature almost trivial.

It was just another example of something i experience almost everyday in this Emacs life, namely, how easy and direct it is to mold the computer environment to fulfil new requirements, sometimes in idiosyncratic ways no external package is going to implement for you, and some other times (as in this case) in ways you can share with the community. The result is an environment almost exquisitely adapted to your needs, and it think that it is precisely this rooting in direct, day-to-day user needs that, at the same time, makes individual hacks so rich and useful to everyone else. That, and the fact that adapting an external package to your liking is so often just a couple lines of elisp away.

I hope i did it right, and you all Emacslife followers can see me waving hello, and this big _thank you, Sacha!_ :)

### Footnotes:

[1][8]

Inevitably, i've been tweaking my configuration since then: you can see it, as a literate org file, in my emacs configuration repo [here][9].

[Tags][10]: [emacs][11]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2021-02-26-simplicity-pays-off.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://bastibe.de/
[2]: https://github.com/bastibe/org-static-blog
[3]: https://jao.io/blog/2020-02-11-simplicity.html
[4]: tmp.W13VWkPNzh#fn.1
[5]: https://sachachua.com/blog/
[6]: https://planet.emacslife.com/
[7]: https://github.com/bastibe/org-static-blog/pull/92
[8]: tmp.W13VWkPNzh#fnr.1
[9]: https://codeberg.org/jao/elibs/src/branch/main/blog.org
[10]: https://jao.io/blog/tags.html
[11]: https://jao.io/blog/tag-emacs.html
