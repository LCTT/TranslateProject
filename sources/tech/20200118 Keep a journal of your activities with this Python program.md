[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Keep a journal of your activities with this Python program)
[#]: via: (https://opensource.com/article/20/1/python-journal)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Keep a journal of your activities with this Python program
======
Jrnl creates a searchable, timestamped, exportable, and (if you want)
encrypted log of your daily activities. Learn more in the eighth in our
series on 20 ways to be more productive with open source in 2020.
![Writing in a notebook][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Journaling with jrnl

At my workplace, many of us post an "end of day" status to Slack before we leave for the day. With a lot of projects going on and a global team, it is a pretty good way to share what you got done, what isn't done, and what you need help with. But some days are so busy, so hectic that I can't remember what I did. And this is where journaling comes in.

![jrnl][2]

It's pretty easy to keep a text editor open and just add a line when you do something. But it can be challenging to go back and figure out when you make a particular note or pull out related lines quickly and easily. Fortunately, [jrnl][3] is here to help.

Jrnl allows you to enter a quick entry from your command line, search past entries, and export to rich text formats like HTML and Markdown. You can have multiple journals, meaning you can keep your work entries separated from private ones. It stores entries as plain text, so even if jrnl stops working, you have your data.

Since jrnl is a Python program, the easiest way to install it is with **pip3 install jrnl**; this will make sure you get the latest and greatest version. On its first run, it will ask some questions, and then you are good to go.

![jrnl's first run][4]

Now, whenever you need to make a note or log work, simply type **jrnl &lt;some text&gt;,** and it will be logged with a timestamp to the default file. You can search for entries on a specific date with **jrnl -on YYYY-MM-DD**, entries since a date with **jrnl -from YYYY-MM-DD**, and entries up to a specific date with **jrnl -to YYYY-MM-DD**. Search terms can be combined with the **-and** parameter, allowing for searches like **jrnl -from 2019-01-01 -and -to 2019-12-31**.

You can also edit entries in the journal with the **\--edit** command-line flag. Before you do, set up your default editor for entries by editing the file **~/.config/jrnl/jrnl.yaml**. This is also where you can specify what files to use for journals, what special character to use for tags, and a few other options. Right now, the important thing is to set the editor. I use Vim, and jrnl's documentation has some [helpful hints][5] for using other editors like VSCode and Sublime Text.

![Example jrnl config file][6]

Jrnl can also encrypt journal files. By setting the global **encrypt** variable, you'll tell jrnl to encrypt all the journals you have defined. Encryption can also be set per file by adding **encrypt: true** to the definition in the configuration file.


```
journals:
  default: ~/journals/journal.txt
  work: ~/journals/work.txt
  private:
    journal: ~/journals/private.txt
    encrypt: true
```

If a journal isn't already encrypted, you will be prompted for the password on any actions for that journal. The journal file will be stored encrypted on disk and safe from prying eyes. [The jrnl documentation][7] has a lot more information on how it works, what ciphers it uses, and so on.

![Encrypted jrnl file][8]

Journaling helps me remember what I did when and find it later when I need it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/python-journal

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/notebook-writing-pen.jpg?itok=uA3dCfu_ (Writing in a notebook)
[2]: https://opensource.com/sites/default/files/uploads/productivity_8-1.png (jrnl)
[3]: https://jrnl.sh/
[4]: https://opensource.com/sites/default/files/uploads/productivity_8-2.png (jrnl's first run)
[5]: https://jrnl.sh/recipes/#external-editors
[6]: https://opensource.com/sites/default/files/uploads/productivity_8-3.png (Example jrnl config file)
[7]: https://jrnl.sh/encryption/
[8]: https://opensource.com/sites/default/files/uploads/productivity_8-4.png (Encrypted jrnl file)
