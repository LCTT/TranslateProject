[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A guide to Python virtual environments with virtualenvwrapper)
[#]: via: (https://opensource.com/article/21/2/python-virtualenvwrapper)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

A guide to Python virtual environments with virtualenvwrapper
======
Virtual environments are key to safely tinkering with different versions
of Python and combinations of packages
![Python in a coffee cup.][1]

For some time, Python has included support for managing virtual environments. Python 3.3 even added the built-in **venv** module for creating environments without third-party libraries. Python programmers use several different tools to manage their environments, and the one I use is called [**virtualenvwrapper**][2].

Virtual environments are a way of separating your Python project and its dependencies from your system-installed Python. If you use a macOS or Linux-based operating system, it very likely comes with a version of Python as part of the installation, and in fact, it will probably be dependent on that particular version of Python to function properly. But it's your computer, and you may want to use it for your own purposes. You may need to install another version of Python than the operating system provides. You may need to install some additional libraries, too. Although it's possible to upgrade your system Python, it's not recommended. It's also possible to install other libraries, but you must take care not to interfere with anything the system relies on.

Virtual environments are key to creating the isolation you need to safely tinker with different versions of Python and different combinations of packages. They also allow you to install different versions of the same library for different projects, which resolves what would be impossible if all of your projects' requirements were installed in the same environment.

Why virtualenvwrapper over other tools? In short:

  * Rather than having a `venv` directory inside or alongside your project directory, virtualenvwrapper keeps all your environments in one place: `~/.virtualenvs` by default.
  * It provides commands for creating and activating environments easily, and the activation doesn't rely on locating the right `activate` script. It's just `workon projectname` (from anywhere) rather than `source ~/Projects/flashylights-env/bin/activate`. 



### Getting started

First of all, it's important to take the time to understand how your system Python is configured and a bit about how the **pip** tool works.

To use the Raspberry Pi OS as an example, the operating system comes with both Python 2.7 and 3.7 installed. It also provides separate instances of **pip**, one for each version:

  * The command `python` runs Python 2.7 and is located at `/usr/bin/python`.
  * The command `python3` runs Python 3.7 and is located at `/usr/bin/python3`.
  * The command `pip` installs packages for Python 2.7 and is located at `/usr/bin/pip`.
  * The command `pip3` installs packages for Python 3.7 and is located at `/usr/bin/pip3`.



![Python commands on Raspberry Pi][3]

(Ben Nuttall, [CC BY-SA 4.0][4])

It's useful to verify your own state of affairs when it comes to the `python` and `pip` commands before starting to use virtual environments. More information about your `pip` instances can be found by running the command `pip debug` or `pip3 debug`.

The equivalent information on my Linux computer, which runs Ubuntu, is almost identical (except that it's Python 3.8); and it's very similar on my Macbook, except that the only system Python is 2.6, and I used `brew` to install Python 3.8, so it's located at `/usr/local/bin/python3` instead (along with `pip3`).

### Installing virtualenvwrapper

You'll need to install virtualenvwrapper using your system `pip` for Python 3:


```
`sudo pip3 install virtualenvwrapper`
```

The next step is to configure your shell to load the virtualenvwrapper commands. You do this by editing your shell's RC file (e.g. `.bashrc`, `.bash_profile`, or `.zshrc`) and adding the following lines:


```
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
```

![bashrc][5]

(Ben Nuttall, [CC BY-SA 4.0][4])

If your Python 3 is located elsewhere, change the first line according to your setup.

Close your terminal and reopen it for this to take effect. The first time you open the terminal, you should see some output from virtualenvwrapper. This will only happen once, as some directories are created as part of the setup.

Now you should be able to type the command `mkvirtualenv --version` to verify that virtualenvwrapper is installed.

### Creating a new virtual environment

Say you're working on a project called **flashylights**. To create a virtual environment with this name, run the command:


```
`mkvirtualenv flashylights`
```

The environment has been created and activated, so you'll see that `(flashlylights)` appears before your prompt:

![Flashylights prompt][6]

(Ben Nuttall, [CC BY-SA 4.0][4])

Now that the environment is activated, things have changed. The `python` now points at a completely different Python instance than the one(s) you identified on your system earlier. It's created a directory for your environment and placed a copy of the Python 3 binary, the pip command, and more inside it. Type `which python` and `which pip` to see where they're located:

![Flashylights command][7]

(Ben Nuttall, [CC BY-SA 4.0][4])

If you run a Python program now, you can run it with `python` instead of `python3`, and you can use `pip` instead of `pip3`. Any packages you install using `pip` will be installed within this environment alone, and they will not interfere with your other projects, other environments, or your system installation.

To deactivate the environment, run the command `deactivate`. To re-enable it, run `workon flashylights`.

You can list all available environments with `workon` or use `lsvirtualenv`. You can delete an environment with `rmvirtualenv flashylights`.

Adding virtual environments to your development routine is a sensible thing to do. In my experience, it keeps me from installing libraries I'm experimenting with system-wide, which can lead to problems. I find virtualenvwrapper the easiest way for me to get into that routine and manage my project environments hassle-free without thinking too much or remembering too many commands.

### Advanced features

  * You can install multiple Python versions on your system (e.g., using the [deadsnakes PPA][8] on Ubuntu) and create a virtual environment with that particular version using, for example, `mkvirtualenv -p /usr/bin/python3.9 myproject`.
  * You can automate activation/deactivation upon entering/leaving a directory.
  * You can use the `postmkvirtualenv` hook to install common tools every time a new environment is created.



See more tips in [the docs][9].

* * *

_This article is based on Ben Nuttall's [Tooling Tuesday post][10] on virtualenvwrapper and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/python-virtualenvwrapper

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_python.jpg?itok=G04cSvp_ (Python in a coffee cup.)
[2]: https://virtualenvwrapper.readthedocs.io/en/latest/index.html
[3]: https://opensource.com/sites/default/files/uploads/pi-python-cmds.png (Python commands on Raspberry Pi)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/bashrc.png (bashrc)
[6]: https://opensource.com/sites/default/files/uploads/flashylights-activated-prompt.png (Flashylights prompt)
[7]: https://opensource.com/sites/default/files/uploads/flashylights-activated-cmds.png (Flashylights command)
[8]: https://tooling.bennuttall.com/deadsnakes/
[9]: https://virtualenvwrapper.readthedocs.io/en/latest/tips.html
[10]: https://tooling.bennuttall.com/virtualenvwrapper/
