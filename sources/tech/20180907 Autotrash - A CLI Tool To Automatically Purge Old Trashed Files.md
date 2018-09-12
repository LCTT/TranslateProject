Autotrash – A CLI Tool To Automatically Purge Old Trashed Files
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/autotrash-720x340.png)

**Autotrash** is a command line utility to automatically purge old trashed files. It will purge files that have been in the trash for more then a given number of days. You don’t need to empty the trash folder or do SHIFT+DELETE to permanently purge the files/folders. Autortrash will handle the contents of your Trash folder and delete them automatically after a particular period of time. In a nutshell, Autotrash will never allow your trash to grow too big.

### Installing Autotrash

Autotrash is available in the default repositories of Debian-based systems. To install autotrash on Debian, Ubuntu, Linux Mint, run:

```
$ sudo apt-get install autotrash

```

On Fedora:

```
$ sudo dnf install autotrash

```

For Arch linux and its variants, you can install it using any AUR helper programs such as [**Yay**][1].

```
$ yay -S autotrash-git

```

### Automatically Purge Old Trashed Files

Whenever you run autotrash, It will scan your **`~/.local/share/Trash/info`** directory and read the **`.trashinfo`** files to find their deletion date. If the files have been in trash folder for more than the defined date, they will be deleted.

Let me show you some examples.

To purge files which are in the trash folder for more than 30 days, run:

```
$ autotrash -d 30

```

As per above example, if the files in your Trash folder are more than 30-days old, Autotrash will automatically delete them from your Trash. You don’t need to manually delete them. Just send the unnecessary junk to your trash folder and forget about them. Autotrash will take care of the trashed files.

The above command will only process currently logged-in user’s trash directory. If you want to make autotrash to process trash directories of all users (not just in your home directory), use **-t** option like below.

```
$ autotrash -td 30

```

Autotrash also allows you to delete trashed files based on the space left or available on the trash filesystem.

For example, have a look at the following example.

```
$ autotrash --max-free 1024 -d 30

```

As per the above command, autotrash will only purge trashed files that are older than **30 days** from the trash if there is less than **1GB of space left** on the trash filesystem. This can be useful if your trash filesystem is running out of the space.

We can also purge files from trash, oldest first, till there is at least 1GB of space on the trash filesystem.

```
$ autotrash --min-free 1024

```

In this case, there is no restriction on how old trashed files are.

You can combine both options ( **`--min-free`** and **`--max-free`** ) in a single command like below.

```
$ autotrash --max-free 2048 --min-free 1024 -d 30

```

As per the above command, autotrash will start reading the trash if there is less than **2GB** of free space, then start keeping an eye on. At that point, remove files older than 30 days and if there is less than **1GB** of free space after that remove even newer files.

As you can see, all command should be manually run by the user. You might wonder, how can I automate this task?? That’s easy! Just add autotrash as crontab entry. Now, the commands will automatically run at a scheduled time and purge the files in your trash depending on the defined options.

To add these commands in crontab file, run:

```
$ crontab -e

```

Add the entries, for example:

```
@daily /usr/bin/autotrash -d 30

```

Now autotrash will purge files which are in the trash folder for more than 30 days, everyday.

For more details about scheduling tasks, refer the following links.


+ [A Beginners Guide To Cron Jobs][2]
+ [How To Easily And Safely Manage Cron Jobs In Linux][3]


Please be mindful that if you have deleted any important files inadvertently, they will be permanently gone after the defined days, so just be careful.

Refer man pages to know more about Autotrash.

```
$ man autotrash

```

Emptying Trash folder or pressing SHIFT+DELETE to permanently get rid of unnecessary stuffs from the Linux system is no big deal. It will just take a couple seconds. However, if you wanted an extra utility to take care of your junk files, Autotrash might be helpful. Give it a try and see how it works.

And, that’s all for now. Hope this helps. More good stuffs to come.

Cheers!





--------------------------------------------------------------------------------

via: https://www.ostechnix.com/autotrash-a-cli-tool-to-automatically-purge-old-trashed-files/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[2]: https://www.ostechnix.com/a-beginners-guide-to-cron-jobs/
[3]: https://www.ostechnix.com/how-to-easily-and-safely-manage-cron-jobs-in-linux/
