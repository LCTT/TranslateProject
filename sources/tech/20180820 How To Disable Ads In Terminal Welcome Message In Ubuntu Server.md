How To Disable Ads In Terminal Welcome Message In Ubuntu Server
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/disable-ads-in-Terminal-welcome-message-in-Ubuntu-720x340.jpg)

If you’re using any latest Ubuntu server edition, you might have noticed some promotional links in welcome message which are not relevant to Ubuntu server platform. As you might already know **MOTD** , abbreviation of **M** essage **O** f **T** he **D** ay, displays a welcome message at every login in Linux systems. Usually, the welcome message contains the version of your OS, basic system information, official documentation link, and the links to read about the latest security updates etc. This is what we usually see at every time we login either via SSH or on the local machine. However, there some additional links started to appear in the terminal welcome message lately. I have already noticed this link few times, but I didn’t care about it and never clicked it though. Here is the Terminal welcome message shown in my Ubuntu 18.04 LTS server.

![](http://www.ostechnix.com/wp-content/uploads/2018/08/Ubuntu-Terminal-welcome-message.png)

As you can see in the above screenshot, there is also a bit.ly link and Ubuntu wiki link in the welcome message. Some of you may surprise and wondering what this is. There is nothing to worry about the links in the welcome message. It may look sort of ad-like, but those are not really commercial ads. The links are actually pointing to [**Ubuntu official blog**][1] and [**Ubuntu wiki**][2]. As I said earlier, one of link is not relevant and doesn’t has any details related to Ubuntu server. That’s why I called them ads in the first place.

Even though most of us won’t visit bit.ly links, but some people may visit those links out of curiosity and ended up disappointed realizing that it simply points you to an external link. You can use any URL unshortners services, such as unshorten.it, to see where they lead before visiting the actual link. Alternatively, you can just type a plus sign ( **+** ) at the end of the bit.ly link to see where they lead and some statistics about the link.

![](http://www.ostechnix.com/wp-content/uploads/2018/08/shortlink.png)

### What is MOTD and how it works?

Back in 2009, **Dustin Kirkland** from Canonical introduced the concept of MOTD in Ubuntu. It’s a flexible framework that enables the administrators or distro packages to add executable scripts in /etc/update-motd.d/* location to generate informative, interesting messages displayed at login. It was originally implemented for Landscape (a commercial service from Canonical), however other distribution maintainers found it useful and adopted this feature in their own distributions as well.

If you look in **/etc/update-motd.d/** location in your Ubuntu system, you’ll see a set of scripts. One prints the generic “welcome” banner. The next one prints 3 links showing where to find help for the OS. The other one counts and displays the number of package updates available for the local system. Another one tells you if a reboot is required and so on.

From Ubuntu 17.04 onwards, the developers have added **/etc/update-motd.d/50-motd-news** , a script to include some additional information in the welcome message. They additional information are;

  1. Important critical information, such as

ShellShock, Heartbleed etc.

  2. End-of-Life (EOL) messages, new feature availability, etc.

  3. Some fun and informative posts published in Ubuntu official blog and other news about Ubuntu.




Asynchronously, about 60 seconds after boot, a systemd timer runs “/etc/update-motd.d/50-motd-news –force” script. It sources 3 config variables defined in /etc/default/motd-news script. The default values are: ENABLED=1, URLS=”<https://motd.ubuntu.com”>, WAIT=”5″.

Here is the contents of /etc/default/motd-news file:
```
$ cat /etc/default/motd-news
# Enable/disable the dynamic MOTD news service
# This is a useful way to provide dynamic, informative
# information pertinent to the users and administrators
# of the local system
ENABLED=1

# Configure the source of dynamic MOTD news
# White space separated list of 0 to many news services
# For security reasons, these must be https
# and have a valid certificate
# Canonical runs a service at motd.ubuntu.com, and you
# can easily run one too
URLS="https://motd.ubuntu.com"

# Specify the time in seconds, you're willing to wait for
# dynamic MOTD news
# Note that news messages are fetched in the background by
# a systemd timer, so this should never block boot or login
WAIT=5

```

Good thing is MOTD is fully customizable, so you can disable it entirely (ENABLED=0), change or add scripts as per your wish, and change the wait time in seconds

If MOTD is enabled, that systemd timer job will loop over each of the URLS, trim them to 80 characters per line, and a maximum of 10 lines, and concatenate them to a cache file in /var/cache/motd-news. This systemd timer job will re-run and update the /var/cache/motd-news every 12 hours. Upon user login, the contents of /var/cache/motd-news is just printed to screen. This is how MOTD works.

Also, a custom user-agent string is included in **/etc/update-motd.d/50-motd-news** file to report information about your computer. If you look into **/etc/update-motd.d/50-motd-news** file, you will see the following code.
```
# Piece together the user agent
USER_AGENT="curl/$curl_ver $lsb $platform $cpu $uptime"

```

That means, the MOTD retriever reports your **operating system release** , **hardware platform** , **CPU type** and **uptime** to Canonical.

Hope you got the basic idea about MOTD.

Let us now get back to the topic. I don’t want this feature. How do I disable it? If the promotional links in the welcome message still bothers you and you wanted to disable them permanently, here is a quick way to disable it.

### Disable Ads In Terminal Welcome Message In Ubuntu Server

To disable these ads, edit file:
```
$ sudo vi /etc/default/motd-news

```

Find the following line and set its value as 0 (zero).
```
[...]
ENABLED=0
[...]

```

Save and close the file. Now, reboot your system and see if the welcome message stills showing the links from Ubuntu blog.

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Ubuntu-Terminal-welcome-message-1.png)

See? There are no links from Ubuntu blog and Ubuntu wiki now.

And, that’s all for now. Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-disable-ads-in-terminal-welcome-message-in-ubuntu-server/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://blog.ubuntu.com/
[2]:https://wiki.ubuntu.com/
