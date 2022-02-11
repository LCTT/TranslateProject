[#]: subject: "Fixing Repository ‘http://repo.vivaldi.com/stable/deb stable InRelease’ Doesn’t Support Architecture ‘i386’"
[#]: via: "https://itsfoss.com/repository-doesnt-support-architecture-i386/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fixing Repository ‘http://repo.vivaldi.com/stable/deb stable InRelease’ Doesn’t Support Architecture ‘i386’
======

Recently, an It’s FOSS reader asked for an issue he was facing with Vivaldi browser while [updating his Ubuntu system][1]. The apt update command showed an ‘error message’:

**N: Skipping acquisition of configured file ‘main/binary-i386/Packages’, as repository ‘[http://repo.vivaldi.com/stable/deb][2] stable InRelease’ doesn’t support architecture ‘i386’**

Since I already had [Vivaldi installed on my Ubuntu][3], it was easy for me to reproduce the issue.

![][4]

Though this issue was encountered with [Vivaldi][5], it could occur with some other [external repository added to Ubuntu][6] or Debian based distributions.

Let me explain why this happens and what can you do about it.

### Why do you see this “repository doesn’t support architecture i686” message?

First of all, this is not an error message. Error messages start with E. This is a notice, an information and hence at the beginning of the line. Your update is working fine and even the problematic software will be updated when there is an update.

So, why do see this message then? It’s because the way Vivaldi (or other software in question) has been added to your system.

If you look at the content of /etc/apt/sources.list.d/vivaldi.list, you’ll find this line:

```

    deb http://repo.vivaldi.com/stable/deb/ stable main

```

The repository does not specify any architecture. That should not have caused an issue but since May this year, Vivaldi supported AMD64, ARM64 and i386. In case you didn’t know, i386 means 32-bit.

After that, Vivaldi removed support for 32-bit Linux. But probably they continued to keep a folder for i386. However, this folder has now been removed and thus your system notifies that the said repository doesn’t support i386 architecture.

You can ignore this notice but if it bothers you too much, you can make it disappear.

### ‘Fixing’ the issue

[Check if your system is 32-bit or 64-bit][7]. If it is 64-bit, here’s what you can do.

You edit the repository detail of Vivaldi (or the application causing this issue) and make it look for 64 bit package only. Here’s how to do that.

In a terminal, use this command:

```

    sudo gedit /etc/apt/sources.list.d/vivaldi.list &

```

This will open the file in gedit with sudo in the background. The file should look like this:

![][8]

Change the line:

```

    deb http://repo.vivaldi.com/stable/deb/ stable main

```

to this (for non-ARM devices):

```

    deb [arch=amd64] http://repo.vivaldi.com/stable/deb/ stable main

```

You add the [arch=amd64] to specify the architecture of the package you want. It should now look like this:

![][9]

Save and close the editor. Don’t mind the messages in the terminal. Just press enter in the terminal to gain control, if required.

Now, if you run the update, you should not see the “Repository Doesn’t Support Architecture i386” anymore.

```

    sudo apt update

```

This editing of the repository file can also be done from the Software &amp; Updates tool. That’s entirely up to you.

However, only in case of Vivaldi, the changes will be reverted because as the file says, any modification will be lost. As a workaround, you can rename the vivaldi.list file to something else.

```

    sudo mv /etc/apt/sources.list.d/vivaldi.list /etc/apt/sources.list.d/vivaldi-new.list

```

And update the system now.

I hope this helps you.

--------------------------------------------------------------------------------

via: https://itsfoss.com/repository-doesnt-support-architecture-i386/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/update-ubuntu/
[2]: https://repo.vivaldi.com/stable/deb
[3]: https://itsfoss.com/install-vivaldi-ubuntu-linux/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/vivaldi-repository-issue.png?resize=800%2C422&ssl=1
[5]: https://vivaldi.com/
[6]: https://itsfoss.com/adding-external-repositories-ubuntu/
[7]: https://itsfoss.com/32-bit-64-bit-ubuntu/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/vivalid-repo-ubuntu.png?resize=800%2C258&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/vivaldi-remove-32-bit-repo.png?resize=800%2C258&ssl=1
