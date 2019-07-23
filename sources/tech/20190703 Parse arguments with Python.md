[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Parse arguments with Python)
[#]: via: (https://opensource.com/article/19/7/parse-arguments-python)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/notsag)

Parse arguments with Python
======
Parse Python like a pro with the argparse module.
![COBOL punch card][1]

If you're using [Python][2] for any amount of development, you have probably issued a command in a terminal, even if only to launch a Python script or install a Python module with [pip][3]. Commands may be simple and singular:


```
`$ ls`
```

Commands also might take an argument:


```
`$ ls example`
```

Commands can also have options or flags:


```
`$ ls --color example`
```

Sometimes options also have arguments:


```
`$ sudo firewall-cmd  --list-all --zone home`
```

### Arguments

The POSIX shell automatically splits whatever you type as a command into an array. For instance, here is a simple command:


```
`$ ls example`
```

The command **ls** is position **$0**, and the argument **example** is in position **$1**.

You _could_ write a loop to iterate over each item; determine whether it is the command, an option, or an argument; and take action accordingly. Luckily, a module called [argparse][4] already exists for that.

### Argparse

The argparse module is easy to integrate into your Python programs and has several convenience features. For instance, if your user changes the order of options or uses one option that takes no arguments (called a _Boolean_, meaning the option toggles a setting on or off) and then another that requires an argument (such as **\--color red**, for example), argparse can handle the variety. If your user forgets an option that's required, the argparse module can provide a friendly error message.

Using argparse in your application starts with defining what options you want to provide your user. There are several different kinds of arguments you can accept, but the syntax is consistent and simple.

Here's a simple example:


```
#!/usr/bin/env python
import argparse
import sys

def getOptions(args=sys.argv[1:]):
    parser = argparse.ArgumentParser(description="Parses command.")
    parser.add_argument("-i", "--input", help="Your input file.")
    parser.add_argument("-o", "--output", help="Your destination output file.")
    parser.add_argument("-n", "--number", type=int, help="A number.")
    parser.add_argument("-v", "--verbose",dest='verbose',action='store_true', help="Verbose mode.")
    options = parser.parse_args(args)
    return options
```

This code sample creates a function called **getOptions** and tells Python to look at each potential argument preceded by some recognizable string (such as **\--input** or **-i**). Any option that Python finds is returned out of the function as an **options** object (**options** is an arbitrary name and has no special meaning; it's just a data object containing a summary of all the arguments that the function has parsed).

By default, any argument given by the user is seen by Python as a string. If you need to ingest an integer (a number), you must specify that an option expects **type=int**, as in the **\--number** option in the sample code.

If you have an argument that just turns a feature on or off, then you must use the **boolean** type, as with the **\--verbose** flag in the sample code. This style of option simply stores **True** or **False**, specifying whether or not the user used the flag. If the option is used, then **stored_true** is activated.

Once the **getOptions** function runs, you can use the contents of the **options** object and have your program make decisions based on how the user invoked the command. You can see the contents of **options** with a test print statement. Add this to the bottom of your example file:


```
`print(getOptions())`
```

Then run the code with some arguments:


```
$ python3 ./example.py -i foo -n 4
Namespace(input='foo', number=4, output=None, verbose=False)
```

### Retrieving values

The **options** object in the sample code contains any value provided by the user (or a derived Boolean value) in keys named after the long option. In the sample code, for instance, the **\--number** option can be retrieved by looking at **options.number**.


```
options = getOptions(sys.argv[1:])

if options.verbose:
    print("Verbose mode on")
else:
    print("Verbose mode off")

print(options.input)
print(options.output)
print(options.number)

# Insert Useful Python Code Here...
```

The Boolean option, **\--verbose** in the example, is determined by testing whether **options.verbose** is True (meaning the user did use the **\--verbose** flag) or False (the user did not use the **\--verbose** flag), and taking some action accordingly.

### Help and feedback

Argparse also includes a built-in **\--help** (**-h** for short) option that provides a helpful tip on how the command is used. This is derived from your code, so it takes no extra work to generate this help system:


```
$ ./example.py --help
usage: example.py [-h] [-i INPUT] [-o OUTPUT] [-n NUMBER] [-v]

Parses command.

optional arguments:
  -h, --help            show this help message and exit
  -i INPUT, --input INPUT
                        Your input file.
  -o OUTPUT, --output OUTPUT
                        Your destination output file.
  -n NUMBER, --number NUMBER
                        A number.
  -v, --verbose         Verbose mode.
```

### Python parsing like a pro

This a simple example that demonstrates how to deal with parsing arguments in a Python application and how to quickly and efficiently document their syntax. The next time you write a quick Python script, give it some options with argparse. You'll thank yourself later, and your command will feel less like a quick hack and more like a "real" Unix command!

Here's the sample code, which you can use for testing:


```
#!/usr/bin/env python3
# GNU All-Permissive License
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

import argparse
import sys

def getOptions(args=sys.argv[1:]):
    parser = argparse.ArgumentParser(description="Parses command.")
    parser.add_argument("-i", "--input", help="Your input file.")
    parser.add_argument("-o", "--output", help="Your destination output file.")
    parser.add_argument("-n", "--number", type=int, help="A number.")
    parser.add_argument("-v", "--verbose",dest='verbose',action='store_true', help="Verbose mode.")
    options = parser.parse_args(args)
    return options

options = getOptions(sys.argv[1:])

if options.verbose:
    print("Verbose mode on")
else:
    print("Verbose mode off")

print(options.input)
print(options.output)
print(options.number)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/parse-arguments-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/notsag
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cobol-card-punch-programming-code.png?itok=6W6PUqUi (COBOL punch card)
[2]: https://www.python.org/
[3]: https://pip.pypa.io/en/stable/installing/
[4]: https://pypi.org/project/argparse/
