translating by lujun9972
Improve your code searching skills with pss
======
Searching a code base is a part of every day developer activities. From fixing a bug, to learning a new code base or checking how to call an api, being able to quickly navigate your way into a code base is a great skill to have. Luckily, we have dedicated tools to search code. Let's see how to install and use one of them - [**pss**][1].

### What is pss?

**pss** is a command line tool that helps searching inside source code file. **pss** searches recursively within a directory tree, knows which extensions and file names to search and which to ignore, automatically skips directories you wouldn't want to search in (for example `.svn` or `.git`), colors its output in a helpful way, and much more.

### Installing pss

Install **pss** on Fedora with the following command:
```
 $ dnf install pss
```

Once the installation is complete you can now call **pss** in your terminal
```
 $ pss
```

Calling **pss** without any argument or with the -h flag will print a detailed usage message.

### Usage examples

Now that you have installed **pss** let 's go through some Usage examples.
```
 $ pss foo
```

This command simply looks for `foo`. You can be more restrictive and ask pss to look for `foo` only in python files:
```
 $ pss foo --py
```

and for `bar` in all other files:
```
 $ pss bar --nopy
```

Additionally, **pss** supports most of the well known source file types, to get the full list execute:
```
$ pss --help-types
```

You can also ignore some directories. Note that by default, **pss** will ignore directories like .git, __pycache__, .metadata and more.
```
$ pss foo --py --ignore-dir=dist
```

Furthermore, **pss** also gives you the possibility to get more context from your search using the following :
```
$ pss -A 5 foo
```

will display 5 line of context after the matching word
```
$ pss -B 5 foo
```

will display 5 line of context before the matching word
```
$ pss -C 5 foo
```

will display 5 line of context before & after the matching word

If you would like to learn how to use **pss ** with regular expression and other options, more examples are available [here][2].


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/improve-code-searching-skills-pss/

作者：[Author Archive;Author Website;Clément Verna][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://github.com/eliben/pss
[2]:https://github.com/eliben/pss/wiki/Usage-samples
