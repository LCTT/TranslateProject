translating---geekpi

How to kill a process or stop a program in Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/x_stop_terminate_program_kill.jpg?itok=9rM8i9x8)
When a process misbehaves, you might sometimes want to terminate or kill it. In this post, we'll explore a few ways to terminate a process or an application from the command line as well as from a graphical interface, using [gedit][1] as a sample application.

### Using the command line/termination characters

#### Ctrl + C

One problem invoking `gedit` from the command line (if you are not using `gedit &`) is that it will not free up the prompt, so that shell session is blocked. In such cases, Ctrl+C (the Control key in combination with 'C') comes in handy. That will terminate `gedit` and all work will be lost (unless the file was saved). Ctrl+C sends the `SIGINT` signal to `gedit`. This is a stop signal whose default action is to terminate the process. It instructs the shell to stop `gedit` and return to the main loop, and you'll get the prompt back.
```
$ gedit

^C

```

#### Ctrl + Z

This is called a suspend character. It sends a `SIGTSTP` signal to process. This is also a stop signal, but the default action is not to kill but to suspend the process.

It will stop (kill/terminate) `gedit` and return the shell prompt.
```
   $ gedit

   ^Z

   [1]+  Stopped                 gedit

   $

```

Once the process is suspended (in this case, `gedit`), it is not possible to write or do anything in `gedit`. In the background, the process becomes a job. This can be verified by the `jobs` command.
```
  $ jobs

  [1]+  Stopped                 gedit

```

`jobs` allows you to control multiple processes within a single shell session. You can stop, resume, and move jobs to the background or foreground as needed.

Let's resume `gedit` in the background and free up a prompt to run other commands. You can do this using the `bg` command, followed by job ID (notice `[1]` from the output of `jobs` above. `[1]` is the job ID).
```
   $ bg 1

   [1]+ gedit &amp;

```

This is similar to starting `gedit` with `&,`:
```
   $ gedit &amp;

```

### Using kill

`kill` allows fine control over signals, enabling you to signal a process by specifying either a signal name or a signal number, followed by a process ID, or PID.

What I like about `kill` is that it can also work with job IDs. Let's start `gedit` in the background using `gedit &`. Assuming I have a job ID of `gedit` from the `jobs` command, let's send `SIGINT` to `gedit`:
```
   $ kill -s SIGINT %1

```

Note that the job ID should be prefixed with `%`, or `kill` will consider it a PID.

`kill` can work without specifying a signal explicitly. In that case, the default action is to send `SIGTERM`, which will terminate the process. Execute `kill -l` to list all signal names, and use the `man kill` command to read the man page.

### Using killall

If you don't want to specify a job ID or PID, `killall` lets you specify a process by name. The simplest way to terminate `gedit` using `killall` is:
```
   $ killall gedit

```

This will kill all the processes with the name `gedit`. Like `kill`, the default signal is `SIGTERM`. It has the option to ignore case using `-I`:
```
   $ gedit &amp;

   [1] 14852



   $ killall -I GEDIT

   [1]+  Terminated              gedit

```

To learn more about various flags provided by `killall` (such as `-u`, which allows you to kill user-owned processes) check the man page (`man killall`)

### Using xkill

Have you ever encountered an issue where a media player, such as [VLC][2], grayed out or hung? Now you can find the PID and kill the application using one of the commands listed above or use `xkill`.

![Using xkill][3]

`xkill` allows you to kill a window using a mouse. Simply execute `xkill` in a terminal, which should change the mouse cursor to an **x** or a tiny skull icon. Click **x** on the window you want to close. Be careful using `xkill`, though—as its man page explains, it can be dangerous. You have been warned!

Refer to the man page of each command for more information. You can also explore commands like `pkill` and `pgrep`.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/how-kill-process-stop-program-linux

作者：[Sachin Patil][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/psachin
[1]:https://wiki.gnome.org/Apps/Gedit
[2]:https://www.videolan.org/vlc/index.html
[3]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/xkill_gedit.png?itok=TBvMw0TN (Using xkill)
