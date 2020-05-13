[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with Bash programming)
[#]: via: (https://opensource.com/article/20/4/bash-programming-guide)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Get started with Bash programming
======
Learn how to write custom programs in Bash to automate your repetitive
tasks. Download our new eBook to get started.
![Command line prompt][1]

One of the original hopes for Unix was that it would empower everyday computer users to fine-tune their computers to match their unique working style. The expectations around computer customization have diminished over the decades, and many users consider their collection of apps and websites to be their "custom environment." One reason for that is that the components of many operating systems are not open, so their source code isn't available to normal users.

But for Linux users, custom programs are within reach because the entire system is based around commands available through the terminal. The terminal isn't just an interface for quick commands or in-depth troubleshooting; it's a scripting environment that can reduce your workload by taking care of mundane tasks for you.

### How to learn programming

If you've never done any programming before, it might help to think of it in terms of two different challenges: one is to understand how code is written, and the other is to understand what code to write. You can learn _syntax_—but you won't get far without knowing what words are available to you in the _language_. In practice, you start learning both concepts all at once because you can't learn syntax without words to arrange, so initially, you write simple tasks using basic commands and basic programming structures. Once you feel comfortable with the basics, you can explore more of the language so you can make your programs do more and more significant things.

In [Bash][2], most of the _words_ you use are Linux commands. The _syntax_ is Bash. If you already use Bash on a frequent basis, then the transition to Bash programming is relatively easy. But if you don't use Bash, you'll be pleased to learn that it's a simple language built for clarity and simplicity.

### Interactive design

Sometimes, the hardest thing to figure out when learning to program is what a computer can do for you. Obviously, if a computer on its own could do everything you do with it, then you wouldn't have to ever touch a computer again. But the reality is that humans are important. The key to finding something your computer can help you with is to take notice of tasks you repeatedly do throughout the week. Computers handle repetition particularly well.

But for you to be able to tell your computer to do something, you must know how to do it. This is an area Bash excels in: interactive programming. As you perform an action in the terminal, you are also learning how to script it.

For instance, I was once tasked with converting a large number of PDF books to versions that would be low-ink and printer-friendly. One way to do this is to open the PDF in a PDF editor, select each one of the hundreds of images—page backgrounds and textures counted as images—delete them, and then save it to a new PDF. Just one book would take half a day this way.

My first thought was to learn how to script a PDF editor, but after days of research, I could not find a PDF editing application that could be scripted (outside of very ugly mouse-automation hacks). So I turned my attention to finding out to accomplish the task from within a terminal. This resulted in several new discoveries, including GhostScript, the open source version of PostScript (the printer language PDF is based on). By using GhostScript for the task for a few days, I confirmed that it was the solution to my problem.

Formulating a basic script to run the command was merely a matter of copying the command and options I used to remove images from a PDF and pasting them into a text file. Running the file as a script would, presumably, produce the same results.

### Passing arguments to a Bash script

The difference between running a command in a terminal and running a command in a shell script is that the former is interactive. In a terminal, you can adjust things as you go. For instance, if I just processed **example_1.pdf** and am ready to process the next document, to adapt my command, I only need to change the filename.

A shell script isn't interactive, though. In fact, the only reason a shell _script_ exists is so that you don't have to attend to it. This is why commands (and the shell scripts that run them) accept arguments.

In a shell script, there are a few predefined variables that reflect how a script starts. The initial variable is **$0**, and it represents the command issued to start the script. The next variable is **$1**, which represents the first "argument" passed to the shell script. For example, in the command **echo hello**, the command **echo** is **$0,** and the word **hello** is **$1**. In the command **echo hello world**, the command **echo** is **$0**, **hello** is **$1**, and **world** is **$2**.

In an interactive shell:


```
$ echo hello world
hello world
```

In a non-interactive shell script, you _could_ do the same thing in a very literal way. Type this text into a text file and save it as **hello.sh**:


```
`echo hello world`
```

Now run the script:


```
$ bash hello.sh
hello world
```

That works, but it doesn't take advantage of the fact that a script can take input. Change **hello.sh** to this:


```
`echo $1`
```

Run the script with two arguments grouped together as one with quotation marks:


```
$ bash hello.sh "hello bash"
hello bash
```

For my PDF reduction project, I had a real need for this kind of non-interactivity, because each PDF took several minutes to condense. But by creating a script that accepted input from me, I could feed the script several PDF files all at once. The script processed each one sequentially, which could take half an hour or more, but it was a half-hour I could use for other tasks.

### Flow control

It's perfectly acceptable to create Bash scripts that are, essentially, transcripts of the exact process you took to achieve the task you need to be repeated. However, scripts can be made more powerful by controlling how information flows through them. Common methods of managing a script's response to data are:

  * if/then
  * for loops
  * while loops
  * case statements



Computers aren't intelligent, but they are good at comparing and parsing data. Scripts can feel a lot more intelligent if you build some data analysis into them. For example, the basic **hello.sh** script runs whether or not there's anything to echo:


```
$ bash hello.sh foo
foo
$ bash hello.sh

$
```

It would be more user-friendly if it provided a help message when it receives no input. That's an if/then statement, and if you're using Bash in a basic way, you probably wouldn't know that such a statement existed in Bash. But part of programming is learning the language, and with a little research you'd learn about if/then statements:


```
if [ "$1" = "" ]; then
        echo "syntax: $0 WORD"
        echo "If you provide more than one word, enclose them in quotes."
else
        echo "$1"
fi
```

Running this new version of **hello.sh** results in:


```
$ bash hello.sh
syntax: hello.sh WORD
If you provide more than one word, enclose them in quotes.
$ bash hello.sh "hello world"
hello world
```

### Working your way through a script

Whether you're looking for something to remove images from PDF files, or something to manage your cluttered Downloads folder, or something to create and provision Kubernetes images, learning to script Bash is a matter of using Bash and then learning ways to take those scripts from just a list of commands to something that responds to input. It's usually a process of discovery: you're bound to find new Linux commands that perform tasks you never imagined could be performed with text commands, and you'll find new functions of Bash to make your scripts adaptable to all the different ways you want them to run.

One way to learn these tricks is to read other people's scripts. Get a feel for how people are automating rote commands on their systems. See what looks familiar to you, and look for more information about the things that are unfamiliar.

Another way is to download our [introduction to programming with Bash][3] eBook. It introduces you to programming concepts specific to Bash, and with the constructs you learn, you can start to build your own commands. And of course, it's free to download and licensed under a [Creative Commons][4] license, so grab your copy today.

### [Download our introduction to programming with Bash eBook!][3]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/bash-programming-guide

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/resources/what-bash
[3]: https://opensource.com/downloads/bash-programming-guide
[4]: https://opensource.com/article/20/1/what-creative-commons
