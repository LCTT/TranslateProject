[#]: subject: "relaying mail to multiple smarthosts with opensmtpd"
[#]: via: "https://jao.io/blog/2021-11-09-relaying-mail-to-multiple-smarthosts.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

relaying mail to multiple smarthosts with opensmtpd
======

I like to use a local smtp daemon for sending email from my laptop, because that way i can send emails even while disconnected and, even when the network is up, because i don't have to wait for the network protocol to be completed with a remote smarthost. Oh, and i also need local mail delivery.

For many years i've used postfix to those ends; it has an acceptably simply-ish configuration; but recently i've become fond of VPNs ([mullvad][1], if you want to know), and was annoyed by its getting confused when `/etc/resolv.conf` changes (for instance, because you get the VPN up after postfix's service has started). I've found a pleasantly simple alternative: [OpenSMTPD][2].

Say i want to use the SMTP server fencepost.gnu.org when sending an email as [jao@gnu.org][3] and smtp.jao.io when writing with [mail@jao.io][4] or [news@xmobar.org][5] in my `From` header. OpenSMTPD let's you do that with a very simple configuration file in `/etc/smtpd.conf`[1][6]:

```

    table aliases file:/etc/aliases
    table secrets db:/etc/mail/secrets.db

    table sendergnu { jao@gnu.org }
    table senderjao { mail@jao.io, news@xmobar.org }

    listen on localhost

    action "local" mbox alias <aliases>
    action "relaygnu" relay host smtp+tls://gnu@fencepost.gnu.org:587 auth <secrets>
    action "relayjao" relay host smtps://jao@smtp.jao.io:465 auth <secrets>

    match for local action "local"
    match for any from mail-from <sendergnu> action "relaygnu"
    match for any from mail-from <senderjao> action "relaygan"

```

where we have also configured local delivery for a good measure. That's the full configuration file! The only other thing needed is generating the `secrets.db` file with the users and passwords corresponding to the keys `gnu` and `jao` (those are just arbitrary names). To that end, we create a plain text file with them, using entries of the form `<key> <user>:<password>`:

```

    gnu  jao:my fencepost password
    jao  mail@jao.io:xxxxxxxxxxxxxxxxx

```

where my user for `fencepost.gnu.org` is `jao` and for `smtp.jao.io` is `mail@jao.io` (you see there's no need of escaping spaces or ats). Then we use the program `makemap` to create the secrets db:

```

    makemap secrets && rm secrets

```

### Footnotes:

[1][7]

That's the default configuration file in my debian box; other popular alternative is `/etc/openstmpd.conf`.

[Tags][8]: [sundry][9]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2021-11-09-relaying-mail-to-multiple-smarthosts.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Mullvad
[2]: https://www.opensmtpd.org/
[3]: mailto:jao@gnu.org
[4]: mailto:mail@jao.io
[5]: mailto:news@xmobar.org
[6]: tmp.zHAc8OxDnm#fn.1
[7]: tmp.zHAc8OxDnm#fnr.1
[8]: https://jao.io/blog/tags.html
[9]: https://jao.io/blog/tag-sundry.html
