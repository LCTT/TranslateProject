[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Organize and sync your calendar with khal and vdirsyncer)
[#]: via: (https://opensource.com/article/20/1/open-source-calendar)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Organize and sync your calendar with khal and vdirsyncer
======
Keeping and sharing a calendar can be a pain. Learn how to make it
easier in the fifth article in our series on 20 ways to be more
productive with open source in 2020.
![Calendar close up snapshot][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Keep track of your schedule with khal and vdirsyncer

Calendars are a _pain_ to deal with, and finding good tooling is always hard. But I've made some progress since last year when I listed calendaring as [one of my "fails."][2]

The most difficult thing about calendars today is that now they almost always need to be shared online in some way. The two most popular online calendars are Google Calendar and Microsoft Outlook/Exchange. Both are used heavily in corporate environments, which means my calendar has to support one or both options.

![khal calendar][3]

[Khal][4] is a console-based calendar that reads and writes VCalendar files. It's fairly easy to configure, but it does not support syncing with other applications.

Fortunately, khal works with [vdirsyncer][5], a nifty command-line program that can synchronize online calendars (and contacts, which I'll talk about in a separate article) to your local drive. And yes, this includes uploading new events, too.

![vdirsyncer][6]

Vdirsyncer is a Python 3 program, and it can be installed via your package manager or pip. It can synchronize CalDAV, VCalendar/iCalendar, Google Calendar, and local files in a directory. Since I use Google Calendar, I'll use that as an example, although it is not the easiest thing to set up.

Setting vdirsyncer up for Google is [well-documented][7], so I won't go into the nuts and bolts here. The important thing is to make sure your sync pairs are set up in a way that sets Google Calendar as the "winner" for conflict resolution. That is, if there are two updates to the same event, it needs to know which one takes precedence. Do so with something like this:


```
[general]
status_path = "~/.calendars/status"

[pair personal_sync]
a = "personal"
b = "personallocal"
collections = ["from a", "from b"]
conflict_resolution = "a wins"
metadata = ["color"]

[storage personal]
type = "google_calendar"
token_file = "~/.vdirsyncer/google_calendar_token"
client_id = "google_client_id"
client_secret = "google_client_secret"

[storage personallocal]
type = "filesystem"
path = "~/.calendars/Personal"
fileext = ".ics"
```

After the first sync of vdirsyncer, you will end up with a series of directories in the storage path. Each will contain several files, one for each entry in the calendar. The next step is to get them into khal. Start by running **khal configure** to do the initial setup.

![Configuring khal][8]

Now, running **khal interactive** will bring up the display shown at the beginning of this article. Typing **n** will bring up the New Event dialog. One small thing to note here: the calendars are named to match the directories that vdirsyncer creates, but you can change the khal config file to give them clearer names. Adding colors to entries based on which calendar they're on will also help you identify which is which on the list:


```
[calendars]
[[personal]]
path = ~/.calendars/Personal/kevin@sonney.com/
color = light magenta
[[holidays]]
path = ~/.calendars/Personal/cln2stbjc4hmgrrcd5i62ua0ctp6utbg5pr2sor1dhimsp31e8n6errfctm6abj3dtmg@virtual/
color = light blue
[[birthdays]]
path = ~/.calendars/Personal/c5i68sj5edpm4rrfdchm6rreehgm6t3j81jn4rrle0n7cbj3c5m6arj4c5p2sprfdtjmop9ecdnmq@virtual/
color = brown
```

Now when you run **khal interactive**, each calendar will be colored to distinguish it from the others, and when you add a new entry, it will have a more descriptive name.

![Adding a new calendar entry][9]

The setup is a little tricky, but once it's done, khal with vdirsyncer gives you an easy way to manage calendar events and keep them in sync with your online services.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-calendar

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT (Calendar close up snapshot)
[2]: https://opensource.com/article/19/1/productivity-tool-wish-list
[3]: https://opensource.com/sites/default/files/uploads/productivity_5-1.png (khal calendar)
[4]: https://khal.readthedocs.io/en/v0.9.2/index.html
[5]: https://github.com/pimutils/vdirsyncer
[6]: https://opensource.com/sites/default/files/uploads/productivity_5-2.png (vdirsyncer)
[7]: https://vdirsyncer.pimutils.org/en/stable/config.html#google
[8]: https://opensource.com/sites/default/files/uploads/productivity_5-3.png (Configuring khal)
[9]: https://opensource.com/sites/default/files/uploads/productivity_5-4.png (Adding a new calendar entry)
