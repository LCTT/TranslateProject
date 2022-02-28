[#]: subject: "Put sticky notes on your Linux KDE desktop"
[#]: via: "https://opensource.com/article/22/2/sticky-notes-linux-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Put sticky notes on your Linux KDE desktop
======
Use KNotes, a feature of the Kontact suite, to gently remind yourself of
your daily tasks.
![Working from home at a laptop][1]

I remember the first time I went to an "un" conference. It was a chaotic event at first, with lots of socializing and sharing of personal projects, but it gradually coalesced into a mostly self-organized technical event. It didn't happen with magic, but with sticky notes. People wrote ideas for talks and presentations on those colorful adhesive notepads, and stuck them to a common wall, and other people grouped similar ideas into clusters, and eventually everyone knew where to congregate to discuss specific topics. It was a beautiful and satisfying thing to witness, and it gave me a new respect for sticky notes. So I was happy to recently discover that the KDE Plasma Desktop has digital sticky notes, and in many ways they're even more useful than the physical ones. The application is called KNotes, and if you have random ideas that you feel like jotting down, it's probably something you want to consider for your own Linux desktop.

### Install KNotes

KNotes is part of the Kontact suite, which is the personal information manager (PIM) for KDE. If you're running the Plasma Desktop, then you probably already have KNotes installed. If not, you can install it from your package manager:


```
`$ sudo dnf install kontact`
```

On a Debian-based distribution, use the `apt` command instead of `dnf`.

### KNotes on the Linux desktop

Even though KNotes is part of Kontact, it's also a stand-alone application that can run in the background, ready to produce a blank note whenever you need one. Launch KNotes from your application menu, and it minimizes itself to your system tray. Its icon is a small yellow square, because before sticky notes got colorful in real life they tended to all be yellow.

To create a new note, right-click the KNote icon in your system tray and select **New Note**. The first time you create a note, you're prompted to choose a destination for the saved note. Select the local KNotes database file (it's managed by Kontact, so you won't interact with that file directly) and enable the selection to use this location by default. From then on, you won't be prompted again.

A new note appears on your desktop, and you can type yourself a note.

![Start using KNotes][2]

(Seth Kenlon, [CC BY-SA 4.0][3])

It's as simple as that. Or at least, it would be, were these old-fashioned physical notes. But these are digital KDE KNotes, so you can do a lot more than just jot down some reminder text to yourself.

### Changing note colors

A bunch of yellow notes start to blend together, but you can color-code notes. Right-click on the title bar of the note (the part with the date and time) and select **Preferences** from the contextual menu that appears. In the **Preferences** window, you can change the title and body font and font size, and then select the **Display Settings** tab to change the note and font colors.

![KNotes with added color][4]

(Seth Kenlon, [CC BY-SA 4.0][3])

### Sending notes

When I used to write myself notes, I often jotted reminders to myself in the scratch buffer of [Emacs][5]. There are better ways to manage [notes in Emacs][6], but my habit of jotting notes down in places that I was destined to be absent-mindedly close later, without saving, was difficult to break.

With KNotes, the notes are automatically saved to Kontact, so you don't have to worry about keeping track of them. Better still, they're digital, so you can send them to yourself on other devices. You can email notes to yourself, or you can send them to another computer over your network. All it takes is a right-click on the title bar of a note, and you can select **Email** or **Send**.

To receive notes as KNotes from one KDE Plasma Desktop to another, you must give KNotes permission on the recipient machine to accept notes. To allow incoming notes, right-click on the KNotes icon in the system tray and select **Configure KNotes**.

![Configure KNotes][7]

(Seth Kenlon, [CC BY-SA 4.0][3])

### Setting alarms

At least for me, notes usually happen because I've promised someone something in the short term, often by the end of the day. Notes stuck to my desktop do tend to get covered up as I work and open more and more windows, so it's especially helpful that KNotes allow you to set alarms for the really important ones.

To set an alarm for a note, right-click on the note's title bar and select **Set alarm**.

### Take notes on Linux

Sticky notes are easy and fun ways to keep track of daily tasks. They don't "work" for everyone, and they aren't my only means of tracking things I mean to do each day, but they're great options to have, and there's nothing more satisfying than moving a completed note into the "done" pile before deleting them all at the end of the day. Give it a try, it's a habit that just might stick.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/sticky-notes-linux-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/sites/default/files/knote-yellow.jpg (Start using KNotes)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/knote-color.jpg (KNotes with added color)
[5]: https://opensource.com/downloads/emacs-cheat-sheet
[6]: https://opensource.com/article/18/7/emacs-modes-note-taking
[7]: https://opensource.com/sites/default/files/knotes-preferences.jpg (Configure KNotes)
