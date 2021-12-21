[#]: subject: "Fixing “Target Packages is configured multiple times” Error in Ubuntu & Debian Based Linux Distributions"
[#]: via: "https://itsfoss.com/fixing-target-packages-configured-multiple-times/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fixing “Target Packages is configured multiple times” Error in Ubuntu & Debian Based Linux Distributions
======

Recently, when I was [updating Ubuntu via command line][1], I encountered a warning that complained about target package being configured multiple times.

The exact message after running sudo apt update command looked like this:

**Fetched 324 kB in 6s (50.6 kB/s)
Reading package lists… Done
Building dependency tree… Done
Reading state information… Done
17 packages can be upgraded. Run ‘apt list –upgradable’ to see them.
W: Target Packages (main/binary-amd64/Packages) is configured multiple times in /etc/apt/sources.list.d/microsoft-edge-dev.list:3 and /etc/apt/sources.list.d/microsoft-edge.list:3**

Since I know a few things about how the apt [package manager][2], I can already see the issue.

Here’s the thing. A repository was added to the list of sources twice. This could happen in the same file or in separate files.

The fix is to read the error message (it’s a warning, actually) correctly and edit the file to remove (or comment out) duplicate lines. You can see that it mentions the file name and the line number both.

So, here in my case, I removed the third line of one of the file and it stopped showing the warning for me. To summarize, here’s what you need to do:

  * Read the error message and find out which line number of what files have the same entry.
  * Use a terminal-based text editor like Nano to edit one of the files and either remove or comment the duplicate line.
  * The solution may require you to be familiar (and comfortable) with basic Linux commands.



But that’s too short an explanation if you are not familiar with package management in [Ubuntu and Debian][3].

### Understand and fixing the problem of package configured multiple times

It is important to understand the issue in order to fix it. It’s because there is no single command to make it go away. The solution requires a little but effort from your side and you’ll see that the exact command/process may vary for different people.

#### What causes this issue?

If you read the warning message, you can at least guess that something is configured more than once.

The APT package management works on sources.list. It’s just a text file that contains the information about repositories from where you can download certain packages.

There is a main /etc/apt/sources.list file that contains the details of the official repositories provided by Ubuntu. Then, there is /etc/apt/sources.list.d directory that contains files for [additional external repositories][4].

The norm is that you do not touch the main /etc/apt/sources.list file. You add a new file in /etc/apt/sources.list.d for any additional repositories you add.

![Sources list files][5]

The problem arises when you are trying to install some software by reading various tutorials from the internet. You try adding an external repository, it doesn’t work to your liking. You try to add some other repository from some other tutorial and you end up with duplicate entries without even realizing.

_**To be clear, this is not an error.**_ If you have duplicate entries in the sources list, your system will still be downloading the packages from it. It’s not stopping your system from working as usual. This is why _**it is a warning message, not an error**_. It’s just that it expects a repository to be added only once.

#### Fixing the duplicate repository entries

To fix the issue, you have to remove all the duplicate entries and leave just one of them in the system.

That’s easier said than done, specially for beginners. Let me share a few tips and suggestion on that.

##### Method 1: For Ubuntu desktop users

There is an application called Software &amp; Updates in Ubuntu. Start this application.

![Go to Software and Updates application][6]

Go to the **Other Software** tab and see the additional repositories added to your system. The checked ones are active.

You may look through all the checked ones and see if you can spot duplicate entries. If yes, select one of them and hit the remove button.

![Identify and remove the duplicate entries, leaving just one repository][7]

You may run the update command again to see if the problem is fixed. I know it’s not very convenient but if you want the convenience of a GUI tool, this is what you have to do.

If you cannot spot the duplicate entries, you have to be a detective and investigate it from the error message as explained in the next sections.

##### Method 2: Remove duplicate entries using command line (if the duplicate error is not in /etc/apt/sources.list file)

Please note the difference between /etc/apt sources.list (main sources file of the system) and /etc/apt/sources.list.d (folder to keep the files for additional repositories).

If the error complains of **repeated entries in files under the /etc/apt/sources.list.d folder**, use this method.

I’ll show it to you with my example. Follow the method with the details in your own error message.

**W: Target Packages (main/binary-amd64/Packages) is configured multiple times in /etc/apt/sources.list.d/microsoft-edge-dev.list:3 and /etc/apt/sources.list.d/microsoft-edge.list:3**

In the above error message, it tells me that line number 3 of file /etc/apt/sources.list.d/microsoft-edge-dev.list is the same as the line number 3 of the file /etc/apt/sources.list.d/microsoft-edge.list.

It happened because I had Microsoft Edge browser beta version installed. When the stable version was released, I installed it from deb file and it added another entry.

The decision for me is simple, I can delete one of the files and it won’t complain of the duplicate entry. If you are familiar with Linux command line, you can get the full path of the file and use the rm command with sudo to delete it.

But if you are [clueless about Linux terminal][8], there is a safer approach and that is to comment out the repeated line.

In the terminal, copy the full path of one of the trouble file. For me, it is /etc/apt/sources.list.d/microsoft-edge-dev.list. Use this sudo gedit command like this:

```

    sudo gedit /etc/apt/sources.list.d/microsoft-edge-dev.list

```

It will open the file in graphical text editor and you can go to the line number the system was complaining about and add a # at the beginning of the line:

![Go to the line number mentioned in the error and add # at the beginning of it][9]

This will treat the line as a comment. Save the file and close the editor. Your problem should stop now.

##### Method (or use case) 3: When one file is from /etc/apt/sources.list and other is from /etc/apt/sources.list.d directory

The idea is to avoid touching the main /etc/apt/sources.list file.

So if you have duplicate lines in this file and some other file in the /etc/apt/sources.list.d directory, you should edit the file in /etc/apt/sources.list.d folder.

You copy its path and open it with sudo gedit the same way you saw in the previous method.

##### Method (or use case) 4: When all duplicate entries are in the /etc/apt/sources.list file itself

It’s possible that you added multiple entries in the main /etc/apt/sources.list file. You should not have but you are not familiar with things so you did it. Now it complains about duplicate entroes in the same file.

**W: Target Packages (universe/binary-amd64/Packages) is configured multiple times in /etc/apt/sources.list:16 and /etc/apt/sources.list:53**

![Duplicate entries in /etc/apt/sources.list file][10]

Now, the first thing here is to make a backup of this file with this command:

```

    sudo cp /etc/apt/sources.list /etc/apt/sources.list.back

```

Next, open the file with Gedit text editor and sudo:

```

    sudo gedit /etc/apt/sources.list

```

If you want, you can go to Preference in Gedit and display line numbers. It will be easier to see the line numbers.

![Show line numbers in Gedit][11]

Now look at the error message again and see which lines it complains about. Go to one of those lines and add the # before it or delete the line altogether.

![Remove duplicate entry from sources list][12]

Save the file and close the editor. That’s it.

### Did it help you?

I don’t know if I made things more complicated. I wanted to explain things in detail so that beginners specially could fix the issue without messing up with their system.

Do let me know if it worked for you or not. If you still have questions, feel free to ask in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/fixing-target-packages-configured-multiple-times/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/update-ubuntu/
[2]: https://itsfoss.com/package-manager/
[3]: https://itsfoss.com/debian-vs-ubuntu/
[4]: https://itsfoss.com/adding-external-repositories-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/apt-sources-list.png?resize=800%2C418&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/software-and-updates.webp?resize=800%2C166&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/remove-duplicate-repositories-ubuntu.png?resize=800%2C403&ssl=1
[8]: https://itsfoss.com/basic-terminal-tips-ubuntu/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/disable-repository-ubuntu.png?resize=800%2C363&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/duplicate-entries-in-sources-list.png?resize=800%2C306&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/gedit-show-line-numbers.webp?resize=800%2C573&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/remove-duplicate-entry-from-sources-list.png?resize=800%2C427&ssl=1
