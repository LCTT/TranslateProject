[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Search, Study And Practice Linux Commands On The Fly!)
[#]: via: (https://www.ostechnix.com/search-study-and-practice-linux-commands-on-the-fly/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

Search, Study And Practice Linux Commands On The Fly!
======

![](https://www.ostechnix.com/wp-content/uploads/2019/01/tldr-720x340.png)

The title may look like sketchy and click bait. Allow me to explain what I am about to explain in this tutorial. Let us say you want to download an archive file, extract it and move the file from one location to another from command line. As per the above scenario, we may need at least three Linux commands, one for downloading the file, one for extracting the downloaded file and one for moving the file. If you’re intermediate or advanced Linux user, you could do this easily with an one-liner command or a script in few seconds/minutes. But, if you are a noob who don’t know much about Linux commands, you might need little help.

Of course, a quick google search may yield many results. Or, you could use [**man pages**][1]. But some man pages are really long, comprehensive and lack in useful example. You might need to scroll down for quite a long time when you’re looking for a particular information on the specific flags/options. Thankfully, there are some [**good alternatives to man pages**][2], which are focused on mostly practical commands. One such good alternative is **TLDR pages**. Using TLDR pages, we can quickly and easily learn a Linux command with practical examples. To access the TLDR pages, we require a TLDR client. There are many clients available. Today, we are going to learn about one such client named **“Tldr++”**.

Tldr++ is a fast and interactive tldr client written with **Go** programming language. Unlike the other Tldr clients, it is fully interactive. That means, you can pick a command, read all examples , and immediately run any command without having to retype or copy/paste each command in the Terminal. Still don’t get it? No problem. Read on to learn and practice Linux commands on the fly.

### Install Tldr++

Installing Tldr++ is very simple. Download tldr++ latest version from the [**releases page**][3]. Extract it and move the tldr++ binary to your $PATH.

```
$ wget https://github.com/isacikgoz/tldr/releases/download/v0.5.0/tldr_0.5.0_linux_amd64.tar.gz

$ tar xzf tldr_0.5.0_linux_amd64.tar.gz

$ sudo mv tldr /usr/local/bin

$ sudo chmod +x /usr/local/bin/tldr
```

Now, run ‘tldr’ binary to populate the tldr pages in your local system.

```
$ tldr
```

Sample output:

```
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Compressing objects: 100% (6/6), done.
Total 18157 (delta 0), reused 3 (delta 0), pack-reused 18151
Successfully cloned into: /home/sk/.local/share/tldr
```

![](https://www.ostechnix.com/wp-content/uploads/2019/01/tldr-2.png)

Tldr++ is available in AUR. If you’re on Arch Linux, you can install it using any AUR helper, for example [**YaY**][4]. Make sure you have removed any existing tldr client from your system and run the following command to install tldr++.

```
$ yay -S tldr++
```

Alternatively, you can build from source as described below. Since Tldr++ is written using Go language, make sure you have installed it on your Linux box. If it isn’t installed yet, refer the following guide.

+ [How To Install Go Language In Linux](https://www.ostechnix.com/install-go-language-linux/)

After installing Go, run the following command to install Tldr++.

```
$ go get -u github.com/isacikgoz/tldr
```

This command will download the contents of tldr repository in a folder named **‘go’** in the current working directory.

Now run the ‘tldr’ binary to populate all tldr pages in your local system using command:

```
$ go/bin/tldr
```

Sample output:

![][6]

Finally, copy the tldr binary to your PATH.

```
$ sudo mv tldr /usr/local/bin
```

It is time to see some examples.

### Tldr++ Usage

Type ‘tldr’ command without any options to display all command examples in alphabetical order.

![][7]

Use the **UP/DOWN arrows** to navigate through the commands, type any letters to search or type a command name to view the examples of that respective command. Press **?** for more and **Ctrl+c** to return/exit.

To display the example commands of a specific command, for example **apt** , simply do:

```
$ tldr apt
```

![][8]

Choose any example command from the list and hit ENTER. You will see a *** symbol** before the selected command. For example, I choose the first command i.e ‘sudo apt update’. Now, it will ask you whether to continue or not. If the command is correct, just type ‘y’ to continue and type your sudo password to run the selected command.

![][9]

See? You don’t need to copy/paste or type the actual command in the Terminal. Just choose it from the list and run on the fly!

There are hundreds of Linux command examples are available in Tldr pages. You can choose one or two commands per day and learn them thoroughly. And keep this practice everyday to learn as much as you can.

### Learn And Practice Linux Commands On The Fly Using Tldr++

Now think of the scenario that I mentioned in the first paragraph. You want to download a file, extract it and move it to different location and make it executable. Let us see how to do it interactively using Tldr++ client.

**Step 1 – Download a file from Internet**

To download a file from command line, we mostly use **‘curl’** or **‘wget’** commands. Let me use ‘wget’ to download the file. To open tldr page of wget command, just run:

```
$ tldr wget
```

Here is the examples of wget command.

![](https://www.ostechnix.com/wp-content/uploads/2019/01/wget-tldr.png)

You can use **UP/DOWN** arrows to go through the list of commands. Once you choose the command of your choice, press ENTER. Here I chose the first command.

Now, enter the path of the file to download.

![](https://www.ostechnix.com/wp-content/uploads/2019/01/tldr-3.png)

You will then be asked to confirm if it is the correct command or not. If the command is correct, simply type ‘yes’ or ‘y’ to start downloading the file.

![][10]

We have downloaded the file. Let us go ahead and extract this file.

**Step 2 – Extract downloaded archive**

We downloaded the **tar.gz** file. So I am going to open the ‘tar’ tldr page.

```
$ tldr tar
```

You will see the list of example commands. Go through the examples and find which command is suitable to extract tar.gz(gzipped archive) file and hit ENTER key. In our case, it is the third command.

![][11]

Now, you will be prompted to enter the path of the tar.gz file. Just type the path and hit ENTER key. Tldr++ supports smart file suggestions. That means it will suggest the file name automatically as you type. Just press TAB key for auto-completion.

![][12]

If you downloaded the file to some other location, just type the full path, for example **/home/sk/Downloads/tldr_0.5.0_linux_amd64.tar.gz.**

Once you enter the path of the file to extract, press ENTER and then, type ‘y’ to confirm.

![][13]

**Step 3 – Move file from one location to another**

We extracted the archive. Now we need to move the file to another location. To move the files from one location to another, we use ‘mv’ command. So, let me open the tldr page for mv command.

```
$ tldr mv
```

Choose the correct command to move the files from one location to another. In our case, the first command will work, so let me choose it.

![][14]

Type the path of the file that you want to move and enter the destination path and hit ENTER key.

![][15]

**Note:** Type **y!** or **yes!** to run command with **sudo** privileges.

As you see in the above screenshot, I moved the file named **‘tldr’** to **‘/usr/local/bin/’** location.

For more details, refer the project’s GitHub page given at the end.


### Conclusion

Don’t get me wrong. **Man pages are great!** There is no doubt about it. But, as I already said, many man pages are comprehensive and doesn’t have useful examples. There is no way I could memorize all lengthy commands with tricky flags. Some times I spent much time on man pages and remained clueless. The Tldr pages helped me to find what I need within few minutes. Also, we use some commands once in a while and then we forget them completely. Tldr pages on the other hand actually helps when it comes to using commands we rarely use. Tldr++ client makes this task much easier with smart user interaction. Give it a go and let us know what you think about this tool in the comment section below.

And, that’s all. More good stuffs to come. Stay tuned!

Good luck!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/search-study-and-practice-linux-commands-on-the-fly/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/learn-use-man-pages-efficiently/
[2]: https://www.ostechnix.com/3-good-alternatives-man-pages-every-linux-user-know/
[3]: https://github.com/isacikgoz/tldr/releases
[4]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[6]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-1.png
[7]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-11.png
[8]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-12.png
[9]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-13.png
[10]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-4.png
[11]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-6.png
[12]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-7.png
[13]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-8.png
[14]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-9.png
[15]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-10.png
