[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A Tale of HTTP/2)
[#]: via: (https://veronneau.org/a-tale-of-http2.html)
[#]: author: (Louis-Philippe Véronneau https://veronneau.org/)

A Tale of HTTP/2
======

Around a month ago, someone mentioned the existence of [HTTP/2][1] in an IRC channel I lurk in. For some reason, I had never heard of it and some of the features of this new protocol (like mutiplexing requests without having to open multiple TCP connections) seemed cool.

To be honest, I had just finished re-writing the Puppet code that manages our backup procedures and enabling HTTP/2 seemed like a productive way to procrastinate before moving on to an another large project. How hard could this be?

Turns out it took me around 25 hours of work... Sit back and put on comfortable slippers, for this is a tale of HTTP/2!

[![The Yule Log][2]][3]

### Cursed Be the HTTP/1.1

When I first looked up how to enable HTTP/2 on Apache it seemed a pretty simple task. The documentation mentioned loading the `http2` module and making sure to prioritise the new protocol via a configuration file like this one:

```
Protocols h2 h2c http/1.1

H2Push on
H2PushPriority core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated after
H2PushPriority text/css before
H2PushPriority image/jpeg after 32
H2PushPriority image/png after 32
H2PushPriority application/javascript interleaved
```

This would of course have been too easy. Even if everything in Apache was set up properly, websites kept being served as HTTP/1.1. I was obviously doing something right though, since my websites were now sending a new HTTP header: `Upgrade: h2, h2c`.

After wasting a good deal of time debugging TLS ciphers (HTTP/2 is [incompatible with TLS 1.1][4]), I finally found out the problem was that we weren't using the right multi-processing module for Apache.

Turns out Apache won't let you serve HTTP/2 while using `mpm_prefork` (the default MPM), as it is not supported by `mod_http2`. Even though there are two other MPM you can use with Apache, only `mpm_prefork` supports `mod_php`. Suddenly, adding support for HTTP/2 meant switching all our webapps built in PHP to PHP-FPM...

### Down the Rabbit Hole

![A clip from Alice in Wonderlands][5]

For the longest time, a close friend has been trying to convince me of the virtues of [PHP-FPM][6]. As great as it looked on paper, I never really did anything about it. It seemed so ... complicated. Regular ol' `mod_php` did the trick just fine and other things required my attention.

This whole HTTP/2 thing turned out to be the perfect excuse for me to dive into it after all. Once I understood how FPM pools worked, it was actually pretty easy to set up. Since I had to rewrite the Puppet profiles we're using to deploy websites, also I took that opportunity to harden a bunch of things left and right.

PHP-FPM let's you run websites under different Unix users for added separation. On top of that, I decided it was time for PHP code on our servers to be ran in read-only mode and had to tweak a bunch of things for our Wordpress, Nextcloud, KanBoard and Drupal instances to stop complaining about it.

After too much time passed automating tasks in Puppet, I finally was able to turn off `mod_php` and `mpm_prefork` everywhere and to enable `mpm_event` and `mod_http2`. The speed bonus offered by PHP-FPM and HTTP/2 is nice, but more than anything I'm happy this whole ordeal forced me to harden the way our Apache servers deal with PHP.

![Victory!][7]

--------------------------------------------------------------------------------

via: https://veronneau.org/a-tale-of-http2.html

作者：[Louis-Philippe Véronneau][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://veronneau.org/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/HTTP/2
[2]: https://veronneau.org/media/blog/2018-12-22/yule_log.jpg (The Yule Log)
[3]: https://commons.wikimedia.org/wiki/File:The_Yule_Log.jpg
[4]: https://http2.github.io/http2-spec/#TLSUsage
[5]: https://veronneau.org/media/blog/2018-12-22/mod_php.gif (A clip from Alice in Wonderlands)
[6]: https://wiki.apache.org/httpd/PHP-FPM
[7]: https://veronneau.org/media/blog/2018-12-22/victory.png (Victory!)
