[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 open source tools that make Linux the ideal workstation)
[#]: via: (https://opensource.com/article/21/2/linux-workday)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

3 open source tools that make Linux the ideal workstation
======
Linux has everything you think you need and more for you to have a
productive workday.
![Person using a laptop][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Today, I'll share with you why Linux is a great choice for your workday.

Everyone wants to be productive during the workday. If your workday generally involves working on documents, presentations, and spreadsheets, then you might be accustomed to a specific routine. The problem is that _usual routine_ is usually dictated by one or two specific applications, whether it's a certain office suite or a desktop OS. Of course, just because something's a habit doesn't mean it's ideal, and yet it tends to persist unquestioned, even to the point of influencing the very structure of how a business is run.

### Working smarter

Many office applications these days run in the cloud, so you can work with the same constraints on Linux if you really want to. However, because many of the typical big-name office applications aren't cultural expectations on Linux, you might find yourself inspired to explore other options. As anyone eager to get out of their "comfort zone" knows, this kind of subtle disruption can be surprisingly useful. All too often, you don't know what you're doing inefficiently because you haven't actually tried doing things differently. Force yourself to explore other options, and you never know what you'll find. You don't even have to know exactly what you're looking for.

### LibreOffice

One of the most obvious open source office stalwarts on Linux (or any other platform) is [LibreOffice][2]. It features several components, including a word processor, presentation software, a spreadsheet, relational database interface, vector drawing, and more. It can import many document formats from other popular office applications, so transitioning to LibreOffice from another tool is usually easy.

There's more to LibreOffice than just being a great office suite, however. LibreOffice has macro support, so resourceful users can automate repetitive tasks. It also features terminal commands so you can perform many tasks without ever launching the LibreOffice interface.

Imagine, for instance, opening 21 documents, navigating to the **File** menu, to the **Export** or **Print** menu item, and exporting the file to PDF or EPUB. That's over 84 clicks, at the very least, and probably an hour of work. Compare that to opening a folder of documents and converting all of them to PDF or EPUB with just one swift command or menu action. The conversion would run in the background while you work on other things. You'd be finished in a quarter of the time, possibly less.


```
`$ libreoffice --headless --convert-to epub *.docx`
```

It's the little improvements that Linux encourages, not explicitly but implicitly, through its toolset and the ease with which you can customize your environment and workflow.

### Abiword and Gnumeric

Sometimes, a big office suite is exactly what you _don't_ need. If you prefer to keep your office work simple, you might do better with a lightweight and task-specific application. For instance, I mostly write articles in a text editor because I know all styles are discarded during conversion to HTML. But there are times when a word processor is useful, either to open a document someone has sent to me or because I want a quick and easy way to generate some nicely styled text.

[Abiword][3] is a simple word processor with basic support for popular document formats and all the essential features you'd expect from a word processor. It isn't meant as a full office suite, and that's its best feature. While there's no such a thing as too many options, there definitely is such a thing as information overload, and that's exactly what a full office suite or word processor is sometimes guilty of. If you're looking to avoid that, then use something simple instead.

Similarly, the [Gnumeric][4] project provides a simple spreadsheet application. Gnumeric avoids any features that aren't strictly necessary for a spreadsheet, so you still get a robust formula syntax, plenty of functions, and all the options you need for styling and manipulating cells. I don't do much with spreadsheets, so I find myself quite happy with Gnumeric on the rare occasions I need to review or process data in a ledger.

### Pandoc

It's possible to get even more minimal with specialized commands and document processors. The `pandoc` command specializes in document conversion. It's like the `libreoffice --headless` command, except with ten times the number of document formats to work with. You can even generate presentations with it! If part of your work is taking source text from one document and formatting it for several modes of delivery, then Pandoc is a necessity, and so you should [download our cheat sheet][5].

Broadly, Pandoc is representative of a completely different way of working. It gets you away from the confines of office applications. It separates you from trying to get your thoughts down into typed words and deciding what font those words ought to use, all at the same time. Working in plain text and then converting to all of your delivery targets afterward lets you work with any application you want, whether it's a notepad on your mobile device, a simple text editor on whatever computer you happen to be sitting in front of, or a text editor in the cloud.

### Look for the alternatives

There are lots of unexpected alternatives available for Linux. You can find them by taking a step back from what you're doing, analyzing your work process, assessing your required results, and investigating new applications that claim to do just the things you rely upon.

Changing the tools you use, your workflow, and your daily routine can be disorienting, especially when you don't know exactly where it is you're looking to go. But the advantage to Linux is that you're afforded the opportunity to re-evaluate the assumptions you've subconsciously developed over years of computer usage. If you look hard enough for an answer, you'll eventually realize what the question was in the first place. And oftentimes, you'll end up appreciating what you learn.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-workday

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: http://libreoffice.org
[3]: https://www.abisource.com
[4]: http://www.gnumeric.org
[5]: https://opensource.com/article/20/5/pandoc-cheat-sheet
