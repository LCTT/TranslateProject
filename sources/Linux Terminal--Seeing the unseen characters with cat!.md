Linux终端：用cat命令查看隐藏的字符
================================================================================
Sometimes a program or software don’t start for a syntax error, and if you check the files there is nothing wrong..apparently.
There are a lot of characters that usually are not printed if you use a normal text editor, but you can easily check if they are present with your terminal and the command cat.某些时候，一个程序或软件并没有语法错误，并且你检查它的相关文件也确实没有发现问题。这是因为你用普通文本编辑器软件来查看的时候，有许多字符没有显示出来，但在终端下面使用cat命令可以很容易的检测出是否存在这些字符。

As first thing let’s create a simple text file with these special characters, open a terminal and run the command:首先，我们创建一个简单的文本文件，写入一些特殊的字符，打开终端，运行命令：

    printf 'testing\012\011\011testing\014\010\012more testing\012\011\000\013\000even more testing\012\011\011\011\012' > /tmp/testing.txt

Now if you open the file with an editor you’ll have different results.
A simple cat will show:

    $ cat /tmp/testing.txt 
    testing
    		testing
     
    more testing
     
    even more testing
    
While if you open it with nano or vim you’ll see :

    testing
                testing^L^H

    more testing
        ^@^K^@even more testing

Now we can see some options of cat to print special characters.

1) Use cat -T to display TAB characters as ^I

    cat -T /tmp/testing.txt
    testing
    ^I^Itesting
     
    more testing
    ^I
      even more testing
    ^I^I^I

2) Use cat -E to display $ at end of each line

    $ cat -E /tmp/testing.txt
    testing$
    		testing
      $
    more testing$
     
    even more testing$
    			$

3) Use a simple cat -A to show up all the invisible characters:

    $ cat -A /tmp/testing.txt
    testing$
    ^I^Itesting^L^H$
    more testing$
    ^I^@^K^@even more testing$
    ^I^I^I$

--------------------------------------------------------------------------------

via: http://linuxaria.com/pills/linux-terminal-seeing-the-unseen-characters-with-cat?lang=en#more-7645

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
