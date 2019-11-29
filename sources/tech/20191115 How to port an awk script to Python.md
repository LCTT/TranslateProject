[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to port an awk script to Python)
[#]: via: (https://opensource.com/article/19/11/awk-to-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How to port an awk script to Python
======
Porting an awk script to Python is more about code style than
transliteration.
![Woman sitting in front of her laptop][1]

Scripts are potent ways to solve a problem repeatedly, and awk is an excellent language for writing them. It excels at easy text processing in particular, and it can bring you through some complicated rewriting of config files or reformatting file names in a directory. 

### When to move from awk to Python

At some point, however, awk's limitations start to show. It has no real concept of breaking files into modules, it lacks quality error reporting, and it's missing other things that are now considered fundamentals of how a language works. When these rich features of a programming language are helpful to maintain a critical script, porting becomes a good option.

My favorite modern programming language that is perfect for porting awk is Python.

Before porting an awk script to Python, it is often worthwhile to consider its original context. For example, because of awk's limitations, the awk code is commonly called from a Bash script and includes some calls to other command-line favorites like sed, sort, and the gang. It's best to convert all of it into one coherent Python program. Other times, the script makes overly broad assumptions; for example, the code might allow for any number of files, even though it's run with only one in practice.

After carefully considering the context and determining the thing to substitute with Python, it is time to write code.

### Standard awk to Python functionality

The following Python functionality is useful to remember:


```
with open(some_file_name) as fpin:
    for line in fpin:
        pass # do something with line
```

This code will loop through a file line-by-line and process the lines.

If you want to access a line number (equivalent to awk's **NR**), you can use the following code:


```
with open(some_file_name) as fpin:
    for nr, line in enumerate(fpin):
        pass # do something with line
```

### awk-like behavior over multiple files in Python

If you need to be able to iterate through any number of files while keeping a persistent count of the number of lines (like awk's **FNR**), this loop can do it:


```
def awk_like_lines(list_of_file_names):
    def _all_lines():
        for filename in list_of_file_names:
            with open(filename) as fpin:
                yield from fpin
    yield from enumerate(_all_lines())
```

This syntax uses Python's _generators_ and **yield from** to build an _iterator_ that loops through all lines and keeps a persistent count.

If you need the equivalent of both **FNR** and **NR**, here is a more sophisticated loop:


```
def awk_like_lines(list_of_file_names):
    def _all_lines():
        for filename in list_of_file_names:
            with open(filename) as fpin:
                yield from enumerate(fpin)
    for nr, (fnr, line) in _all_lines:
        yield nr, fnr, line
```

### More complex awk functionality with FNR, NR, and line

The question remains if you need all three: **FNR**, **NR**, and **line**. If you really do, using a three-tuple where two of the items are numbers can lead to confusion. Named parameters can make this code easier to read, so it's better to use a **dataclass**:


```
import dataclass

@dataclass.dataclass(frozen=True)
class AwkLikeLine:
    content: str
    fnr: int
    nr: int

def awk_like_lines(list_of_file_names):
    def _all_lines():
        for filename in list_of_file_names:
            with open(filename) as fpin:
                yield from enumerate(fpin)
    for nr, (fnr, line) in _all_lines:
        yield AwkLikeLine(nr=nr, fnr=fnr, line=line)
```

You might wonder, why not start with this approach? The reason to start elsewhere is that this is almost always too complicated. If your goal is to make a generic library that makes porting awk to Python easier, then consider doing so. But writing a loop that gets you exactly what you need for a specific case is usually easier to do and easier to understand (and thus maintain).

### Understanding awk fields

Once you have a string that corresponds to a line, if you are converting an awk program, you often want to break it up into _fields_. Python has several ways of doing that. This will return a list of strings, splitting the line on any number of consecutive whitespaces:


```
`line.split()`
```

If another field separator is needed, something like this will split the line by **:**; the **rstrip** method is needed to remove the last newline:


```
`line.rstrip("\n").split(":")`
```

After doing the following, the list **parts** will have the broken-up string:


```
`parts = line.rstrip("\n").split(":")`
```

This split is good for choosing what to do with the parameters, but we are in an [off-by-one error][2] scenario. Now **parts[0]** will correspond to awk's **$1**, **parts[1]** will correspond to awk's **$2**, etc. This off-by-one is because awk starts counting the "fields" from 1, while Python counts from 0. In awk's **$0** is the whole line -- equivalent to **line.rstrip("\n") **and awk's **NF** (number of fields) is more easily retrieved as **len(parts)**.

### Porting awk fields in Python

As an example, let's convert the one-liner from "[How to remove duplicate lines from files with awk][3]" to Python.

The original in awk is:


```
`awk '!visited[$0]++' your_file > deduplicated_file`
```

An "authentic" Python conversion would be:


```
import collections
import sys

visited = collections.defaultdict(int)
for line in open("your_file"):
    did_visit = visited[line]
    visited[line] += 1
    if not did_visit:
        sys.stdout.write(line)
```

However, Python has more data structures than awk. Instead of _counting_ visits (which we do not use, except to know whether we saw a line), why not record the visited lines?


```
import sys

visited = set()
for line in open("your_file"):
    if line in visited:
        continue
    visited.add(line)
    sys.stdout.write(line)
```

### Making Pythonic awk code

The Python community advocates for writing Pythonic code, which means it follows a commonly agreed-upon code style. An even more Pythonic approach will separate the concerns of _uniqueness_ and _input/output_. This change would make it easier to unit test your code:


```
def unique_generator(things):
    visited = set()
    for thing in things:
        if thing in visited:
            continue
        visited.add(things)
        yield thing

import sys
   
for line in unique_generator(open("your_file")):
    sys.stdout.write(line)
```

Putting all logic away from the input/output code leads to better separation of concerns and more usability and testability of code.

### Conclusion: Python can be a good choice 

Porting an awk script to Python is often more a matter of reimplementing the core requirements while thinking about proper Pythonic code style than a slavish transliteration of condition/action by condition/action. Take the original context into account and produce a quality Python solution. While there are times when a Bash one-liner with awk can get the job done, Python coding is a path toward more easily maintainable code.

Also, if you're writing awk scripts, I am confident you can learn Python as well! Let me know if you have any questions in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/awk-to-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: https://en.wikipedia.org/wiki/Off-by-one_error
[3]: https://opensource.com/article/19/10/remove-duplicate-lines-files-awk
