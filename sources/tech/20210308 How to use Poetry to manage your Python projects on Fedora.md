[#]: subject: (How to use Poetry to manage your Python projects on Fedora)
[#]: via: (https://fedoramagazine.org/how-to-use-poetry-to-manage-your-python-projects-on-fedora/)
[#]: author: (Kader Miyanyedi https://fedoramagazine.org/author/moonkat/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to use Poetry to manage your Python projects on Fedora
======

![Python & Poetry on Fedora][1]

Python developers often create a new virtual environment to separate project dependencies and then manage them with tools such as _pip, pipenv, etc._ Poetry is a tool for simplifying dependency management and packaging in Python. This post will show you how to use Poetry to manage your Python projects on Fedora.

Unlike other tools, Poetry uses only a single configuration file for dependency management, packaging, and publishing. This eliminates the need for different files such as _Pipfile, MANIFEST.in, setup.py_, etc. It is also faster than **using multiple tools.

Detailed below is a brief overview of commands used when getting started with Poetry.

### **Installing Poetry on Fedora**

If you already use Fedora 32 or above, you can install Poetry directly from the command line using this command:

```
$ sudo dnf install poetry
```

```
Editor note: on Fedora Silverblue or CoreOs Python 3.9.2 is part of the core commit, you would layer Poetry with '
```

rpm-ostree install poetry

```
'
```

### Initialize a project

Create a new project using the _new_ command.

```
$ poetry new poetry-project
```

The structure of a project created with Poetry looks like this:

```
├── poetry_project
│   └── init.py
├── pyproject.toml
├── README.rst
└── tests
    ├── init.py
    └── test_poetry_project.py
```

Poetry uses _pyproject.toml_ to manage the dependencies of your project. Initially, this file will look similar to this:

```
[tool.poetry]
name = "poetry-project"
version = "0.1.0"
description = ""
authors = ["Kadermiyanyedi <kadermiyanyedi@hotmail.com>"]

[tool.poetry.dependencies]
python = "^3.9"

[tool.poetry.dev-dependencies]
pytest = "^5.2"

[build-system]
requires = ["poetry>=0.12"]
build-backend = "poetry.masonry.api"
```

This file contains 4 sections:

  * The first section contains information describing the project such as project name, project version, etc.
  * The second section contains project dependencies. These dependencies are necessary to build the project.
  * The third section contains development dependencies.
  * The fourth section describes a building system as in [PEP 517][2]



If you already have a project, or create your own project folder, and you want to use poetry, run the _init_ command within your project.

```
$ poetry init
```

After this command, you will see an interactive shell to configure your project.

### Create a virtual environment

If you want to create a virtual environment or activate an existing virtual environment, use the command below:

```
$ poetry shell
```

Poetry creates the virtual environment in the _/home/username/.cache/pypoetry_ project by default. You can change the default path by editing the poetry config. Use the command below to see the config list:

```
$ poetry config --list

cache-dir = "/home/username/.cache/pypoetry"
virtualenvs.create = true
virtualenvs.in-project = true
virtualenvs.path = "{cache-dir}/virtualenvs"
```

Change the _virtualenvs.in-project_ configuration variable to create a virtual environment within your project directory. The Poetry command is:

```
$ poetry config virtualenv.in-project true
```

### Add dependencies

Install a dependency for the project with the _poetry add_ command.

```
$ poetry add django
```

You can identify any dependencies that you use only for the development environment using the _add_ command with the _–dev_ option.

```
$ poetry add black --dev
```

The **add** command creates a _poetry.lock file_ that is used to track package versions. If the _poetry.lock_ file doesn’t exist, the latest versions of all dependencies in _pyproject.toml_ are installed. If _poetry.lock_ does exist, Poetry uses the exact versions listed in the file to ensure that the package versions are consistent for everyone working on your project.

Use the poetry _install_ command to install all dependencies in your current project.

```
$ poetry install
```

Prevent development dependencies from being installed by using the _no-dev_ option.

```
$ poetry install --no-dev
```

### List packages

The _show_ command lists all of the available packages. The _tree_ option will list packages as a tree.

```
$ poetry show --tree

django 3.1.7 A high-level Python Web framework that encourages rapid development and clean, pragmatic design.
├── asgiref >=3.2.10,<4
├── pytz *
└── sqlparse >=0.2.2
```

Include the package name to list details of a specific package.

```
$ poetry show requests

name         : requests
version      : 2.25.1
description  : Python HTTP for Humans.

dependencies
 - certifi >=2017.4.17
 - chardet >=3.0.2,<5
 - idna >=2.5,<3
 - urllib3 >=1.21.1,<1.27
```

Finally, if you want to learn the latest version of the packages, you can pass the _latest_ option.

```
$ poetry show --latest

idna     2.10      3.1    Internationalized Domain Names in Applications
asgiref  3.3.1     3.3.1  ASGI specs, helper code, and adapters
```

### Further information

More details on Poetry are available in the [documentation][3].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-use-poetry-to-manage-your-python-projects-on-fedora/

作者：[Kader Miyanyedi][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/moonkat/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/Poetry_Python-816x345.jpg
[2]: https://www.python.org/dev/peps/pep-0517/
[3]: https://python-poetry.org/docs/
