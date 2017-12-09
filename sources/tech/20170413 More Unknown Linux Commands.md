translating by ucasFL

More Unknown Linux Commands
============================================================


![unknown Linux commands](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/outer-limits-of-linux.jpg?itok=5L5xfj2v "unknown Linux commands")
>Explore the outer limits of Linux with Carla Schroder in this roundup of little-known utilities.[Creative Commons Zero][2]Pixabay

A roundup of the fun and little-known utilities `termsaver`, `pv`, and `calendar`. `termsaver` is an ASCII screensaver for the console, and `pv` measures data throughput and simulates typing. Debian's `calendar` comes with a batch of different calendars, and instructions for making your own.

![Linux commands](https://www.linux.com/sites/lcom/files/styles/floated_images/public/linux-commands-fig-1.png?itok=HveXXLLK "Linux commands")

Figure 1: Star Wars screensaver.[Used with permission][1]

### Terminal Screensaver

Why should graphical desktops have all the fun with fancy screensavers? Install `termsaver` to enjoy fancy ASCII screensavers like matrix, clock, starwars, and a couple of not-safe-for-work screens. More on the NSFW screens in a moment.

`termsaver` is included in Debian/Ubuntu, and if you're using a boring distro that doesn't package fun things (like CentOS), you can download it from [termsaver.brunobraga.net][7] and follow the simple installation instructions.

Run `termsaver -h` to see a list of screens:

```
 randtxt        displays word in random places on screen
 starwars       runs the asciimation Star Wars movie
 urlfetcher     displays url contents with typing animation
 quotes4all     displays recent quotes from quotes4all.net
 rssfeed        displays rss feed information
 matrix         displays a matrix movie alike screensaver
 clock          displays a digital clock on screen
 rfc            randomly displays RFC contents
 jokes4all      displays recent jokes from jokes4all.net (NSFW)
 asciiartfarts  displays ascii images from asciiartfarts.com (NSFW)
 programmer     displays source code in typing animation
 sysmon         displays a graphical system monitor
```

Then run your chosen screen with `termsaver [screen name]`, e.g. `termsaver matrix`, and stop it with Ctrl+c. Get information on individual screens by running `termsaver [screen name] -h`. Figure 1 is from the `starwars` screen, which runs our old favorite [Asciimation Wars][8].

The not-safe-for-work screens pull in online feeds. They're not my cup of tea, but the good news is `termsaver` is a gaggle of Python scripts, so they're easy to hack to connect to any RSS feed you desire.

### pv

The `pv` command is one of those funny little utilities that lends itself to creative uses. Its intended use is monitoring data copying progress, like when you run `rsync` or create a `tar`archive. When you run `pv` without options the defaults are:

*   -p progress.

*   -t timer, total elapsed time.

*   -e, ETA, time to completion. This is often inaccurate as `pv` cannot always know the size of the data you are moving.

*   -r, rate counter, or throughput.

*   -b, byte counter.

This is what an `rsync` transfer looks like:

```
$ rsync -av /home/carla/ /media/carla/backup/ | pv 
sending incremental file list
[...]
103GiB 0:02:48 [ 615MiB/s] [  <=>
```

Create a tar archive like this example:

```
$ tar -czf - /file/path| (pv  > backup.tgz)
 885MiB 0:00:30 [28.6MiB/s] [  <=>
```

`pv` monitors processes. To see maximum activity monitor a Web browser process. It is amazing how much activity that generates:

```
$ pv -d  3095                                                                                                             
  58:/home/carla/.pki/nssdb/key4.db:    0 B 0:00:33 
  [   0 B/s] [<=>                                                                           ] 
  78:/home/carla/.config/chromium/Default/Visited Links:  
  256KiB 0:00:33 [   0 B/s] [<=>                                                      ] 
  ] 
  85:/home/carla/.con...romium/Default/data_reduction_proxy_leveldb/LOG:  
  298 B 0:00:33 [   0 B/s] [<=>                                       ] 
```

Somewhere on the Internet I stumbled across a most entertaining way to use `pv` to echo back what I type:

```
$ echo "typing random stuff to pipe through pv" | pv -qL 8
typing random stuff to pipe through pv
```

The normal `echo` command prints the whole line at once. Piping it through `pv` makes it appear as though it is being re-typed. I have no idea if this has any practical value, but I like it. The `-L`controls the speed of the playback, in bytes per second.

`pv` is one of those funny little old commands that has acquired a giant batch of options over the years, including fancy formatting options, multiple output options, and transfer speed modifiers. `man pv` reveals all.

### /usr/bin/calendar

It's amazing what you can learn by browsing `/usr/bin` and other commands directories, and reading man pages. `/usr/bin/calendar` on Debian/Ubuntu is a modification of the BSD calendar, but it omits the moon and sun phases. It retains multiple calendars including `calendar.computer, calendar.discordian, calendar.music`, and `calendar.lotr`. On my system the man page lists different calendars than exist in `/usr/bin/calendar`. This example displays the Lord of the Rings calendar for the next 60 days:

```
$ calendar -f /usr/share/calendar/calendar.lotr  -A 60
Apr 17  An unexpected party
Apr 23  Crowning of King Ellesar
May 19  Arwen leaves Lorian to wed King Ellesar
Jun 11  Sauron attacks Osgilliath
```

The calendars are plain text files so you can easily create your own. The easy way is to copy the format of the existing calendar files. `man calendar` contains detailed instructions for creating your own calendar file.

Once again we come to the end too quickly. Take some time to cruise your own filesystem to dig up interesting commands to play with.

 _Learn more about Linux through the free ["Introduction to Linux" ][5]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/4/more-unknown-linux-commands

作者：[ CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/linux-commands-fig-1png
[4]:https://www.linux.com/files/images/outer-limits-linuxjpg
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[6]:https://www.addtoany.com/share#url=https%3A%2F%2Fwww.linux.com%2Flearn%2Fintro-to-linux%2F2017%2F4%2Fmore-unknown-linux-commands&title=More%20Unknown%20Linux%20Commands
[7]:http://termsaver.brunobraga.net/
[8]:http://www.asciimation.co.nz/
