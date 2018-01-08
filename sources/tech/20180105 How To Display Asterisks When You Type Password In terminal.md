How To Display Asterisks When You Type Password In terminal
======

![](https://www.ostechnix.com/wp-content/uploads/2018/01/Display-Asterisks-When-You-Type-Password-In-terminal-1-720x340.png)

When you type passwords in a web browser login or any GUI login, the passwords will be masked as asterisks like 0_sync_master.sh 1_add_new_article_manual.sh 1_add_new_article_newspaper.sh 2_start_translating.sh 3_continue_the_work.sh 4_finish.sh 5_pause.sh base.sh env format.test lctt.cfg parse_url_by_manual.sh parse_url_by_newspaper.py parse_url_by_newspaper.sh README.org reedit.sh reformat.sh or bullets like •••••••••••••. This is the built-in security mechanism to prevent the users near you to view your password. But when you type the password in Terminal to perform any administrative task with **sudo** or **su** , you won't even the see the asterisks or bullets as you type the password. There won't be any visual indication of entering passwords, there won't be any cursor movement, nothing at all. You will not know whether you entered all characters or not. All you will see just a blank screen!

Look at the following screenshot.

![][2]

As you see in the above image, I've already entered the password, but there was no indication (either asterisks or bullets). Now, I am not sure whether I entered all characters in my password or not. This security mechanism also prevents the person near you to guess the password length. Of course, this behavior can be changed. This is what this guide all about. It is not that difficult. Read on!

#### Display Asterisks When You Type Password In terminal

To display asterisks as you type password in Terminal, we need to make a small modification in **" /etc/sudoers"** file. Before making any changes, it is better to backup this file. To do so, just run:
```
sudo cp /etc/sudoers{,.bak}
```

The above command will backup /etc/sudoers file to a new file named /etc/sudoers.bak. You can restore it, just in case something went wrong after editing the file.

Next, edit **" /etc/sudoers"** file using command:
```
sudo visudo
```

Find the following line:
```
Defaults env_reset
```

![][3]

Add an extra word **" ,pwfeedback"** to the end of that line as shown below.
```
Defaults env_reset,pwfeedback
```

![][4]

Then, press **" CTRL+x"** and **" y"** to save and close the file. Restart your Terminal to take effect the changes.

Now, you will see asterisks when you enter password in Terminal.

![][5]

If you're not comfortable to see a blank screen when you type passwords in Terminal, the small tweak will help. Please be aware that the other users can predict the password length if they see the password when you type it. If you don't mind it, go ahead make the changes as described above to make your password visible (masked as asterisks, of course!).

And, that's all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/display-asterisks-type-password-terminal/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/01/password-1.png ()
[3]:http://www.ostechnix.com/wp-content/uploads/2018/01/visudo-1.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2018/01/visudo-1-1.png ()
[5]:http://www.ostechnix.com/wp-content/uploads/2018/01/visudo-2.png ()
