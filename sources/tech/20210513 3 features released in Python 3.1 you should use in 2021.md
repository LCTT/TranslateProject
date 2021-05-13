[#]: subject: (3 features released in Python 3.1 you should use in 2021)
[#]: via: (https://opensource.com/article/21/5/python-31-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

3 features released in Python 3.1 you should use in 2021
======
Explore some of the underutilized but still useful Python features.
![Python programming language logo with question marks][1]

This is the second in a series of articles about features that first appeared in a version of Python 3.x. Python 3.1 was first released in 2009, and even though it has been out for a long time, many of the features it introduced are underused and pretty cool. Here are three of them.

### Thousands formatting

When formatting large numbers, it is common to place commas every three digits to make the number more readable (e.g., 1,048,576 is easier to read than 1048576). Since Python 3.1, this can be done directly when using string formatting functions:


```
`"2 to the 20th power is {:,d}".format(2**20)`[/code] [code]`'2 to the 20th power is 1,048,576'`
```

The `,d` format specifier indicates that the number must be formatted with commas.

### Counter class

The `collections.Counter` class, part of the standard library module `collections`, is a secret super-weapon in Python. It is often first encountered in simple solutions to interview questions in Python, but its value is not limited to that.

For example, find the five most common letters in the first eight lines of [Humpty Dumpty's song][2]:


```
hd_song = """
In winter, when the fields are white,
I sing this song for your delight.

In Spring, when woods are getting green,
I'll try and tell you what I mean.

In Summer, when the days are long,
Perhaps you'll understand the song.

In Autumn, when the leaves are brown,
Take pen and ink, and write it down.
"""

[/code] [code]

import collections

collections.Counter(hd_song.lower().replace(' ', '')).most_common(5)

[/code] [code]`[('e', 29), ('n', 27), ('i', 18), ('t', 18), ('r', 15)]`
```

### Executing packages

Python allows the `-m` flag to execute modules from the command line. Even some standard-library modules do something useful when they're executed; for example, `python -m cgi` is a CGI script that debugs the web server's CGI configuration.

However, until Python 3.1, it was impossible to execute _packages_ like this. Starting with Python 3.1, `python -m package` will execute the `__main__` module in the package. This is a good place to put debug scripts or commands that are executed mostly with tools and do not need to be short.

Python 3.0 was released over 11 years ago, but some of the features that first showed up in this release are cool—and underused. Add them to your toolkit if you haven't already.

Newcomers to python-ideas occasionally make reference to the idea of "Python 4000" when proposing...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-31-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: http://www2.open.ac.uk/openlearn/poetryprescription/humpty-dumptys-recitation.html
