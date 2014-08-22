15 Practical Examples of ‘echo’ command in Linux
================================================================================
**echo** is one of the most commonly and widely used built-in command for Linux bash and C shells, that typically used in scripting language and batch files to display a line of text/string on standard output or a file.

![echo command examples](http://www.tecmint.com/wp-content/uploads/2014/08/echo-command.png)
echo command examples

The syntax for echo is:

    echo [option(s)] [string(s)]

**1.** Input a line of text and display on standard output

    $ echo Tecmint is a community of Linux Nerds 

Outputs the following text:

    Tecmint is a community of Linux Nerds 

**2.** Declare a variable and echo its value. For example, Declare a variable of **x** and assign its value=**10**.

     $ x=10

echo its value:

    $ echo The value of variable x = $x 

    The value of variable x = 10 

**Note:** The ‘**-e**‘ option in Linux acts as interpretation of escaped characters that are backslashed.

**3.** Using option ‘**\b**‘ – backspace with backslash interpretor ‘**-e**‘ which removes all the spaces in between.

    $ echo -e "Tecmint \bis \ba \bcommunity \bof \bLinux \bNerds" 

    TecmintisacommunityofLinuxNerds 

**4.** Using option ‘**\n**‘ – New line with backspace interpretor ‘**-e**‘ treats new line from where it is used.

    $ echo -e "Tecmint \nis \na \ncommunity \nof \nLinux \nNerds" 

    Tecmint 
    is 
    a 
    community 
    of 
    Linux 
    Nerds 

**5.** Using option ‘**\t**‘ – horizontal tab with backspace interpretor ‘**-e**‘ to have horizontal tab spaces.

    $ echo -e "Tecmint \tis \ta \tcommunity \tof \tLinux \tNerds" 

    Tecmint 	is 	a 	community 	of 	Linux 	Nerds 

**6.** How about using option new Line ‘**\n**‘ and horizontal tab ‘**\t**‘ simultaneously.

    $ echo -e "\n\tTecmint \n\tis \n\ta \n\tcommunity \n\tof \n\tLinux \n\tNerds" 
    
    	Tecmint 
    	is 
    	a 
    	community 
    	of 
    	Linux 
    	Nerds 

**7.** Using option ‘**\v**‘ – vertical tab with backspace interpretor ‘**-e**‘ to have vertical tab spaces.

    $ echo -e "\vTecmint \vis \va \vcommunity \vof \vLinux \vNerds" 
    
    Tecmint 
            is 
               a 
                 community 
                           of 
                              Linux 
                                    Nerds 

**8.** How about using option new Line ‘**\n**‘ and vertical tab ‘**\v**‘ simultaneously.

    $ echo -e "\n\vTecmint \n\vis \n\va \n\vcommunity \n\vof \n\vLinux \n\vNerds" 
    
    
    Tecmint 
    
    is 
    
    a 
    
    community 
    
    of 
    
    Linux 
    
    Nerds 

**Note:** We can double the vertical tab, horizontal tab and new line spacing using the option two times or as many times as required.

**9.** Using option ‘**\r**‘ – carriage return with backspace interpretor ‘**-e**‘ to have specified carriage return in output.

    $ echo -e "Tecmint \ris a community of Linux Nerds" 

    is a community of Linux Nerds 

**10.** Using option ‘**\c**‘ – suppress trailing new line with backspace interpretor ‘**-e**‘ to continue without emitting new line.

    $ echo -e "Tecmint is a community \cof Linux Nerds" 

    Tecmint is a community avi@tecmint:~$ 

**11.** Omit echoing trailing new line using option ‘**-n**‘.

    $ echo -n "Tecmint is a community of Linux Nerds" 
    Tecmint is a community of Linux Nerdsavi@tecmint:~/Documents$ 

**12.** Using option ‘**\a**‘ – alert return with backspace interpretor ‘**-e**‘ to have sound alert.

    $ echo -e "Tecmint is a community of \aLinux Nerds" 
    Tecmint is a community of Linux Nerds

**Note:** Make sure to check Volume key, before firing.

**13.** Print all the files/folder using echo command (ls command alternative).

    $ echo * 

    103.odt 103.pdf 104.odt 104.pdf 105.odt 105.pdf 106.odt 106.pdf 107.odt 107.pdf 108a.odt 108.odt 108.pdf 109.odt 109.pdf 110b.odt 110.odt 110.pdf 111.odt 111.pdf 112.odt 112.pdf 113.odt linux-headers-3.16.0-customkernel_1_amd64.deb linux-image-3.16.0-customkernel_1_amd64.deb network.jpeg 

**14.** Print files of a specific kind. For example, let’s assume you want to print all ‘**.jpeg**‘ files, use the following command.

    $ echo *.jpeg 

    network.jpeg 

**15.** The echo can be used with redirect operator to output to a file and not standard output.

    $ echo "Test Page" > testpage 

    ## Check Content
    avi@tecmint:~$ cat testpage 
    Test Page 

### echo Options ###

<table border="0" cellspacing="0">
<colgroup width="85"></colgroup>
<colgroup width="271"></colgroup>
<tbody>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> Options</b></td>
<td style="border: 1px solid #000000;" align="LEFT"><b> Description</b></td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> -n</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> do not print the trailing newline.</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> -e</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> enable interpretation of backslash escapes.</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \b</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> backspace</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \\</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> backslash</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \n</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> new line</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \r</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> carriage return</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \t</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> horizontal tab</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \v</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> vertical tab</td>
</tr>
</tbody>
</table>

That’s all for now and don’t forget to provide us with your valuable feedback in the comments below.
--------------------------------------------------------------------------------

via: http://www.tecmint.com/echo-command-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/