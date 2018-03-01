Why Python devs should use Pipenv
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd)

This article was co-written with [Jeff Triplett][1].

Pipenv, the "Python Development Workflow for Humans" created by Kenneth Reitz a little more than a year ago, has become the [official Python-recommended resource][2] for managing package dependencies. But there is still confusion about what problems it solves and how it's more useful than the standard workflow using `pip` and a `requirements.txt` file. In this month's Python column, we'll fill in the gaps.

### A brief history of Python package installation

To understand the problems that Pipenv solves, it's useful to show how Python package management has evolved.

Take yourself back to the first Python iteration. We had Python, but there was no clean way to install packages.

Then came [Easy Install][3], a package that installs other Python packages with relative ease. But it came with a catch: it wasn't easy to uninstall packages that were no longer needed.

Enter [pip][4], which most Python users are familiar with. `pip` lets us install and uninstall packages. We could specify versions, run `pip freeze > requirements.txt` to output a list of installed packages to a text file, and use that same text file to install everything an app needed with `pip install -r requirements.txt`.

But `pip` didn't include a way to isolate packages from each other. We might work on apps that use different versions of the same libraries, so we needed a way to enable that. Along came [virtual environments][5], which enabled us to create small, isolated environments for each app we worked on. We've seen many tools for managing virtual environments: [virtualenv][6], [venv][7], [virtualenvwrapper][8], [pyenv][9], [pyenv-virtualenv][10], [pyenv-virtualenvwrapper][11], and even more. They all play well with `pip` and `requirements.txt` files.

### The new kid: Pipenv

Pipenv aims to solve several problems.

`pip` library for package installation, plus a library for creating a virtual environment, plus a library for managing virtual environments, plus all the commands associated with those libraries. That's a lot to manage. Pipenv ships with package management and virtual environment support, so you can use one tool to install, uninstall, track, and document your dependencies and to create, use, and organize your virtual environments. When you start a project with it, Pipenv will automatically create a virtual environment for that project if you aren't already using one.

First, the problem of needing thelibrary for package installation, plus a library for creating a virtual environment, plus a library for managing virtual environments, plus all the commands associated with those libraries. That's a lot to manage. Pipenv ships with package management and virtual environment support, so you can use one tool to install, uninstall, track, and document your dependencies and to create, use, and organize your virtual environments. When you start a project with it, Pipenv will automatically create a virtual environment for that project if you aren't already using one.

Pipenv accomplishes this dependency management by abandoning the `requirements.txt` norm and trading it for a new document called a [Pipfile][12]. When you install a library with Pipenv, a `Pipfile` for your project is automatically updated with the details of that installation, including version information and possibly the Git repository location, file path, and other information.

Second, Pipenv wants to make it easier to manage complex interdependencies. Your app might depend on a specific version of a library, and that library might depend on a specific version of another library, and it's just dependencies and turtles all the way down. When two libraries your app uses have conflicting dependencies, your life can become hard. Pipenv wants to ease that pain by keeping track of a tree of your app's interdependencies in a file called `Pipfile.lock`. `Pipfile.lock` also verifies that the right versions of dependencies are used in production.

Also, Pipenv is handy when multiple developers are working on a project. With a `pip` workflow, Casey might install a library and spend two days implementing a new feature using that library. When Casey commits the changes, they might forget to run `pip freeze` to update the requirements file. The next day, Jamie pulls down Casey's changes, and suddenly tests are failing. It takes time to realize that the problem is libraries missing from the requirements file that Jamie doesn't have installed in the virtual environment.

Because Pipenv auto-documents dependencies as you install them, if Jamie and Casey had been using Pipenv, the `Pipfile` would have been automatically updated and included in Casey's commit. Jamie and Casey would have saved time and shipped their product faster.

Finally, using Pipenv signals to other people who work on your project that it ships with a standardized way to install project dependencies and development and testing requirements. Using a workflow with `pip` and requirements files means that you may have one single `requirements.txt` file, or several requirements files for different environments. It might not be clear to your colleagues whether they should run `dev.txt` or `local.txt` when they're running the project on their laptops, for example. It can also create confusion when two similar requirements files get wildly out of sync with each other: Is `local.txt` out of date, or is it really supposed to be that different from `dev.txt`? Multiple requirements files require more context and documentation to enable others to install the dependencies properly and as expected. This workflow has the potential to confuse colleagues and increase your maintenance burden.

Using Pipenv, which gives you `Pipfile`, lets you avoid these problems by managing dependencies for different environments for you. This command will install the main project dependencies:
```
pipenv install

```

Adding the `--dev` tag will install the dev/testing requirements:
```
pipenv install --dev

```

There are other benefits to using Pipenv: It has better security features, graphs your dependencies in an easier-to-understand format, seamlessly handles `.env` files, and can automatically handle differing dependencies for development versus production environments in one file. You can read more in the [documentation][13].

### Pipenv in action

The basics of using Pipenv are detailed in the [Managing Application Dependencies][14] section of the official Python packaging tutorial. To install Pipenv, use `pip`:
```
pip install pipenv

```

To install packages to use in your project, change into the directory for your project. Then to install a package (we'll use Django as an example), run:
```
pipenv install django

```

You will see some output that indicates that Pipenv is creating a `Pipfile` for your project.

If you aren't already using a virtual environment, you will also see some output from Pipenv saying it is creating a virtual environment for you.

Then, you will see the output you are used to seeing when you install packages.

To generate a `Pipfile.lock` file, run:
```
pipenv lock

```

You can also run Python scripts with Pipenv. To run a top-level Python script called `hello.py`, run:
```
pipenv run python hello.py

```

And you will see your expected result in the console.

To start a shell, run:
```
pipenv shell

```

If you would like to convert a project that currently uses a `requirements.txt` file to use Pipenv, install Pipenv and run:
```
pipenv install requirements.txt

```

This will create a Pipfile and install the specified requirements. Consider your project upgraded!

### Learn more

Check out the Pipenv documentation, particularly [Basic Usage of Pipenv][15], to take you further. Pipenv creator Kenneth Reitz gave a talk on Pipenv, "[The Future of Python Dependency Management][16]," at a recent PyTennessee event. The talk wasn't recorded, but his [slides][17] are helpful in understanding what Pipenv does and the problems it solves.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/why-python-devs-should-use-pipenv

作者：[Lacey Williams Henschel][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/laceynwilliams
[1]:https://opensource.com/users/jefftriplett
[2]:https://packaging.python.org/tutorials/managing-dependencies/#managing-dependencies
[3]:http://peak.telecommunity.com/DevCenter/EasyInstall
[4]:https://packaging.python.org/tutorials/installing-packages/#use-pip-for-installing
[5]:https://packaging.python.org/tutorials/installing-packages/#creating-virtual-environments
[6]:https://virtualenv.pypa.io/en/stable/
[7]:https://docs.python.org/3/library/venv.html
[8]:https://virtualenvwrapper.readthedocs.io/en/latest/
[9]:https://github.com/pyenv/pyenv
[10]:https://github.com/pyenv/pyenv-virtualenv
[11]:https://github.com/pyenv/pyenv-virtualenvwrapper
[12]:https://github.com/pypa/pipfile
[13]:https://docs.pipenv.org/
[14]:https://packaging.python.org/tutorials/managing-dependencies/
[15]:https://docs.pipenv.org/basics/
[16]:https://www.pytennessee.org/schedule/presentation/158/
[17]:https://speakerdeck.com/kennethreitz/the-future-of-python-dependency-management
