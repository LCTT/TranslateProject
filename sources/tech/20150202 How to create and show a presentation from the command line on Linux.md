translating by soooogreen
How to create and show a presentation from the command line on Linux
================================================================================
When you prepare a talk for audience, the first thing that will probably come to your mind is shiny presentation charts filled with fancy diagrams, graphics and animation effects. Fine. No one can deny the power of visually charming presentation. However, not all presentations need to be Ted talk quality. Often times, the purpose of a presentation is to convey specific information, which can easily be done with textual messages. In such cases, your time can be better spent on gathering information and checking facts, rather than searching for good-looking graphics from Google Image.

In the world of Linux, you can do presentation in several different ways, e.g., Impress for multimedia-rich content, [Impress.js][1] for stunning visualization, Beamer for hardcore LaTex users, and so on. If you are looking for a simple means to create and show a textual presentation, look no further. [mdp][2] can get the job done for you.

### What is Mdp? ###

mdp is an ncurses-based command-line presentation tool for Linux. What I like about mdp is its [markdown][3] support, which makes it easy to create slides with familiar markdown format. Naturally, it becomes painless to publish the slides in HTML format as well. Another plus is its support for UTF-8 character encoding, which comes in handy when showing non-English characters (e.g., Greek or Cyrillic alphabets).

### Install Mdp on Linux ###

Installation of mdp is mostly painless due to its light dependency requirement (i.e., ncursesw).

#### Debian, Ubuntu or their derivatives ####

    $ sudo apt-get install git gcc make libncursesw5-dev
    $ git clone https://github.com/visit1985/mdp.git
    $ cd mdp
    $ make
    $ sudo make install 

#### Fedora or CentOS/RHEL ####

    $ sudo yum install git gcc make ncurses-devel
    $ git clone https://github.com/visit1985/mdp.git
    $ cd mdp
    $ make
    $ sudo make install 

#### Arch Linux ####

On Arch Linux, you can easily install mdp from [AUR][4].

### Create a Presentation from the Command Line ###

Once you installed mdp, you can easily create a presentation by using your favorite text editor. If you are familiar with markdown, it will take no time to master mdp. For those of you who are not familiar with markdown, starting with an example is the best way to learn mdp.

Here is a 6-page sample presentation for your reference.

    %title: Sample Presentation made with mdp (Xmodulo.com)
    %author: Dan Nanni
    %date: 2015-01-28
    
    -> This is a slide title <-
    =========
    
    -> mdp is a command-line based presentation tool with markdown support. <-
    
    *_Features_*
    
    * Multi-level headers
    * Code block formatting
    * Nested quotes
    * Nested list
    * Text highlight and underline
    * Citation
    * UTF-8 special characters
    
    -------------------------------------------------
    
    -> # Example of nested list <-
    
    This is an example of multi-level headers and a nested list.
    
    # first-level title
    
    second-level
    ------------
    
    - *item 1*
        - sub-item 1
            - sub-sub-item 1
            - sub-sub-item 2
            - sub-sub-item 3
        - sub-item 2
    
    -------------------------------------------------
    
    -> # Example of code block formatting <-
    
    This example shows how to format a code snippet.
    
        1  /* Hello World program */
        2
        3  #include <stdio.h>
        4
        5  int main()
        6  {
        7     printf("Hello World");
        8     return 0;
        9  }
    
    This example shows inline code: `sudo reboot`
    
    -------------------------------------------------
    
    -> # Example of nested quotes <-
    
    This is an example of nested quotes.
    
    # three-level nested quotes
    
    > This is the first-level quote.
    >> This is the second-level quote
    >> and continues.
    >>> *This is the third-level quote, and so on.*
    
    -------------------------------------------------
    
    -> # Example of citations <-
    
    This example shows how to place a citation inside a presentation.
    
    This tutorial is published at [Xmodulo](http://xmodulo.com)
    
    You are welcome to connect with me at [LinkedIn](http://www.linkedin.com/in/xmodulo)
    
    Pretty cool, huh?
    
    -------------------------------------------------
    
    -> # Example of UTF-8 special characters <-
    
    This example shows UTF-8 special characters.
    
    ae = ä, oe = ö, ue = ü, ss = ß
    alpha = ?, beta = ?, upsilon = ?, phi = ?
    Omega = ?, Delta = ?, Sigma = ?
    
    ???????????
    ?rectangle?
    ???????????

### Show a Presentation from the Command Line ###

Once you save the above code as slide.md text file, you can show the presentation by simply running:

     $ mdp slide.md 

You can navigate the presentation by pressing Enter/Space/Page-Down/Down-Arrow (next slide), Backspace/Page-Up/Up-Arrow (previous slide), Home (first slide), End (last slide), or numeric-N (N-th slide).

The title of the presentation appears on top of each slide, and your name and page number are shown at the bottom.

![](https://farm9.staticflickr.com/8637/16392457702_ec732d0094_c.jpg)

This is an example of a nested list and multi-level headers.

![](https://farm9.staticflickr.com/8567/16367397606_29be7df633_c.jpg)

This is an example of a code snippet and inline code.

![](https://farm9.staticflickr.com/8682/15770926144_0f982b0863_b.jpg)

This is an example of nested quotes.

![](https://farm9.staticflickr.com/8587/16393383115_0865c8b89b_c.jpg)

This is an example of placing citations.

![](https://farm8.staticflickr.com/7409/16392457712_ed36c14bc2_c.jpg)

This is an example of UTF-8 special characters.

![](https://farm9.staticflickr.com/8648/16205981560_7fa3debc75_c.jpg)

### Summary ###

In this tutorial, I showed you how to use mdp to create and show a presentation from the command line. Its markdown compatibility saves us the trouble and hassle of having to learn any new formatting, which is an advantage compared to [tpp][5], another command-line presentation tool. Due to its limitations, mdp may not qualify as your default presentation tool, but there should be definitely a use case for that. What do you think of mdp? Do you prefer something else?

--------------------------------------------------------------------------------

via: http://xmodulo.com/presentation-command-line-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://bartaz.github.io/impress.js/
[2]:https://github.com/visit1985/mdp
[3]:http://daringfireball.net/projects/markdown/
[4]:https://aur.archlinux.org/packages/mdp-git/
[5]:http://www.ngolde.de/tpp.html
