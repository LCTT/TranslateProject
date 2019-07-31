[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage your passwords with Bitwarden and Podman)
[#]: via: (https://fedoramagazine.org/manage-your-passwords-with-bitwarden-and-podman/)
[#]: author: (Eric Gustavsson https://fedoramagazine.org/author/egustavs/)

Manage your passwords with Bitwarden and Podman
======

![][1]

You might have encountered a few advertisements the past year trying to sell you a password manager. Some examples are [LastPass][2], [1Password][3], or [Dashlane][4]. A password manager removes the burden of remembering the passwords for all your websites. No longer do you need to re-use passwords or use easy-to-remember passwords. Instead, you only need to remember one single password that can unlock all your other passwords for you.

This can make you more secure by having one strong password instead of many weak passwords. You can also sync your passwords across devices if you have a cloud-based password manager like LastPass, 1Password, or Dashlane. Unfortunately, none of these products are open source. Luckily there are open source alternatives available.

### Open source password managers

These alternatives include Bitwarden, [LessPass][5], or [KeePass][6]. Bitwarden is [an open source password manager][7] that stores all your passwords encrypted on the server, which works the same way as LastPass, 1Password, or Dashlane. LessPass is a bit different as it focuses on being a stateless password manager. This means it derives passwords based on a master password, the website, and your username rather than storing the passwords encrypted. On the other side of the spectrum there’s KeePass, a file-based password manager with a lot of flexibility with its plugins and applications.

Each of these three apps has its own downsides. Bitwarden stores everything in one place and is exposed to the web through its API and website interface. LessPass can’t store custom passwords since it’s stateless, so you need to use their derived passwords. KeePass, a file-based password manager, can’t easily sync between devices. You can utilize a cloud-storage provider together with [WebDAV][8] to get around this, but a lot of clients do not support it and you might get file conflicts if devices do not sync correctly.

This article focuses on Bitwarden.

### Running an unofficial Bitwarden implementation

There is a community implementation of the server and its API called [bitwarden_rs][9]. This implementation is fully open source as it can use SQLite or MariaDB/MySQL, instead of the proprietary Microsoft SQL Server that the official server uses.

It’s important to recognize some differences exist between the official and the unofficial version. For instance, the [official server has been audited by a third-party][10], whereas the unofficial one hasn’t. When it comes to implementations, the unofficial version lacks [email confirmation and support for two-factor authentication using Duo or email codes][11].

Let’s get started running the server with SELinux in mind. Following the documentation for bitwarden_rs you can construct a Podman command as follows:

```
$ podman run -d \
 --userns=keep-id \
 --name bitwarden \
 -e SIGNUPS_ALLOWED=false \
 -e ROCKET_PORT=8080 \
 -v /home/egustavs/Bitwarden/bw-data/:/data/:Z \
 -p 8080:8080 \
 bitwardenrs/server:latest
```

This downloads the bitwarden_rs image and runs it in a user container under the user’s namespace. It uses a port above 1024 so that non-root users can bind to it. It also changes the volume’s SELinux context with _:Z_ to prevent permission issues with read-write on _/data_.

If you host this under a domain, it’s recommended to put this server under a reverse proxy with Apache or Nginx. That way you can use port 80 and 443 which points to the container’s 8080 port without running the container as root.

### Running under systemd

With Bitwarden now running, you probably want to keep it that way. Next, create a unit file that keeps the container running, automatically restarts if it doesn’t respond, and starts running after a system restart. Create this file as _/etc/systemd/system/bitwarden.service_:

```
[Unit]
Description=Bitwarden Podman container
Wants=syslog.service

[Service]
User=egustavs
Group=egustavs
TimeoutStartSec=0
ExecStart=/usr/bin/podman run 'bitwarden'
ExecStop=-/usr/bin/podman stop -t 10 'bitwarden'
Restart=always
RestartSec=30s
KillMode=none

[Install]
WantedBy=multi-user.target
```

Now, enable and start it [using][12] _[sudo][12]_:

```
$ sudo systemctl enable bitwarden.service && sudo systemctl start bitwarden.service
$ systemctl status bitwarden.service
bitwarden.service - Bitwarden Podman container
    Loaded: loaded (/etc/systemd/system/bitwarden.service; enabled; vendor preset: disabled)
    Active: active (running) since Tue 2019-07-09 20:23:16 UTC; 1 day 14h ago
  Main PID: 14861 (podman)
     Tasks: 44 (limit: 4696)
    Memory: 463.4M
```

Success! Bitwarden is now running under system and will keep running.

### Adding LetsEncrypt

It’s strongly recommended to run your Bitwarden instance through an encrypted channel with something like LetsEncrypt if you have a domain. Certbot is a bot that creates LetsEncrypt certificates for us, and they have a [guide for doing this through Fedora][13].

After you generate a certificate, you can follow the [bitwarden_rs guide about HTTPS][14]. Just remember to append _:Z_ to the LetsEncrypt volume to handle permissions while not changing the port.

* * *

*Photo by _[_CMDR Shane_][15]_ on *[_Unsplash_][16].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manage-your-passwords-with-bitwarden-and-podman/

作者：[Eric Gustavsson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/egustavs/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/bitwarden-816x345.jpg
[2]: https://www.lastpass.com
[3]: https://1password.com/
[4]: https://www.dashlane.com/
[5]: https://lesspass.com/
[6]: https://keepass.info/
[7]: https://bitwarden.com/
[8]: https://en.wikipedia.org/wiki/WebDAV
[9]: https://github.com/dani-garcia/bitwarden_rs/
[10]: https://blog.bitwarden.com/bitwarden-completes-third-party-security-audit-c1cc81b6d33
[11]: https://github.com/dani-garcia/bitwarden_rs/wiki#missing-features
[12]: https://fedoramagazine.org/howto-use-sudo/
[13]: https://certbot.eff.org/instructions
[14]: https://github.com/dani-garcia/bitwarden_rs/wiki/Enabling-HTTPS
[15]: https://unsplash.com/@cmdrshane?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[16]: https://unsplash.com/search/photos/password?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
