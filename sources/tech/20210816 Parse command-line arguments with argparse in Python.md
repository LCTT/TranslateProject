[#]: subject: "Parse command-line arguments with argparse in Python"
[#]: via: "https://opensource.com/article/21/8/python-argparse"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Parse command-line arguments with argparse in Python
======
Use the argparse module to enable options in your Python applications.
![Python options][1]

There are several third-party libraries for command-line argument parsing, but the standard library module `argparse` is no slouch either.

Without adding any more dependencies, you can write a nifty command-line tool with useful argument parsing.

### Argument parsing in Python

When parsing command-line arguments with `argparse`, the first step is to configure an `ArgumentParser` object. This is often done at the global module scope since merely _configuring_ the parser has no side effects.


```
import argparse

PARSER = argparse.ArgumentParser()
```

The most important method on `ArgumentParser` is `.add_argument()`. It has a few variants. By default, it adds an argument that expects a value.


```
`PARSER.add_argument("--value")`
```

To see it in action, call the method `.parse_args()`:


```
`PARSER.parse_args(["--value", "some-value"])`[/code] [code]`Namespace(value='some-value')`
```

It's also possible to use the syntax with `=`:


```
`PARSER.parse_args(["--value=some-value"])`[/code] [code]`Namespace(value='some-value')`
```

You can also specify a short "alias" for a shorter command line when typed into the prompt:


```
`PARSER.add_argument("--thing", "-t")`
```

It's possible to pass either the short option:


```
`PARSER.parse_args("-t some-thing".split())`[/code] [code]`Namespace(value=None, thing='some-thing')`
```

or the long one:


```
`PARSER.parse_args("--thing some-thing".split())`[/code] [code]`Namespace(value=None, thing='some-thing')`
```

### Types

There are more types of arguments available. The two most popular ones, after the default, are boolean and counting. The booleans come with a variant that defaults to true, and one that defaults to false.


```
PARSER.add_argument("--active", action="store_true")
PARSER.add_argument("--no-dry-run", action="store_false", dest="dry_run")
PARSER.add_argument("--verbose", "-v", action="count")
```

This means that `active` is `False` unless `--active` is passed, and `dry_run` is `True` unless `--no-dry-run` is passed. Short options without value can be juxtaposed.

Passing all the arguments results in a non-default state:


```
`PARSER.parse_args("--active --no-dry-run -vvvv".split())`[/code] [code]`Namespace(value=None, thing=None, active=True, dry_run=False, verbose=4)`
```

The default is somewhat less exciting:


```
`PARSER.parse_args("".split())`[/code] [code]`Namespace(value=None, thing=None, active=False, dry_run=True, verbose=None)`
```

### Subcommands

Though classic Unix commands "did one thing, and did it well," the modern tendency is to do "several closely related actions."

The examples of `git`, `podman`, and `kubectl` can show how popular the paradigm is. The `argparse` library supports that too:


```
MULTI_PARSER = argparse.ArgumentParser()
subparsers = MULTI_PARSER.add_subparsers()
get = subparsers.add_parser("get")
get.add_argument("--name")
get.set_defaults(command="get")
search = subparsers.add_parser("search")
search.add_argument("--query")
search.set_defaults(command="search")

[/code] [code]`MULTI_PARSER.parse_args("get --name awesome-name".split())`[/code] [code]`Namespace(name='awesome-name', command='get')`[/code] [code]`MULTI_PARSER.parse_args("search --query name~awesome".split())`[/code] [code]`Namespace(query='name~awesome', command='search')`
```

### Anatomy of a program

One way to use `argparse` is to structure the program as follows:


```
## my_package/__main__.py
import argparse
import sys

from my_package import toplevel

parsed_arguments = toplevel.PARSER.parse_args(sys.argv[1:])
toplevel.main(parsed_arguments)

[/code] [code]

## my_package/toplevel.py

PARSER = argparse.ArgumentParser()
## .add_argument, etc.

def main(parsed_args):

    ...

    # do stuff with parsed_args
```

In this case, running the command is done with `python -m my_package`. Alternatively, you can use the [`console_scripts`][2] entry points in the package's setup.

### Summary

The `argparse` module is a powerful command-line argument parser. There are many more features that have not been covered here. The limit is your imagination.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/python-argparse

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/bitmap_0.png?itok=PBXU-cn0 (Python options)
[2]: https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html#the-console-scripts-entry-point
