Why I love Xonsh
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/shelloff.png?itok=L8pjHXjW)

Shell languages are useful for interactive use. But this optimization often comes with trade-offs against using them as programming languages, which is sometimes felt when writing shell scripts.

What if your shell also understood a more scalable programming language? Say, Python?

Enter [Xonsh][1].

Installing Xonsh is as simple as creating a virtual environment, running `pip install xonsh[ptk,linux]`, and then running `xonsh`.

At first, you might wonder why your Python shell has a weird prompt:
```
$ 1+1
2
```

Nice calculator!
```
$ print("hello world")
hello world
```

We can also call other functions:
```
$ from antigravity import geohash
$ geohash(37.421542, -122.085589, b'2005-05-26-10458.68')
37.857713 -122.544543
```

However, we can still use it like a regular shell:
```
$ echo "hello world"
hello world
```

We can even mix and match!
```
$ for i in range(3):
.     echo "hello world"
.
hello world
hello world
hello world
```

Xonsh supports completion for both shell commands and Python expressions by using the [Prompt Toolkit][2]. Completions are visually informative, showing possible completions and having in-band dropdown lists.

It also supports environment access. It uses a simple but powerful heuristic for applying Python types to environment variables. The default is "string," but, for example, path variables are automatically lists.
```
$ '/usr/bin' in $PATH
True
```

Xonsh accepts either shell-style or Python-style boolean shortcut operators:
```
$ cat things
foo
$ grep -q foo things and echo "found"
found
$ grep -q bar things && echo "found"
$ grep -q foo things or echo "found"
$ grep -q bar things || echo "found"
found
```

This means that Python keywords are interpreted. If we want to print the title of a famous Dr. Seuss book, we need to quote the keywords.
```
$ echo green eggs "and" ham
green eggs and ham
```

If we do not, we are in for a surprise:
```
$ echo green eggs and ham
green eggs
xonsh: For full traceback set: $XONSH_SHOW_TRACEBACK = True
xonsh: subprocess mode: command not found: ham
Did you mean one of the following?
    as:   Command (/usr/bin/as)
    ht:   Command (/usr/bin/ht)
    mag:  Command (/usr/bin/mag)
    ar:   Command (/usr/bin/ar)
    nm:   Command (/usr/bin/nm)
```

Virtual environments can get a little tricky. Regular virtual environments, depending as they do on Bash-like syntax, cannot work. However, Xonsh comes with its own virtual environment management system called `vox`.

`vox` can create, activate and deactivate environments in `~/.virtualenvs`; if you've used `virtualenvwrapper`, this is where the environments were.

Note that the current activated environment doesn't affect `x``onsh`. It can't import anything from an activated environment.
```
$ xontrib load vox
$ vox create my-environment                                                    
...
$ vox activate my-environment        
Activated "my-environment".                                                    
$ pip install money                                                            
...
$ python                                                              
...
>>> import money                                                              
>>> money.Money('3.14')                        
$ import money
xonsh: For full traceback set: $XONSH_SHOW_TRACEBACK = True
ModuleNotFoundError: No module named 'money'
```

The first line enables `vox`: it is a `xontrib`, a third-party extension for Xonsh. The `xontrib` manager can list all possible `xontribs` and their current state (installed, loaded, or neither).

It's possible to write a `xontrib` and just upload it to `PyPi` to make it available. However, it's good practice to add it to the `xontrib` index so Xonsh knows about it in advance. This allows, for example, the configuration wizard to suggest it.

If you've ever wondered, "can Python be my shell?" then you are only a `pip install xonsh` away from finding out.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/xonsh-bash-alternative

作者：[Moshe Zadka][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[1]: https://xon.sh/
[2]: https://python-prompt-toolkit.readthedocs.io/en/master/
