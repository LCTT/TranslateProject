[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Nextcloud is the ultimate open source productivity suite)
[#]: via: (https://opensource.com/article/21/1/nextcloud-productivity)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

How Nextcloud is the ultimate open source productivity suite
======
Nextcloud can replace many of the online apps you use for collaboration,
organization, and task management.
![Working on a team, busy worklife][1]

In prior years, this annual series covered individual apps. This year, we are looking at all-in-one solutions in addition to strategies to help in 2021. Welcome to day 11 of 21 Days of Productivity in 2021.

Web-based services allow for access to your data almost anywhere and they support millions of users hourly. For some of us, though, running our own service is preferable to using a big company's service for various reasons. Maybe we work on things that are subject to regulation or have explicit security requirements. Perhaps we have privacy concerns, or just like being able to build, run, and fix things ourselves. Whatever the case may be, [Nextcloud][2] can provide most of the services you need, but on your own hardware.

![NextCloud Dashboard displaying service options][3]

The Nextcloud Dashboard (Kevin Sonney, [CC BY-SA 4.0][4])

Most of the time, when we think of Nextcloud, we think of file sharing and syncing, similar to commercial products like Dropbox, OneDrive, and Google Drive. However, these days, it is a full-on productivity suite, with an email client, calendaring, tasks, and notebooks.

There are several ways to set up and run Nextcloud. You can install it to a bare metal server, run it in Docker containers, or as a virtual machine. There are also hosted services that will run Nextcloud for you, should you choose. Finally, there are apps for every major OS, including mobile apps for access on-the-go.

![Nextcloud virtual machine][5]

The Nextcloud VM (Kevin Sonney, [CC BY-SA 4.0][4])

By default, Nextcloud comes with file sharing and a few other related apps (or add-ons) installed. You can find the Apps page in the Admin interface, which allows you to install individual add-ons and some pre-defined bundles of related apps. For my install, I chose the _Groupware Bundle_, which includes mail, calendars, contacts, and Deck. Deck is a lightweight Kanban Board for handling tasks. I installed the _Notes_ and _Tasks_ apps as well.

The Nextcloud Mail app is a very straight-forward IMAP email client. While Nextcloud does not include an IMAP or SMTP server as part of the packages, you can easily add one to the OS or use a remote service. The Calendar application is pretty standard and also allows you to subscribe to remote calendars. One drawback is that remote calendars (say, from a large cloud provider) are read-only, so you can view but not modify them.

![NextCoud App Interface][6]

The Nextcloud App interface (Kevin Sonney, [CC BY-SA 4.0][4])

Notes is a simple text notepad, allowing you to create and update short notes, journals, and related things. Tasks is a to-do list application with support for multiple lists, task priorities, percent complete, and several other standard features that users expect. If you installed Deck, its task cards are listed as well. Each Board will show up as its own list, so you can use Deck or Tasks to track what is complete.

Deck itself is a Kanban Board app, presenting tasks as cards to move through a process. If you like the Kanban flow, it is an excellent application for tracking progress.

![Taking notes][7]

Taking notes (Kevin Sonney, [CC BY-SA 4.0][4])

All the applications in Nextcloud natively support sharing via standard protocols. Unlike some similar solutions, this sharing does not feel like it was added on to check a features box. Sharing is one of the primary reasons Nextcloud exists, and so it is very simple to use. You can also add the ability to share links to social media, via email, and so on. You can use Nextcloud to replace several online services in a single interface, accessible from anywhere, with a collaboration-first mindset.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/nextcloud-productivity

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://nextcloud.com/
[3]: https://opensource.com/sites/default/files/day11-image1_0.png
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/pictures/nextcloud-vm.png (Nextcloud virtual machine)
[6]: https://opensource.com/sites/default/files/pictures/nextcloud-app-interface.png (NextCoud App Interface)
[7]: https://opensource.com/sites/default/files/day11-image3.png (Taking notes in Nextcloud)
