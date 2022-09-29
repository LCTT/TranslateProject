[#]: subject: "Turn your Python script into a command-line application"
[#]: via: "https://opensource.com/article/22/7/bootstrap-python-command-line-application"
[#]: author: "Mark Meyer https://opensource.com/users/ofosos"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15061-1.html"

将你的 Python 脚本转换为命令行程序
======

> 使用 Python 中的 `scaffold` 和 `click` 库，你可以将一个简单的实用程序升级为一个成熟的命令行界面工具。

![](https://img.linux.net.cn/data/attachment/album/202209/23/093712jyayyed8x7d8d8yd.jpg)

在我的职业生涯中，我写过、用过和看到过很多随意的脚本。一些人需要半自动化完成任务，于是它们诞生了。一段时间后，它们变得越来越大。它们在一生中可能转手很多次。我常常希望这些脚本提供更多的**命令行工具式**的感觉。但是，从一次性脚本到合适的工具，真正提高质量水平有多难呢？事实证明这在 Python 中并不难。

### 搭建骨架脚本

在本文中，我将从一小段 Python 代码开始。我将把它应用到 `scaffold` 模块中，并使用 `click` 库扩展它以接受命令行参数。

```
#!/usr/bin/python

from glob import glob
from os.path import join, basename
from shutil import move
from datetime import datetime
from os import link, unlink

LATEST = 'latest.txt'
ARCHIVE = '/Users/mark/archive'
INCOMING = '/Users/mark/incoming'
TPATTERN = '%Y-%m-%d'

def transmogrify_filename(fname):
    bname = basename(fname)
    ts = datetime.now().strftime(TPATTERN)
    return '-'.join([ts, bname])

def set_current_latest(file):
    latest = join(ARCHIVE, LATEST)
    try:
        unlink(latest)
    except:
        pass
    link(file, latest)

def rotate_file(source):
    target = join(ARCHIVE, transmogrify_filename(source))
    move(source, target)
    set_current_latest(target)

def rotoscope():
    file_no = 0
    folder = join(INCOMING, '*.txt')
    print(f'Looking in {INCOMING}')
    for file in glob(folder):
        rotate_file(file)
        print(f'Rotated: {file}')
        file_no = file_no + 1
    print(f'Total files rotated: {file_no}')

if __name__ == '__main__':
    print('This is rotoscope 0.4.1. Bleep, bloop.')
    rotoscope()
```

本文所有没有在这里插入显示的代码示例，你都可以在 [https://codeberg.org/ofosos/rotoscope][2] 中找到特定版本的代码。该仓库中的每个提交都描述了本文操作过程中一些有意义的步骤。

这个片段做了几件事：

* 检查 `INCOMING` 指定的路径中是否有文本文件
* 如果存在，则使用当前时间戳创建一个新文件名，并将其移动到 `ARCHIVE`
* 删除当前的 `ARCHIVE/latest.txt` 链接，并创建一个指向刚刚添加文件的新链接

作为一个示例，它很简单，但它会让你理解这个过程。

### 使用 Pyscaffold 创建应用程序

首先，你需要安装 `scaffold`、`click` 和 `tox` [Python 库][3]。

```
$ python3 -m pip install scaffold click tox
```

安装 `scaffold` 后，切换到示例的 `rotoscope` 项目所在的目录，然后执行以下命令：

```
$ putup rotoscope -p rotoscope \
    --force --no-skeleton -n rotoscope \
    -d 'Move some files around.' -l GLWT \
    -u http://codeberg.org/ofosos/rotoscope \
    --save-config --pre-commit --markdown
```

Pyscaffold 会重写我的 `README.md`，所以从 Git 恢复它：

```
$ git checkout README.md
```

Pyscaffold 在文档中说明了如何设置一个完整的示例项目，我不会在这里介绍，你之后可以探索。除此之外，Pyscaffold 还可以在项目中为你提供持续集成（CI）模板：

* 打包: 你的项目现在启用了 PyPi，所以你可以将其上传到一个仓库并从那里安装它。
* 文档: 你的项目现在有了一个完整的文档文件夹层次结构，它基于 Sphinx，包括一个 readthedocs.org 构建器。
* 测试: 你的项目现在可以与 tox 一起使用，测试文件夹包含运行基于 pytest 的测试所需的所有样板文件。
* 依赖管理: 打包和测试基础结构都需要一种管理依赖关系的方法。`setup.cfg` 文件解决了这个问题，它包含所有依赖项。
* 预提交钩子: 包括 Python 源代码格式工具 black 和 Python 风格检查器 flake8。

查看测试文件夹并在项目目录中运行 `tox` 命令，它会立即输出一个错误：打包基础设施无法找到相关库。

现在创建一个 `Git` 标记（例如 `v0.2`），此工具会将其识别为可安装版本。在提交更改之前，浏览一下自动生成的 `setup.cfg` 并根据需要编辑它。对于此示例，你可以修改 `LICENSE` 和项目描述，将这些更改添加到 Git 的暂存区，我必须禁用预提交钩子，然后提交它们。否则，我会遇到错误，因为 Python 风格检查器 flake8 会抱怨糟糕的格式。

```
$ PRE_COMMIT_ALLOW_NO_CONFIG=1 git commit
```

如果这个脚本有一个入口点，用户可以从命令行调用，那就更好了。现在，你只能通过找 `.py` 文件并手动执行它来运行。幸运的是，Python 的打包基础设施有一个很好的“罐装”方式，可以轻松地进行配置更改。将以下内容添加到 `setup.cfg` 的 `options.entry_points` 部分：

```
console_scripts =
    roto = rotoscope.rotoscope:rotoscope
```

这个更改会创建一个名为 `roto` 的 shell 命令，你可以使用它来调用 rotoscope 脚本，使用 `pip` 安装 rotoscope 后，可以使用 `roto` 命令。

就是这样，你可以从 Pyscaffold 免费获得所有打包、测试和文档设置。你还获得了一个预提交钩子来保证（大部分情况下）你按照设定规则提交。

### CLI 工具化

现在，一些值会硬编码到脚本中，它们作为命令 [参数][4] 会更方便。例如，将 `INCOMING` 常量作为命令行参数会更好。

首先，导入 [click][5] 库，使用 Click 提供的命令装饰器对 `rotoscope()` 方法进行装饰，并添加一个 Click 传递给 `rotoscope` 函数的参数。Click 提供了一组验证器，因此要向参数添加一个路径验证器。Click 还方便地使用函数的内嵌字符串作为命令行文档的一部分。所以你最终会得到以下方法签名：

```
@click.command()
@click.argument('incoming', type=click.Path(exists=True))
def rotoscope(incoming):
    """
    Rotoscope 0.4 - Bleep, blooop.
    Simple sample that move files.
    """
```

主函数会调用 `rotoscope()`，它现在是一个 Click 命令，不需要传递任何参数。

选项也可以使用 [环境变量][6] 自动填充。例如，将 `ARCHIVE` 常量改为一个选项：

```
@click.option('archive', '--archive', default='/Users/mark/archive', envvar='ROTO_ARCHIVE', type=click.Path())
```

使用相同的路径验证器。这一次，让 Click 填充环境变量，如果环境变量没有提供任何内容，则默认为旧常量的值。

Click 可以做更多的事情，它有彩色的控制台输出、提示和子命令，可以让你构建复杂的 CLI 工具。浏览 Click 文档会发现它的更多功能。

现在添加一些测试。

### 测试

Click 对使用 CLI 运行器 [运行端到端测试][7] 提供了一些建议。你可以用它来实现一个完整的测试（在 [示例项目][8] 中，测试在 `tests` 文件夹中。）

测试位于测试类的一个方法中。大多数约定与我在其他 Python 项目中使用的非常接近，但有一些细节，因为 rotoscope 使用 `click`。在 `test` 方法中，我创建了一个 `CliRunner`。测试使用它在一个隔离的文件系统中运行此命令。然后测试在隔离的文件系统中创建 `incoming` 和 `archive` 目录和一个虚拟的 `incoming/test.txt` 文件，然后它调用 CliRunner，就像你调用命令行应用程序一样。运行完成后，测试会检查隔离的文件系统，并验证 `incoming` 为空，并且 `archive` 包含两个文件（最新链接和存档文件）。

```
from os import listdir, mkdir
from click.testing import CliRunner
from rotoscope.rotoscope import rotoscope

class TestRotoscope:
    def test_roto_good(self, tmp_path):
        runner = CliRunner()

        with runner.isolated_filesystem(temp_dir=tmp_path) as td:
            mkdir("incoming")
            mkdir("archive")
            with open("incoming/test.txt", "w") as f:
                f.write("hello")

            result = runner.invoke(rotoscope, ["incoming", "--archive", "archive"])
            assert result.exit_code == 0

            print(td)
            incoming_f = listdir("incoming")
            archive_f = listdir("archive")
            assert len(incoming_f) == 0
            assert len(archive_f) == 2
```

要在控制台上执行这些测试，在项目的根目录中运行 `tox`。

在执行测试期间，我在代码中发现了一个错误。当我进行 Click 转换时，`rotoscope` 只是取消了最新文件的链接，无论它是否存在。测试从一个新的文件系统（不是我的主文件夹）开始，很快就失败了。我可以通过在一个很好的隔离和自动化测试环境中运行来防止这种错误。这将避免很多“它在我的机器上正常工作”的问题。

### 搭建骨架脚本和模块

本文到此结束，我们可以使用 `scaffold` 和 `click` 完成一些高级操作。有很多方法可以升级一个普通的 Python 脚本，甚至可以将你的简单实用程序变成成熟的 CLI 工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/bootstrap-python-command-line-application

作者：[Mark Meyer][a]
选题：[lkxed][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ofosos
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python_linux_tux_penguin_programming.png
[2]: https://codeberg.org/ofosos/rotoscope
[3]: https://opensource.com/article/19/5/python-tox
[4]: https://opensource.com/article/21/8/linux-terminal#argument
[5]: https://click.palletsprojects.com
[6]: https://opensource.com/article/19/8/what-are-environment-variables
[7]: https://click.palletsprojects.com/en/8.1.x/testing
[8]: https://codeberg.org/ofosos/rotoscope/commit/dfa60c1bfcb1ac720ad168e5e98f02bac1fde17d
