[#]: subject: (How to Give Sudo Permission to Users on Ubuntu Linux [Beginner’s Tip])
[#]: via: (https://itsfoss.com/add-sudo-user-ubuntu/)
[#]: author: (Hunter Wittenborn https://itsfoss.com/author/hunter/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Give Sudo Permission to Users on Ubuntu Linux [Beginner’s Tip]
======

When [installing Ubuntu][1], you’re asked to create a user, and that user gets sudo access by default. That’s good, because you need root privileges to do things like perform updates and install packages(probably wouldn’t be too nice if any user could do that).

But what about new users you created after installing [Ubuntu][2]? What if the new user also needs sudo permissions?

In this tutorial, I’ll go over the steps you need for adding a user to sudoers in Ubuntu, from both the command line and a GUI.

The GUI method will work for the desktop version of Ubuntu, while the command line method will work for both the desktop and server versions.

Note: this tutorial is _**not**_ about creating users in Ubuntu. I’m assuming any users you’re doing this for have already been created. _**Lastly, to give sudo access to another user, you must have sudo access yourself.**_

### Giving sudo permissions from the command line

Giving a user sudo permission from the command line is just a single command if you know the username of the user:

```
sudo usermod -aG sudo username
```

The above command adds the user to the `sudo` group, which is used to track the users who are allowed to have sudo permissions. Just adding the user to the `sudo` group takes care of everything. Pretty easy, right?

Let’s go over what that command just did:

  * usermod: The [usermod command][3] is used for modifying an existing user in Linux.
  * -aG: The `a` option means append(or add), `G` is for groups. So, this adds the specified group to the specified user, without touching the user’s existing groups. If you exclude the `a` option, the user would be removed from all its groups except sudo (you don’t want that).
  * sudo: the second sudo in the command represents the sudo group.
  * username: This is the name of the user you want to add to the sudo group.



If you don’t know the exact username, [you can list the users on your system][4] using the `compgen -u` command. You’ll find the username near the end of the command’s output.

#### How to verify if the user has sudo access

There are [various ways you can check if a user has sudo access][5]. You can check if the user is part of `sudo` group with the following:

```
groups username
```

![][6]

Alternatively, you can log in as the other user you just gave sudo access to and run a command with sudo. For example:

```
sudo echo "I am root!"
```

If everything’s set up correctly, it’ll output `I am root!`. If you get an error about the user not being in the sudoers file, try going through the instructions again, or you can use the graphical method below.

### Giving sudo access to a user on Ubuntu Desktop

Giving a user sudo permissions on Ubuntu Desktop is a simple two-step process:

Step 1: Open up the Settings application, go to ‘Users’ and click ‘Unlock’. Enter your password when prompted to do so.

![][7]

Step 2: Toggle the Administrator switch to on.

![][8]

And that’s it! If you want to see if it worked, log in as the user you gave administrator permissions to and try running the same command as before. Look for the same output as mentioned before.

```
sudo echo "I am root!"
```

### Wrapping up

With that, you’ve given a user sudo permissions! The commands should be mostly, if not completely functional on other distros such as Debian, Fedora, or Arch Linux.

If you have any questions or suggestions, feel free to leave them in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/add-sudo-user-ubuntu/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu/
[2]: https://ubuntu.com/
[3]: https://linuxhandbook.com/usermod-command/
[4]: https://linuxhandbook.com/linux-list-users/
[5]: https://linuxhandbook.com/check-if-user-has-sudo-rights/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/sudo-group_check.png?resize=767%2C508&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/sudo-settings_unlock.jpg?resize=800%2C534&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/sudo-settings_admin.jpg?resize=800%2C536&ssl=1
