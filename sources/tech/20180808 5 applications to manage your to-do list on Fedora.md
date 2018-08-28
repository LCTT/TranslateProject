translating---geekpi

5 applications to manage your to-do list on Fedora
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/todoapps-816x345.jpg)

Effective management of your to-do list can do wonders for your productivity. Some prefer just keeping a to-do list in a text file, or even just using a notepad and pen. For users that want more out of their to-do list, they often turn to an application. In this article we highlight 4 graphical applications and a terminal-based tool for managing your to-do list.

### GNOME To Do

[GNOME To Do][1] is a personal task manager designed specifically for the GNOME desktop (Fedora Workstation’s default desktop). When comparing GNOME To Do with some others in this list, it is has a range of neat features.

GNOME To Do provides organization of tasks by lists, and the ability to assign a colour to that list. Additionally, individual tasks can be assigned due dates & priorities, and notes for each task. Futhermore, GNOME To Do has extensions, allowing even more features, including support for [todo.txt][2] and syncing with online services such as [todoist][3].

![][4]

Install GNOME To Do either by using the Software application, or using the following command in the Terminal:
```
sudo dnf install gnome-todo

```

### Getting things GNOME!

Before GNOME To Do existed, the go-to application for tracking tasks on GNOME was [Getting things GNOME!][5] This older-style GNOME application has a multiple window layout, allowing you to show the details of multiple tasks at the same time. Rather than having lists of tasks, GTG has the ability to add sub-tasks to tasks and even to sub-tasks. GTG also has the ability to add due dates and start dates. Syncing to other apps and services is also possible in GTG via plugins.

![][6]

Install Getting Things GNOME either by using the Software application, or using the following command in the Terminal:
```
sudo dnf install gtg

```

### Go For It!

[Go For It!][7] is a super-simple task management application. It is used to simply create a list of tasks, and mark them as done when completed. It does not have the ability to group tasks, or create sub-tasks. By default, Go For It! stored tasks in the todo.txt format, allowing simpler syncing to online services and other applications. Additionally, Go For It! contains a simple timer to track how much time you have spent on the current task.

![][8]

Go For It is available to download from the Flathub application repository. To install, simply [enable Flathub as a software source][9], and then install via the Software application.

### Agenda

If you are looking for a no-fuss super simple to-do application, look no further than [Agenda][10]. Create tasks, mark them as complete, and then delete them from your list. Agenda shows all tasks (completed or open) until you remove them.

![][11]

Agenda is available to download from the Flathub application repository. To install, simply [enable Flathub as a software source][9], and then install via the Software application.

### Taskwarrior

[Taskwarrior][12] is a flexible command-line task management program. It is highly customizable, but can also be used “right out of the box.” Using simple commands, you can create tasks, mark them as complete, and list current open tasks. Additionally, tasks can be tagged, added to projects, searched and filtered. Furthermore, you can set up recurring tasks, and apply due dates to tasks.

[This previous article on the Fedora Magazine][13] provides a good overview of getting started with Taskwarrior.

![][14]

Install Taskwarrior with this command in the Terminal:
```
sudo dnf install task

```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/5-tools-to-manage-your-to-do-list-on-fedora/

作者：[Ryan Lerch][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/introducing-flatpak/
[1]:https://wiki.gnome.org/Apps/Todo/
[2]:http://todotxt.org/
[3]:https://en.todoist.com/
[4]:https://fedoramagazine.org/wp-content/uploads/2018/08/gnome-todo.png
[5]:https://wiki.gnome.org/Apps/GTG
[6]:https://fedoramagazine.org/wp-content/uploads/2018/08/gtg.png
[7]:http://manuel-kehl.de/projects/go-for-it/
[8]:https://fedoramagazine.org/wp-content/uploads/2018/08/goforit.png
[9]:https://fedoramagazine.org/install-flathub-apps-fedora/
[10]:https://github.com/dahenson/agenda
[11]:https://fedoramagazine.org/wp-content/uploads/2018/08/agenda.png
[12]:https://taskwarrior.org/
[13]:https://fedoramagazine.org/getting-started-taskwarrior/
[14]:https://fedoramagazine.org/wp-content/uploads/2018/08/taskwarrior.png
