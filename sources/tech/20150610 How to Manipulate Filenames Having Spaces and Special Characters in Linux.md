zpl1025
How to Manipulate Filenames Having Spaces and Special Characters in Linux
================================================================================
We come across files and folders name very regularly. In most of the cases file/folder name are related to the content of the file/folder and starts with number and characters. Alpha-Numeric file name are pretty common and very widely used, but this is not the case when we have to deal with file/folder name that has special characters in them.

**Note**: We can have files of any type but for simplicity and easy implementation we will be dealing with Text file (.txt), throughout the article.

Example of most common file names are:

    abc.txt
    avi.txt
    debian.txt
    ...

Example of numeric file names are:

    121.txt
    3221.txt
    674659.txt
    ...

Example of Alpha-Numeric file names are:

    eg84235.txt
    3kf43nl2.txt
    2323ddw.txt
    ...

Examples of file names that has special character and is not very common:

    #232.txt
    #bkf.txt
    #bjsd3469.txt
    #121nkfd.txt
    -2232.txt
    -fbjdew.txt
    -gi32kj.txt
    --321.txt
    --bk34.txt
    ...

One of the most obvious question here is – who on earth create/deal with files/folders name having a Hash `(#)`, a semi-colon `(;)`, a dash `(-)` or any other special character.

I Agree to you, that such file names are not common still your shell should not break/give up when you have to deal with any such file names. Also speaking technically every thing be it folder, driver or anything else is treated as file in Linux.

### Dealing with file that has dash (-) in it’s name ###

Create a file that starts with a dash `(-)`, say -abx.txt.

    $ touch -abc.txt

#### Sample Output ####

    touch: invalid option -- 'b'
    Try 'touch --help' for more information.

The reason for above error, that shell interprets anything after a dash `(-)`, as option, and obviously there is no such option, hence is the error.

To resolve such error, we have to tell the Bash shell (yup this and most of the other examples in the article is for BASH) not to interpret anything after special character (here dash), as option.

There are two ways to resolve this error as:

    $ touch -- -abc.txt		[Option #1]
    $ touch ./-abc.txt		[Option #2]

You may verify the file thus created by both the above ways by running commands ls or [ls -l][1] for long listing.

    $ ls -l
    
    total 0
    -rw-r--r-- 1 avi avi 0 Jun  8 11:05 -abc.txt

To edit the above file you may do:

    $ nano -- -abc.txt 
    or 
    $ nano ./-abc.txt 

**Note**: You may replace nano with any other editor of your choice say vim as:

    $ vim -- -abc.txt 
    or 
    $ vim ./-abc.txt 

Similarly to move such file you have to do:

    $ mv -- -abc.txt -a.txt
    or
    $ mv -- -a.txt -abc.txt

and to Delete this file, you have to do:

    $ rm -- -abc.txt
    or
    $ rm ./-abc.txt 

If you have lots of files in a folder the name of which contains dash, and you want to delete all of them at once, do as:

    $ rm ./-*

**Important to Note:**

1. The same rule as discussed above follows for any number of hypen in the name of the file and their occurrence. Viz., -a-b-c.txt, ab-c.txt, abc-.txt, etc.

2. The same rule as discussed above follows for the name of the folder having any number of hypen and their occurrence, except the fact that for deleting the folder you have to use ‘rm -rf‘ as:

    $ rm -rf -- -abc
    or
    $ rm -rf ./-abc

### Dealing with files having HASH (#) in the name ###

The symbol `#` has a very different meaning in BASH. Anything after a `#` is interpreted as comment and hence neglected by BASH.

**Understand it using examples:**

create a file #abc.txt.

    $ touch #abc.txt

#### Sample Output ####

    touch: missing file operand
    Try 'touch --help' for more information.

The reason for above error, that Bash is interpreting #abc.txt a comment and hence ignoring. So the [command touch][2] has been passed without any file Operand, and hence is the error.

To resolve such error, you may ask BASH not to interpret # as comment.

    $ touch ./#abc.txt
    or
    $ touch '#abc.txt'

and verify the file just created as:

    $ ls -l
    
    total 0
    -rw-r--r-- 1 avi avi 0 Jun  8 12:14 #abc.txt

Now create a file the name of which contains # anywhere except at the begging.

    $ touch ./a#bc.txt
    $ touch ./abc#.txt
    
    or
    $ touch 'a#bc.txt'
    $ touch 'abc#.txt'

Run ‘ls -l‘ to verify it:

    $ ls -l
    
    total 0
    -rw-r--r-- 1 avi avi 0 Jun  8 12:16 a#bc.txt
    -rw-r--r-- 1 avi avi 0 Jun  8 12:16 abc#.txt

What happens when you create two files (say a and #bc) at once:

    $ touch a.txt #bc.txt

Verify the file just created:

    $ ls -l
    
    total 0
    -rw-r--r-- 1 avi avi 0 Jun  8 12:18 a.txt

Obvious from the above example it only created file ‘a‘ and file ‘#bc‘ has been ignored. To execute the above situation successfully we can do,

    $ touch a.txt ./#bc.txt
    or
    $ touch a.txt '#bc.txt'

and verify it as:

    $ ls -l
    
    total 0
    -rw-r--r-- 1 avi avi 0 Jun  8 12:20 a.txt
    -rw-r--r-- 1 avi avi 0 Jun  8 12:20 #bc.txt

You can move the file as:

    $ mv ./#bc.txt ./#cd.txt
    or
    $ mv '#bc.txt' '#cd.txt'

Copy it as:

    $ cp ./#cd.txt ./#de.txt
    or
    $ cp '#cd.txt' '#de.txt'

You may edit it as using your choice of editor as:

    $ vi ./#cd.txt
    or
    $ vi '#cd.txt'

----------

    $ nano ./#cd.txt
    or
    $ nano '#cd.txt'

And Delete it as:

    $ rm ./#bc.txt 
    or
    $ rm '#bc.txt'

To delete all the files that has hash (#) in the file name, you may use:

    # rm ./#*

### Dealing with files having semicolon (;) in its name ###

In case you are not aware, semicolon acts as a command separator in BASH and perhaps other shell as well. Semicolon lets you execute several command in one go and acts as separator. Have you ever deal with any file name having semicolon in it? If not here you will.

Create a file having semi-colon in it.

    $ touch ;abc.txt

#### Sample Output ####

    touch: missing file operand
    Try 'touch --help' for more information.
    bash: abc.txt: command not found

The reason for above error, that when you run the above command BASH interpret touch as a command but could not find any file operand before semicolon and hence it reports error. It also reports another error that ‘abc.txt‘ command not found, only because after semicolon BASH was expecting another command and ‘abc.txt‘, is not a command.

To resolve such error, tell BASH not to interpret semicolon as command separator, as:

    $ touch ./';abc.txt'
    or
    $ touch ';abc.txt'

**Note**: We have enclosed the file name with single quote ''. It tells BASH that ; is a part of file name and not command separator.

Rest of the action (viz., copy, move, delete) on the file and folder having semicolon in its name can be carried out straight forward by enclosing the name in single quote.

### Dealing with other special characters in file/folder name ###

#### Plus Sign (+) in file name ####

Don’t requires anything extra, just do it normal way, as simple file name as shown below.

    $ touch +12.txt 

#### Dollar sign ($) in file name ####

You have to enclose file name in single quote, as we did in the case of semicolon. Rest of the things are straight forward..

    $ touch '$12.txt'

#### Percent (%) in file name ####

You don’t need to do anything differently, treat it as normal file.

    $ touch %12.txt

#### Asterisk (*) in file name ####

Having Asterisk in file name don’t change anything and you can continue using it as normal file.

    $ touch *12.txt

Note: When you have to delete a file that starts with *, Never use following commands to delete such files.

    $ rm *
    or
    $ rm -rf *

Instead use,

    $ rm ./*.txt

#### Exclamation mark (!) in file name ####

Just Enclose the file name in single quote and rest of the things are same.

    $ touch '!12.txt'

#### At Sign (@) in file name ####

Nothing extra, treat a filename having At Sign as nonrmal file.

    $ touch '@12.txt'

#### ^ in file name ####

No extra attention required. Use a file having ^ in filename as normal file.

    $ touch ^12.txt

#### Ampersand (&) in file name ####

Filename should be enclosed in single quotes and you are ready to go.

    $ touch '&12.txt'

#### Parentheses () in file name ####

If the file name has Parenthesis, you need to enclose filename with single quotes.

    $ touch '(12.txt)'

#### Braces {} in file name ####

No Extra Care needed. Just treat it as just another file.

    $ touch {12.txt}

#### Chevrons <> in file name ####

A file name having Chevrons must be enclosed in single quotes.

    $ touch '<12.txt>'

#### Square Brackets [ ] in file name ####

Treat file name having Square Brackets as normal files and you need not take extra care of it.

    $ touch [12.txt]

#### Under score (_) in file name ####

They are very common and don’t require anything extra. Just do what you would have done with a normal file.

    $ touch _12.txt

#### Equal-to (=) in File name ####

Having an Equal-to sign do not change anything, you can use it as normal file.

    $ touch =12.txt

#### Dealing with back slash (\) ####

Backslash tells shell to ignore the next character. You have to enclose file name in single quote, as we did in the case of semicolon. Rest of the things are straight forward.

    $ touch '\12.txt'

#### The Special Case of Forward Slash ####

You cannot create a file the name of which includes a forward slash (/), until your file system has bug. There is no way to escape a forward slash.

So if you can create a file such as ‘/12.txt’ or ‘b/c.txt’ then either your File System has bug or you have Unicode support, which lets you create a file with forward slash. In this case the forward slash is not a real forward slash but a Unicode character that looks alike a forward slash.

#### Question Mark (?) in file name ####

Again, an example where you don’t need to put any special attempt. A file name having Question mark can be treated in the most general way.

    $ touch ?12.txt

#### Dot Mark (.) in file name ####

The files starting with dot `(.)` are very special in Linux and are called dot files. They are hidden files generally a configuration or system files. You have to use switch ‘-a‘ or ‘-A‘ with ls command to view such files.

Creating, editing, renaming and deleting of such files are straight forward.

    $ touch .12.txt

Note: In Linux you may have as many dots `(.)` as you need in a file name. Unlike other system dots in file name don’t means to separate name and extension. You can create a file having multiple dots as:

    $ touch 1.2.3.4.5.6.7.8.9.10.txt

and check it as:

    $ ls -l
    
    total 0
    -rw-r--r-- 1 avi avi 0 Jun  8 14:32 1.2.3.4.5.6.7.8.9.10.txt

#### Comma (,) in file name ####

You can have comma in a file name, as many as you want and you Don’t requires anything extra. Just do it normal way, as simple file name.

    $ touch ,12.txt
    or
    $ touch ,12,.txt

#### Colon (:) in File name ####

You can have colon in a file name, as many as you want and you Don’t requires anything extra. Just do it normal way, as simple file name.

    $ touch :12.txt
    or
    $ touch :12:.txt

#### Having Quotes (single and Double) in file name ####

To have quotes in file name, we have to use the rule of exchange. I.e, if you need to have single quote in file name, enclose the file name with double quotes and if you need to have double quote in file name, enclose it with single quote.

    $ touch "15'.txt"
    
    and
    
    $ touch '15”.txt'

#### Tilde (~) in file name ####

Some Editors in Linux like emacs create a backup file of the file being edited. The backup file has the name of the original file plus a tilde at the end of the file name. You can have a file that name of which includes tilde, at any location simply as:

    $ touch ~1a.txt
    or
    $touch 2b~.txt

#### White Space in file name ####

Create a file the name of which has space between character/word, say “hi my name is avishek.txt”.

It is not a good idea to have file name with spaces and if you have to distinct readable name, you should use, underscore or dash. However if you have to create such a file, you have to use backward slash which ignores the next character to it. To create above file we have to do it this way..

    $ touch hi\ my\ name\ is\ avishek.txt
    
    hi my name is avishek.txt

I have tried covering all the scenario you may come across. Most of the above implementation are explicitly for BASH Shell and may not work in other shell.

If you feel that I missed something (that is very common and human nature), you may include your suggestion in the comments below. Keep Connected, Keep Commenting. Stay Tuned and connected! Like and share us and help us get spread!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-linux-filenames-with-special-characters/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[2]:http://www.tecmint.com/8-pratical-examples-of-linux-touch-command/
