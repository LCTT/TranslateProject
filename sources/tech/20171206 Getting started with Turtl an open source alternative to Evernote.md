Getting started with Turtl, an open source alternative to Evernote
============================================================

### Turtl is a solid note-taking tool for users looking for an alternative to apps like Evernote and Google Keep.

![Using Turtl as an open source alternative to Evernote](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUS_brainstorm_island_520px.png?itok=6IUPyxkY "Using Turtl as an open source alternative to Evernote")
Image by : opensource.com

Just about everyone I know takes notes, and many people use an online note-taking application like Evernote, Simplenote, or Google Keep. Those are all good tools, but you have to wonder about the security and privacy of your information—especially in light of [Evernote's privacy flip-flop of 2016][11]. If you want more control over your notes and your data, you really need to turn to an open source tool.

Whatever your reasons for moving away from Evernote, there are open source alternatives out there. Let's look at one of those alternatives: Turtl.

### Getting started

The developers behind [Turtl][12] want you to think of it as "Evernote with ultimate privacy." To be honest, I can't vouch for the level of privacy that Turtl offers, but it is a quite a good note-taking tool.

To get started with Turtl, [download][13] a desktop client for Linux, Mac OS, or Windows, or grab the [Android app][14]. Install it, then fire up the client or app. You'll be asked for a username and passphrase. Turtl uses the passphrase to generate a cryptographic key that, according to the developers, encrypts your notes before storing them anywhere on your device or on their servers.

### Using Turtl

You can create the following types of notes with Turtl:

*   Password

*   File

*   Image

*   Bookmark

*   Text note

No matter what type of note you choose, you create it in a window that's similar for all types of notes:


![Create new text note with Turtl](https://opensource.com/sites/default/files/images/life-uploads/turtl-new-note-520.png "Creating a new text note with Turtl")

Creating a new text note in Turtl

Add information like the title of the note, some text, and (if you're creating a File or Image note) attach a file or an image. Then click **Save**.

You can add formatting to your notes via [Markdown][15]. You need to add the formatting by hand—there are no toolbar shortcuts.

If you need to organize your notes, you can add them to **Boards**. Boards are just like notebooks in Evernote. To create a new board, click on the **Boards** tab, then click the **Create a board** button. Type a title for the board, then click **Create**.


![Create new board in Turtl](https://opensource.com/sites/default/files/images/life-uploads/turtl-boards-520.png "Creating a new Turtl board")

Creating a new board in Turtl

To add a note to a board, create or edit the note, then click the **This note is not in any boards** link at the bottom of the note. Select one or more boards, then click **Done**.

To add tags to a note, click the **Tags** icon at the bottom of a note, enter one or more keywords separated by commas, and click **Done**.

### Syncing your notes across your devices

If you use Turtl across several computers and an Android device, for example, Turtl will sync your notes whenever you're online. However, I've encountered a small problem with syncing: Every so often, a note I've created on my phone doesn't sync to my laptop. I tried to sync manually by clicking the icon in the top left of the window and then clicking **Sync Now**, but that doesn't always work. I found that I occasionally need to click that icon, click **Your settings**, and then click **Clear local data**. I then need to log back into Turtl, but all the data syncs properly.

### A question, and a couple of problems

When I started using Turtl, I was dogged by one question:  _Where are my notes kept online?_  It turns out that the developers behind Turtl are based in the U.S., and that's also where their servers are. Although the encryption that Turtl uses is [quite strong][16] and your notes are encrypted on the server, the paranoid part of me says that you shouldn't save anything sensitive in Turtl (or any online note-taking tool, for that matter).

Turtl displays notes in a tiled view, reminiscent of Google Keep:


![Notes in Turtl](https://opensource.com/sites/default/files/images/life-uploads/turtl-notes-520.png "Collection of notes in Turtl")

A collection of notes in Turtl

There's no way to change that to a list view, either on the desktop or on the Android app. This isn't a problem for me, but I've heard some people pan Turtl because it lacks a list view.

Speaking of the Android app, it's not bad; however, it doesn't integrate with the Android **Share** menu. If you want to add a note to Turtl based on something you've seen or read in another app, you need to copy and paste it manually.

I've been using a Turtl for several months on a Linux-powered laptop, my [Chromebook running GalliumOS][17], and an Android-powered phone. It's been a pretty seamless experience across all those devices. Although it's not my favorite open source note-taking tool, Turtl does a pretty good job. Give it a try; it might be the simple note-taking tool you're looking for.


### About the author

 [![That idiot Scott Nesbitt ...](https://opensource.com/sites/default/files/styles/profile_pictures/public/scottn-cropped.jpg?itok=q4T2J4Ai)][18] 
 
 Scott Nesbitt - I'm a long-time user of free/open source software, and write various things for both fun and profit. I don't take myself too seriously and I do all of my own stunts. You can find me at these fine establishments on the web: [Twitter][5], [Mastodon][6], [GitHub][7], and... [more about Scott Nesbitt][8][More about me][9]

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/using-turtl-open-source-alternative-evernote

作者：[Scott Nesbitt ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/file/378346
[2]:https://opensource.com/file/378351
[3]:https://opensource.com/file/378356
[4]:https://opensource.com/article/17/12/using-turtl-open-source-alternative-evernote?rate=Kktl8DSEAXzwIGppn0PS4KuSpZv3Qbk0fuiilnplrnE
[5]:http://www.twitter.com/ScottWNesbitt
[6]:https://mastodon.social/@scottnesbitt
[7]:https://github.com/ScottWNesbitt
[8]:https://opensource.com/users/scottnesbitt
[9]:https://opensource.com/users/scottnesbitt
[10]:https://opensource.com/user/14925/feed
[11]:https://blog.evernote.com/blog/2016/12/15/evernote-revisits-privacy-policy/
[12]:https://turtlapp.com/
[13]:https://turtlapp.com/download/
[14]:https://turtlapp.com/download/
[15]:https://en.wikipedia.org/wiki/Markdown
[16]:https://turtlapp.com/docs/security/encryption-specifics/
[17]:https://opensource.com/article/17/4/linux-chromebook-gallium-os
[18]:https://opensource.com/users/scottnesbitt
[19]:https://opensource.com/users/scottnesbitt
[20]:https://opensource.com/users/scottnesbitt
[21]:https://opensource.com/article/17/12/using-turtl-open-source-alternative-evernote#comments
[22]:https://opensource.com/tags/alternatives
