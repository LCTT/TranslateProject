[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage your daily schedule with Git)
[#]: via: (https://opensource.com/article/19/4/calendar-git)
[#]: author: (Seth Kenlon  https://opensource.com/users/seth)

Manage your daily schedule with Git
======
Treat time like source code and maintain your calendar with the help of
Git.
![website design image][1]

[Git][2] is one of those rare applications that has managed to encapsulate so much of modern computing into one program that it ends up serving as the computational engine for many other applications. While it's best-known for tracking source code changes in software development, it has many other uses that can make your life easier and more organized. In this series leading up to Git's 14th anniversary on April 7, we'll share seven little-known ways to use Git. Today, we'll look at using Git to keep track of your calendar.

### Keep track of your schedule with Git

What if time itself was but source code that could be managed and version controlled? While proving or disproving such a theory is probably beyond the scope of this article, it happens that you can treat time like source code and manage your daily schedule with the help of Git.

The reigning champion for calendaring is the [CalDAV][3] protocol, which drives popular open source calendaring applications like [NextCloud][4] as well as popular closed source ones. There's nothing wrong with CalDAV (commenters, take heed). But it's not for everyone, and besides there's nothing less inspiring than a mono-culture.

Because I have no interest in becoming invested in largely GUI-dependent CalDAV clients (although if you're looking for a good terminal CalDAV viewer, see [khal][5]), I started investigating text-based alternatives. Text-based calendaring has all the usual benefits of working in [plaintext][6]. It's lightweight, it's highly portable, and as long as it's structured, it's easy to parse and beautify (whatever _beauty_ means to you).

And best of all, it's exactly what Git was designed to manage.

### Org mode not in a scary way

If you don't impose structure on your plaintext, it quickly falls into a pandemonium of off-the-cuff thoughts and devil-may-care notation. Luckily, a markup syntax exists for calendaring, and it's contained in the venerable productivity Emacs mode, [Org mode][7] (which, admit it, you've been meaning to start using anyway).

The amazing thing about Org mode that many people don't realize is [you don't need to know or even use Emacs][8] to take advantage of conventions established by Org mode. You get a lot of great features if you _do_ use Emacs, but if Emacs intimidates you, then you can implement a Git-based Org-mode calendaring system without so much as installing Emacs.

The only part of Org mode that you need to know is its syntax. Org-mode syntax is low-maintenance and fairly intuitive. The biggest difference in calendaring with Org mode instead of a GUI calendaring app is the workflow: instead of going to a calendar and finding the day you want to schedule a task, you create a list of tasks and then assign each one a day and time.

Lists in Org mode use asterisks (*) as bullets. Here's my gaming task list: ****

```
* Gaming
** Build Stardrifter character
** Read Stardrifter rules
** Stardrifter playtest

** Blue Planet @ Mike's

** Run Rappan Athuk
*** Purchase hard copy
*** Skim Rappan Athuk
*** Build Rappan Athuk maps in maptool
*** Sort Rappan Athuk tokens
```

If you're familiar with [CommonMark][9] or Markdown, you'll notice that instead of using whitespace to create a subtask, Org mode favors the more explicit use of additional bullets. Whatever your background with lists, this is an intuitive and easy way to build a list, and it obviously is not inherently tied to Emacs (although using Emacs provides you with shortcuts so you can rearrange your list quickly).

To turn your list into scheduled tasks or events in a calendar, go back through and add the keywords **SCHEDULED** and, optionally, **:CATEGORY:**.

```
* Gaming
:CATEGORY: Game
** Build Stardrifter character
SCHEDULED: <2019-03-22 18:00-19:00>
** Read Stardrifter rules
SCHEDULED: <2019-03-22 19:00-21:00>
** Stardrifter playtest
SCHEDULED: <2019-03-25 0900-1300>
** Blue Planet @ Mike's
SCHEDULED: <2019-03-18 18:00-23:00 +1w>

and so on...
```

The **SCHEDULED** keyword marks the entry as an event that you expect to be notified about and the optional **:CATEGORY:** keyword is an arbitrary tagging system for your own use (and in Emacs, you can color-code entries according to category).

For a repeating event, you can use notation such as **+1w** to create a weekly event or **+2w** for a fortnightly event, and so on.

All the fancy markup available for Org mode is [documented][10], so don't hesitate to find more tricks to help it fit your needs.

### Put it into Git

Without Git, your Org-mode appointments are just a file on your local machine. It's the 21st century, though, so you at least need your calendar on your mobile phone, if not on all of your personal computers. You can use Git to publish your calendar for yourself and others.

First, create a directory for your **.org** files. I store mine in **~/cal**.

```
$ mkdir ~/cal
```

Change into your directory and make it a Git repository:

```
$ cd cal
$ git init
```

Move your **.org** file to your local Git repo. In practice, I maintain one **.org** file per category.

```
$ mv ~/*.org ~/cal
$ ls
Game.org Meal.org Seth.org Work.org
```

Stage and commit your files:

```
$ git add *.org
$ git commit -m 'cal init'
```

### Create a Git remote

To make your calendar available from anywhere, you must have a Git repository on the internet. Your calendar is plaintext, so any Git repository will do. You can put your calendar on [GitLab][11] or any other public Git hosting service (even proprietary ones), and as long as your host allows it, you can even mark the repository as private. If you don't want to post your calendar to a server you don't control, it's easy to host a Git repository yourself, either using a bare repository for a single user or using a frontend service like [Gitolite][12] or [Gitea][13].

In the interest of simplicity, I'll assume a self-hosted bare Git repository. You can create a bare remote repository on any server you have SSH access to with one Git command:
```
$ ssh -p 22122 [seth@example.com][14]
[remote]$ mkdir cal.git
[remote]$ cd cal.git
[remote]$ git init --bare
[remote]$ exit
```

This bare repository can serve as your calendar's home on the internet.

Set it as the remote source for your local (on your computer, not your server) Git repository:

```
$ git remote add origin seth@example.com:/home/seth/cal.git
```

And then push your calendar data to the server:

```
$ git push -u origin HEAD
```

With your calendar in a Git repository, it's available to you on any device running Git. That means you can make updates and changes to your schedule and push your changes upstream so it updates everywhere.

I use this method to keep my calendar in sync between my work laptop and my home workstation. Since I use Emacs every day for most of the day, being able to view and edit my calendar in Emacs is a major convenience. The same is true for most people with a mobile device, so the next step is to set up an Org-mode calendaring system on a mobile.

### Mobile Git

Since your calendar data is in plaintext, strictly speaking, you can "use" it on any device that can read a text file. That's part of the beauty of this system; you're never without, at the very least, your raw data. But to integrate your calendar on a mobile device the way you'd expect a modern calendar to work, you need two components: a mobile Git client and a mobile Org-mode viewer.

#### Git client for mobile

[MGit][15] is a good Git client for Android. There are Git clients for iOS, as well.

Once you've installed MGit (or a similar Git client), you must clone your calendar repository so your phone has a copy. To access your server from your mobile device, you must set up an SSH key for authentication. MGit can generate and store a key for you, which you must add to your server's **~/.ssh/authorized_keys** file or to your SSH keys in the settings of your hosted Git account.

You must do this manually. MGit does not have an interface to log into your server or hosted Git account. If you do not do this, your mobile device cannot access your server to access your calendar data.

I did it by copying the key file I generated in MGit to my laptop over [KDE Connect][16] (but you can do the same over Bluetooth, or with an SD card reader, or a USB cable, depending on your preferred method of accessing data on your phone). I copied the key (a file called **calkey** to my server with this command:

```
$ cat calkey | ssh seth@example.com "cat >> /home/seth/.ssh/authorized_keys"
```

You may have a different way of doing it, but if you ever set your server up for passwordless login, this is exactly the same process. If you're using a hosted Git service like GitLab, you must copy and paste the contents of your key file into your user account's SSH Key panel.

![Adding key file data to GitLab][17]

Once that's done, your mobile device can authorize to your server, but it still needs to know where to go to find your calendar data. Different apps may use different notation, but MGit uses plain old Git-over-SSH. That means if you're using a non-standard SSH port, you must specify the SSH port to use:

```
$ git clone ssh://seth@example.com:22122//home/seth/git/cal.git
```

![Specifying SSH port in MGit][18]

If you use a different app, it may use a different syntax that allows you to provide a port in a special field or drop the **ssh://** prefix. Refer to the app documentation if you experience issues.

Clone the repository to your phone.

![Cloned repositories][19]

Few Git apps are set to automatically update the repository. There are a few apps you can use to automate pulls, or you can set up Git hooks to push updates from your server—but I won't get into that here. For now, after you make an update to your calendar, be sure to pull new changes manually in MGit (or if you change events on your phone, push the changes to your server).

![MGit push/pull settings][20]

#### Mobile calendar

There are a few different apps that provide frontends for Org mode on a mobile device. [Orgzly][21] is a great open source Android app that provides an interface for Org mode's greatest features, from the Agenda mode to the TODO lists. Install and launch it.

From the Main menu, choose Setting Sync Repositories and select the directory containing your calendar files (i.e., the Git repository you cloned from your server).

Give Orgzly a moment to import the data, then use Orgzly's [hamburger][22] menu to select the Agenda view.

![Orgzly's agenda view][23]

In Orgzly's Settings Reminders menu, you can choose which event types trigger a notification on your phone. You can get notifications for **SCHEDULED** tasks, **DEADLINE** tasks, or anything with an event time assigned to it. If you use your phone as your taskmaster, you'll never miss an event with Org mode and Orgzly.

![Orgzly notification][24]

Orgzly isn't just a parser. You can edit and update events, and even mark events **DONE**.

![Orgzly to-do list][25]

### Designed for and by you

The important thing to understand about using Org mode and Git is that both applications are highly flexible, and it's expected that you'll customize how and what they do so they will adapt to your needs. If something in this article is an affront to how you organize your life or manage your weekly schedule, but you like other parts of what this proposal offers, then throw out the part you don't like. You can use Org mode in Emacs if you want, or you can just use it as calendar markup. You can set your phone to pull Git data right off your computer at the end of the day instead of a server on the internet, or you can configure your computer to sync calendars whenever your phone is plugged in, or you can manage it daily as you load up your phone with all the stuff you need for the workday. It's up to you, and that's the most significant thing about Git, about Org mode, and about open source.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/calendar-git

作者：[Seth Kenlon (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-design-monitor-website.png?itok=yUK7_qR0 (website design image)
[2]: https://git-scm.com/
[3]: https://tools.ietf.org/html/rfc4791
[4]: http://nextcloud.com
[5]: https://github.com/pimutils/khal
[6]: https://plaintextproject.online/
[7]: https://orgmode.org
[8]: https://opensource.com/article/19/1/productivity-tool-org-mode
[9]: https://commonmark.org/
[10]: https://orgmode.org/manual/
[11]: http://gitlab.com
[12]: http://gitolite.com/gitolite/index.html
[13]: https://gitea.io/en-us/
[14]: mailto:seth@example.com
[15]: https://f-droid.org/en/packages/com.manichord.mgit
[16]: https://community.kde.org/KDEConnect
[17]: https://opensource.com/sites/default/files/uploads/gitlab-add-key.jpg (Adding key file data to GitLab)
[18]: https://opensource.com/sites/default/files/uploads/mgit-0.jpg (Specifying SSH port in MGit)
[19]: https://opensource.com/sites/default/files/uploads/mgit-1.jpg (Cloned repositories)
[20]: https://opensource.com/sites/default/files/uploads/mgit-2.jpg (MGit push/pull settings)
[21]: https://f-droid.org/en/packages/com.orgzly/
[22]: https://en.wikipedia.org/wiki/Hamburger_button
[23]: https://opensource.com/sites/default/files/uploads/orgzly-agenda.jpg (Orgzly's agenda view)
[24]: https://opensource.com/sites/default/files/uploads/orgzly-cal-notify.jpg (Orgzly notification)
[25]: https://opensource.com/sites/default/files/uploads/orgzly-cal-todo.jpg (Orgzly to-do list)
