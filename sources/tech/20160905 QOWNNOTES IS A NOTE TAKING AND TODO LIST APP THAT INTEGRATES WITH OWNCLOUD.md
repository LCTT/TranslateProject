QOWNNOTES IS A NOTE TAKING AND TODO LIST APP THAT INTEGRATES WITH OWNCLOUD
===============

[QOwnNotes][1] is a free, open source note taking and todo list application available for Linux, Windows, and Mac. 

The application saves your notes as plain-text files, and it features Markdown support and tight ownCloud integration.

![](https://2.bp.blogspot.com/-a2vsrOG0zFk/V81gyHWlaaI/AAAAAAAAYZs/uzY16JtNcT8bnje1rTKJx1135WueY6V9gCLcB/s400/qownnotes.png)

What makes QOwnNotes stand out is its ownCloud integration (which is optional). Using the ownCloud Notes app, you are able to edit and search notes from the web, or from mobile devices (by using an app like [CloudNotes][2]). 

Furthermore, connecting QOwnNotes with your ownCloud account allows you to share notes and access / restore previous versions (or trashed files) of your notes from the ownCloud server.

In the same way, QOwnNotes can also integrate with the ownCloud tasks or Tasks Plus apps.

In case you're not familiar with [ownCloud][3], this is a free software alternative to proprietary web services such as Dropbox, Google Drive, and others, which can be installed on your own server. It comes with a web interface that provides access to file management, calendar, image gallery, music player, document viewer, and much more. The developers also provide desktop sync clients, as well as mobile apps.

Since the notes are saved as plain text, they can be synchronized across devices using other cloud storage services, like Dropbox, Google Drive, and so on, but this is not done directly from within the application. 

As a result, the features I mentioned above, like restoring previous note versions, are only available with ownCloud (although Dropbox, and others, do provide access to previous file revisions, but you won't be able to access this directly from QOwnNotes).

As for the QOwnNotes note taking features, the app supports Markdown (with a built-in Markdown preview mode), tagging notes, searching in tags and notes, adding links to notes, and inserting images:

![](https://4.bp.blogspot.com/-SuBhC43gzkY/V81oV7-zLBI/AAAAAAAAYZ8/l6nLQQSUv34Y7op_Xrma8XYm6EdWrhbIACLcB/s400/qownnotes_2.png)

Hierarchical note tagging and note subfolders are also supported. 

The todo manager feature is pretty basic and could use some improvements, as it currently opens in a separate window, and it doesn't use the same editor as the notes, not allowing you to insert images, or use Markdown. 

![](https://3.bp.blogspot.com/-AUeyZS3s_ck/V81opialKtI/AAAAAAAAYaA/xukIiZZUdNYBVZ92xgKEsEFew7q961CDwCLcB/s400/qownnotes-tasks.png)

It does allow you to search your todo items, set item priority, add reminders, and show completed items. Also, todo items can be inserted into notes.

The application user interface is customizable, allowing you to increase or decrease the font size, toggle panes (Markdown preview, note edit and tag panes), and more. A distraction-free mode is also available:

![](https://4.bp.blogspot.com/-Pnzw1wZde50/V81rrE6mTWI/AAAAAAAAYaM/0UZnH9ktbAgClkuAk1g6fgXK87kB_Bh0wCLcB/s400/qownnotes-distraction-free.png)

From the application settings, you can enable the dark mode (this was buggy in my test under Ubuntu 16.04 - some toolbar icons were missing), change the toolbar icon size, fonts, and color scheme (light or dark):

![](https://1.bp.blogspot.com/-K1MGlXA8sxs/V81rv3fwL6I/AAAAAAAAYaQ/YDhhhnbJ9gY38B6Vz1Na_pHLCjLHhPWiwCLcB/s400/qownnotes-settings.png)

Other QOwnNotes features include encryption support (notes can only be decrypted in QOwnNotes), customizable keyboard shortcuts, export notes to PDF or Markdown, customizable note saving interval, and more.

Check out the QOwnNotes [homepage][11] for a complete list of features.


### Download QOwnNotes


For how to install QownNotes, see its [installation][4] page (packages / repositories available for Debian, Ubuntu, Linux Mint, openSUSE, Fedora, Arch Linux, KaOS, Gentoo, Slakware, CentOS, as well as Mac OSX and Windows).

A QOwnNotes [snap][5] package is also available (in Ubuntu 16.04 and newer, you should be able to install it directly from Ubuntu Software).

To integrate QOwnNotes with ownCloud you'll need [ownCloud server][6], as well as [Notes][7], [QOwnNotesAPI][8], and [Tasks][9] or [Tasks Plus][10] ownCloud apps. These can be installed from the ownCloud web interface, without having to download anything manually.

Note that the QOenNotesAPI and Notes ownCloud apps are listed as experimental, so you'll need to enable experimental apps to be able to find and install them. This can be done from the ownCloud web interface, under Apps, by clicking on the settings icon in the lower left-hand side corner.


--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/09/qownnotes-is-note-taking-and-todo-list.html

作者：[Andrew][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.webupd8.org/p/about.html
[1]: http://www.qownnotes.org/
[2]: http://peterandlinda.com/cloudnotes/
[3]: https://owncloud.org/
[11]: http://www.qownnotes.org/
[4]: http://www.qownnotes.org/installation
[5]: https://uappexplorer.com/app/qownnotes.pbek
[6]: https://download.owncloud.org/download/repositories/stable/owncloud/
[7]: https://github.com/owncloud/notes
[8]: https://github.com/pbek/qownnotesapi
[9]: https://apps.owncloud.com/content/show.php/Tasks?content=164356
[10]: https://apps.owncloud.com/content/show.php/Tasks+Plus?content=170561
