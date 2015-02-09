Fix Cannot Empty Trash In Ubuntu 14.04 [Quick Tip]
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/empty-the-trash.jpg)

### Problem ###

The other day I ran in to an **issue while emptying trash in Ubuntu 14.04**. I right clicked on the trash icon and chose Empty Trash option, like I always do. It took some time with a progress bar showing that it was in the process of deleting the files in trash. But it just got stuck at it and I got ended with a frozen Nautilus File manager. I had to kill it via terminal.

But this was painful because the files in trash were still there. And my repeated attempts to delete the trash resulted in same frozen window.

### Solution ###

Honestly, I do not know what caused this issue in the first place. But I do have a solution for you if you too are facing issue in deleting the trash via GUI in Ubuntu 14.04 or 14.10.

Open a terminal and use the following command:

    sudo rm -rf ~/.local/share/Trash/*

Now be careful in what you type. You are using the remove command with super user privileges. I trust you that you won’t be deleting any other files or directory.

The above mentioned command is deleting all the files in Trash directory. In other words, it is emptying the trash in command line way. Once you use that command, you’ll see that the Trash has been emptied. If you delete any new files, you should not be having the same freezing Nautilus issue again.

### Worked for you? ###

I hope this little tip worked for you and you can empty the trash without any further issue in Ubuntu or any other Linux distribution. do let me know if you face any issue.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-empty-trash-ubuntu/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/