[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with TaskBoard, a lightweight kanban board)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-taskboard)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

Get started with TaskBoard, a lightweight kanban board
======
Check out the ninth tool in our series on open source tools that will make you more productive in 2019.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the ninth of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### TaskBoard

As I wrote in the [second article][1] in this series, [kanban boards][2] are pretty popular these days. And not all kanban boards are created equal. [TaskBoard][3] is a PHP application that is easy to set up on an existing web server and has a set of functions that make it easy to use and manage.

![](https://opensource.com/sites/default/files/uploads/taskboard-1.png)

[Installation][4] is as simple as unzipping the files on your web server, running a script or two, and making sure the correct directories are accessible. The first time you start it up, you're presented with a login form, and then it's time to start adding users and making boards. Board creation options include adding the columns you want to use and setting the default color of the cards. You can also assign users to boards so everyone sees only the boards they need to see.

User management is lightweight, and all accounts are local to the server. You can set a default board for everyone on the server, and users can set their own default boards, too. These options can be useful when someone works on one board more than others.

![](https://opensource.com/sites/default/files/uploads/taskboard-2.png)

TaskBoard also allows you to create automatic actions, which are actions taken upon changes to user assignment, columns, or card categories. Although TaskBoard is not as powerful as some other kanban apps, you can set up automatic actions to make cards more visible for board users, clear due dates, and auto-assign new cards to people as needed. For example, in the screenshot below, if a card is assigned to the "admin" user, its color is changed to red, and when a card is assigned to my user, its color is changed to teal. I've also added an action to clear an item's due date if it's added to the "To-Do" column and to auto-assign cards to my user when that happens.

![](https://opensource.com/sites/default/files/uploads/taskboard-3.png)

The cards are very straightforward. While they don't have a start date, they do have end dates and a points field. Points can be used for estimating the time needed, effort required, or just general priority. Using points is optional, but if you are using TaskBoard for scrum planning or other agile techniques, it is a really handy feature. You can also filter the view by users and categories. This can be helpful on a team with multiple work streams going on, as it allows a team lead or manager to get status information about progress or a person's workload.

![](https://opensource.com/sites/default/files/uploads/taskboard-4.png)

If you need a reasonably lightweight kanban board, check out TaskBoard. It installs quickly, has some nice features, and is very, very easy to use. It's also flexible enough to be used for development teams, personal task tracking, and a whole lot more.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-taskboard

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/19/1/productivity-tool-wekan
[2]: https://en.wikipedia.org/wiki/Kanban
[3]: https://taskboard.matthewross.me/
[4]: https://taskboard.matthewross.me/docs/
