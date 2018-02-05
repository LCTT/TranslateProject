Getting Started with Taskwarrior
======
Taskwarrior is a flexible [command-line task management program][1]. In their [own words][2]:

Taskwarrior manages your TODO list from your command line. It is flexible, fast, efficient, unobtrusive, does its job then gets out of your way.

Taskwarrior is highly customizable, but can also be used "right out of the box." In this article, we'll show you the basic commands to add and complete tasks. Then we'll cover a couple more advanced commands. And finally, we'll show you some basic configuration settings to begin customizing your setup.

### Installing Taskwarrior

Taskwarrior is available in the Fedora repositories, so installing it is simple:
```
sudo dnf install task

```

Once installed, run `task`. This first run will create a `~/.taskrc` file for you.
```
$ **task**
A configuration file could not be found in ~

Would you like a sample /home/link/.taskrc created, so Taskwarrior can proceed? (yes/no) yes
[task next]
No matches.

```

### Adding Tasks

Adding tasks is fast and unobtrusive.
```
$ **task add Plant the wheat**
Created task 1.

```

Run `task` or `task list` to show upcoming tasks.
```
$ **task list**

ID Age Description Urg
 1 8s Plant the wheat 0

1 task

```

Let's add a few more tasks to round out the example.
```
$ **task add Tend the wheat**
Created task 2.
$ **task add Cut the wheat**
Created task 3.
$ **task add Take the wheat to the mill to be ground into flour**
Created task 4.
$ **task add Bake a cake**
Created task 5.

```

Run `task` again to view the list.
```
[task next]

ID Age Description Urg
 1 3min Plant the wheat 0
 2 22s Tend the wheat 0
 3 16s Cut the wheat 0
 4 8s Take the wheat to the mill to be ground into flour 0
 5 2s Bake a cake 0

5 tasks

```

### Completing Tasks

To mark a task as complete, look up its ID and run:
```
$ **task 1 done**
Completed task 1 'Plant the wheat'.
Completed 1 task.

```

You can also mark a task done with its description.
```
$ **task 'Tend the wheat' done**
Completed task 1 'Tend the wheat'.
Completed 1 task.

```

With `add`, `list` and `done`, you're all ready to get started with Taskwarrior.

### Setting Due Dates

Many tasks do not require a due date:
```
task add Finish the article on Taskwarrior

```

But sometimes, setting a due date is just the kind of motivation you need to get productive. Use the `due` modifier when adding a task to set a specific due date.
```
task add Finish the article on Taskwarrior due:tomorrow

```

`due` is highly flexible. It accepts specific dates ("2017-02-02"), or ISO-8601 ("2017-02-02T20:53:00Z"), or even relative time ("8hrs"). See the [Date & Time][3] documentation for all the examples.

Dates go beyond due dates too. Taskwarrior has `scheduled`, `wait`, and `until`.
```
task add Proof the article on Taskwarrior scheduled:thurs

```

Once the date (Thursday in this example) passes, the task is tagged with the `READY` virtual tag. It will then show up in the `ready` report.
```
$ **task ready**

ID Age S Description Urg
 1 2s 1d Proof the article on Taskwarrior 5

```

To remove a date, `modify` the task with a blank value:
```
$ task 1 modify scheduled:

```

### Searching Tasks

No task list is complete without the ability to search with regular expressions, right?
```
$ **task '/.* the wheat/' list**

ID Age Project Description Urg
 2 42min Take the wheat to the mill to be ground into flour 0
 1 42min Home Cut the wheat 1

2 tasks

```

### Customizing Taskwarrior

Remember that file we created back in the beginning (`~/.taskrc`). Let's take at the defaults:
```
# [Created by task 2.5.1 2/9/2017 16:39:14]
# Taskwarrior program configuration file.
# For more documentation, see http://taskwarrior.org or try 'man task', 'man task-color',
# 'man task-sync' or 'man taskrc'

# Here is an example of entries that use the default, override and blank values
# variable=foo -- By specifying a value, this overrides the default
# variable= -- By specifying no value, this means no default
# #variable=foo -- By commenting out the line, or deleting it, this uses the default

# Use the command 'task show' to see all defaults and overrides

# Files
data.location=~/.task

# Color theme (uncomment one to use)
#include /usr//usr/share/task/light-16.theme
#include /usr//usr/share/task/light-256.theme
#include /usr//usr/share/task/dark-16.theme
#include /usr//usr/share/task/dark-256.theme
#include /usr//usr/share/task/dark-red-256.theme
#include /usr//usr/share/task/dark-green-256.theme
#include /usr//usr/share/task/dark-blue-256.theme
#include /usr//usr/share/task/dark-violets-256.theme
#include /usr//usr/share/task/dark-yellow-green.theme
#include /usr//usr/share/task/dark-gray-256.theme
#include /usr//usr/share/task/dark-gray-blue-256.theme
#include /usr//usr/share/task/solarized-dark-256.theme
#include /usr//usr/share/task/solarized-light-256.theme
#include /usr//usr/share/task/no-color.theme


```

The only active option right now is `data.location=~/.task`. To view active configuration settings (including the built-in defaults), run `show`.
```
task show

```

To change a setting, use `config`.
```
$ **task config displayweeknumber no**
Are you sure you want to add 'displayweeknumber' with a value of 'no'? (yes/no) yes
Config file /home/link/.taskrc modified.

```

### Examples

These are just some of the things you can do with Taskwarrior.

Assign a project to your tasks:
```
task 'Fix leak in the roof' modify project:Home

```

Use `start` to mark what you were working on. This can help you remember what you were working on after the weekend:
```
task 'Fix bug #141291' start

```

Use relevant tags:
```
task add 'Clean gutters' +weekend +house

```

Be sure to read the [complete documentation][4] to learn all the ways you can catalog and organize your tasks.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-taskwarrior/

作者：[Link Dupont][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/linkdupont/
[1]:https://taskwarrior.org/
[2]:https://taskwarrior.org/docs/start.html
[3]:https://taskwarrior.org/docs/dates.html
[4]:https://taskwarrior.org/docs/
