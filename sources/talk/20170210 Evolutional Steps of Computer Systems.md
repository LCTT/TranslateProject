lontow Translating

Evolutional Steps of Computer Systems
======
Throughout the history of the modern computer, there were several evolutional steps related to the way we interact with the system. I tend to categorize those steps as following:

  1. Numeric Systems
  2. Application-Specific Systems
  3. Application-Centric Systems
  4. Information-Centric Systems
  5. Application-Less Systems



Following sections describe how I see those categories.

### Numeric Systems

[Early computers][1] were designed with numbers in mind. They could add, subtract, multiply, divide. Some of them were able to perform more complex mathematical operations such as differentiate or integrate.

If you map characters to numbers, they were able to «compute» [strings][2] as well but this is somewhat «creative use of numbers» instead of meaningful processing arbitrary information.

### Application-Specific Systems

For higher-level problems, pure numeric systems are not sufficient. Application-specific systems were developed to do one single task. They were very similar to numeric systems. However, with sufficiently complex number calculations, systems were able to accomplish very well-defined higher level tasks such as calculations related to scheduling problems or other optimization problems.

Systems of this category were built for one single purpose, one distinct problem they solved.

### Application-Centric Systems

Systems that are application-centric are the first real general purpose systems. Their main usage style is still mostly application-specific but with multiple applications working either time-sliced (one app after another) or in multi-tasking mode (multiple apps at the same time).

Early personal computers [from the 70s][3] of the previous century were the first application-centric systems that became popular for a wide group of people.

Yet modern operating systems - Windows, macOS, most GNU/Linux desktop environments - still follow the same principles.

Of course, there are sub-categories as well:

  1. Strict Application-Centric Systems
  2. Loose Application-Centric Systems



Strict application-centric systems such as [Windows 3.1][4] (Program Manager and File Manager) or even the initial version of [Windows 95][5] had no pre-defined folder hierarchy. The user did start text processing software like [WinWord][6] and saved the files in the program folder of WinWord. When working with a spreadsheet program, its files were saved in the application folder of the spreadsheet tool. And so on. Users did not create their own hierarchy of folders mostly because of convenience, laziness, or because they did not saw any necessity. The number of files per user were sill within dozens up to a few hundreds.

For accessing information, the user typically opened an application and within the application, the files containing the generated data were retrieved using file/open.

It was [Windows 95][5] SP2 that introduced «[My Documents][7]» for the Windows platform. With this file hierarchy template, application designers began switching to «My Documents» as a default file save/open location instead of using the software product installation path. This made the users embrace this pattern and start to maintain folder hierarchies on their own.

This resulted in loose application-centric systems: typical file retrieval is done via a file manager. When a file is opened, the associated application is started by the operating system. It is a small or subtle but very important usage shift. Application-centric systems are still the dominant usage pattern for personal computers.

Nevertheless, this pattern comes with many disadvantages. For example in order to prevent data retrieval problems, there is the need to maintain a strict hierarchy of folders that contain all related files of a given project. Unfortunately, nature does not fit well in strict hierarchy of folders. Further more, [this does not scale well][8]. Desktop search engines and advanced data organizing tools like [tagstore][9] are able to smooth the edged a bit. As studies show, only a minority of users are using such advanced retrieval tools. Most users still navigate through the file system without using any alternative or supplemental retrieval techniques.

### Information-Centric Systems

One possible way of dealing with the issue that a certain topic needs to have a folder that holds all related files is to switch from an application-centric system to an information-centric systems.

Instead of opening a spreadsheet application to work with the project budget, opening a word processor application to write the project report, and opening another tool to work with image files, an information-centric system combines all the information on the project in one place, in one application.

The calculations for the previous month is right beneath notes from a client meeting which is right beneath a photography of the whiteboard notes which is right beneath some todo tasks. Without any application or file border in between.

Early attempts to create such an environment were IBM [OS/2][10], Microsoft [OLE][11] or [NeXT][12]. None of them were a major success for a variety of reasons. A very interesting information-centric environment is [Acme][13] from [Plan 9][14]. It combines [a wide variety of applications][15] within one application but it never reached a notable distribution even with its ports to Windows or GNU/Linux.

Modern approaches for an information-centric system are advanced [personal wikis][16] like [TheBrain][17] or [Microsoft OneNote][18].

My personal tool of choice is the [GNU/Emacs][19] platform with its [Org-mode][19] extension. I hardly leave Org-mode when I work with my computer. For accessing external data sources, I created [Memacs][20] which brings me a broad variety of data into Org-mode. I love to do spreadsheet calculations right beneath scheduled tasks, in-line images, internal and external links, and so forth. It is truly an information-centric system where the user doesn't have to deal with application borders or strictly hierarchical file-system folders. Multi-classifications is possible using simple or advanced tagging. All kinds of views can be derived with a single command. One of those views is my calendar, the agenda. Another derived view is the list of borrowed things. And so on. There are no limits for Org-mode users. If you can think of it, it is most likely possible within Org-mode.

Is this the end of the evolution? Certainly not.

### Application-Less Systems

I can think of a class of systems which I refer to as application-less systems. As the next logical step, there is no need to have single-domain applications even when they are as capable as Org-mode. The computer offers a nice to use interface to information and features, not files and applications. Even a classical operating system is not accessible.

Application-less systems might as well be combined with [artificial intelligence][21]. Think of it as some kind of [HAL 9000][22] from [A Space Odyssey][23]. Or [LCARS][24] from Star Trek.

It is hard to believe that there is a transition between our application-based, vendor-based software culture and application-less systems. Maybe the open source movement with its slow but constant development will be able to form a truly application-less environment where all kinds of organizations and people are contributing to.

Information and features to retrieve and manipulate information, this is all it takes. This is all we need. Everything else is just limiting distraction.

--------------------------------------------------------------------------------

via: http://karl-voit.at/2017/02/10/evolution-of-systems/

作者：[Karl Voit][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://karl-voit.at
[1]:https://en.wikipedia.org/wiki/History_of_computing_hardware
[2]:https://en.wikipedia.org/wiki/String_%2528computer_science%2529
[3]:https://en.wikipedia.org/wiki/Xerox_Alto
[4]:https://en.wikipedia.org/wiki/Windows_3.1x
[5]:https://en.wikipedia.org/wiki/Windows_95
[6]:https://en.wikipedia.org/wiki/Microsoft_Word
[7]:https://en.wikipedia.org/wiki/My_Documents
[8]:http://karl-voit.at/tagstore/downloads/Voit2012b.pdf
[9]:http://karl-voit.at/tagstore/
[10]:https://en.wikipedia.org/wiki/OS/2
[11]:https://en.wikipedia.org/wiki/Object_Linking_and_Embedding
[12]:https://en.wikipedia.org/wiki/NeXT
[13]:https://en.wikipedia.org/wiki/Acme_%2528text_editor%2529
[14]:https://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs
[15]:https://en.wikipedia.org/wiki/List_of_Plan_9_applications
[16]:https://en.wikipedia.org/wiki/Personal_wiki
[17]:https://en.wikipedia.org/wiki/TheBrain
[18]:https://en.wikipedia.org/wiki/Microsoft_OneNote
[19]:../../../../tags/emacs
[20]:https://github.com/novoid/Memacs
[21]:https://en.wikipedia.org/wiki/Artificial_intelligence
[22]:https://en.wikipedia.org/wiki/HAL_9000
[23]:https://en.wikipedia.org/wiki/2001:_A_Space_Odyssey
[24]:https://en.wikipedia.org/wiki/LCARS
