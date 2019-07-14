[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Easily Upload Text Snippets To Pastebin-like Services From Commandline)
[#]: via: (https://www.ostechnix.com/how-to-easily-upload-text-snippets-to-pastebin-like-services-from-commandline/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

Easily Upload Text Snippets To Pastebin-like Services From Commandline
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-720x340.png)

Whenever there is need to share the code snippets online, the first one probably comes to our mind is Pastebin.com, the online text sharing site launched by **Paul Dixon** in 2002. Now, there are several alternative text sharing services available to upload and share text snippets, error logs, config files, a command’s output or any sort of text files. If you happen to share your code often using various Pastebin-like services, I do have a good news for you. Say hello to **Wgetpaste** , a command line BASH utility to easily upload text snippets to pastebin-like services. Using Wgetpaste script, anyone can quickly share text snippets to their friends, colleagues, or whoever wants to see/use/review the code from command line in Unix-like systems.

### Installing Wgetpaste

Wgetpaste is available in Arch Linux [Community] repository. To install it on Arch Linux and its variants like Antergos and Manjaro Linux, just run the following command:

```
$ sudo pacman -S wgetpaste
```

For other distributions, grab the source code from [**Wgetpaste website**][1] and install it manually as described below.

First download the latest Wgetpaste tar file:

```
$ wget http://wgetpaste.zlin.dk/wgetpaste-2.28.tar.bz2
```

Extract it:

```
$ tar -xvjf wgetpaste-2.28.tar.bz2
```

It will extract the contents of the tar file in a folder named “wgetpaste-2.28”.

Go to that directory:

```
$ cd wgetpaste-2.28/
```

Copy the wgetpaste binary to your $PATH, for example **/usr/local/bin/**.

```
$ sudo cp wgetpaste /usr/local/bin/
```

Finally, make it executable using command:

```
$ sudo chmod +x /usr/local/bin/wgetpaste
```

### Upload Text Snippets To Pastebin-like Services

Uploading text snippets using Wgetpaste is trivial. Let me show you a few examples.

**1\. Upload text files**

To upload any text file using Wgetpaste, just run:

```
$ wgetpaste mytext.txt
```

This command will upload the contents of mytext.txt file.

Sample output:

```
Your paste can be seen here: https://paste.pound-python.org/show/eO0aQjTgExP0wT5uWyX7/
```

![](https://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-1.png)

You can share the pastebin URL via any medium like mail, message, whatsapp or IRC etc. Whoever has this URL can visit it and view the contents of the text file in a web browser of their choice.

Here is the contents of mytext.txt file in web browser:

![](https://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-2.png)

You can also use **‘tee’** command to display what is being pasted, instead of uploading them blindly.

To do so, use **-t** option like below.

```
$ wgetpaste -t mytext.txt
```

![][3]

**2. Upload text snippets to different services
**

By default, Wgetpaste will upload the text snippets to **poundpython** (<https://paste.pound-python.org/>) service.

To view the list of supported services, run:

```
$ wgetpaste -S
```

Sample output:

```
Services supported: (case sensitive):
Name: | Url:
=============|=================
bpaste | https://bpaste.net/
codepad | http://codepad.org/
dpaste | http://dpaste.com/
gists | https://api.github.com/gists
*poundpython | https://paste.pound-python.org/
```

Here, ***** indicates the default service.

As you can see, Wgetpaste currently supports five text sharing services. I didn’t try all of them, but I believe all services will work.

To upload the contents to other services, for example **bpaste.net** , use **-s** option like below.

```
$ wgetpaste -s bpaste mytext.txt
Your paste can be seen here: https://bpaste.net/show/5199e127e733
```

**3\. Read input from stdin**

Wgetpaste can also read the input from stdin.

```
$ uname -a | wgetpaste
```

This command will upload the output of ‘uname -a’ command.

**4. Upload the COMMAND and the output of COMMAND together
**

Sometimes, you may need to paste a COMMAND and its output. To do so, specify the contents of the command within quotes like below.

```
$ wgetpaste -c 'ls -l'
```

This will upload the command ‘ls -l’ along with its output to the pastebin service.

This can be useful when you wanted to let others to clearly know what was the exact command you just ran and its output.

![][4]

As you can see in the output, I ran ‘ls -l’ command.

**5. Upload system log files, config files
**

Like I already said, we can upload any sort of text files, not just an ordinary text file, in your system such as log files, a specific command’s output etc. Say for example, you just updated your Arch Linux box and ended up with a broken system. You ask your colleague how to fix it and s/he wants to read the pacman.log file. Here is the command to upload the contents of the pacman.log file:

```
$ wgetpaste /var/log/pacman.log
```

Share the pastebin URL with your Colleague, so s/he will review the pacman.log and may help you to fix the problem by reviewing the log file.

Usually, the contents of log files might be too long and you don’t want to share them all. In such cases, just use **cat** command to read the output and use **tail** command with the **-n** switch to define the number of lines to share and finally pipe the output to Wgetpaste as shown below.

```
$ cat /var/log/pacman.log | tail -n 50 | wgetpaste
```

The above command will upload only the **last 50 lines** of pacman.log file.

**6\. Convert input url to tinyurl**

By default, Wgetpaste will display the full pastebin URL in the output. If you want to convert the input URL to a tinyurl, just use **-u** option.

```
$ wgetpaste -u mytext.txt
Your paste can be seen here: http://tinyurl.com/y85d8gtz
```

**7. Set language
**

By default, Wgetpaste will upload text snippets in **plain text**.

To list languages supported by the specified service, use **-L** option.

```
$ wgetpaste -L
```

This command will list all languages supported by default service i.e **poundpython** (<https://paste.pound-python.org/>).

We can change this using **-l** option.

```
$ wgetpaste -l Bash mytext.txt
```

**8\. Disable syntax highlighting or html in the output**

As I mentioned above, the text snippets will be displayed in a specific language format (plaintext, Bash etc.).

You can, however, change this behaviour to display the raw text snippets using **-r** option.

```
$ wgetpaste -r mytext.txt
Your raw paste can be seen here: https://paste.pound-python.org/raw/CUJhQ3jEmr2UvfmD2xCL/
```

![](https://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-5.png)

As you can see in the above output, there is no syntax highlighting, no html formatting. Just a raw output.

**9\. Change Wgetpaste defaults**

All Defaults values (DEFAULT_{NICK,LANGUAGE,EXPIRATION}[_${SERVICE}] and DEFAULT_SERVICE) can be changed globally in **/etc/wgetpaste.conf** or per user in **~/.wgetpaste.conf** files. These files, however, are not available by default in my system. I guess we need to manually create them. The developer has given the sample contents for both files [**here**][5] and [**here**][6]. Just create these files manually with given sample contents and modify the parameters accordingly to change Wgetpaste defaults.

**10\. Getting help**

To display the help section, run:

```
$ wgetpaste -h
```

And, that’s all for now. Hope this was useful. We will publish more useful content in the days to come. Stay tuned!

On behalf of **OSTechNix** , I wish you all a very **Happy New Year 2019**. I am grateful to all our readers, contributors, and mentors for supporting us from the beginning of our journey. We couldn’t come this far without your support and guidance. Thank you everyone! Have a great year ahead!!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-easily-upload-text-snippets-to-pastebin-like-services-from-commandline/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: http://wgetpaste.zlin.dk/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-3.png
[4]: http://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-4.png
[5]: http://wgetpaste.zlin.dk/zlin.conf
[6]: http://wgetpaste.zlin.dk/wgetpaste.example
