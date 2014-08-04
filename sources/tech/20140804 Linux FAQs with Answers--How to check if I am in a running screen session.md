Translating by GOLinux ...
Linux FAQs with Answers--How to check if I am in a running screen session
================================================================================
> **Question**: I often use screen command to run multiple pseudo terminal sessions. Oftentimes I find it difficult to remember whether I am inside a screen session, or in a regular terminal. Is there any convenient way to check whether or not I am inside a running screen session? 

One quick and easy way to tell whether you are inside a screen's pseudo terminal or in a regular terminal is to check STY environment variable. When screen is invoked, it sets STY variable to a session name. So if STY environment variable is set to any non-empty string, that means you are inside a screen session.

     $ echo $STY 

> 2858.pts-3.my_host

However, note that the above method works **only if** you are still on a local computer where you run screen command. If you SSH to any other remote computer from the local computer's screen session, STY variable will not be set on the remote computer while you are technically still in a screen session.

In fact, a more reliable way to check if you are in a screen session is to press "Ctrl-a"+"Ctrl-t". If you are in screen, the terminal will show you time information at the bottom of the terminal.

![](https://farm6.staticflickr.com/5578/14821730712_6a139d72e9_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-running-screen-session.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
