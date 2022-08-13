[#]: subject: "reading and searching gmane with gnus, fast"
[#]: via: "https://jao.io/blog/2021-05-17-reading-and-searching-gmane-with-gnus-fast.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

reading and searching gmane with gnus, fast
======

Reading mailing lists via Gnus by pointing it to the usenet service news.gmane.io is a well-known trick among emacsers. It has a couple of drawbacks, though: network latency and no search. The two problems have, as almost always with almost any problem in Emacs land, a cure. The names of the game are, in this case, leafnode and notmuch.

I've been using [leafnode][1] since i was young to avoid network latency issues when Gnus fetches news from remote usenet servers. [Leafnode][1] is a store &amp; forward NNTP proxy that can be used to give a regular newsreader off-line functionality. It works by fetching in the background news articles from a number of configured remote servers (gmane.io in our case), storing them locally and offering a local NNTP server to Gnus (or any other newsreader, for that matter). That way, one configures Gnus to fetch news from localhost, which is fast and will never block, even when one is disconnected from the interwebs. Leafnode's server implements the full protocol, so one can also post to the remote servers.

For our case, leafnode's configuration file is very simple:

```

    ## Unread articles will be deleted after this many days
    expire = 365

    ## This is the NNTP server leafnode fetches its news from.
    ## You need read and post access to it. Mandatory.
    server = news.gmane.io

    ## Fetch only a few articles when we subscribe a new newsgroup. The
    ## default is to fetch all articles.
    initialfetch = 100

```

With leafnode in place, i've rarely needed to subscribe to a mailing list[1][2], and all their messages are available with the Gnus interface that we all know and love.

With one caveat: one can search over e-mails, using either IMAP (i like dovecot's lucene indexes) or (even better) notmuch. Can we do the same with those messages we access through leafnode? Well, it turns out that, using notmuch, you can!

First of all, leafnode stores its articles in a format recognised by notmuch's indexer. In my debian installation, the live in the directory `/var/spool/news/gmane`. On the other hand, my notmuch configuration points to `~/var/mail` as the parent directory where my mailboxes are to be found. I just created a symlink in the latter to the former and voila, notmuch is indexing all the messages retrieved by leafnode and i can search over them![2][3]

With the version of Gnus in current emacs master, it's even better. I can tell Gnus that the search engine for the news server is notmuch:

```

    (setq gnus-select-method
          '(nntp "localhost"
                 (gnus-search-engine gnus-search-notmuch
                                     (remove-prefix "/home/jao/var/mail/"))))

```

and perform searches directly in Gnus using the notmuch indexes. Or, if you prefer, you can use directly notmuch.el to find and read those usenet articles: they look just like good old email[3][4] :)

### Footnotes:

[1][5]

Actually, gmane also includes _gwene_ groups that mirror RSS feeds as usenet messages, so you could extend the trick to feeds too. I however use [rss2email][6] to read RSS feeds as email, for a variety of reasons best left to a separate post.

[2][7]

With the `expire` parameter in leafnode's configuration set to 365, i keep locally an indexed archive of the mailing list posts less than a year old: in this age of cheap storage, one can make that much longer. One can also play with `initialfetch`.

[3][8]

I am not a mu4e user, but i am pretty sure one can play the same trick if that's your email indexer and reader.

[Tags][9]: [emacs][10]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2021-05-17-reading-and-searching-gmane-with-gnus-fast.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://leafnode.sourceforge.io/
[2]: tmp.gr7aQUOwRH#fn.1
[3]: tmp.gr7aQUOwRH#fn.2
[4]: tmp.gr7aQUOwRH#fn.3
[5]: tmp.gr7aQUOwRH#fnr.1
[6]: https://wiki.archlinux.org/title/Rss2email
[7]: tmp.gr7aQUOwRH#fnr.2
[8]: tmp.gr7aQUOwRH#fnr.3
[9]: https://jao.io/blog/tags.html
[10]: https://jao.io/blog/tag-emacs.html
