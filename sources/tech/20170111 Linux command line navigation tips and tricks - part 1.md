# translating by ruskking
Linux command line navigation tips and tricks - part 1
============================================================

### On this page

1.  [Linux command line tips/tricks][3]
    1.  [Easily switch between two directories - the quick tip][1]
    2.  [Easily switch between two directories - related details][2]
2.  [Conclusion][4]

If you've just started using the command line in Linux, then it's worth knowing that it is one of the most powerful and useful features of the OS. The learning curve may or may not be steep depending on how deep you want to dive into the topic. However, there are some Linux command line tips/tricks that'll always be helpful regardless of your level of expertise.

In this article series, we'll be discussing several such tips/tricks, hoping that they'll make your command line experience even more pleasant.

But before we move ahead, it's worth mentioning that all the instructions as well examples presented in this article have been tested on Ubuntu 14.04LTS. The command line shell we've used is bash (version  4.3.11)

### Linux command line tips/tricks

Please note that we've assumed that you know the basics of the command line in Linux, like what is root and home directory, what are environment variables, how to navigate directories, and more. Also, keep in mind that tips/tricks will be accompanied by the how and why of the concept involved (wherever applicable).

### Easily switch between two directories - the quick tip

Suppose you are doing some work on the command line that requires you to switch between two directories multiple times. And these two directories are located in completely different branches, say, under /home/ and under /usr/, respectively. What would you do? 

One, and the most straightforward, option is to switch by typing the complete paths to these directories. While there's no problem with the approach per se, it's very time consuming. Other option could be to open two separate terminals and carry on with your work. But again, neither this approach is convenient, nor it looks elegant.

You'll be glad to know that there exists an easy solution to this problem. All you have to do is to first switch between the two directories manually (by passing their respective paths to the **cd** command), and then subsequent switches can be accomplished using the **cd -** command.

For example:

I am in the following directory:

```
$ pwd
/home/himanshu/Downloads
```

And then I switched to some other directory in the /usr/ branch:

```
cd /usr/lib/
```

Now, I can easily switch back and forth using the following command:

```
cd -
```

Here's a screenshot showing the **cd -** command in action.

[
 ![The Linux cd command](https://www.howtoforge.com/images/linux-command-line-tips-for-beginners/cmd-line-tips.png) 
][5]

An important point worth mentioning here is that if you make a switch to a third directory in between all this, then the **cd -** command will work for the new directory and the directory from which the switch was made.

### Easily switch between two directories - related details

For the curious bunch, who want to know how the **cd -** command works, here's the explanation: As we all know, the cd command requires a path as its argument. Now, when a hyphen (-) is passed as an argument to the command, it's replaced by the value that OLDPWD environment variable contains at that moment.

[
 ![The cd command explained](https://www.howtoforge.com/images/linux-command-line-tips-for-beginners/cmd-line-tips-oldpwd.png) 
][6]

As it would be clear by now, the OLDPWD environment variable stores the path of previous working directory. This explanation is there is the man page of the cd command, but sadly, it's likely that you'll not find the man page pre-installed on your system (it's not there on Ubuntu at least).

However, installing it is not a big deal, all you have to do is to run the following command:

```
sudo apt-get install manpages-posix
```

And then do:

```
man cd
```

Once the man page opens, you'll see that it clearly says:

```
- When a hyphen is used as the operand, this shall be equivalent
 to the command:

 cd "$OLDPWD" && pwd
```

Needless to say, it's the cd command that sets the OLDPWD variable. So every time you change the directory, the previous working directory gets stored in this variable. This brings us to another important point here: whenever a new shell instance is launched (both manually or through a script), it does not have a 'previous working directory.'

[
 ![Hyphen and the cd command](https://www.howtoforge.com/images/linux-command-line-tips-for-beginners/cmd-line-tips-no-oldpwd.png) 
][7]

That's logical because it's the cd command which sets this variable. So until you run the cd command at-least once, the OLDPWD environment variable will not contain any value.

Moving on, while it may seem counterintuitive, the **cd -** and **cd $OLDWPD** commands do not produce same results in all situations. Case in point, when a new shell has just been launched.

[
 ![cd command example](https://www.howtoforge.com/images/linux-command-line-tips-for-beginners/cmd-line-tips-oldpwd-home.png) 
][8]

As clear from the screenshot above, while the **cd -** command complained about the OLDPWD variable not being set, the **cd $OLDPWD** command did not produce any error; in fact it changed the present working directory to the user's home directory.

That's because given that the OLDPWD variable is currently not set, $OLDPWD is nothing but an empty string. So, the **cd $OLDPWD** command is as good as just running **cd**, which - by default - takes you to your home directory.

Finally, I've also been through situations where-in it's desirable to suppress the output the **cd -** command produces. What I mean is, there can be cases (for example, while writing a shell script), where-in you'll want the **cd -** command to not produce the usual directory path in output. For those situations, you can use the command in the following way:

```
cd - &>/dev/null
```

The above command will redirect both file descriptor 2 (STDERR) and descriptor 1 (STDOUT) to [/dev/null][9]. This means that any error the command produces will also be suppressed. However, you'll still be able to check the success of failure of the command using the generic [$? technique][10] - the command **echo $?** will produce '1' if there was some error, and '0' otherwise.

Alternatively, if you're ok with the **cd -** command producing an output in error cases, then you can use the following command instead:

```
cd - > /dev/null
```

This command will only redirect the file descriptor 1 (STDOUT) to `/dev/null`.

### Conclusion

Sadly, we could only cover one command line-related tip here, but the good thing is that we managed to discuss a lot of in-depth stuff about the **cd -**command. You are advised to go through the tutorial thoroughly and test everything  - that we've discussed here -  on your Linux box's command line terminal. Also, do go through the command's man page, and try out all the features documented there.

In case you face any issue or have some doubt, do share with us in comments below. Meanwhile, wait for the second part, where-in we'll discuss some more useful command line-related tips/tricks in the same manner as has been done here.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/linux-command-line-navigation-tips-and-tricks-part-1/

作者：[Ansh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/linux-command-line-navigation-tips-and-tricks-part-1/
[1]:https://www.howtoforge.com/tutorial/linux-command-line-navigation-tips-and-tricks-part-1/#easily-switch-between-two-directories-the-quick-tip
[2]:https://www.howtoforge.com/tutorial/linux-command-line-navigation-tips-and-tricks-part-1/#easily-switch-between-two-directories-related-details
[3]:https://www.howtoforge.com/tutorial/linux-command-line-navigation-tips-and-tricks-part-1/#linux-command-line-tipstricks
[4]:https://www.howtoforge.com/tutorial/linux-command-line-navigation-tips-and-tricks-part-1/#conclusion
[5]:https://www.howtoforge.com/images/linux-command-line-tips-for-beginners/big/cmd-line-tips.png
[6]:https://www.howtoforge.com/images/linux-command-line-tips-for-beginners/big/cmd-line-tips-oldpwd.png
[7]:https://www.howtoforge.com/images/linux-command-line-tips-for-beginners/big/cmd-line-tips-no-oldpwd.png
[8]:https://www.howtoforge.com/images/linux-command-line-tips-for-beginners/big/cmd-line-tips-oldpwd-home.png
[9]:https://en.wikipedia.org/wiki/Null_device
[10]:http://askubuntu.com/questions/29370/how-to-check-if-a-command-succeeded
