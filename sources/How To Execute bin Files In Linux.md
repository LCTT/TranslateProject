Translating----------------geekpi


How To Execute bin Files In Linux
================================================================================
Hi **linux** geeks,

In this short tutorial I will teach you how to install **.bin** files in your Linux machine. Not scary terminal commands, I promise! But I will also show how to do it from the terminal.

What is  a .bin file?

A .bin file is a self extracting binary file for Linux and Unix-like operating systems.  Before executing a .bin file you need to give it executive permissions. This can be done from the terminal or from the gui. If you like to practise terminal commands then open a new terminal and run the following command to give the file execute permissions.

    chmod +x filename.bin

The execute it with the following command.

    ./filename.bin

Make sure you are a superuser when typing the above commands.

How to do the same thing from the gui? Go to the folder where you have the .bin file and right click on it with your mouse, then go to properties like shown in the picture below.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/exec1.png)

Go to **Permissions** and tick **Allow executing file as a program**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/exec2.png)

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/exec3.png)

Double click the file and it will be executed. It is done.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/execute-bin-files-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
