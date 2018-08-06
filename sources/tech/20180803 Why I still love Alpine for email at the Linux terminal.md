Why I still love Alpine for email at the Linux terminal
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

Maybe you can relate to this story: You try out a program and really love it. Over the years, new programs are developed that can do the same things and more, maybe even better. You try them out, and they are great too—but you keep coming back to the first program.

That is the story of my relationship with [Alpine Mail][1]. So I decided to write a little article praising my de facto favorite mail program.

![alpine_main_menu.png][3]

The main menu screen of the Alpine email client

In the mid-90's, I discovered the [GNU/Linux][4] operating system. Because I had never seen a Unix-like system before, I read a lot of documentation and books and tried a lot of programs to find my way through this fascinating OS.

After a while, [Pine][5] became my favorite mail client, followed by its successor, Alpine. I found it intuitive and easy to use—you can always see the possible commands or options at the bottom, so navigation is easy to learn quickly, and Alpine comes with very good help.

Getting started is easy.

Most distributions include Alpine. It can be installed via the package manager: Just press **S** (or navigate the bar to the setup line) and you will be directed to the categories you can configure. At the bottom, you can use the shortcut keys for commands you can do right away. For commands that don’t fit in there, press **O** (`Other Commands`).

Press **C** to enter the configuration dialog. When you scroll down the list, it becomes clear that you can make Alpine behave as you want. If you have only one mail account, simply navigate the bar to the line you want to change, press **C** (`Change Value`), and type in the values:

![alpine_setup_configuration.png][7]

The Alpine setup configuration screen

Note how the SNMP and IMAP servers are entered, as this is not the same as in mail clients with assistants and pre-filled fields. If you just enter the server/SSL/user like this:

`imap.myprovider.com:993/ssl/user=max@example.com`

Alpine will ask you if "Inbox" should be used (yes) and put curly brackets around the server part. When you're done, press **E** (`Exit Setup`) and commit your changes by pressing **Y** (yes). Back in the main menu, you can then move to the folder list and the Inbox to see if you have mail (you will be prompted for your password). You can now navigate using **`>`** and **`<`**.

![navigating_the_message_index.png][9]

Navigating the message index in Alpine

To compose an email, simply navigate to the corresponding menu entry and write. Note that the options at the bottom change depending on the line you are on. **`^T`** ( **Ctrl** \+ **T** ) can stand for `To Addressbook` or `To Files`. To attach files, just navigate to `Attchmt:` and press either **Ctrl** \+ **T** to go to a file browser, or **Ctrl** \+ **J** to enter a path.

Send the mail with `^X`.

![composing_an_email_in_alpine.png][11]

Composing an email in Alpine

### Why Alpine?

Of course, every user's personal preferences and needs are different. If you need a more "office-like" solution, an app like Evolution or Thunderbird might be a better choice.

But for me, Alpine (and Pine) are dinosaurs in the software world. You can manage your mail in a comfortable way—no more and no less. It is available for many operating systems (even [Termux for Android][12]). And because the configuration is stored in a plain text file (`.pinerc`), you can simply copy it to a device and it works.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/love-alpine

作者：[Heiko Ossowski][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/hossow
[1]:https://en.wikipedia.org/wiki/Alpine_(email_client)
[2]:/file/405641
[3]:https://opensource.com/sites/default/files/uploads/alpine_main_menu.png (alpine_main_menu.png)
[4]:https://www.gnu.org/gnu/linux-and-gnu.en.html
[5]:https://en.wikipedia.org/wiki/Pine_(email_client)
[6]:/file/405646
[7]:https://opensource.com/sites/default/files/uploads/alpine_setup_configuration.png (alpine_setup_configuration.png)
[8]:/file/405651
[9]:https://opensource.com/sites/default/files/uploads/navigating_the_message_index.png (navigating_the_message_index.png)
[10]:/file/405656
[11]:https://opensource.com/sites/default/files/uploads/composing_an_email_in_alpine.png (composing_an_email_in_alpine.png)
[12]:https://termux.com/
