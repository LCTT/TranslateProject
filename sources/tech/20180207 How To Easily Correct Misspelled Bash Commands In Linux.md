translating---geekpi

How To Easily Correct Misspelled Bash Commands In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/02/Correct-Misspelled-Bash-Commands-720x340.png)

I know, I know! You could just hit the UP arrow to bring up the command you just ran, and navigate to the misspelled word using the LEFT/RIGHT keys, and correct the misspelled word(s), finally hit ENTER key to run it again, right? But, wait. There is another easier way to correct misspelled Bash commands in GNU/Linux. This brief tutorial explains how to do it. Read on.

### Correct Misspelled Bash Commands In Linux

Have you run a mistyped command something like below?
```
$ unme -r
bash: unme: command not found

```

Did you notice? There is a typo in the above command. I missed the letter “a” in the “uname” command.

I have done this kind of silly mistakes in many occasions. Before I know this trick, I used to hit UP arrow to bring up the command and go to the misspelled word in the command, correct the spelling and typos and hit the ENTER key to run that command again. But believe me. The below trick is super easy to correct any typos and spelling mistakes in a command you just ran.

To easily correct the above misspelled command, just run:
```
$ ^nm^nam^

```

This will replace the characters “nm” with “nam” in the “uname” command. Cool, yeah? It’s not only corrects the typos, but also runs the command. Check the following screenshot.

![][2]

Use this trick when you made a typo in a command. Please note that it works only in Bash shell.

**Bonus tip:**

Have you ever wondered how to automatically correct spelling mistakes and typos when using “cd” command? No? It’s alright! The following trick will explain how to do it.

This trick will only help to correct the spelling mistakes and typos when using “cd” command.

Let us say, you want to switch to “Downloads” directory using command:
```
$ cd Donloads
bash: cd: Donloads: No such file or directory

```

Oops! There is no such file or directory with name “Donloads”. Well, the correct name was “Downloads”. The “w” is missing in the above command.

To fix this issue and automatically correct the typos while using cd command, edit your **.bashrc** file:
```
$ vi ~/.bashrc

```

Add the following line at end.
```
[...]
shopt -s cdspell

```

Type **:wq** to save and exit the file.

Finally, run the following command to update the changes.
```
$ source ~/.bashrc

```

Now, if there are any typos or spelling mistakes in the path while using cd command, it will automatically corrects and land you in the correct directory.

![][3]

As you see in the above command, I intentionally made a typo (“Donloads” instead of “Downloads”), but Bash automatically detected the correct directory name and cd into it.

[**Fish**][4] and **Zsh** shells have this feature built-in. So, you don’t need this trick if you use them.

This trick, however, has some limitations. It works only if you use the correct case. In the above example, if you type “cd donloads” instead of “cd Donloads”, it won’t recognize the correct path. Also, if there were more than one letters missing in the path, it won’t work either.



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/easily-correct-misspelled-bash-commands-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/02/misspelled-command.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/02/cd-command.png
[4]:https://www.ostechnix.com/install-fish-friendly-interactive-shell-linux/
