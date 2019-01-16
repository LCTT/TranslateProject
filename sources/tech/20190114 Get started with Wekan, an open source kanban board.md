[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with Wekan, an open source kanban board)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-wekan)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

Get started with Wekan, an open source kanban board
======
In the second article in our series on open source tools that will make you more productive in 2019, check out Wekan.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kanban-board.png?itok=tXC0dkKV)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the second of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### Wekan

[Kanban][1] boards are a mainstay of today's agile processes. And many of us (myself included) use them to organize not just our work but also our personal lives. I know several artists who use apps like [Trello][2] to keep track of their commision lists as well as what's in progress and what's complete.

![](https://opensource.com/sites/default/files/uploads/wekan-1.png)

But these apps are often linked to a work account or a commercial service. Enter [Wekan][3], an open source kanban board you can run locally or on the service of your choice. Wekan offers much of the same functionality as other Kanban apps, such as creating boards, lists, swimlanes, and cards, dragging and dropping between lists, assigning to users, labeling cards, and doing pretty much everything else you'd expect in a modern kanban board.

![](https://opensource.com/sites/default/files/uploads/wekan-2.png)

The thing that distinguishes Wekan from most other kanban boards is the built-in rules. While most other boards support emailing updates, Wekan allows you to set up triggers when taking actions on cards, checklists, and labels.

![](https://opensource.com/sites/default/files/uploads/wekan-3.png)

Wekan can then take actions like moving cards, updating labels, adding checklists, and sending emails.

![](https://opensource.com/sites/default/files/uploads/wekan-4.png)

Setting up Wekan locally is a snap—literally. If your desktop supports [Snapcraft][4] applications, installing is as easy as:

```
sudo snap install wekan
```

It also supports Docker, which means installing on a server is reasonably straightforward on most servers and desktops.

Overall, if you want a nice kanban board that you can run yourself, Wekan has you covered.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-wekan

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Kanban
[2]: https://www.trello.com
[3]: https://wekan.github.io/
[4]: https://snapcraft.io/
