4 Python libraries for building great command-line user interfaces
============================================================

### In the second installment of a two-part series on terminal applications with great command-line UIs, we explore Prompt Toolkit, Click, Pygments, and Fuzzy Finder.


![Getting started with 4 practical Python libraries: Prompt Toolkit, Click, Pygments, and Fuzzy Finder](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/library-libraries-search.png?itok=YE0Qk276 "Getting started with 4 practical Python libraries: Prompt Toolkit, Click, Pygments, and Fuzzy Finder")
>Image by : [Mennonite Church USA Archives][16]. Modified by Opensource.com. [CC BY-SA 4.0][17]

This is the second installment in my two-part series on terminal applications with great command-line UIs. In the [first article][18], I discussed features that make a command-line application a pure joy to use. In part two, I'll look at how to implement those features in Python with the help of a few libraries. By the end of this article, readers should have a good understanding of how to use [Prompt Toolkit][19], [Click][20] (Command Line Interface Creation Kit), [Pygments][21], and [Fuzzy Finder][22] to implement an easy-to-use [REPL][23].

I plan to achieve this in fewer than 20 lines of Python code. Let's begin.

Programming and development

*   [New Python content][1]

*   [Our latest JavaScript articles][2]

*   [Recent Perl posts][3]

*   [Red Hat Developers Blog][4]

### Python Prompt Toolkit

I like to think of this library as the Swiss Army knife of command-line apps—it acts as a replacement for **[readline][5]**, **[curses][6]**, and much more. Let's install the library and get started:

```
pip install prompt_toolkit
```

We'll start with a simple REPL. Typically a REPL will accept user input, do an operation, and print the results. For our example, we're going to build an "echo" REPL. It merely prints back what the user typed in:

### REPL

```
from prompt_toolkit import prompt

while 1:
    user_input = prompt('>')
    print(user_input)
```

That is all it takes to implement a REPL. It can read user input and print out what they have entered. The **prompt** function used in this code snippet is from the **prompt_toolkit** library; it is a replacement for the **readline** library.

### History

To enhance our REPL, we can add command history:

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory

while 1:
    user_input = prompt('>', 
                        history=FileHistory('history.txt'),
                       )
    print(user_input)
```

We've just added persistent history to our REPL. Now we can use the up/down arrow to navigate the history, and use the **Ctrl**+**R** to search the history. This satisfies the basic etiquette of a command line.

### Auto-suggestion

One of the discoverability tricks I covered in part one was the automatic suggestion of commands from the history. (We saw this feature pioneered in the **fish** shell.) Let's add that feature to our REPL:

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory

while 1:
    user_input = prompt('>', 
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                       )
    print(user_input)
```

All we had to do was add a new argument to the **prompt()** API call. Now we have a REPL that has **fish**-style auto-suggestion from the history.

### Auto-completion

Now let's implement an enhancement of Tab-completion via auto-completion, which pops up possible suggestions as the user starts typing input.

How will our REPL know what to suggest? We supply a dictionary of possible items to suggest.

Let's say we're implementing a REPL for SQL. We can stock our auto-completion dictionary with SQL keywords. Let's see how to do that:

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.contrib.completers import WordCompleter

SQLCompleter = WordCompleter(['select', 'from', 'insert', 'update', 'delete', 'drop'],
                             ignore_case=True)

while 1:
    user_input = prompt('SQL>', 
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                        completer=SQLCompleter,
                        )
    print(user_input)
```

Once again, we simply can use a built-in completion routine of prompt-toolkit called **WordCompleter**, which matches the user input with the dictionary of possible suggestions and offers up a list.

We now have a REPL that can do auto-completion, fish-style suggestions from history, and up/down traversal of history. All of that in less than 10 lines of actual code.

### Click

Click is a command-line creation toolkit that makes it easy to parse command-line options arguments and parameters for the program. This section does not talk about how to use Click as an arguments parser; instead, I'm going to look at some utilities that ship with Click.

Installing click is simple:

```
pip install click
```

### Pager

Pagers are Unix utilities that display long output one page at a time. Examples of pagers are **less**, **more**, **most**, etc. Displaying the output of a command via a pager is not just friendly design, but also the decent thing to do.

Let's take the previous example further. Instead of using the default **print()** statement, we can use **click.echo_via_pager()**. This will take care of sending the output to stdout via a pager. It is platform-agnostic, so it will work in Unix or Windows. **click.echo_via_pager()** will try to use decent defaults for the pager to be able to show color codes if necessary:

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.contrib.completers import WordCompleter
import click

SQLCompleter = WordCompleter(['select', 'from', 'insert', 'update', 'delete', 'drop'],
                             ignore_case=True)

while 1:
    user_input = prompt(u'SQL>',
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                        completer=SQLCompleter,
                        )
    click.echo_via_pager(user_input)
```

### Editor

One of the niceties mentioned in my previous article was falling back to an editor when the command gets too complicated. Once again **click** has an [easy API][24] to launch an editor and return the text entered in the editor back to the application:

```
import click
message = click.edit()
```

### Fuzzy Finder

Fuzzy Finder is a way for users to narrow down the suggestions with minimal typing. Once again, there is a library that implements Fuzzy Finder. Let's install the library:

```
pip install fuzzyfinder
```

The API for Fuzzy Finder is simple. You pass in the partial string and a list of possible choices, and Fuzzy Finder will return a new list that matches the partial string using the fuzzy algorithm ranked in order of relevance. For example:

```
>>> from fuzzyfinder import fuzzyfinder

>>> suggestions = fuzzyfinder('abc', ['abcd', 'defabca', 'aagbec', 'xyz', 'qux'])

>>> list(suggestions)
['abcd', 'defabca', 'aagbec']
```

Now that we have our **fuzzyfinder**, let's add it into our SQL REPL. The way we do this is to define a custom completer instead of the **WordCompleter** that comes with **prompt-toolkit**. For example:

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.completion import Completer, Completion
import click
from fuzzyfinder import fuzzyfinder

SQLKeywords = ['select', 'from', 'insert', 'update', 'delete', 'drop']

class SQLCompleter(Completer):
    def get_completions(self, document, complete_event):
        word_before_cursor = document.get_word_before_cursor(WORD=True)
        matches = fuzzyfinder(word_before_cursor, SQLKeywords)
        for m in matches:
            yield Completion(m, start_position=-len(word_before_cursor))

while 1:
    user_input = prompt(u'SQL>',
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                        completer=SQLCompleter(),
                        )
    click.echo_via_pager(user_input)
```

### Pygments

Now let's add syntax highlighting to the user input. We are building a SQL REPL, and having colorful SQL statements will be nice.

Pygments is a syntax highlighting library with built-in support for more than 300 languages. Adding syntax highlighting makes an application colorful, which helps users spot mistakes—such as typos, unmatched quotes, or brackets—in their SQL before executing it.

First install Pygments:

```
pip install pygments
```

Let's use Pygments to add color to our SQL REPL:

```
from prompt_toolkit import prompt
from prompt_toolkit.history import FileHistory
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.completion import Completer, Completion
import click
from fuzzyfinder import fuzzyfinder
from pygments.lexers.sql import SqlLexer

SQLKeywords = ['select', 'from', 'insert', 'update', 'delete', 'drop']

class SQLCompleter(Completer):
    def get_completions(self, document, complete_event):
        word_before_cursor = document.get_word_before_cursor(WORD=True)
        matches = fuzzyfinder(word_before_cursor, SQLKeywords)
        for m in matches:
            yield Completion(m, start_position=-len(word_before_cursor))

while 1:
    user_input = prompt(u'SQL>',
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                        completer=SQLCompleter(),
                        lexer=SqlLexer,
                        )
    click.echo_via_pager(user_input)
```

Prompt Toolkit works well with the Pygments library. We pick **SqlLexer** supplied by **Pygments** and pass it into the **prompt** API from **prompt-toolkit**. Now all user input is treated as SQL statements and colored appropriately.

### Conclusion

That concludes our journey through the creation of a powerful REPL that has all the features of a common shell, such as history, key bindings, and user-friendly features such as auto-completion, fuzzy finding, pager support, editor support, and syntax highlighting. We achieved all of that in fewer than 20 statements of Python.

Wasn't that easy? Now you have no excuses not to write a stellar command-line app. These resources might help:

*   [Click][7] (Command Line Interface Creation Kit)

*   [Fuzzy Finder][8]

*   [Prompt Toolkit][9]

*   See the [Prompt Toolkit tutorial tutorial][10] and [examples][11] in the prompt-toolkit repository.

*   [Pygments][12]

 _Learn more in Amjith Ramanujam's  [PyCon US 2017][13] talk, [Awesome Commandline Tools][14], May 20th in Portland, Oregon._

--------------------------------------------------------------------------------

作者简介：

Amjith Ramanujam - Amjith Ramanujam is the creator of pgcli and mycli. People think they're pretty cool and he doesn't disagree. He likes programming in Python, Javascript and C. He likes to write simple, understandable code, sometimes he even succeeds. 

----------------------------

via: https://opensource.com/article/17/5/4-practical-python-libraries

作者：[ Amjith Ramanujam][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/amjith
[1]:https://opensource.com/tags/python?src=programming_resource_menu
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu
[3]:https://opensource.com/tags/perl?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[5]:https://docs.python.org/2/library/readline.html
[6]:https://docs.python.org/2/library/curses.html
[7]:http://click.pocoo.org/5/
[8]:https://pypi.python.org/pypi/fuzzyfinder
[9]:https://python-prompt-toolkit.readthedocs.io/en/latest/
[10]:https://github.com/jonathanslenders/python-prompt-toolkit/tree/master/examples/tutorial
[11]:https://github.com/jonathanslenders/python-prompt-toolkit/tree/master/examples/
[12]:http://pygments.org/
[13]:https://us.pycon.org/2017/
[14]:https://us.pycon.org/2017/schedule/presentation/518/
[15]:https://opensource.com/article/17/5/4-practical-python-libraries?rate=SEw4SQN1U2QSXM7aUHJZb2ZsPwyFylPIbgcVLgC_RBg
[16]:https://www.flickr.com/photos/mennonitechurchusa-archives/6987770030/in/photolist-bDu9zC-ovJ8gx-aecxqE-oeZerP-orVJHj-oubnD1-odmmg1-ouBNHR-otUoui-occFe4-ot7LTD-oundj9-odj4iX-9QSskz-ouaoMo-ous5V6-odJKBW-otnxbj-osXERb-iqdyJ8-ovgmPu-bDukCS-sdk9QB-5JQauY-fteJ53-ownm41-ov9Ynr-odxW52-rgqPBV-osyhxE-6QLRz9-i7ki3F-odbLQd-ownZP1-osDU6d-owrTXy-osLLXS-out7Dp-hNHsya-wPbFkS-od7yfD-ouA53c-otnzf9-ormX8L-ouTj6h-e8kAze-oya2zR-hn3B2i-aDNNqk-aDNNmR
[17]:https://creativecommons.org/licenses/by-sa/4.0/
[18]:https://opensource.com/article/17/4/4-terminal-apps
[19]:https://python-prompt-toolkit.readthedocs.io/en/latest/
[20]:http://click.pocoo.org/5/
[21]:http://pygments.org/
[22]:https://pypi.python.org/pypi/fuzzyfinder
[23]:https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop
[24]:http://click.pocoo.org/5/utils/#launching-editors
[25]:https://opensource.com/user/125521/feed
[26]:https://opensource.com/article/17/5/4-practical-python-libraries#comments
[27]:https://opensource.com/users/amjith
