[#]: subject: "Tame your text with Perl"
[#]: via: "https://opensource.com/article/22/2/text-based-code-perl"
[#]: author: "Hunter Coleman https://opensource.com/users/hunterc"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Tame your text with Perl
======
Use regular expressions to speed up your text-based coding tasks.
![Person using a laptop][1]

Although its popularity has been tempered by languages like Python, Lua, and Go, Perl was one of the primary utilitarian languages on Unix and Linux for 30 years. It remains an important and powerful component in many open source systems today. If you haven't used Perl much, then you may be surprised by how helpful it can be for many tasks. This is especially true if you deal with large amounts of text in your day-to-day work.

If you need a language that allows you to search and manipulate large volumes of text quickly and easily, Perl is tough to beat. In fact, doing exactly that is what Larry Walls originally built the language for.

If you're brand new to Perl, you can read this [quick Perl intro][2] to get a feel for the basics.

### Searching text with regex

To get started, here's an example of a simple regular expression (sometimes shortened to "regex") script.

Suppose you have a list of names in a file called `names.txt`:


```


Steve Smith
Jane Murphy
Bobby Jones
Elizabeth Arnold
Michelle Swanson

```

You want to pull out all the people named Elizabeth. Put the regular expression you're looking for—here it is "Elizabeth"—between forward slashes, and Perl will look at every line following the special DATA token and only print lines that match.


```


use warnings;
use strict;

[open][3] my $fh, '&lt;:encoding(UTF-8)', "$names.txt" or
  [die][4] "Could not read file\n";

while(&lt;$fh&gt;){
  [print][5] if /Elizabeth/;
}

```

A quick note regarding this code: the regular expression needs to come at the end of the line. So `if /Elizabeth/ print;` will not work. This error is common for new Perl programmers.

### Changing selected words with lookarounds

Sometimes you may not want to do something with every instance of a string, but instead make your selections based on what comes either before or after the string. For example, perhaps you want to change the string "Robert" to "Bob" but only if "Robert" is followed by "Dylan." Otherwise, you don't want to change the name.

For Perl, this is easy. You can apply this condition with a single line of code directly from your terminal:


```
`perl -i.bkp -pe 's/Robert (?=Dylan)/Bob /g' names.txt`
```

For those new to Perl, this line might seem a bit intimidating at first glance, but it's really quite simple and elegant.

The `-i` flag makes the output of the program write back to a file instead of displaying on the terminal screen. You can provide an extension to `-i` to save the input file to a file with the given extension. In other words, I'm creating a backup of the original file with the `.bkp` extension. (Be sure that you do not put a space between `-i` and the extension `.bkp`.)

After that, I use the `-pe` options. The `-e` option allows me to run Perl from the command line. The `-p` option causes my code to loop through every line of the file and print the output. After all, I want the new file to contain every name in the original file, not just Mr. Dylan's.

Next comes the phrase `s/Robert (?=Dylan)/Bob /g`.

Here, I'm substituting (indicated by `s`) what comes between the first two slashes with what comes between the second and third slash. In this case, I want to substitute "Bob" for "Robert" in a specific circumstance. I want to do this for every instance in the file, not just the first one it finds, so I use the `g` flag for _global_ at the end.

What about that strange-looking `(?=Dylan)`? This is what's known as a _positive lookahead_ in the world of regular expressions. It's noncapturing, so it won't be replaced by anything (Bob, in this example); instead, the expression narrows down the results that do get changed.

I'm looking for the string "Robert" _if and only if_ it is followed (that's a positive lookahead) by the string "Dylan."

Otherwise, ignore it. If the name "Robert Smith" is in my list of names, for example, I want to leave that alone and not change it to "Bob Smith."

These are the lookarounds available to Perl users:

  * positive lookahead: `?=pattern`
  * negative lookahead: `?!pattern`
  * positive lookbehind: `?<=pattern`
  * negative lookbehind: `?<!pattern`



Be sure to place lookbehinds _behind_ the string you are searching for. To change "Sam" to "Samantha," but only if "Miss" precedes it, you would write:


```
s/(?&lt;=Miss) Sam/Samantha/g'
```

### Capture what comes before or after a word

What if you want to get everything either before or after a word, but you don't know how many words that will be? Perl makes doing this quick and easy.

This example starts with a list of recent (fictional) baseball games with the winning team listed first, followed by the word "over," followed by the nonwinning team and the final score.


```


San Francisco Giants over Miami Marlins 3:0
Chicago Cubs over Houston Astros 6:1
New York Mets over San Francisco Giants 4:3

```

Perl has some special built-in variables:

  * `$&` (dollar ampersand) contains the last string captured
  * `$`` (dollar backtick) holds what comes before the captured string on the line
  * `$'`(dollar apostrophe) holds what comes the captured string on the line



To get a list of the teams that won, I need to capture the word "over" and then output everything that comes before it.


```


use strict;
use warnings;

while (&lt;DATA&gt;){
        /over/;
        [print][5] "$`\n";

}

```

### Moving around a file with the seek function

So far, all the programs I've mentioned have started at the top and continued line by line until they reached the end, at which point the program is over. This is often all you need, but sometimes you want to jump around within a program to perform specific tasks in a certain order.

In that case, Perl's `seek` function is what you are looking for.

The `seek` function takes three arguments: a filehandle, a byte offset, and a file position.

The file position can be one of three values:

  * `0` = beginning of the file
  * `1` = current position in the file
  * `2` = end of the file



The second argument, the byte offset, is the number of bytes away from the file position you want to go to.

Positive numbers move the cursor position to the right, while negative values move the cursor to the left. Because there's nothing before the beginning, you can use negative byte offsets only if the file position is a 1 or a 2.

Here is an example to make this all clear:

Suppose you have a large list of names along with the person's birthday. You want to create a new list with the people who have a birthday in August listed at the top, followed by everyone else.

To accomplish this, you need to go through the entire list, finding everyone with an August birthday. Then, once you reach the bottom of the list, you must go back to the top and get all non-August birthday people.

Here's a portion of the original file:


```


Bob Smith 03/12/1967
Carl Carlson 01/22/1998
Susan Meyers 01/28/1980
Derek Jackson 08/02/2009
Sara Miller 02/11/2002
Marcus Philips 08/28/1999
Jeremy Stills 11/30/2001

```

Here is a Perl script to accomplish the task:


```


use strict;
use warnings;

[open][3] my $fh, '&lt;:encoding(UTF-8)', "originalfile.txt" or
    or [die][4] "Error opening file: $!d\n";

while($line = &lt;$fh&gt;){
  if ($line =~ [m][6]#\t\t08/#){
    [print][5] "$line\n";
  }

[seek][7] ($fh, 0, 0);

while (&lt;$fh&gt;){
  if ($line !~ [m][6]#\t\t08/#){
    [print][5] "$line";
  }

[close][8] $fh;

```

The line `if ($line =~ m#\t\t08/#) {` uses the `m` flag for the regular expression search, allowing you to use an arbitrary delimiter in your search.

The default, as you may have noticed before, is a forward slash (`/`). But because forward slashes are used in dates, this could throw off the search. Luckily, Perl allows you to use a different delimiter by placing your choice after the `m` flag. In this example, I use the common alternative hash (`#`), but you can use other characters (for example, square brackets, an ampersand, a capital X, and so on) as long as it doesn't interfere with or confuse your query.

In this case, you're searching for two Tab characters, written as `\t\t` in this example. It could also have been written as `\t{2}`.

The Tab characters must be followed by a `0`, followed by `an 8` (August is the eighth month), followed by a forward slash. Note that you couldn't just search for 08, because that would also match people born on the eighth day of any month and people born in 2008.

After Perl has found and printed all the August birthdays, I use the `seek` function to go back to the beginning of the file. Going through the file a second time, the regex search changes from a match (`=~`) to a nonmatch (`!~`) to get everyone born in one of the other 11 months.

### Explaining regexes to others

Regular expressions, in Perl and many [other languages][9], are a wonderful thing to know and use.

They can turn what would otherwise be a long and confusing process to program into a simple expression of only a few characters. But they do have a reputation for being a bit cryptic at times.

Writing a long and complicated regular expression might make programmers feel proud of themselves, but there is no place for needlessly complicated code. One sign of a good programmer is that other programmers can easily understand what they are doing.

When writing anything more than a relatively basic regular expression, it is usually a good idea to comment your regex with the `x` option. This option makes Perl ignore any comments and whitespace in the regex so you can explain to your future self and others just what it was you were attempting to do.

Note: The question to ask yourself is not "could I figure out what the regex is doing, even without comments," but "should I ask others to figure it out." Don't make other people try to figure out what it is you're doing.

Compare the two code examples below. They both do the same thing, but the second version is easier to understand.

Suppose you have this sample data to search through:


```


01/21/1998
sample text
Sept/21/97
Here is another line
Mr. Smith
01-12-2009
7/23/1998
Fake text
Feb./5/09

```

And you have the following regular expression in your Perl script:


```
`m%(?<![-|/|\d])((\d\d?)|[A-Z][a-z]*\.?)(?=[-|/])(/|-)\d\d?(/|-)\d{2,4}%`
```

Can you glance at that and understand what it does? Probably not. You might be able to figure it out, but it would take a few minutes.

On the other hand, you could write the same regular expression like this:


```


use strict;
use warnings;

while (&lt;DATA&gt;){
  [print][5] if m%   # capture dates written in multiple formats
  (?&lt;![-/\d])   # is not preceded by a hyphen, slash, or digit
  ((\d\d?)|[A-Z][a-z]*\\.?)(?=[-/])  # month 1 or 2 digits, or word with optional hyphen
                                    # followed by a hyphen or slash
  (/|-)\d\d?    # 1 or 2 digit day
  (/|-)\d{2,4}  # 2 or 4 digit year
  %x;
}

```

This version makes it clear that we are searching for dates.

The month appears as either one or two digits, written out as a word or abbreviated with or without a period, followed by either a slash or a hyphen. The day is written as either one or two digits, followed by a slash or a hyphen, followed by the year, written as a four-digit year or two-digit year.

Using the `x` modifier in the regular expression makes Perl ignore whitespace and comments, making it possible to explain the regular expression in a more friendly manner. Note that in this example, as before, I also used the `m` modifier to change the regex delimiters from the default `/` to `%` since this regex contains forward slashes.

### Conclusion

I hope this article has given you a taste of how the Perl language can speed up some of your text-based coding issues and make your job easier. Perl is a mature and rich language; this introduction has barely touched the surface of what it can do. If you are interested in increasing your productivity as a programmer, Perl is worth checking out.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/text-based-code-perl

作者：[Hunter Coleman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hunterc
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/22/1/learning-perl-easier-you-think
[3]: http://perldoc.perl.org/functions/open.html
[4]: http://perldoc.perl.org/functions/die.html
[5]: http://perldoc.perl.org/functions/print.html
[6]: http://perldoc.perl.org/functions/m.html
[7]: http://perldoc.perl.org/functions/seek.html
[8]: http://perldoc.perl.org/functions/close.html
[9]: https://opensource.com/article/19/11/how-regular-expressions-awk
