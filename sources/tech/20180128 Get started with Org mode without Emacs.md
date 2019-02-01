[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with Org mode without Emacs)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-org-mode)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

Get started with Org mode without Emacs
======
No, you don't need Emacs to use Org, the 16th in our series on open source tools that will make you more productive in 2019.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the 16th of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### Org (without Emacs)

[Org mode][1] (or just Org) is not in the least bit new, but there are still many people who have never used it. They would love to try it out to get a feel for how Org can help them be productive. But the biggest barrier is that Org is associated with Emacs, and many people think one requires the other. Not so! Org can be used with a variety of other tools and editors once you understand the basics.

![](https://opensource.com/sites/default/files/uploads/org-1.png)

Org, at its very heart, is a structured text file. It has headers, subheaders, and keywords that allow other tools to parse files into agendas and to-do lists. Org files can be edited with any flat-text editor (e.g., [Vim][2], [Atom][3], or [Visual Studio Code][4]), and many have plugins that help create and manage Org files.

A basic Org file looks something like this:

```
* Task List
** TODO Write Article for Day 16 - Org w/out emacs
   DEADLINE: <2019-01-25 12:00>
*** DONE Write sample org snippet for article
    - Include at least one TODO and one DONE item
    - Show notes
    - Show SCHEDULED and DEADLINE
*** TODO Take Screenshots
** Dentist Appointment
   SCHEDULED: <2019-01-31 13:30-14:30>
```

Org uses an outline format that uses ***** as bullets to indicate an item's level. Any item that begins with the word TODO (yes, in all caps) is just that—a to-do item. The work DONE indicates it is completed. SCHEDULED and DEADLINE indicate dates and times relevant to the item. If there's no time in either field, the item is considered an all-day event.

With the right plugins, your favorite text editor becomes a powerhouse of productivity and organization. For example, the [vim-orgmode][5] plugin's features include functions to create Org files, syntax highlighting, and key commands to generate agendas and comprehensive to-do lists across files.

![](https://opensource.com/sites/default/files/uploads/org-2.png)

The Atom [Organized][6] plugin adds a sidebar on the right side of the screen that shows the agenda and to-do items in Org files. It can read from multiple files by default with a path set up in the configuration options. The Todo sidebar allows you to click on a to-do item to mark it done, then automatically updates the source Org file.

![](https://opensource.com/sites/default/files/uploads/org-3.png)

There are also a whole host of tools that "speak Org" to help keep you productive. With libraries in Python, Perl, PHP, NodeJS, and more, you can develop your own scripts and tools. And, of course, there is also [Emacs][7], which has Org support within the core distribution.

![](https://opensource.com/sites/default/files/uploads/org-4.png)

Org mode is one of the best tools for keeping on track with what needs to be done and when. And, contrary to myth, it doesn't need Emacs, just a text editor.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-org-mode

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://orgmode.org/
[2]: https://www.vim.org/
[3]: https://atom.io/
[4]: https://code.visualstudio.com/
[5]: https://github.com/jceb/vim-orgmode
[6]: https://atom.io/packages/organized
[7]: https://www.gnu.org/software/emacs/
