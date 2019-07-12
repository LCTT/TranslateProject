[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Pipx – Install And Run Python Applications In Isolated Environments)
[#]: via: (https://www.ostechnix.com/pipx-install-and-run-python-applications-in-isolated-environments/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Pipx – Install And Run Python Applications In Isolated Environments
======

![][1]

It is always recommended to install Python applications in Virtual Environments to avoid conflicts with one another. **Pip package manager** helps us to install Python applications in an isolated environments, using two tools namely **venv** and **virtualenv**. There is also another Python package manager named [**“Pipenv”**][2], which is recommended by Python.org, to install Python applications. Unlike Pip, Pipenv automatically creates virtual environments by default. Meaning – you don’t need to manually create virtual environments for your projects anymore. Today, I stumbled upon a similar tool named **“Pipx”** , a free and open source utility that allows you to install and run Python applications in an isolated virtual environments.

Using Pipx, we can easily install thousands of Python applications hosted in **PyPI** without much hassle. Good thing is you can do everything with regular user permissions. You need not to be “root” user or need not to have “sudo” permissions. It is worth mentioning that **Pipx can run a program from temporary environment** , without having to install it. This will be handy when you test multiple versions of same program often. The packages installed with Pipx can be listed, upgrade or uninstalled at any time. Pipx is a cross-platform application, so it can run on Linux, Mac OS and Windows.

### Install Pipx

**Python 3.6+** , **Pip** and **venv** module are required to install pipx. Make sure you have installed them as described in the following guide.

  * [**How To Manage Python Packages Using Pip**][3]



Here, venv is needed to create virtual environments.

Next, run the following commands to install Pipx.

```
$ python3 -m pip install --user pipx

$ python3 -m userpath append ~/.local/bin
```

The default location of pipx’s binary is **~/.local/bin**. You can override this with the **PIPX_BIN_DIR** environment variable. If you override **PIPX_BIN_DIR** , just make sure it is on your path by running **userpath append $PIPX_BIN_DIR**.

And the default virtual environment location of Pipx is **~/.local/pipx**. This can be overridden with the environment variable **PIPX_HOME**.

Let us go ahead and see how to install Python applications using Pipx.

### Install And Run Python Applications In Isolated Environments Using Pipx

Here are few examples to getting started with Pipx.

##### Install Python packages

To install a Python application, for example **cowsay** , globally, run:

```
$ pipx install cowsay
```

This command will automatically create virtual environments, install the package in it and put the package executable file on your **$PATH**.

**Sample output:**

```
installed package cowsay 2.0.3, Python 3.6.8
These binaries are now globally available
- cowsay
done! ✨ 🌟 ✨
```

![1][4]

Install Python Applications Using Pipx

Let us test newly installed cowsay program:

![1][5]

Here, I have taken the examples from official site. You can install/test any other Python package of your choice.

##### List Python packages

To list all installed applications using Pipx, run:

```
$ pipx list
```

Sample output:

```
venvs are in /home/sk/.local/pipx/venvs
binaries are exposed on your $PATH at /home/sk/.local/bin
package cowsay 2.0.3, Python 3.6.8
- cowsay
```

If you have not installed any packages, you will see the following output:

```
nothing has been installed with pipx 😴
```

##### Upgrade Packages

To upgrade a package, simply do:

```
$ pipx upgrade cowsay
```

To upgrade all installed packages in one go, use:

```
$ pipx upgrade-all
```

##### Run a application from temporary virtual environments

At times, you might want to run a specific python program, but not actually install it.

```
$ pipx run pycowsay moooo
```

![1][6]

Run Python Applications In Temporary Isolated Virtual Environments

This command doesn’t actually install the given program, but run it from the temporary virtual environment. You can use this command for quickly testing a python application.

You can even run .py files directly as well.

```
$ pipx run https://gist.githubusercontent.com/cs01/fa721a17a326e551ede048c5088f9e0f/raw/6bdfbb6e9c1132b1c38fdd2f195d4a24c540c324/pipx-demo.py
pipx is working!
```

##### Uninstall packages

A package can be uninstalled with command:

```
$ pipx uninstall cowsay
```

To remove all installed packages:

```
$ pipx uninstall-all
```

##### Getting help

To view help section, run:

```
$ pipx --help
```

And, that’s all. If you’re ever looking for a safe, convenient and reliable application to install and run Python applications, Pipx might be a good choice.

**Resource:**

  * [**Pipx GitHub Repository**][7]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pipx-install-and-run-python-applications-in-isolated-environments/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/pipx-720x340.png
[2]: https://www.ostechnix.com/pipenv-officially-recommended-python-packaging-tool/
[3]: https://www.ostechnix.com/manage-python-packages-using-pip/
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/Install-Python-Applications-Using-Pipx.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Test-Python-application.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/07/Run-Python-Applications-In-Isolated-Environments.png
[7]: https://github.com/pipxproject/pipx
