使用 VS Code 进行 Python 编程
======

![](https://fedoramagazine.org/wp-content/uploads/2018/07/pythonvscode-816x345.jpg)

Visual Studio Code，简称 VS Code，是一个开源的文本编辑器，包含用于构建和调试应用程序的工具。安装启用 Python 扩展后，VS Code 可以配置成理想的 Python 开发工作环境。本文将介绍一些有用的 VS Code 扩展，并配置它们以充分提高 Python 开发效率。

如果你的计算机上还没有安装 VS Code，可以参考文章 [在 Fedora 上使用 VS Code](https://fedoramagazine.org/using-visual-studio-code-fedora/) 来安装。

### 在 VS Code 中安装 Python 扩展

首先，为了更方便地在 VS Code 中进行 Python 开发，需要从 VS Code 扩展商店中安装 Python 扩展。

![][2]

Python 扩展安装完成后，就可以开始配置 Python 扩展了。

VS Code 通过两个 JSON 文件管理设置:

  * 一个文件用于 VS Code 的全局设置，作用于所有的项目
  * 另一个文件用于特殊设置，作用于单独项目

可以用快捷键 `Ctrl+,` （逗号）打开全局设置，也可以通过 **文件 -> 首选项 -> 设置** 来打开。

#### 设置 Python 路径

您可以在全局设置中配置 `python.pythonPath` 使 VS Code 自动为每个项目选择最适合的 Python 解释器。

```
// 将设置放在此处以覆盖默认设置和用户设置。
// Path to Python, you can use a custom version of Python by modifying this setting to include the full path.
{
    "python.pythonPath":"${workspaceRoot}/.venv/bin/python",
}
```

这样，VS Code 将使用虚拟环境目录 `.venv` 下项目根目录中的 Python 解释器。

#### 使用环境变量

默认情况下，VS Code 使用项目根目录下的 `.env` 文件中定义的环境变量。 这对于设置环境变量很有用，如：

```
PYTHONWARNINGS="once"
```

可使程序在运行时显示警告。

可以通过设置 `python.envFile` 来加载其他的默认环境变量文件：

```
// Absolute path to a file containing environment variable definitions.
"python.envFile": "${workspaceFolder}/.env",
```

### 代码分析

Python 扩展还支持不同的代码分析工具（pep8、flake8、pylint）。要启用你喜欢的或者正在进行的项目所使用的分析工具，只需要进行一些简单的配置。

扩展默认情况下使用 pylint 进行代码分析。你可以这样配置以使用 flake8 进行分析：

```
"python.linting.pylintEnabled": false,
"python.linting.flake8Path": "${workspaceRoot}/.venv/bin/flake8",
"python.linting.flake8Enabled": true,
"python.linting.flake8Args": ["--max-line-length=90"],
```

启用代码分析后，分析器会在不符合要求的位置加上波浪线，鼠标置于该位置，将弹窗提示其原因。注意，项目的虚拟环境中需要安装有 flake8，此示例方能有效。

![][3]

### 格式化代码

可以配置 VS Code 使其自动格式化代码。目前支持 autopep8、black 和 yapf。下面的设置将启用 “black” 模式。

```
// Provider for formatting. Possible options include 'autopep8', 'black', and 'yapf'.
"python.formatting.provider": "black",
"python.formatting.blackPath": "${workspaceRoot}/.venv/bin/black"
"python.formatting.blackArgs": ["--line-length=90"],
"editor.formatOnSave": true,
```

如果不需要编辑器在保存时自动格式化代码，可以将 `editor.formatOnSave` 设置为 `false` 并手动使用快捷键 `Ctrl + Shift + I` 格式化当前文档中的代码。 注意，项目的虚拟环境中需要安装有 black，此示例方能有效。

### 运行任务

VS Code 的一个重要特点是它可以运行任务。需要运行的任务保存在项目根目录中的 JSON 文件中。

#### 运行 flask 开发服务

这个例子将创建一个任务来运行 Flask 开发服务器。 使用一个可以运行外部命令的基本模板来创建新的工程：

![][4]

编辑如下所示的 `tasks.json` 文件，创建新任务来运行 Flask 开发服务：

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

Flask 开发服务使用环境变量来获取应用程序的入口点。 如 **使用环境变量** 一节所说，可以在 `.env` 文件中声明这些变量：

```
FLASK_APP=wsgi.py
FLASK_DEBUG=True
```

这样就可以使用快捷键 `Ctrl + Shift + B` 来执行任务了。

### 单元测试

VS Code 还支持单元测试框架 pytest、unittest 和 nosetest。启用测试框架后，可以在 VS Code 中单独运行搜索到的单元测试，通过测试套件运行测试或者运行所有的测试。

例如，可以这样启用 pytest 测试框架：

```
"python.unitTest.pyTestEnabled": true,
"python.unitTest.pyTestPath": "${workspaceRoot}/.venv/bin/pytest",
```

注意，项目的虚拟环境中需要安装有 pytest，此示例方能有效。

![][5]


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/vscode-python-howto/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[idea2act](https://github.com/idea2act)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://fedoramagazine.org/using-visual-studio-code-fedora/
[2]:https://fedoramagazine.org/wp-content/uploads/2018/07/Peek-2018-07-27-09-44.gif
[3]:https://fedoramagazine.org/wp-content/uploads/2018/07/Peek-2018-07-27-12-05.gif
[4]:https://fedoramagazine.org/wp-content/uploads/2018/07/Peek-2018-07-27-13-26.gif
[5]:https://fedoramagazine.org/wp-content/uploads/2018/07/Peek-2018-07-27-15-33.gif
