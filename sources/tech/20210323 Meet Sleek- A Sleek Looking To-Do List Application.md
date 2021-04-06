[#]: subject: (Meet Sleek: A Sleek Looking To-Do List Application)
[#]: via: (https://itsfoss.com/sleek-todo-app/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Meet Sleek: A Sleek Looking To-Do List Application
======

There are plenty of [to-do list applications available for Linux][1]. There is one more added to that list in the form of Sleek.

### Sleek to-do List app

Sleek is nothing extraordinary except for its looks perhaps. It provides an Electron-based GUI for todo.txt.

![][2]

For those not aware, [Electron][3] is a framework that lets you use JavaScript, HTML and CSS for building cross-platform desktop apps. It utilizes Chromium and Node.js for this purpose and this is why some people don’t like their desktop apps running a browser underneath it.

[Todo.txt][4] is a text-based file system and if you follow its markup syntax, you can create a to-do list. There are tons of mobile, desktop and CLI apps that use Todo.txt underneath it.

Don’t worry you don’t need to know the correct syntax for todo.txt. Since Sleek is a GUI tool, you can utilize its interface for creating to-do lists without special efforts.

The advantage of todo.txt is that you can copy or export your files and use it on any To Do List app that supports todo.txt. This gives you portability to keep your data while moving between applications.

### Experience with Sleek

![][5]

Sleek gives you option to create a new to-do.txt or open an existing one. Once you create or open one, you can start adding items to the list.

Apart from the normal checklist, you can add tasks with due date.

![][6]

While adding a due date, you can also set the repetition for the tasks. I find this weird that you can not create a recurring task without setting a due date to it. This is something the developer should try to fix in the future release of the application.

![][7]

You can check a task complete. You can also choose to hide or show completed tasks with options to sort tasks based on priority.

Sleek is available in both dark and light theme. There is a dedicated option on the left sidebar to change themes. You can, of course, change it from the settings.

![][8]

There is no provision to sync your to-do list app. As a workaround, you can save your todo.txt file in a location that is automatically sync with Nextcloud, Dropbox or some other cloud service. This also opens the possibility of using it on mobile with some todo.txt mobile client. It’s just a suggestion, I haven’t tried it myself.

### Installing Sleek on Linux

Since Sleek is an Electron-based application, it is available for Windows as well as Linux.

For Linux, you can install it using Snap or Flatpak, whichever you prefer.

For Snap, use the following command:

```
sudo snap install sleek
```

If you have enabled Flatpak and added Flathub repository, you can install it using this command:

```
flatpak install flathub com.github.ransome1.sleek
```

As I said at the beginning of this article, Sleek is nothing extraordinary. If you prefer a modern looking to-do list app with option to import and export your tasks list, you may give this open source application a try.

--------------------------------------------------------------------------------

via: https://itsfoss.com/sleek-todo-app/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/to-do-list-apps-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/sleek-to-do-list-app.png?resize=800%2C630&ssl=1
[3]: https://www.electronjs.org/
[4]: http://todotxt.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/sleek-to-do-list-app-1.png?resize=800%2C521&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/sleek-to-do-list-app-due-tasks.png?resize=800%2C632&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/sleek-to-do-list-app-repeat-tasks.png?resize=800%2C632&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/sleek-to-do-list-app-light-theme.png?resize=800%2C521&ssl=1
