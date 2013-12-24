look : Linux Command To Verify Spellings And Display Lines Beginning With A String
================================================================================
Have you ever felt the need of a command line utility in Linux through which you can verify spellings? A utility that can display lines in file which contain a particular string as a prefix? Well, in this article we will discuss the **look** command in Linux that is capable of doing both these tasks.

### look Command In Linux ###

Here is a snapshot of the description of look command from its man page :

![](http://mylinuxbook.com/wp-content/uploads/2013/12/look-main.png)

### Testing Environment ###

- **OS** – Ubuntu 13.04
- **Shell** – Bash 4.2.45
- **Application** – look 2.20.1-5.1ubuntu8

#### A Brief Tutorial ####

Now lets discuss this command through some practical examples.

Suppose you want to verify the spelling of the word rendezvous. You can do it easily using look command.

Here is an example :

    $ look rendez
    rendezvous
    rendezvous's
    rendezvoused
    rendezvouses
    rendezvousing

So as you can see, I just passed a few initial characters of the word as command line argument  and the command produced all the related words. These words are fetched by the look command from the file **/usr/share/dict/words**.

Another scenario could be the one in which it is required to print all the lines beginning with a particular string. For example, if I want to display all the header files that are included in a c file, I’d use the look command in the following way :

    $ look "#include" efence_test.c 
    #include <stdio.h>
    #include <stdlib.h>

So you can see that it produced all the lines in file efence_test.c that begin with the string “#include” and hence I got to know the header files included in this source file.

By default, all the matching that the look command does is case-sensitive. You can opt for non-case-sensitive matching by using the **-f option**.

Here are some other command line options that the look command provides :

![](http://mylinuxbook.com/wp-content/uploads/2013/12/look-options.png)

For more information on this command, read its [man page][1].

#### Download/Install/Configure ####

Here are some of the important links related to the look command :

- Home Page [*Let me know if you find home page of this utility*]
- Download Link

The look command comes as a part of **util-linux** package which is pre-installed in most of the Linux distributions.

#### Pros ####

- Easily verify spellings from command line
- Comes pre-installed in most of the Linux distributions

#### Cons ####

- Depends on /usr/share/dict/words for spelling verification.

#### Conclusion ####

An excellent command line utility to verify spellings. Saves a lot of time if you want to display lines beginning with a particular string. Try it, you’ll definitely like it.

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/look-verify-spellings-and-display-lines/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.about.com/library/cmd/blcmdl1_look.htm