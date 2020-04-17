[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use pyenv to run multiple versions of Python on a Mac)
[#]: via: (https://opensource.com/article/20/4/pyenv)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

How to use pyenv to run multiple versions of Python on a Mac
======
If you need to run a project that uses a Python version you don't have
installed on macOS, try pyenv.
![Searching for code][1]

Managing a local Python development environment continues to be a challenge, even for experienced developers. While there are well-documented [strategies for package management][2], there is another step necessary to ensure you are running the version of Python you need when you need it.

### Why does the version of Python matter?

It's a strange concept at first, but programming languages change like any other software. They have bugs, fixes, and updates like any of your favorite [APIs][3] and any other software. Similarly again, different releases are identified by a three-digit number known as a [semantic version][4].

> 😭😭😭 [pic.twitter.com/yt1Z2439W8][5]
>
> — Denny Perez (@dennyperez18) [May 28, 2019][6]

For many years, Python 2 was the commonly used major version of the programming language. In January 2020, Python 2 [reached end of life][7], and only Python 3 will be supported by the language's core maintainers from then forward. Python 3 is developing steadily, and releasing new updates regularly. That makes it important for me to regularly get those updates.

Recently, I tried to run a project on macOS that depended on Python 3.5.9, a version that I did not have installed on my system. It might seem logical to think the Python package manager **pip** could install it*, but that wasn't the case:


```
$ pip install python3.5.9
Collecting python3.5.9
  ERROR: Could not find a version that satisfies the requirement python3.5.9 (from versions: none)
ERROR: No matching distribution found for python3.5.9
```

Alternatively, I could have downloaded that version from the official Python website, but how would I run it in on my Mac alongside my existing version of Python? Specifying the version of Python I intend to use every time I run the interpreter (python3.7 or python3.5 for example) seems error-prone at best. There has to be a better way.

_(A note on the above: I know this makes no sense to seasoned Python developer, but it made sense to me at the time. I would happily talk about why I still think it should.)_

### Installing and setting up pyenv

Thankfully, **pyenv** exists to work around this series of complexities. To start, I needed to install pyenv. I could clone and compile it myself [from source][8], but I prefer to manage packages like this through the Homebrew package manager:


```
`$ brew install pyenv`
```

In order to use the version of Python through pyenv, it's essential to understand the shell's PATH variable. PATH determines where the shell searches for files by the name of the command. You must ensure the shell will find the version of Python run by pyenv, not the one installed by default (which is often called the _system version_). If you don't change the path, here is the result:


```
$ which python
/usr/bin/python
```

That's the system version of Python.

To set up pyenv correctly, you can run the following in Bash or zsh:


```
`$ PATH=$(pyenv root)/shims:$PATH`
```

Now, if you check the version of Python, you'll see it is the one managed by pyenv:


```
$ which python
/Users/my_username/.pyenv/shims/python
```

That export statement (PATH=) will only change for this shell instance, so make it a permanent change, you need to add it to your dotfiles. Since zsh is officially macOS's default shell, I'll focus on it. Append that same syntax to the **~/.zshrc** file:


```
`$ echo 'PATH=$(pyenv root)/shims:$PATH' >> ~/.zshrc`
```

Now every time we run a command in zsh, it will use the pyenv version of Python. Note that I used single quotes with **echo** so it does not evaluate and expand the commands.

The .zshrc file only manages zsh instances, so be sure to check what your shell is and edit the associated dotfiles. If you need to double-check what your default shell is, you can run **echo $SHELL**. If it's zsh, use the command above. If you use Bash, change **~/.zshrc** to **~/.bashrc**. You can dive deep into [path setting][9] in pyenv's README if you would like to learn more.

### Using pyenv to manage Python versions

Now that pyenv is in control, we can see it only has the system Python available to it:


```
$ pyenv versions
system
```

As mentioned above, you absolutely do not want to use this version ([read more on why][10]). Now that pyenv is set up correctly, I want it to have a few different versions of Python that I regularly use.

There is a way to see all Python versions available from all the different repositories pyenv has access to by running **pyenv install --list**. It's a long, overwhelming list that may be helpful to review in the future. For now, I stick with the latest of each dot-release (3.5.x or 3.6.x where x is the latest) found on the [Python download page][11]. With that in mind, I'll install 3.5.9 and 3.8.0:


```
$ pyenv install 3.5.9
$ pyenv install 3.8.0
```

This will take a while, so get some tea (or read one of the links above). It's interesting to note that the output walks through the download and building of that version of Python. For example, the output shows that the file comes directly from [Python.org][12].

Once everything is installed, you can set up your defaults. I like to live at the cutting edge, so I set my global default Python version to the latest:


```
`$ pyenv global 3.8.0`
```

And that version is immediately set in my shell. To confirm:


```
$ python -V
Python 3.8.0
```

The project I want to run works only with Python 3.5, so I'll set the version locally and confirm it's in use:


```
$ pyenv local 3.5.9
$ python -V
Python 3.5.9
```

Because I used the **local** option with pyenv, it added a file to my current directory to track that information. 


```
$ cat .python-version
3.5.9
```

Now, I can finally set up a virtual environment for the project I want and be sure I'm running the right version of Python.


```
$ python -m venv venv
$ source ./venv/bin/activate
(venv) $ which python
/Users/mbbroberg/Develop/my_project/venv/bin/python
```

To learn more, check out this tutorial about [managing virtual environments on a Mac][13].

### Wrapping up

By default, running multiple Python versions can be a challenge. I find starting with pyenv ensures I have the versions of Python I need set up to run when I need them.

Do you have other beginner or intermediate Python questions? Leave a comment, and we will consider them for a future article.

Newcomers to python-ideas occasionally make reference to the idea of "Python 4000" when proposing...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/pyenv

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://opensource.com/article/19/4/managing-python-packages
[3]: https://opensource.com/article/19/5/api-evolution-right-way
[4]: https://semver.org/
[5]: https://t.co/yt1Z2439W8
[6]: https://twitter.com/dennyperez18/status/1133505310516232203?ref_src=twsrc%5Etfw
[7]: https://opensource.com/article/19/11/end-of-life-python-2
[8]: https://github.com/pyenv/pyenv
[9]: https://github.com/pyenv/pyenv#understanding-path
[10]: https://opensource.com/article/19/5/python-3-default-mac
[11]: https://www.python.org/downloads/
[12]: http://python.org
[13]: https://opensource.com/article/19/6/python-virtual-environments-mac
