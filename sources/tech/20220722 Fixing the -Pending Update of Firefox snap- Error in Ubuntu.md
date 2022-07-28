[#]: subject: "Fixing the “Pending Update of Firefox snap” Error in Ubuntu"
[#]: via: "https://itsfoss.com/pending-update-firefox-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fixing the “Pending Update of Firefox snap” Error in Ubuntu
======

If you are using Ubuntu 22.04, you might have received this notification.

![Notification about pending Firefox app][1]

It notifies you that the Firefox update is pending and asks you to close the app to avoid disruption.

So, like a good obedient Ubuntu user, you close the Firefox browser when you have saved or finished your work.

You think that Firefox was updated in the background and restarting the browser will run the newer version.

Only, that is not the case here.

**Even after you restart your browser or even your computer, it may still show the same “pending update of Firefox” notification.**

Frustrating? I can relate.

Let me explain why it is happening and what you can do to ‘fix’ it.

### Fixing the ‘pending update of Firefox snap’ problem

Earlier, Firefox used to update in the background and then required you to restart the browser. It would not have let you [open any website until you restarted the browser][2].

![Firefox forced restart in the past][3]

After switching the [Firefox browser to Snap packaging by default][4], the Ubuntu team made some changes to the update process.

This notification is part of that ‘improved user experience.’ Here, Firefox is not stopping you from browsing anymore. It asks you to restart the browser at your convenience to update.

But why does it keep showing the notification even after your restart the browser or the system?

Because it’s a poor notification message that doesn’t give you the complete information.

#### Firefox update hasn’t even begun

When you see the ‘pending Firefox update’ you wrongly presume that the application has been updated in the background and restart will upgrade it to the newer version.

That’s the case here. The snap packages in Ubuntu refresh (update) automatically once or a couple of times a day. To avoid disruption of work where Firefox doesn’t let you browse anything until you restart to install the updates, Ubuntu doesn’t even update the Firefox Snap package in the background.

Instead, when the Snap package refresh takes place, **it shows the notification and expects you to close the browser immediately**so it can be updated with other Snap packages.

But that’s not what users like you and me can do, right? See the notification, and close the browser immediately? Not very convenient.

But when you get the time to close the browser, the Snap refresh is not taking place to update the browser.

You can see that a newer Snap version of Firefox is available but it won’t be installed automatically as long as Firefox is running.

![Firefox snap won’t be updated automatically if the browser is running][5]

#### Updating Firefox Snap

Here’s what you need to do to get rid of the update notification that keeps on appearing daily.

* Close the Firefox browser
* Manually run the Snap refresh (update the installed snap packages)

Make sure that your work in the Firefox browser is saved. Now, close all the Firefox browsers using your mouse or run this command in the terminal:

```
sudo killall firefox
```

Now that Firefox is not running anymore, update the Snap package(s):

```
sudo snap refresh
```

You’ll see that it starts downloading the newer Firefox package.

![Firefox is being updated with Snap][6]

Once the update is finished, you’ll see the summary that Firefox has been upgraded to a newer version.

![Updated Firefox snap version][7]

### Conclusion

Installing a non-Snap version of Firefox could also be the solution here but not everyone can go down that road.

Firefox and Snap developers must come together to improve this ambiguous update process. They should provide a better mechanism that doesn’t only show the notification on pending updates but also gives the option to start the update.

This is one of the many weird things we have seen with Ubuntu recently. This must change to make Ubuntu a beginner-friendly distribution (again).

--------------------------------------------------------------------------------

via: https://itsfoss.com/pending-update-firefox-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/07/pending-update-firefox-ubuntu.png
[2]: https://news.itsfoss.com/mozilla-annoying-new-tab/
[3]: https://itsfoss.com/wp-content/uploads/2022/07/firefox-restart.webp
[4]: https://news.itsfoss.com/ubuntu-firefox-snap-default/
[5]: https://itsfoss.com/wp-content/uploads/2022/07/pending-Firefox-update-issue-Ubuntu.png
[6]: https://itsfoss.com/wp-content/uploads/2022/07/updating-firefox-snap-package-ubuntu.png
[7]: https://itsfoss.com/wp-content/uploads/2022/07/firefox-snap-update-ubuntu.png
