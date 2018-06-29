How to install Pipenv on Fedora
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/pipenv-install-816x345.jpg)

Pipenv aims to bring the best of all packaging worlds (bundler, composer, npm, cargo, yarn, etc.) to the Python world. It tries to solve a couple of problems and also simplify the whole management process.

Currently the management of Python application dependencies sometimes seems like a bit of a challenge. Developers usually create a [virtual environment][1] for each new project and install dependencies into it using [pip][2]. In addition they have to store the set of installed packages into the requirements.txt text file. We’ve seen many tools and wrappers that aim to automate this workflow. However, there was still necessity to combine multiple utilities and the requirements.txt format itself is not ideal for more complicated scenarios.

### One tol to rule them all

Pipenv manages complex inter-dependencies properly and it also provides manual documenting of installed packages. For example development, testing and production environments often require a different set of packages. It used to be necessary to maintain multiple requirements.txt per project. Pipenv introduces the new [Pipfile][3] format using [TOML][4] syntax. Thanks to this format, you can finally maintain multiple set of requirement for different environments in a single file.

Pipenv has become the officially recommended tool for managing Python application dependencies only a year after the first lines of code were committed into the project. Now it is finally available as an package in Fedora repositories as well.

### Installing Pipenv on Fedora

On clean installation of Fedora 28 and later you can simply install Pipenv by running this command at the terminal:
```
$ sudo dnf install pipenv

```

Your system is now ready to start working on your new Python 3 application with help of Pipenv.

The important point is that while this tool provides nice solution for the applications, it is not designed for dealing with library requirements. When writing a Python library, pinning dependencies is not desirable. You should rather specify install_requires in setup.py file.

### Basic dependencies management

Create a directory for your project first:
```
$ mkdir new-project && cd new-project

```

Another step is to create a virtual environment for this project:
```
$ pipenv --three

```

The –three option here sets the Python version of the virtual environment to Python 3.

Install dependencies:
```
$ pipenv install requests
Installing requests…
Adding requests to Pipfile's [packages]…
Pipfile.lock not found, creating…
Locking [dev-packages] dependencies…
Locking [packages] dependencies…

```

Finally generate a lockfile:
```
$ pipenv lock
Locking [dev-packages] dependencies…
Locking [packages] dependencies…
Updated Pipfile.lock (b14837)

```

You can also check a dependency graph:
```
$ pipenv graph
 - certifi [required: >=2017.4.17, installed: 2018.4.16]
- chardet [required: <3.1.0,>=3.0.2, installed: 3.0.4]
- idna [required: <2.8,>=2.5, installed: 2.7]
- urllib3 [required: >=1.21.1,<1.24, installed: 1.23]

```

More details on Pipenv and it commands are available in the [documentation][5].


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/install-pipenv-fedora/

作者：[Michal Cyprian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/mcyprian/
[1]:https://packaging.python.org/tutorials/installing-packages/#creating-virtual-environments
[2]:https://developer.fedoraproject.org/tech/languages/python/pypi-installation.html
[3]:https://github.com/pypa/pipfile
[4]:https://github.com/toml-lang/toml
[5]:https://docs.pipenv.org/
