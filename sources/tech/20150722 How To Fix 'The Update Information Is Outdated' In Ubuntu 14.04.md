Translating by GOLinux!
How To Fix “The Update Information Is Outdated” In Ubuntu 14.04
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Fix_update_information_is_outdated.jpeg)

Seeing a red triangle in top panel in Ubuntu 14.04 that displays the following error?

> The update information is outdated. This may be caused by network problems or by a repository that is no longer available. Please update manually by selecting ‘Show updates’ from indicator menu, and watching for any failing repositories.

It looks something like this:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Update_error_Ubuntu.jpeg)

Instead of red triangle, there is a pink exclamation sign because I am using one of the [best Ubuntu icon themes][1], Numix. Coming back to the error, this is a common update problem which you might see every now and then. Now you might be wondering what is causing this update error.

### Reason for ‘update information is outdated’ error ###

The reason is pretty explanatory in the error description itself. It reads “this may be caused by network problems or by a repository that is no longer available”. So, either you upgraded your system and some repository or PPA is no longer supported or you are facing some similar issue.

While the error is self-explanatory, the action it suggests, “Please update manually by selecting ‘Show updates’ from the indicator menu, and watching for any failing repositories.”, doesn’t work properly. If you click on Show updates, all you’ll see is that the system is already updated.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/System_updated_Ubuntu.png)

Weird isn’t it? How will we find out what is failing where and why?

### Fix ‘update information is outdated’ ###

The ‘solution’ discussed here will work for Ubuntu versions be it Ubuntu 14.04, 12.04 or 14.04. All you need to do is to open a terminal (Ctrl+Alt+T) and use the following command:

    sudo apt-get update

Wait for the command to finish and look at the result. Quick tip to add here, you can [add notifications in terminal][2] so that you are notified as soon as a long command finishes execution. In the last few lines at the end of the command, see what kind of error your system is facing.  Yes, you’ll see an error for sure.

In my case, I saw the famous [GPG error: The following could not be verified][3] error. Apparently there is some problem with [Spotify installation in Ubuntu 15.04][4].

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Update_error_Ubuntu_1.jpeg)

It is very much possible that you might see a different error instead of the GPG error like me. In that case, I suggest you to go through this article which I wrote to [fix various common update errors in Ubuntu][5].

I know few people, specially beginners have strong aversion to command line but if you are using Linux, you simply cannot avoid terminal. Moreover, it is not that scary a thing. Give it a try, you will feel accustomed to it soon enough.

I hope this quick tip helped you to fix the recurring “update information is outdated” in Ubuntu. Any questions or suggestions is welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-update-information-outdated-ubuntu/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/best-icon-themes-ubuntu-1404/
[2]:http://itsfoss.com/notification-terminal-command-completion-ubuntu/
[3]:http://itsfoss.com/solve-gpg-error-signatures-verified-ubuntu/
[4]:http://itsfoss.com/install-spotify-ubuntu-1504/
[5]:http://itsfoss.com/fix-update-errors-ubuntu-1404/
