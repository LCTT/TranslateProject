[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with this open source to-do list manager)
[#]: via: (https://opensource.com/article/20/1/open-source-to-do-list)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Get started with this open source to-do list manager
======
Todo is a powerful way to keep track of your task list. Learn how to use
it in the seventh in our series on 20 ways to be more productive with
open source in 2020.
![Team checklist][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Track your tasks with todo

Tasks and to-do lists are very near and dear to my heart. I'm a big fan of productivity (so much so that I do a [podcast][2] about it) and try all sorts of different applications. I've even [given presentations][3] and [written articles][4] about them. So it only makes sense that, when I talk about being productive, task and to-do list tools are certain to come up.

![Getting fancy with Todo.txt][5]

In all honesty, for being simple, cross-platform, and easily synchronized, you cannot go wrong with [todo.txt][6]. It is one of the two to-do list and task management apps that I keep coming back to over and over again (the other is [Org mode][7]). And what keeps me coming back is that it is simple, portable, understandable, and has many great add-ons that don't break it if one machine has them and the others don't. And since it is a Bash shell script, I have never found a system that cannot support it.

#### Set up todo.txt

First things first, you need to install the base shell script and copy the default configuration file to the **~/.todo** directory:


```
git clone <https://github.com/todotxt/todo.txt-cli.git>
cd todo.txt-cli
make
sudo make install
mkdir ~/.todo
cp todo.cfg ~/.todo/config
```

Next, set up the configuration file. I like to uncomment the color settings at this point, but the only thing that must be set up right away is the **TODO_DIR** variable:


```
`export TODO_DIR="$HOME/.todo"`
```

#### Add to-do's

To add your first to-do item, simply type **todo.sh add &lt;NewTodo&gt;**, and it will be added. This will also create three files in **$HOME/.todo/**: todo.txt, done.txt, and reports.txt.

After adding a few items, run **todo.sh ls** to see your to-do list.

![Basic todo.txt list][8]

#### Manage your tasks

You can improve it a little by prioritizing the items. To add a priority to an item, run **todo.sh pri # A**. The number is the number of the task on the list, and the letter "A" is the priority. You can set the priority as anything from A to Z since that's how it will get sorted.

To complete a task, run **todo.sh do #** to mark the item done and move the item to done.txt. Running **todo.sh report** will write a count of done and not done items to reports.txt.

The file format used for all three files is well documented, so you can make changes with your text editor of choice. The basic format of todo.txt is:


```
`(Priority) YYYY-MM-DD Task`
```

The date indicates the due date of a task, if one is set. When editing the file manually, just put an "x" in front of the task to mark it as done. Running **todo.sh archive** will move these items to done.txt, and you can work in that text file and archive the done items when you have time.

#### Set up recurring tasks

I have a lot of recurring tasks that I need to schedule every day/week/month.

![Recurring tasks with the ice_recur add-on][9]

This is where todo.txt's flexibility comes in. By using [add-ons][10] in **~/.todo.actions.d/**, you can add commands and extend the functionality of the base todo.sh. The add-ons are basically scripts that implement specific commands. For recurring tasks, the plugin [ice_recur][11] should fit the bill. By following the instructions on the page, you can set up tasks to recur in a very flexible manner.

![Todour on MacOS][12]

There are a lot of add-ons in the directory, including syncing to some cloud services. There are also links to desktop and mobile apps, so you can keep your to-do list with you on the go.

I've only scratched the surface of todo's functionality, so take some time to dig in and see how powerful this tool is! It really helps me keep on task every day.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-to-do-list

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://productivityalchemy.com/
[3]: https://www.slideshare.net/AllThingsOpen/getting-to-done-on-the-command-line
[4]: https://opensource.com/article/18/2/getting-to-done-agile-linux-command-line
[5]: https://opensource.com/sites/default/files/uploads/productivity_7-1.png
[6]: http://todotxt.org/
[7]: https://orgmode.org/
[8]: https://opensource.com/sites/default/files/uploads/productivity_7-2.png (Basic todo.txt list)
[9]: https://opensource.com/sites/default/files/uploads/productivity_7-3.png (Recurring tasks with the ice_recur add-on)
[10]: https://github.com/todotxt/todo.txt-cli/wiki/Todo.sh-Add-on-Directory
[11]: https://github.com/rlpowell/todo-text-stuff
[12]: https://opensource.com/sites/default/files/uploads/productivity_7-4.png (Todour on MacOS)
