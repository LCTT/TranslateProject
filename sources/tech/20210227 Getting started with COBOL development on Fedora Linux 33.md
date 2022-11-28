[#]: subject: (Getting started with COBOL development on Fedora Linux 33)
[#]: via: (https://fedoramagazine.org/getting-started-with-cobol-development-on-fedora-linux-33/)
[#]: author: (donnie https://fedoramagazine.org/author/donnie/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Getting started with COBOL development on Fedora Linux 33
======

![cobol_article_title_photo][1]

Though its popularity has waned, COBOL is still powering business critical operations within many major organizations. As the need to update, upgrade and troubleshoot these applications grows, so may the demand for anyone with COBOL development knowledge.

Fedora 33 represents an excellent platform for COBOL development.
This article will detail how to install and configure tools, as well as compile and run a COBOL program.

### Installing and configuring tools

GnuCOBOL is a free and open modern compiler maintained by volunteer developers. To install, open a terminal and execute the following command:

```
# sudo dnf -y install gnucobol
```

Once completed, execute this command to verify that GnuCOBOL is ready for work:

```
# cobc -v
```

You should see version information and build dates. Don’t worry if you see the error “no input files”. We will create a COBOL program file with the Vim text editor in the following steps.

Fedora ships with a minimal version of Vim, but it would be nice to have some of the extra features that the full version can offer (such as COBOL syntax highlighting). Run the command below to install Vim-enhanced, which will overwrite Vim-minimal:

```
# sudo dnf -y install vim-enhanced
```

### Writing, Compiling, and Executing COBOL programs

At this point, you are ready to write a COBOL program. For this example, I am set up with username _fedorauser_ and I will create a folder under my home directory to store my COBOL programs. I called mine _cobolcode_.

```
# mkdir /home/fedorauser/cobolcode
# cd /home/fedorauser/cobolcode
```

Now we can create and open a new file to enter our COBOL source program. I’ll call it _helloworld.cbl_.

```
# vim helloworld.cbl
```

You should now have the blank file open in Vim, ready to edit. This will be a simple program that does nothing except print out a message to our terminal.

Enable “insert” mode in vim by pressing the “i” key, and key in the text below. Vim will assist with placement of your code sections. This can be very helpful since every character space in a COBOL file has a purpose (it’s a digital representation of the physical cards that developers would complete and feed into the computer).

```
 IDENTIFICATION DIVISION.
 PROGRAM-ID. HELLO-WORLD.
*simple helloworld program.
 PROCEDURE DIVISION.
     DISPLAY '##################################'.
     DISPLAY '#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#'.
     DISPLAY '#!!!!!!!!!!FEDORA RULES!!!!!!!!!!#'.
     DISPLAY '#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#'.
     DISPLAY '##################################'.
     STOP RUN.
```

You can now press the “ESC” key to exit insert mode, and key in “:x” to save and close the file.

Compile the program by keying in the following:

```
# cobc -x helloworld.cbl
```

It should complete quickly with return status: 0. Key in “ls” to view the contents of your current directory. You should see your original _helloworld.cbl_ file, as well as a new file simply named _helloworld_.

Execute the COBOL program.

```
# ./helloworld
```

If you see your text output without errors, then you have sucessfully compiled and executed the program!

![][2]

Now that we have the basics of writing, compiling, and running a COBOL program, lets try one that does something a little more interesting.

The following program will generate the Fibonacci sequence given your input. Use Vim to create a file called _fib.cbl_ and input the text below:

```
******************************************************************
      * Author: Bryan Flood
      * Date: 25/10/2018
      * Purpose: Compute Fibonacci Numbers
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIB.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  N0             BINARY-C-LONG VALUE 0.
       01  N1             BINARY-C-LONG VALUE 1.
       01  SWAP           BINARY-C-LONG VALUE 1.
       01  RESULT         PIC Z(20)9.
       01  I              BINARY-C-LONG VALUE 0.
       01  I-MAX          BINARY-C-LONG VALUE 0.
       01  LARGEST-N      BINARY-C-LONG VALUE 92.
       PROCEDURE DIVISION.
      *>  THIS IS WHERE THE LABELS GET CALLED
           PERFORM MAIN
           PERFORM ENDFIB
           GOBACK.
      *>  THIS ACCEPTS INPUT AND DETERMINES THE OUTPUT USING A EVAL STMT
       MAIN.
            DISPLAY "ENTER N TO GENERATE THE FIBONACCI SEQUENCE"
            ACCEPT I-MAX.
            EVALUATE TRUE
              WHEN I-MAX > LARGEST-N
                 PERFORM INVALIDN
              WHEN I-MAX > 2
                 PERFORM CASEGREATERTHAN2
              WHEN I-MAX = 2
                 PERFORM CASE2
              WHEN I-MAX = 1
                 PERFORM CASE1
              WHEN I-MAX = 0
                 PERFORM CASE0
              WHEN OTHER
                 PERFORM INVALIDN
            END-EVALUATE.
            STOP RUN.
       *>  THE CASE FOR WHEN N = 0
       CASE0.
           MOVE N0 TO RESULT.
           DISPLAY RESULT.
      *>  THE CASE FOR WHEN N = 1
       CASE1.
           PERFORM CASE0
           MOVE N1 TO RESULT.
           DISPLAY RESULT.
      *>  THE CASE FOR WHEN N = 2
       CASE2.
           PERFORM CASE1
           MOVE N1 TO RESULT.
           DISPLAY RESULT.
      *>  THE CASE FOR WHEN N > 2
       CASEGREATERTHAN2.
           PERFORM CASE1
           PERFORM VARYING I FROM 1 BY 1 UNTIL I = I-MAX
                   ADD N0 TO N1 GIVING SWAP
                   MOVE N1 TO N0
                   MOVE SWAP TO N1
                   MOVE SWAP TO RESULT
                   DISPLAY RESULT
            END-PERFORM.
      *>  PROVIDE ERROR FOR INVALID INPUT
       INVALIDN.
           DISPLAY 'INVALID N VALUE. THE PROGRAM WILL NOW END'.
      *>  END THE PROGRAM WITH A MESSAGE
       ENDFIB.
           DISPLAY "THE PROGRAM HAS COMPLETED AND WILL NOW END".
       END PROGRAM FIB.
```

As before, hit the “ESC” key to exit insert mode, and key in “:x” to save and close the file.

Compile the program:

```
# cobc -x fib.cbl
```

Now execute the program:

```
# ./fib
```

The program will ask for you to input a number, and will then generate Fibonocci output based upon that number.

![][3]

### Further Study

There are numerous resources available on the internet to consult, however vast amounts of knowledge reside only in legacy print. Keep an eye out for vintage COBOL guides when visiting used book stores and public libraries; you may find copies of endangered manuals at a rock-bottom prices!

It is also worth noting that helpful documentation was installed on your system when you installed GnuCOBOL. You can access them with these terminal commands:

```
# info gnucobol
# man cobc
# cobc -h
```

![][4]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-cobol-development-on-fedora-linux-33/

作者：[donnie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/donnie/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/02/Screenshot-from-2021-02-09-17-20-21-816x384.png
[2]: https://fedoramagazine.org/wp-content/uploads/2021/02/Screenshot-from-2021-01-02-21-48-22-1024x576.png
[3]: https://fedoramagazine.org/wp-content/uploads/2021/02/Screenshot-from-2021-02-21-22-11-51-1024x598.png
[4]: https://fedoramagazine.org/wp-content/uploads/2021/02/image_50369281-1-1024x768.jpg
