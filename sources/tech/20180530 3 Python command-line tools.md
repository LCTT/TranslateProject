3 Python command-line tools
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-tool-box.png?itok=NrJYb417)

This article was co-written with [Lacey Williams Henschel][1].

Sometimes the right tool for the job is a command-line application. A command-line application is a program that you interact with and run from something like your shell or Terminal. [Git][2] and [Curl][3] are examples of command-line applications that you might already be familiar with.

Command-line apps are useful when you have a bit of code you want to run several times in a row or on a regular basis. Django developers run commands like `./manage.py runserver` to start their web servers; Docker developers run `docker-compose up` to spin up their containers. The reasons you might want to write a command-line app are as varied as the reasons you might want to write code in the first place.

For this month's Python column, we have three libraries to recommend to Pythonistas looking to write their own command-line tools.

### Click

[Click][4] is our favorite Python package for command-line applications. It:

  * Has great documentation filled with examples

  * Includes instructions on packaging your app as a Python application so it's easier to run

  * Automatically generates useful help text

  * Lets you stack optional and required arguments and even [several commands][5]

  * Has a Django version ([][6]

`django-click`

) for writing management commands




Click uses its `@click.command()` to declare a function as a command and specify required or optional arguments.
```
# hello.py

import click



@click.command()

@click.option('--name', default='', help='Your name')

def say_hello(name):

    click.echo("Hello {}!".format(name))



if __name__ == '__main__':

    hello()

```

The `@click.option()` decorator declares an [optional argument][7], and the `@click.argument()` decorator declares a [required argument][8]. You can combine optional and required arguments by stacking the decorators. The `echo()` method prints results to the console.
```
$ python hello.py --name='Lacey'

Hello Lacey!

```

### Docopt

[Docopt][9] is a command-line application parser, sort of like Markdown for your command-line apps. If you like writing the documentation for your apps as you go, Docopt has by far the best-formatted help text of the options in this article. It isn't our favorite command-line app library because its documentation throws you into the deep end right away, which makes it a little more difficult to get started. Still, it's a lightweight library that is very popular, especially if exceptionally nice documentation is important to you.

`help` and `version` flags.

Docopt is very particular about how you format the required docstring at the top of your file. The top element in your docstring after the name of your tool must be "Usage," and it should list the ways you expect your command to be called (e.g., by itself, with arguments, etc.). Usage should includeandflags.

The second element in your docstring should be "Options," and it should provide more information about the options and arguments you identified in "Usage." The content of your docstring becomes the content of your help text.
```
"""HELLO CLI



Usage:

    hello.py

    hello.py <name>

    hello.py -h|--help

    hello.py -v|--version



Options:

    <name>  Optional name argument.

    -h --help  Show this screen.

    -v --version  Show version.

"""



from docopt import docopt



def say_hello(name):

    return("Hello {}!".format(name))





if __name__ == '__main__':

    arguments = docopt(__doc__, version='DEMO 1.0')

    if arguments['<name>']:

        print(say_hello(arguments['<name>']))

    else:

        print(arguments)

```

At its most basic level, Docopt is designed to return your arguments to the console as key-value pairs. If I call the above command without specifying a name, I get a dictionary back:
```
$ python hello.py

{'--help': False,

 '--version': False,

 '<name>': None}

```

This shows me I did not input the `help` or `version` flags, and the `name` argument is `None`.

But if I call it with a name, the `say_hello` function will execute.
```
$ python hello.py Jeff

Hello Jeff!

```

Docopt allows both required and optional arguments and has different syntax conventions for each. Required arguments should be represented in `ALLCAPS` or in `<carets>`, and options should be represented with double or single dashes, like `--name`. Read more about Docopt's [patterns][10] in the docs.

### Fire

[Fire][11] is a Google library for writing command-line apps. We especially like it when your command needs to take more complicated arguments or deal with Python objects, as it tries to handle parsing your argument types intelligently.

Fire's [docs][12] include a ton of examples, but I wish the docs were a bit better organized. Fire can handle [multiple commands in one file][13], commands as methods on [objects][14], and [grouping][15] commands.

Its weakness is the documentation it makes available to the console. Docstrings on your commands don't appear in the help text, and the help text doesn't necessarily identify arguments.
```
import fire





def say_hello(name=''):

    return 'Hello {}!'.format(name)





if __name__ == '__main__':

  fire.Fire()

```

Arguments are made required or optional depending on whether you specify a default value for them in your function or method definition. To call this command, you must specify the filename and the function name, more like Click's syntax:
```
$ python hello.py say_hello Rikki

Hello Rikki!

```

You can also pass arguments as flags, like `--name=Rikki`.

### Bonus: Packaging!

Click includes instructions (and highly recommends you follow them) for [packaging][16] your commands using `setuptools`.

To package our first example, add this content to your `setup.py` file:
```
from setuptools import setup



setup(

    name='hello',

    version='0.1',

    py_modules=['hello'],

    install_requires=[

        'Click',

    ],

    entry_points='''

        [console_scripts]

        hello=hello:say_hello

    ''',

)

```

Everywhere you see `hello`, substitute the name of your module but omit the `.py` extension. Where you see `say_hello`, substitute the name of your function.

Then, run `pip install --editable` to make your command available to the command line.

You can now call your command like this:
```
$ hello --name='Jeff'

Hello Jeff!

```

By packaging your command, you omit the extra step in the console of having to type `python hello.py --name='Jeff'` and save yourself several keystrokes. These instructions will probably also work for the other libraries we mentioned.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/3-python-command-line-tools

作者：[Jeff Triplett][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/laceynwilliams
[1]:https://opensource.com/users/laceynwilliams
[2]:https://git-scm.com/
[3]:https://curl.haxx.se/
[4]:http://click.pocoo.org/5/
[5]:http://click.pocoo.org/5/commands/
[6]:https://github.com/GaretJax/django-click
[7]:http://click.pocoo.org/5/options/
[8]:http://click.pocoo.org/5/arguments/
[9]:http://docopt.org/
[10]:https://github.com/docopt/docopt#usage-pattern-format
[11]:https://github.com/google/python-fire
[12]:https://github.com/google/python-fire/blob/master/docs/guide.md
[13]:https://github.com/google/python-fire/blob/master/docs/guide.md#exposing-multiple-commands
[14]:https://github.com/google/python-fire/blob/master/docs/guide.md#version-3-firefireobject
[15]:https://github.com/google/python-fire/blob/master/docs/guide.md#grouping-commands
[16]:http://click.pocoo.org/5/setuptools/
