translating---geekpi

Fix Shell Script Opens In Text Editor In Ubuntu
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Run-Shell-Script-on-Double-Click.jpg)

When you double click on a shell script (.sh file) what do you expect? The normal expectation would be that it is executed. But this might not be the case in Ubuntu, or I should better say in case of Files (Nautilus). You may go crazy yelling “Run, File, Run”, but the file won’t run and instead it gets opened in Gedit.

I know that you would say, does the file has execute permission?  And I say, yes. The shell script has execute permission but still if I double click on it, it is opened in a text editor. I don’t want it and if you are facing the same issue, I assume that even you don’t want it.

I know that you would have been advised to run it in the terminal and I know that it would work but that’s not an excuse for the GUI way to not work. Is it?

In this quick tutorial, we shall see **how to make shell script run by double clicking on it**.

#### Fix Shell script opens in text editor in Ubuntu ####

The reason why shell scripts are opening in text editor is the default behavior set in Files (file manager in Ubuntu). In earlier versions, it would ask you if you want to run the file or open for editing. The default behavior has been changed in later versions.

To fix it, go in file manager and from the top menu and click on **Preference**:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/execute-shell-program-ubuntu-1.png)

Next in **Files preferences**, go to **Behavior** tab and you’ll see the option of “**Executables Text Files**“.

By default, it would have been set to “View executable text files when they are opened”. I would advise you to change it to “Ask each time” so that you’ll have the choice whether to execute it or edit but of course you can set it by default for execution. Your choice here really.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/execute-shell-program-ubuntu-2.png)

I hope this quick tip helped you to fix this little ‘issue’. Questions and suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/shell-script-opens-text-editor/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
