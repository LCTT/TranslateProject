
Translating by GOLinux ...
Echo Command with Practical Examples
================================================================================
echo command is built in **shell command** , which is used to display the value of a **variable** or **print a line of text**. 

Echo command plays a important role in building a shell script.
 
### Synatx : ###

    # echo [Options] [String]

The items in square brackets are optional. A string can be defined as  finite sequence of characters (like letters, numerals, symbols  punctuation marks).

When echo command is used without any options or strings, echo returns a blank line on the display screen followed by the command prompt on the subsequent line. This is because pressing the ENTER key is a signal to the system to start a new line, and thus echo repeats this signal.
 
### Options : ###


- -n     do not output the trailing newline
- -e     enable interpretation of backslash escapes
- -E     disable interpretation of backslash escapes (default)

If -e is in effect, the following sequences are recognized:

- \\     backslash
- \a     alert (BEL)
- \b     backspace
- \c     produce no further output
- \e     escape
- \f     form feed
- \n     new line
- \r     carriage return
- \t     horizontal tab
- \v     vertical tab
- \0NNN  byte with octal value NNN (1 to 3 digits)
- \xHH   byte with hexadecimal value HH (1 to 2 digits)

### Example :1  Display the value of System Defined Variables ###

Using the set command , we can list the system define variables and to print the vaule of these variables we can use echo command :

    jack@localhost:~$ echo $USER
    jack
    jack@localhost:~$ echo $HOME
    /home/jack

### Example:2 Display the value of User defined Variables : ###

    jack@nextstep4it:~$ var1=`date`
    jack@nextstep4it:~$ echo "Today's date  time is : $var1"
    Today's date  time is : Mon Jul 28 13:11:37 IST 2014

### Example:3 Display the text String ###

    jack@nextstep4it:~$ echo " Hi this echo command testing"
    Hi this echo command testing

### Example:4 Use of backspace in echo command ###

    jack@nextstep4it:~$ echo -e "Ubuntu \bis \bthe \bbest \bDesktop \bOS"

Above Command will Print :
UbuntuisthebestDesktopOS

### Example:5  Use of  tab space in echo command ###

    nextstep4it@nextstep4it:~$ echo -e "Ubuntu \tis \tthe \tbest \tDesktop \tOS"

Above command will show below output :

Ubuntu is the best Desktop OS

### Example:6 Use of Vertical tab in echo Command ###

    jack@nextstep4it:~$ echo -e "Ubuntu \vis \vthe \vbest \vDesktop \vOS"
    Ubuntu
           is
                  the
                         best
                                Desktop
                                              OS

### Example:7  Colored output of echo command ###

echo command can change the font style, background color of fonts and font colors. Escape sequence \033 can be used to alter font properties. -e option has to be used in order to the escape sequence be in effect. Some of escape codes are listed below :

- [0m: Normal
- [1m: Bold fonts
- [2m: Font color changes to Purple
- [4m: Underlined fonts
- [7m: Invert foreground and background colors
- [8m: Invisible fonts
- [9m: Cross lined fonts
- [30m: Font color changes to Grey 
- [31m: Font color changes to Red
- [32m: Font color changes to Green
- [33m: Font color changes to Brown
- [34m: Font color changes to Blue
- [35m: Font color changes to Violet
- [36m: Font color changes to Sky Blue
- [37m: Font color changes to Light Grey
- [38m: Font color changes to Black
- [40m: Background color changes to Black
- [41m: Background color changes to Red
- [42m: Background color changes to Green
- [43m: Background color changes to Brown
- [44m: Background color changes to Blue
- [45m: Background color changes to Violet
- [46m: Background color changes to Sky Blue
- [47m: Background color changes to Light Grey

Below command will print the output in red color.

    jack@nextstep4it:~$ echo -e "\033[31mMagic of Linux\033[0m"
    Magic of Linux

Below Command will print “Magic of Linux” in bold style and red background color.

    nextstep4it@nextstep4it:~$ echo -e "\033[1m\033[41mMagic of Linux\033[0m"
    Magic of Linux

--------------------------------------------------------------------------------

via: http://www.nextstep4it.com/categories/unix-command/echo-command/

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
