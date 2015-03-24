7 Quirky ‘ls’ Command Tricks Every Linux User Should Know
================================================================================
We have covered most of the things on ‘ls‘ command in last two articles of our Interview series. This article is the last part of the ‘ls command‘ series. If you have not gone through last two articles of this series you may visit the links below.

注：以下三篇都做过源文，看看翻译了没有，如果发布了可适当改链接地址
- [15 Basic ‘ls’ Command Examples in Linux][]
- [15 Interview Questions on Linux “ls” Command – Part 1][]
- [10 Useful ‘ls’ Command Interview Questions – Part 2][]

![7 Quirky ls Command Tricks](http://www.tecmint.com/wp-content/uploads/2015/03/ls-command-tricks.jpg)
7 Quirky ls Command Tricks

### 1. List the contents of a directory with time using various time styles. ###

To list the contents of a directory with times using style, we need to choose any of the below two methods.

    # ls -l –time-style=[STYLE]               (Method A)

**Note** – The above switch (`--time` style must be run with switch `-l`, else it won’t serve the purpose).

    # ls –full-time                           (Method B)

Replace `[STYLE]` with any of the below option.

    full-iso
    long-iso
    iso
    locale
    +%H:%M:%S:%D

**Note** – In the above line H(Hour), M(Minute), S(Second), D(Date) can be used in any order.

Moreover you just choose those relevant and not all options. E.g., `ls -l --time-style=+%H` will show only hour.

`ls -l --time-style=+%H:%M:%D` will show Hour, Minute and date.

    # ls -l --time-style=full-iso

![ls Command Full Time Style](http://www.tecmint.com/wp-content/uploads/2015/03/ls-Command-Full-Time-Style.gif)
ls Command Full Time Style

    # ls -l --time-style=long-iso

![Long Time Style Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Long-Time-Listing-Format.gif)
Long Time Style Listing

    # ls -l --time-style=iso

![Time Style Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Local-Time-Style-Listing.gif)
Time Style Listing

    # ls -l --time-style=locale

![Locale Time Style Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Hour-Mintue-Time-Style-Listing.gif)
Locale Time Style Listing

    # ls -l --time-style=+%H:%M:%S:%D

![Date and Time Style Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Full-Time-Style-Listing.gif)
Date and Time Style Listing

    # ls --full-time

![Full Style Time Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Full-Style-Time-Listing.gif)

Full Style Time Listing

### 2. Output the contents of a directory in various formats such as separated by commas, horizontal, long, vertical, across, etc. ###

Contents of directory can be listed using ls command in various format as suggested below.

- across
- comma
- horizontal
- long
- single-column
- verbose
- vertical

    # ls –-format=across
    # ls --format=comma
    # ls --format=horizontal
    # ls --format=long
    # ls --format=single-column
    # ls --format=verbose
    # ls --format=vertical

![Listing Formats of ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/ls-command-Listing-Formats.gif)
Listing Formats of ls Command

### 3. Use ls command to append indicators like (/=@|) in output to the contents of the directory. ###

The option `-p` with ‘ls‘ command will server the purpose. It will append one of the above indicator, based upon the type of file.

    # ls -p

![Append Indicators to Content](http://www.tecmint.com/wp-content/uploads/2015/03/Append-Indicators.gif)
Append Indicators to Content

### 4. Sort the contents of directory on the basis of extension, size, time and version. ###

We can use options like `--extension` to sort the output by extension, size by extension `--size`, time by using extension `-t` and version using extension `-v`.

Also we can use option `--none` which will output in general way without any sorting in actual.

    # ls --sort=extension
    # ls --sort=size
    # ls --sort=time
    # ls --sort=version
    # ls --sort=none

![Sort Listing of Content by Options](http://www.tecmint.com/wp-content/uploads/2015/03/Sort-Content-by-Extensions.gif)
Sort Listing of Content by Options

### 5. Print numeric UID and GID for every contents of a directory using ls command. ###

The above scenario can be achieved using flag -n (Numeric-uid-gid) along with ls command.

    # ls -n

![Print Listing of Content by UID and GID](http://www.tecmint.com/wp-content/uploads/2015/03/Print-UID-GID-of-Contents.gif)
Print Listing of Content by UID and GID

### 6. Print the contents of a directory on standard output in more columns than specified by default. ###

Well ls command output the contents of a directory according to the size of the screen automatically.

We can however manually assign the value of screen width and control number of columns appearing. It can be done using switch ‘`--width`‘.

    # ls --width 80
    # ls --width 100
    # ls --width 150

![List Content Based on Window Sizes](http://www.tecmint.com/wp-content/uploads/2015/03/List-Content-By-More-Column.gif)
List Content Based on Window Sizes

**Note**: You can experiment what value you should pass with width flag.

### 7. Include manual tab size at the contents of directory listed by ls command instead of default 8. ###

    # ls --tabsize=[value]

![List Content by Table Size](http://www.tecmint.com/wp-content/uploads/2015/03/List-Content-by-Table-Size.gif)
List Content by Table Size

**Note**: Specify the `[Value]=` Numeric value.

That’s all for now. Stay tuned to Tecmint till we come up with next article. Do not forget to provide us with your valuable feedback in the comments below. Like and share us and help us get spread.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-ls-command-tricks/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[2]:http://www.tecmint.com/ls-command-interview-questions/
[3]:http://www.tecmint.com/ls-interview-questions/