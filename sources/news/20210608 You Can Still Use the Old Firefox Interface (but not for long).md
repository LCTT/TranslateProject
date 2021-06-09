[#]: subject: (You Can Still Use the Old Firefox Interface (but not for long))
[#]: via: (https://news.itsfoss.com/firefox-old-design-switch/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

You Can Still Use the Old Firefox Interface (but not for long)
======

[Firefox 89][1] is finally available to download with a major redesign. While some like what they are trying to do, as a competitive alternative to Google Chrome in terms of user experience, many do not seem to like the modern design.

Of course, the design choices will always have distinct perspective for all kinds of users. But is there a way to go back to the old Firefox design?

Well, for now, it seems like a yes. But you may not be able to revert the design after the next Firefox update.

Here, let me briefly highlight what it is all about.

### How to Switch Back to the Old Firefox Design?

Just like how [we enabled the proton design to take an early look before the final release][2], you need to disable the proton UI elements to get back to the old design.

To get started, just type in “**about:config**” in the address bar and proceed by ignoring the warning.

![][3]

Once you click on “**Accept the Risk and Continue**“, you will notice a search field with no options to choose/select.

Now, you just need to type in “**Proton**” to list all the options related to the new redesign, as shown below:

![][3]

Here, you need to click on the toggle button at the right-side as highlighted in this screenshot to disable all those options.

You should already see it in action after disabling the options, but you may want to restart the browser if it does not seem right.

I should mention that even with all the options disabled, it does not necessarily look exactly like the old Firefox design, but yes — for most of the part.

In the same way, you just have to enable the options back to switch to the new design.

### Wrapping Up

Now that you can easily go back and forth between the new and old Firefox design, you may not be able to go back again after the next Firefox update.

As originally spotted by [UbuntuHanbook][4], the options that you disabled above will no longer be available with the next Firefox update as per a [bug report][5].

What do you think about the new Firefox design? Would you be willing go back to the old design using the method mentioned?

Feel free to let me know what you think in the comments below.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/firefox-old-design-switch/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/firefox-89-release/
[2]: https://news.itsfoss.com/firefox-proton-redesign/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ4OCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://ubuntuhandbook.org/index.php/2021/06/revert-old-user-interface-firefox-89/
[5]: https://bugzilla.mozilla.org/show_bug.cgi?id=1709425
