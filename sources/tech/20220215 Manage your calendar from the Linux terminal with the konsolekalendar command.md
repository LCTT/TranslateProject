[#]: subject: "Manage your calendar from the Linux terminal with the konsolekalendar command"
[#]: via: "https://opensource.com/article/22/2/manage-calendar-linux-konsolekalender-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manage your calendar from the Linux terminal with the konsolekalendar command
======
KDE is well-suited for terminal-based calendaring on Linux. The
konsolekalendar command lets you view and manage an iCal calendar from
the terminal.
![Calendar close up snapshot][1]

I'm a [KDE user][2], and for years I've been on a seemingly endless journey of discovery with the Plasma Desktop. If you were to ask me in public, I'd probably claim to know everything there is to know about the desktop I use every day of my life. But in truth, I've actually only just scratched the surface. It seems every day I learn a new KDE trick that either makes my life easier or just more fun, and my latest discovery is the `konsolekalendar` command, which lets you view and manage an iCal calendar from the terminal.

### Akonadi

The Akonadi project is a low-level KDE Framework that helps the Plasma Desktop keep track of all the Personal Information Manager (PIM) data. It's mostly for developers and includes lots of libraries that allow a programmer to create applications through which you can access your contacts, notes, emails, calendar, and so on. Some terminal commands are included in Akonadi, such as `akonadictl` to start and stop the Akonadi service, but they're mostly for troubleshooting. However, `konsolekalendar` is a user-facing command that provides you full access to all the data in the Kontact suite, including KMail, Notes, and the Calendar.

If you're running KDE's Plasma Desktop, then you already have the Kontact suite installed.

![Kontact UI][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

You also already have Akonadi and its tools installed, so everything you need for terminal-based calendaring is in place!

### View your calendar from the terminal

You can host your own iCal calendaring service thanks to projects like [NextCloud][5] and [Radicale][6], or you may already have an iCal account with popular providers (for instance, Google). When you use Kontact for calendaring, you subscribe to a calendar object (a "collection" in Akonadi's terminology). When you make updates to your local calendar, the changes get sent back to your iCal server to synchronize your calendar server and client.

Whether or not you've used the calendaring part of Kontact yet, you have some default calendar objects in Kontact. You have one called **Personal Calendar** and **Birthdays &amp; Anniversaries**.

Here's how to display the current day's calendar (**Personal Calendar** by default):


```


$ konsolekalendar
Date:   Saturday, January 15, 2022
        10:00 AM - 11:00 AM
Summary: Covid booster shot
UID: 8d8a1e38-c88c-4d84-99e5-23...
\----------------------------------
Date:   Saturday, January 15, 2022
        12:00 PM - 01:00 PM
Summary: Lunch
UID: 7aa89a...
\----------------------------------
Date:   Saturday, January 15, 2022
        01:00 PM - 04:45 PM
Summary: Afternoon coding
UID: 9cde38b...
\----------------------------------
Date:   Saturday, January 15, 2022
        06:00 PM - 10:00 PM
Summary: Planescape game
UID: c73f7e98-722f-48a2-8006-66...
\----------------------------------

```

### Add an event

To see all calendars you've subscribed to, use the `--list-calendars` option:


```


$ konsolekalendar --list-calendars
\----------------------------------
3  - (Read only) Birthdays &amp; Anniversaries
11 - Personal Calendar
60 - (Read only) Open Invitations
61 - (Read only) Declined Invitations
66 - Dnd
67 - Work
68 - Museum

```

The numbers on the left are calendar IDs. To add an event to a specific calendar, use the `--calendar` option, followed by the calendar ID:


```


$ konsolekalendar --add --calendar 66 \
\--date 2022-01-16 \
\--time 20:00 --end-time 23:59 \
\--summary "Another game" \
\--description "Remember to bring dice" \
Success: "Another game" inserted

```

### Delete an event

You can also remove events. Each event has a unique ID (UID), provided at the bottom of each event listing:


```


$ konsolekalendar --list
Date:   Saturday, January 15, 2022
        06:00 PM - 10:00 PM
Summary: Planescape game
UID: c73f7e98-722f-48a2-8006-66aa8ddcf789

```

To delete an event, use the `--delete` option along with the `--uid` option:


```


$ konsolekalendar --delete \
\--uid c73f7e98-722f-48a2-8006-66aa8ddcf789

```

### Akonadi in the terminal

Everything you do with `konsolekalendar` is immediately performed in Akonadi and is reflected just as quickly in Kontact itself. Using one doesn't mean you have to give up the other. Thanks to their shared Akonadi backend, the two view and edit the same data. The `konsolekalendar` command is a work in progress. Future plans include integration with the Notes and Journal parts of Kontact, and there are many more options available than this article covered. If you're using the KDE desktop, try `konsolekalendar` and experience a PIM for your terminal!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/manage-calendar-linux-konsolekalender-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT (Calendar close up snapshot)
[2]: https://opensource.com/article/17/5/7-cool-kde-tweaks-will-improve-your-life
[3]: https://opensource.com/sites/default/files/uploads/kontact.jpg (Kontact UI)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/article/21/1/nextcloud-productivity
[6]: https://radicale.org/v3.html
