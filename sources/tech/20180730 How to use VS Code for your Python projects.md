How to use VS Code for your Python projects
======

![](https://fedoramagazine.org/wp-content/uploads/2018/07/pythonvscode-816x345.jpg)
Visual Studio Code, or VS Code, is an open source code editor that also includes tools for building and debugging an application. With the Python extension enabled, vscode becomes a great working environment for any Python developer. This article shows you which extensions are useful, and how to configure VS Code to get the most out of it.

If you don’t have it installed, check out our previous article, [Using Visual Studio Code on Fedora][1]:

[Using Visual Studio Code on Fedora ](https://fedoramagazine.org/using-visual-studio-code-fedora/)

### Install the VS Code Python extension

First, to make VS Code Python friendly, install the Python extension from the marketplace.

![][2]

Once the Python extension installed, you can now configure the Python extension.

VS Code manages its configuration inside JSON files. Two files are used:

  * One for the global settings that applies to all projects
  * One for project specific settings



Press **Ctrl+,** (comma) to open the global settings.

#### Setup the Python Path

You can configure VS Code to automatically select the best Python interpreter for each of your projects. To do this, configure the python.pythonPath key in the global settings.
```
// Place your settings in this file to overwrite default and user settings.
{
 "python.pythonPath":"${workspaceRoot}/.venv/bin/python",
}

```

This sets VS Code to use the Python interpreter located in the project root directory under the .venv virtual environment directory.

#### Use environment variables

By default, VS Code uses environment variables defined in the project root directory in a .env file. This is useful to set environment variables like:
```
PYTHONWARNINGS="once"

```

That setting ensures that warnings are displayed when your program is running.

To change this default, set the python.envFile configuration key as follows:
```
"python.envFile": "${workspaceFolder}/.env",

```

### Code Linting

The Python extension also supports different code linters (pep8, flake8, pylint). To enable your favorite linter, or the one used by the project you’re working on, you need to set a few configuration items.

By default pylint is enabled. But for this example, configure flake8:
```
"python.linting.pylintEnabled": false,
"python.linting.flake8Path": "${workspaceRoot}/.venv/bin/flake8",
"python.linting.flake8Enabled": true,
"python.linting.flake8Args": ["--max-line-length=90"],

```

After enabling the linter, your code is underlined to show where it doesn’t meet criteria enforced by the linter. Note that for this example to work, you need to install flake8 in the virtual environment of the project.

![][3]

### Code Formatting

VS Code also lets you configure automatic code formatting. The extension currently supports autopep8, black and yapf. Here’s how to configure black.
```
"python.formatting.provider": "black",
"python.formatting.blackPath": "${workspaceRoot}/.venv/bin/black"
"python.formatting.blackArgs": ["--line-length=90"],
"editor.formatOnSave": true,

```

If you don’t want the editor to format your file on save, set the option to false and use **Ctrl+Shift+I** to format the current document. Note that for this example to work, you need to install black in the virtual environment of the project.

### Running Tasks

Another great feature of VS Code is that it can run tasks. These tasks are also defined in a JSON file saved in the project root directory.

#### Run a development flask server

In this example, you’ll create a task to run a Flask development server. Create a new Build using the basic template that can run an external command:

![][4]

Edit the tasks.json file as follows to create a new task that runs the Flask development server:
```
{
 // See https://go.microsoft.com/fwlink/?LinkId=733558
 // for the documentation about the tasks.json format
 "version": "2.0.0",
 "tasks": [
 {

 "label": "Run Debug Server",
 "type": "shell",
 "command": "${workspaceRoot}/.venv/bin/flask run -h 0.0.0.0 -p 5000",
 "group": {
 "kind": "build",
 "isDefault": true
 }
 }
 ]
}

```

The Flask development server uses an environment variable to get the entrypoint of the application. Use the .env file to declare these variables. For example:
```
FLASK_APP=wsgi.py
FLASK_DEBUG=True

```

Now you can execute the task using **Ctrl+Shift+B**.

### Unit tests

VS Code also has the unit test runners pytest, unittest, and nosetest integrated out of the box. After you enable a test runner, VS Code discovers the unit tests and letsyou to run them individually, by test suite, or simply all the tests.

For example, to enable pytest:
```
"python.unitTest.pyTestEnabled": true,
"python.unitTest.pyTestPath": "${workspaceRoot}/.venv/bin/pytest",

```

Note that for this example to work, you need to install pytest in the virtual environment of the project.

![][5]


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/vscode-python-howto/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://fedoramagazine.org/using-visual-studio-code-fedora/
[2]:https://fedoramagazine.org/wp-content/uploads/2018/07/Peek-2018-07-27-09-44.gif
[3]:https://fedoramagazine.org/wp-content/uploads/2018/07/Peek-2018-07-27-12-05.gif
[4]:https://fedoramagazine.org/wp-content/uploads/2018/07/Peek-2018-07-27-13-26.gif
[5]:https://fedoramagazine.org/wp-content/uploads/2018/07/Peek-2018-07-27-15-33.gif
