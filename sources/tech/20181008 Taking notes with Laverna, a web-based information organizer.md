Taking notes with Laverna, a web-based information organizer
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/notebook-writing-pen.jpg?itok=uA3dCfu_)

I don’t know anyone who doesn’t take notes. Most of the people I know use an online note-taking application like Evernote, Simplenote, or Google Keep.

All of those are good tools, but they’re proprietary. And you have to wonder about the privacy of your information—especially in light of [Evernote’s great privacy flip-flop of 2016][1]. If you want more control over your notes and your data, you need to turn to an open source tool—preferably one that you can host yourself.

And there are a number of good [open source alternatives to Evernote][2]. One of these is Laverna. Let’s take a look at it.

### Getting Laverna

You can [host Laverna yourself][3] or use the [web version][4]

Since I have nowhere to host the application, I’ll focus here on using the web version of Laverna. Aside from the installation and setting up storage (more on that below), I’m told that the experience with a self-hosted version of Laverna is the same.

### Setting up Laverna

To start using Laverna right away, click the **Start using now** button on the front page of [Laverna.cc][5].

On the welcome screen, click **Next**. You’ll be asked to enter an encryption password to secure your notes and get to them when you need to. You’ll also be asked to choose a way to synchronize your notes. I’ll discuss synchronization in a moment, so just enter a password and click **Next**.

![](https://opensource.com/sites/default/files/uploads/laverna-set-password.png)

When you log in, you'll see a blank canvas:

![](https://opensource.com/sites/default/files/uploads/laverna-main-window.png)

### Storing your notes

Before diving into how to use Laverna, let’s walk through how to store your notes.

Out of the box, Laverna stores your notes in your browser’s cache. The problem with that is when you clear the cache, you lose your notes. You can also store your notes using:

  * Dropbox, a popular and proprietary web-based file syncing and storing service
  * [remoteStorage][6], which offers a way for web applications to store information in the cloud.



Using Dropbox is convenient, but it’s proprietary. There are also concerns about [privacy and surveillance][7]. Laverna encrypts your notes before saving them, but not all encryption is foolproof. Even if you don’t have anything illegal or sensitive in your notes, they’re no one’s business but your own.

remoteStorage, on the other hand, is kind of techie to set up. There are few hosted storage services out there. I use [5apps][8].

To change how Laverna stores your notes, click the hamburger menu in the top-left corner. Click **Settings** and then **Sync**.

![](https://opensource.com/sites/default/files/uploads/laverna-sync.png)

Select the service you want to use, then click **Save**. After that, click the left arrow in the top-left corner. You’ll be asked to authorize Laverna with the service you chose.

### Using Laverna

With that out of the way, let’s get down to using Laverna. Create a new note by clicking the **New Note** icon, which opens the note editor:

![](https://opensource.com/sites/default/files/uploads/laverna-new-note.png)

Type a title for your note, then start typing the note in the left pane of the editor. The right pane displays a preview of your note:

![](https://opensource.com/sites/default/files/uploads/laverna-writing-note.png)

You can format your notes using Markdown; add formatting using your keyboard or the toolbar at the top of the window.

You can also embed an image or file from your computer into a note, or link to one on the web. When you embed an image, it’s stored with your note.

When you’re done, click **Save**.

### Organizing your notes

Like some other note-taking tools, Laverna lists the last note that you created or edited at the top. If you have a lot of notes, it can take a bit of work to find the one you're looking for.

To better organize your notes, you can group them into notebooks, where you can quickly filter them based on a topic or a grouping.

When you’re creating or editing a note, you can select a notebook from the **Select notebook** list in the top-left corner of the window. If you don’t have any notebooks, select **Add a new notebook** from the list and type the notebook’s name.

You can also make that notebook a child of another notebook. Let’s say, for example, you maintain three blogs. You can create a notebook called **Blog Post Notes** and name children for each blog.

To filter your notes by notebook, click the hamburger menu, followed by the name of a notebook. Only the notes in the notebook you choose will appear in the list.

![](https://opensource.com/sites/default/files/uploads/laverna-notebook.png)

### Using Laverna across devices

I use Laverna on my laptop and on an eight-inch tablet running [LineageOS][9]. Getting the two devices to use the same storage and display the same notes takes a little work.

First, you’ll need to export your settings. Log into wherever you’re using Laverna and click the hamburger menu. Click **Settings** , then **Import & Export**. Under **Settings** , click **Export settings**. Laverna saves a file named laverna-settings.json to your device.

Copy that file to the other device or devices on which you want to use Laverna. You can do that by emailing it to yourself or by syncing the file across devices using an application like [ownCloud][10] or [Nextcloud][11].

On the other device, click **Import** on the splash screen. Otherwise, click the hamburger menu and then **Settings > Import & Export**. Click **Import settings**. Find the JSON file with your settings, click **Open** and then **Save**.

Laverna will ask you to:

  * Log back in using your password.
  * Register with the storage service you’re using.



Repeat this process for each device that you want to use. It’s cumbersome, I know. I’ve done it. You should need to do it only once per device, though.

### Final thoughts

Once you set up Laverna, it’s easy to use and has just the right features for what I need to do. I’m hoping that the developers can expand the storage and syncing options to include open source applications like Nextcloud and ownCloud.

While Laverna doesn’t have all the bells and whistles of a note-taking application like Evernote, it does a great job of letting you take and organize your notes. The fact that Laverna is open source and supports Markdown are two additional great reasons to use it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/taking-notes-laverna

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[1]: https://blog.evernote.com/blog/2016/12/15/evernote-revisits-privacy-policy/
[2]: https://opensource.com/life/16/8/open-source-alternatives-evernote
[3]: https://github.com/Laverna/laverna
[4]: https://laverna.cc/
[5]: http://laverna.cc/
[6]: https://remotestorage.io/
[7]: https://www.zdnet.com/article/dropbox-faces-questions-over-claims-of-improper-data-sharing/
[8]: https://5apps.com/storage/beta
[9]: https://lineageos.org/
[10]: https://owncloud.com/
[11]: https://nextcloud.com/
