[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use your Raspberry Pi as a productivity powerhouse)
[#]: via: (https://opensource.com/article/21/1/raspberry-pi-productivity)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Use your Raspberry Pi as a productivity powerhouse
======
The Raspberry Pi has come a long way from being primarily for hacking
and hobbyists to a solid choice for a small productive workstation.
![Team checklist and to dos][1]

In prior years, this annual series covered individual apps. This year, we are looking at all-in-one solutions in addition to strategies to help in 2021. Welcome to day 16 of 21 Days of Productivity in 2021.

The [Raspberry Pi][2] is a pretty amazing little computer—small, surprisingly powerful, and very easy to set up and use. I have used them for home automation projects, dashboards, and a dedicated media player. But can it be a productivity powerhouse as well?

The answer is, quite simply, yes.

![Geary and Calendar apps on the Raspberry Pi][3]

Geary and Calendar (Kevin Sonney, [CC BY-SA 4.0][4])

The base [Raspbian][5] install includes [Claws Mail][6], which is a lightweight mail client. The UI is a little dated, and it is very bare-bones. If you are a [Mutt user][7], this will probably meet your needs just fine.

I prefer to install [Geary][8] since it is also lightweight and has a modern interface. Also, unlike Claws, Geary has support for rich-text (HTML) email by default. I dislike rich-text email, but it has become necessary, so having good support for it is critical.

The default Raspbian installation does not include a calendar, so I added [GNOME Calendar][9] since it can talk to remote services (since almost all of my calendars are on cloud providers).

![GTG and GNote open on Raspberry Pi][10]

GTG and GNote (Kevin Sonney, [CC BY-SA 4.0][4])

What about notes and to-do lists? There are a lot of options out there, but I'm a fan of [GNote][11] for notes and [Getting-Things-GNOME!][12] for to-do lists. Both are reasonably lightweight and can sync to each other, as well as to other services.

You'll note that I'm using quite a few GNOME applications here. Why not just install the full GNOME Desktop? On the Raspberry Pi 4 with 4Gb (or 8Gb) of memory, GNOME works exceptionally well. You will need to take some extra steps to disable the default wifi setup on Raspbian and replace it with Network Manager, but that is well documented on the internet and really easy.

Included with GNOME is [Evolution][13], which combines mail, calendars, notes, to-do lists, and contact management into a single app. It is a little heavy compared to Geary and GNOME Calendar, but it is rock solid on the Raspberry Pi 4. This was surprising to me since I'm used to Evolution being kind of a resource hog, but the Raspberry Pi 4 runs it as well as my brand-name laptops with resources to spare.

![Evolution on Raspbian][14]

Evolution on Raspbian (Kevin Sonney, [CC BY-SA 4.0][4])

The Raspberry Pi has come a long way in the last few years and has gone from being primarily for hacking and hobbyists to a solid choice for a small productive workstation.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/raspberry-pi-productivity

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/todo_checklist_team_metrics_report.png?itok=oB5uQbzf (Team checklist and to dos)
[2]: https://www.raspberrypi.org/
[3]: https://opensource.com/sites/default/files/day16-image1.png
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://www.raspbian.org/
[6]: https://www.claws-mail.org/
[7]: http://www.mutt.org/
[8]: https://wiki.gnome.org/Apps/Geary
[9]: https://wiki.gnome.org/Apps/Calendar
[10]: https://opensource.com/sites/default/files/day16-image2.png
[11]: https://wiki.gnome.org/Apps/Gnote
[12]: https://wiki.gnome.org/Apps/GTG
[13]: https://opensource.com/business/18/1/desktop-email-clients
[14]: https://opensource.com/sites/default/files/day16-image3.png
