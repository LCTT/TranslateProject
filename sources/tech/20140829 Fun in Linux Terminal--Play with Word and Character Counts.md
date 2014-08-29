Fun in Linux Terminal – Play with Word and Character Counts
================================================================================
Linux command line has a lot of fun around itself and many tedious task can be performed very easily yet with perfection. Playing with words and characters, their frequency in a text file, etc is what we are going to see in this article.

The only command that comes to our mind, for tweaking Linux command line to manipulate words and characters from a text file is [wc command][1].

![Fun with Word and Letter Counts in Shell](http://www.tecmint.com/wp-content/uploads/2014/03/Linux-Word-Count.png)

A ‘**wc**‘ command which stands for word count is capable of Printing Newline, word & byte counts from a text file.

To work with the small scripts to analyze text file, we must have a text file. To maintain uniformity, we are creating a text file with the output of man command, as described below.

    $ man man > man.txt

The above command creates a text file ‘**man.txt**‘ with the content of ‘**manual page**‘ for ‘man‘ command.

We want to check the most common words, in the above created ‘**Text File**‘ by running the below script.

    $ cat man.txt | tr ' '  '\012' | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | grep -v '[^a-z]' | sort | uniq -c | sort -rn | head

### Sample Output ###

    7557 
    262 the 
    163 to 
    112 is 
    112 a 
    78 of 
    78 manual 
    76 and 
    64 if 
    63 be

The above one liner simple script shows, ten most frequently appearing words and their frequency of appearance, in the text file.

How about breaking down a word into individual using following command.

    $ echo 'tecmint team' | fold -w1

### Sample Output ###

    t 
    e 
    c 
    m 
    i 
    n 
    t 
    t 
    e 
    a 
    m

**Note**: Here, ‘-w1′ is for width.

Now we will be breaking down every single word in a text file, sort the result and get the desired output with the frequency of ten most frequent characters.

    $ fold -w1 < man.txt | sort | uniq -c | sort -rn | head

### Sample Output ###

    8579  
    2413 e
    1987 a
    1875 t
    1644 i
    1553 n
    1522 o
    1514 s
    1224 r
    1021 l

How about getting most frequent characters in the text file with uppercase and lowercase differently along with their occurrence frequency.

    $ fold -w1 < man.txt | sort | tr '[:lower:]' '[:upper:]' | uniq -c | sort -rn | head -20

### Sample Output ###

    11636  
    2504 E 
    2079 A 
    2005 T 
    1729 I 
    1645 N 
    1632 S 
    1580 o
    1269 R 
    1055 L 
    836 H 
    791 P 
    766 D 
    753 C 
    725 M 
    690 U 
    605 F 
    504 G 
    352 Y 
    344 .

Check the above output, where punctuation mark is included. Lets strip out punctuation, with ‘**tr**‘ command. Here we go:

    $ fold -w1 < man.txt | tr '[:lower:]' '[:upper:]' | sort | tr -d '[:punct:]' | uniq -c | sort -rn | head -20

### Sample Output ###

      11636  
      2504 E 
      2079 A 
      2005 T 
      1729 I 
      1645 N 
      1632 S 
      1580 O 
      1550 
      1269 R 
      1055 L 
       836 H 
       791 P 
       766 D 
       753 C 
       725 M 
       690 U 
       605 F 
       504 G 
       352 Y

Now I have three text files, lets run the above one liner script to see the output.

    $ cat *.txt | fold -w1 | tr '[:lower:]' '[:upper:]' | sort | tr -d '[:punct:]' | uniq -c | sort -rn | head -8

### Sample Output ###

      11636  
       2504 E 
       2079 A 
       2005 T 
       1729 I 
       1645 N 
       1632 S 
       1580 O

Next we will be generating those infrequent letters that are at least ten letters long. Here is the simple script.

    $ cat man.txt | tr '' '\012' | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr -d '[0-9]' | sort | uniq -c | sort -n |  grep -E '..................' | head

### Sample Output ###

    1        ────────────────────────────────────────── 
    1        a all 
    1        abc             any or all arguments within   are optional 
    1               able  see setlocale for precise details 
    1        ab              options delimited by  cannot be used together 
    1               achieved by using the less environment variable 
    1              a child process returned a nonzero exit status 
    1               act as if this option was supplied using the name as a filename 
    1               activate local mode  format and display  local  manual  files 
    1               acute accent

**Note**: The more and more dots in the above script till all the results are generated. We can use .{10} to get ten character matches.

These simple scripts, also make us know most frequent appearing words and characters in English.

That’s all for now. I’ll be here again with another interesting and off the beat topic worth knowing, which you people will love to read. Don’t forget to provide us with your valuable feedback in comment section, below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/play-with-word-and-character-counts-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/wc-command-examples/