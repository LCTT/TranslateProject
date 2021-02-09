[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Make sysadmin work on Fedora easier with screen)
[#]: via: (https://fedoramagazine.org/make-sysadmin-work-on-fedora-easier-with-screen/)
[#]: author: (Carmine Zaccagnino https://fedoramagazine.org/author/carzacc/)

Make sysadmin work on Fedora easier with screen
======

![][1]

When you manage a Linux instance, you’ll find that your job is made much easier by the many tools designed specifically to deal with something specific within the system. For example, if you need to install packages, you have easy-to-use package managers that make that a breeze. If you need to create, resize or delete filesystems, you can do so using tools that are built to be used by humans. The same goes for managing services and browsing logs with [systemd][2] using the _systemctl_ and _journalctl_ commands respectively. The _screen_ tool is another such example.

You can run all of those tools directly at the command line interface. But if you’re connecting to a server remotely using SSH, sometimes you need another layer between you and the operating system so the command you’re running doesn’t stop if your remote connection terminates. Sysadmins do this to prevent sudden termination in case of a connection issue, but also on purpose to run a command that needs to keep running indefinitely in the background. Enter the _screen_ utility.

### Introducing screen

The _screen_ tool allows you to have multiple sessions (called _screens_) that are independent from each other and that you can name, leave and join as you desire. It’s multi-tasking for the remote CLI. You can get started with it simply by running this command:

```
$ screen
```

The command creates a screen and connect you to it: your current session is now a screen. You can run any command that does something and doesn’t automatically terminate after a few seconds. For example, you might call a web app executable or a game server. Then press **Ctrl+A** and, right after that, the **D** key and you will _detach_ from the screen, leaving it running in the background.

The **Ctrl+A** combination, given that it is part of every _screen_ command, is often shortened in documentation to **C-a**. Then the _detach_ command used earlier can be described simply as **C-a d**.

#### Getting in and out of sessions

If you want to connect to that screen again, run _screen -r_ and you will _attach_ to that screen. Just running **screen** will create a new screen, and subsequent _screen -r_ commands will print out something like this:

```
There are several suitable screens on:
     5589.pts-0.hostname   (Detached)
     5536.pts-0.hostname   (Detached)
 Type "screen [-d] -r [pid.]tty.host" to resume one of them.
```

You can then choose whether to resume the first or the second screen you created by running either one of these commands:

```
$ screen -r 5536
$ screen -r 5589
```

Adding the rest of the name of the string is optional in this case.

#### Named screens

If you know you’ll have multiple screens, you might want to be able to connect to a screen using a name you choose. This is easier than choosing from a list of numbers that only reflect the process IDs of the screen sessions. To do that, use the _-S_ option as in the following example:

```
$ screen -S mywebapp
```

Then you can resume that screen in the future using this command:

```
$ screen -r mywebapp
```

#### Starting a process in the background using screen

An optional argument is the command to be executed inside the created session. For example:

```
$ screen -S session_name command args
```

This would be the same as running:

```
$ screen -S session_name
```

…And then running this command inside the _screen_ session:

```
$ command args
```

The screen session will terminate when the command finishes its execution.

This is made particularly useful by passing the **-dm** option, which starts the screen in the background without attaching to it. For example, you can copy a very large file in the background by running this command:

```
$ screen -S copy -d -m cp /path/to/file /path/to/output
```

### Other screen features

Now that you’ve seen the basics, let’s see some of the other most commonly used screen features.

#### Easily switching between windows in a screen

When inside a screen, you can create a new window using **C-a c**. After you do that, you can switch between the windows using **C-a n** to go to the next one and **C-a p** to go to the previous window. You can destroy (kill) the current window with **C-a k**.

#### Copying and pasting text

The screen tool also enables you to copy any text on the screen and paste it later wherever you can type some text.

The **C-a [** keybinding frees your cursor of any constraints and lets it go anywhere your will takes it using the arrow keys on your keyboard. To select and copy text, move to the start of the string you want to copy, and press **Enter** on the keyboard. Then move the cursor to the end of the text you want to copy and press **Enter** again.

After you’ve done that, use **C-a ]** to paste that text in your shell. Or you can open a text editor like _vim_ or _nano_ and paste the text you copied there.

### Important notes about screen

Here are some other tips to keep in mind when using this utility.

#### Privileged sessions vs. sudo inside a screen

What if you need to run a command with root privileges inside screen? You can run either of these commands:

```
$ screen -S sessionname sudo command
$ sudo screen -S sessionname command
```

Notice that the second command is like running this command:

```
# screen -S sessionname command
```

Seeing things this way makes it a lot more obvious coupled with the fact that each screen is associated to a user:

  * The first one creates a screen with root privileges that can be accessed by the current user even if, within that screen, they switch to another user or _root_ using the _sudo -i_ command.
  * The second one creates a screen that can only be accessed by the _root_ user, or by running _sudo screen -r_ as a user with the [appropriate _sudo_ access][3].



#### Notes about screen in systemd units

You might be tempted to run a screen session in the background as part of a systemd unit executed at startup, just like any Unix daemon. That way you can resume the screen session and interact with whatever you ran that way. That can work, but you need to consider that it requires the right setup.

By default, [systemd assumes][4] services are either _oneshot,_ meaning they set up something and then shut down, or _simple_. A service is simple by default when you create a unit file with no _Type_. What you actually need to do is to set the _Type_ to _forking_, which describes _screen_‘s actual behavior when the **-dm** option is passed. It starts the process and then forks itself, leaving the process running in the background while the foreground process closes.

If you don’t set that, that _screen_ behavior is interpreted by systemd as the service exiting or failing. This causes systemd to kill the background process when the foreground process exits, which is not what you want.

* * *

_Photo by [Vlad Tchompalov][5] on [Unsplash][6]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/make-sysadmin-work-on-fedora-easier-with-screen/

作者：[Carmine Zaccagnino][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/carzacc/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/12/screen-816x345.jpg
[2]: https://fedoramagazine.org/what-is-an-init-system/
[3]: https://fedoramagazine.org/howto-use-sudo/
[4]: https://www.freedesktop.org/software/systemd/man/systemd.service.html
[5]: https://unsplash.com/@tchompalov?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[6]: https://unsplash.com/s/photos/screen?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
