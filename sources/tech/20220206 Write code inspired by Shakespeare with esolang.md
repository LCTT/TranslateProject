[#]: subject: "Write code inspired by Shakespeare with esolang"
[#]: via: "https://opensource.com/article/22/2/shakespeare-esolang"
[#]: author: "Jessica Cherry https://opensource.com/users/cherrybomb"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Write code inspired by Shakespeare with esolang
======
This above all: to thine own code be true.
![red theater seating for a movie or play][1]

Maybe you've heard that playwright William Shakespeare contributed 1,700 new words to the English language. But did you know that he has an entire programming language as well?

SPL (Shakespeare programming language) was created to make source code resemble Shakespeare plays. It is an esoteric language, also known as an _esolang._ An esolang is a computer programming language designed to experiment with weird ideas, create a challenge for programmers, or simply serve as a source of amusement, rather than for practical use.

In a previous article, I shared how to build an app with the [Schwarzenegger-inspired language ArnoldC][2]. In this experiment, I'll cover a fully written "Hello World " example. If you want to follow along, you'll need GCC, `brew` or `make`, Python 2, and a lot of free time and patience. ([Python 2 has been unsupported since 2020][3], so this is just for entertainment.)

### What is this language?

In SLP, the code is the play, and the characters in the play are variables. If you want to assign a character, for example, Hamlet, a negative value, you put him and another character on the stage and let that character insult Hamlet.

Having someone tell a character to listen to their heart and speak their mind produces input and output. The language contains conditionals, in which characters ask each other questions, and jumps, in which they decide to go to a specific act or scene. Characters are also stacks that can be pushed and popped.

### Where do I get this language?

You can download the language from the [SPL website][4], which also contains a massive amount of documentation. Once you download the tar.gz file you can get started:


```


$ cd ~/spl
/spl$ ls
spl-1.2.1.tar.gz
/spl$ gunzip spl-1.2.1.tar.gz
/spl$ tar -xvf spl-1.2.1.tar
/spl$ cd spl-1.2.1/
/spl/spl-1.2.1$ ls
AUTHORS  examples   libspl.c  makescanner.c  strutils.c
COPYING  grammar.y  LICENSE   NEWS           strutils.h
editor   include    Makefile  spl.h          telma.h

```

Then you can run the `make` command to compile the interpreter or use `brew` for a faster install and easy precompile. I was having issues with `make`, so I ran `brew` again:


```


$ brew install --build-from-source shakespeare
&lt;snip&gt;
==&gt; Downloading <https://ghcr.io/v2/homebrew/core/gettext/blobs/\\>
sha256:33f840e667c6ee0f674adb279e644ca4a1b3cd1606894c85d9bbce1b5acc0273

==&gt; make install
🍺  /home/linuxbrew/.linuxbrew/Cellar/shakespeare/ \
1.2.1: 9 files, 154.1KB, built in 1 second
==&gt; Running `brew cleanup shakespeare`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).

```

### What's next?

Once you've installed SPL, get the other dependencies, starting with Python 2. You can install Python 2 with any package manager. Next, grab a C compiler that uses Python for the SPL files, which can be downloaded from the [SPL GitHub repository][5]. Once you've downloaded the files, just unzip and use them as needed from the directory.

In the base examples, we can take one of the premade files. In this case, I'll grab Hello World to test the compiler and run the code. Below are the commands and output.


```


/spl/Spl-master$ python2 splc.py ../spl-1.2.1/ \
examples/hello.spl &gt; hello.c
/spl/Spl-master$ gcc hello.c -lm
/spl/Spl-master$ ./a.out

Hello World!

```

As you can see, I used the compiler to convert the file to C, then used `gcc` using flags for linker options to use the library and the -m flag for the target file.

You can see how the entire Hello World SPL was written by going to the SPL website.

### How to add some numbers

In this section, I'll explain how to add up numbers. Get ready—this may take a while.

Start by creating a file and giving your play a title:


```


/spl/Spl-master$ vi math.spl

Adding multiple numbers together.
~      
~        
~      
~        
~      
~        
~        
~      
~        
"math.spl" [New File]

```

Next, give the play some characters. In this case, I'm choosing two from a list of acceptable characters that can be found in the SPL GitHub repository. These two characters will be doing some basic addition: 2+2=4.

Start by introducing them. The introductions have no importance, so you can introduce them as you please. Feel free to be silly:

  * Arthur, a man who has been written about one too many times and has too many movies
  * Cleopatra, a lady who has been written about, but the stories are usually only about who she dated



Next, set up your act and scene:

  * To create an act, type `Act`, the act number in Roman numerals, a colon, then a name for the act followed by a period. The act can be named anything you can think of.
  * To create a scene, type `Scene`, the scene number in Roman numerals, a colon, and then a name followed by a period. Once again, you are free to choose any name you would like.



For example:

  * Act I: This is the only act we'll have.
  * Scene I: Arthur and Cleopatra are assigned user-inputted values.



Type `[Enter Cleopatra and Arthur] `to bring your characters onto the stage.

Now that everyone is in the room, you need to set up the input values. Characters in SPL are set up to have "NAME:" followed by a properly punctuated sentence. For input values, the line used is "Listen to your heart." When the input is gathered, the speaking character has been assigned the value.

In this case, I set it up with some interesting sentences. Note that only two characters can be in a scene at a time.


```


[Enter Cleopatra and Arthur]

Cleopatra:
   Listen to your heart.

Arthur:
     LISTEN to your heart!

```

Now that the inputs are ready, it is time to move on to Scene II, where the math happens.

`Scene II: These two become a math machine`

To add the values, set up the store values in each character. One character will then do math by collecting input from the other. The command for addition is `You are the sum of yourself and I.` Just a reminder that punctuation does matter: I spent 20 minutes not noticing the missing punctuation during testing.


```


Arthur:
     You are the sum of yourself and I.

```

In Scene III, we'll have Cleopatra output her value into standard output. To do this, you must have the other character in the scene tell her to `Open your heart.` If you sum the values into one character, the other character in the scene should be the one who says, `Open your heart.`

`Scene III: Cleopatra will open her heart.`


```


Arthur:
     Open your heart.

```

To exit the program, use `[Exeunt]`. You can also have the characters exit using `[Exit NAME and NAME]`, but a single word feels easier to me.

In the end, your program should look like this:


```


Adding multiple numbers together.

Arthur, a man who has been written about one too many times \
and has too many movies.
Cleopatra, a lady who has been written about but usually the \
stories are only about who she dated.

     Act I: This is the only one we'll have.
     Scene I: Arthur and Cleopatra are assigned user-inputted values.

[Enter Cleopatra and Arthur]

Cleopatra:
   Listen to your heart.

Arthur:
     LISTEN to your heart!

     Scene II: These two become a math machine.

Arthur:
     You are the sum of yourself and I.

     Scene III: Cleopatra will open her heart.

Arthur:
     Open your heart.

[Exeunt]

```

To run your new program, do the three-step compile and play.


```


/spl/Spl-master$ python2 splc.py math.spl &gt; math.c
/spl/Spl-master$ gcc math.c -lm

/spl/Spl-master$ ./a.out
2
2
4

```

### To code or not to code, that is the question

This small project was definitely time-consuming and completely superfluous for writing up a simple math script. Doing the whole thing with user input echoing an actual quote would take even more time. That said, if you're feeling Shakesperian, you can set up an entire happy little play that's a program.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/shakespeare-esolang

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/felix-mooneeram-unsplash.jpg?itok=BzU7BPAg (red theater seating for a movie or play)
[2]: https://opensource.com/article/22/2/arnoldc-create-app
[3]: https://opensource.com/article/19/11/end-of-life-python-2
[4]: http://shakespearelang.sourceforge.net/
[5]: https://github.com/drsam94/Spl
