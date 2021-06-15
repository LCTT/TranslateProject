[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Experience alternate computing with the Pe text editor)
[#]: via: (https://opensource.com/article/20/12/pe)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Experience alternate computing with the Pe text editor
======
With elements of legacy systems, Pe is refreshingly simple with plenty
of additional features.
![Programming keyboard.][1]

The Haiku operating system is a bold but successful attempt at reviving an old OS called BeOS. In the 1990s, BeOS was positioned to become the foundation for the next evolution of the Apple Mac line of computers. Back in the 1990s, Apple Inc. was poised to acquire BeOS as its next generation operating system. At the last minute, however, Apple decided the price was too steep and acquired the UNIX-based NeXT operating system instead (and so Mac OS X was born). BeOS, however, had [made some remarkable progress][2] in multi-threading, file systems and attributes, and interface design. When the company finally folded, its userbase persisted.

I like to check in on Haiku every now and again, and while it still lists itself as beta software, it’s a striking achievement. Haiku is not Linux or UNIX, although it is POSIX-compliant. It stays true and compatible with BeOS, while making lots of improvements so that it largely feels like an OS that was developed today and not 30 years ago.

Between BeOS and Haiku, there have been lots of text editors on this platform, including **ne**, **pad**, **TextEdit**, **YATE**, and many more ([JOVE][3], [Emacs][4], and [Vim][5] have all been ported to it, too). For this article, however, I decided to try one of the default text editors included with Haiku: [the Pe editor][6] or _programmer’s editor_.

![Blue HAIKU desktop with Pe editor buffer, a white box with gray text][7]

### Install

Pe is written for Haiku OS and is released under a BSD license. To run it, you must have [Haiku installed][8]. Haiku is an operating system, so in theory, you could install it on a spare computer, but it also runs well in a virtual machine, such as [GNOME Boxes][9]. With Haiku installed on hardware or in a virtual machine, you have Pe by default.

### Launching

If you’re new to BeOS or Haiku, then the easiest way to launch Pe is from the Deskbar. The Deskbar is a precursor to the modern Dock (like the one in macOS). Click the Haiku feather icon in the top-right corner of the desktop and select **Applications**. In the **Applications** submenu, click on **Pe** to launch the text editor.

Alternately, you can double-click the hard drive icon on the desktop and navigate to your home directory. Once there, right-click and create a new text file. Right-click on the text file and open it with Pe.

### Using Pe

When Pe first launches, it opens an empty buffer for text entry, with a menu and a toolbar at the top of the window. Once you’re using Pe, the relative unfamiliarity of the OS fades away because Pe works largely like every other text editor you’ve ever used. You type text, and it appears on the screen. It’s refreshingly simple, but there are lots of exciting features for you to discover.

#### Syntax highlighting

I tried writing in Asciidoc, Docbook XML, Markdown, Python, and C++. Both XML and C++ were recognized by Pe, and it automatically themed the keywords and elements. The color scheme only activated when a text file was saved with the appropriate file extension, so it’s not a bad idea to create your file on the desktop first and then open it with Pe to ensure that the correct syntax definition is loaded. Languages included in Pe are stored in **/system/apps/Pe/Languages**. The color themes followed the general visual design of Haiku itself: soft and calming shades, mostly earth tones, but easy to see. I usually use a dark theme on my desktop, but I found Haiku’s theme pleasing enough that I didn’t feel a special urge to change it (which is convenient because I couldn’t find a built-in dark theme that didn’t involve me redefining every system color myself).

#### Text modifiers

Text editors ideally make editing text easy, and that’s exactly the aim of the **Text** menu. This menu contains lots of convenience functions that most people writing text probably don’t ever think about but that programmers seem to use all the time. There’s **twiddle** to swap characters (a quick way to change "hte" to "the" or "cmo" to "com," and so on), **change case** to alter capitalization of words and sentences, **shift left** and **shift right** to adjust indentation, **comment** and **uncomment** to transform a line into a comment, and much more. This menu, along with its robust **Preferences,** is where Pe really excels. It’s a sign of developers who include what they, and other people serious about computing, want.

#### Saving

Saving and opening files are essentially the same in Pe as with most editors. You go to the **File** menu and select the action you want. However, Pe provides some extra services, too. You can open files from a server, save them directly to a server, save just one file, or save several files in a group.

#### Keyboard shortcuts

Most keyboard shortcuts in Haiku are based around the **Alt** key instead of the **Ctrl** key. I find this somewhat refreshing because I’ve often felt that the **Ctrl** (or **Command** on macOS) is overloaded. Pe, being a native Haiku application, inherits this preference, although the keyboard shortcuts can be changed in its **Preferences**. Unfortunately, I think the **Alt** key ends up being overloaded in Haiku, so the change from one modifier key to another doesn’t actually help relieve that issue (I still have no idea how a user is meant to know a global action from a local action), but it’s an interesting experiment. I find the **Alt** key is easier to press for common actions; it’s right next to the spacebar, after all, and in the future, I may swap **Ctrl** and **Alt** on Linux.

### Alternate computing

Haiku, and BeOS before it, are interesting if only because they let you peek into an alternate reality in which Apple didn’t join in with the UNIX crowd. It’s a fun diversion to look into an OS based on a unique system design, and it’s interesting to see what Apple has borrowed from BeOS, what Haiku has borrowed from UNIX, and how a little variety can help inform each of us about different perspectives and new ideas for interfacing with the tools we use every day of our lives. Whether you’re looking at the OS or the text editor, take an afternoon to get some perspective with Pe.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/pe

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A (Programming keyboard.)
[2]: http://birdhouse.org/beos/bible
[3]: https://opensource.com/article/20/12/jove-emacs
[4]: https://opensource.com/article/20/12/emacs
[5]: https://opensource.com/article/20/12/vi-text-editor
[6]: http://github.com/olta/pe
[7]: https://opensource.com/sites/default/files/uploads/haiku-31_days-pe-opensource.jpg (Blue HAIKU desktop with Pe editor buffer, a white box with gray text)
[8]: http://haiku-os.org
[9]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
