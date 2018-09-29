让 Python 代码更易维护的七种武器
======

> 检查你的代码的质量，通过这些外部库使其更易维护。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A)

> 可读性很重要。
>  — <ruby>[Python 之禅][1]<rt>The Zen of Python</rt></ruby>，Tim Peters

随着软件项目进入“维护模式”，对可读性和编码标准的要求很容易落空（甚至从一开始就没有建立过那些标准）。然而，在代码库中保持一致的代码风格和测试标准能够显著减轻维护的压力，也能确保新的开发者能够快速了解项目的情况，同时能更好地全程保持应用程序的质量。

使用外部库来检查代码的质量不失为保护项目未来可维护性的一个好方法。以下会推荐一些我们最喜爱的[检查代码][2]（包括检查 PEP 8 和其它代码风格错误）的库，用它们来强制保持代码风格一致，并确保在项目成熟时有一个可接受的测试覆盖率。

### 检查你的代码风格

[PEP 8][3] 是 Python 代码风格规范，它规定了类似行长度、缩进、多行表达式、变量命名约定等内容。尽管你的团队自身可能也会有稍微不同于 PEP 8 的代码风格规范，但任何代码风格规范的目标都是在代码库中强制实施一致的标准，使代码的可读性更强、更易于维护。下面三个库就可以用来帮助你美化代码。

#### 1、 Pylint

[Pylint][4] 是一个检查违反 PEP 8 规范和常见错误的库。它在一些流行的[编辑器和 IDE][5] 中都有集成，也可以单独从命令行运行。

执行 `pip install pylint` 安装 Pylint 。然后运行 `pylint [options] path/to/dir` 或者 `pylint [options] path/to/module.py` 就可以在命令行中使用 Pylint，它会向控制台输出代码中违反规范和出现错误的地方。

你还可以使用 `pylintrc` [配置文件][6]来自定义 Pylint 对哪些代码错误进行检查。

#### 2、 Flake8

[Flake8][7] 是“将 PEP 8、Pyflakes（类似 Pylint）、McCabe（代码复杂性检查器）和第三方插件整合到一起，以检查 Python 代码风格和质量的一个 Python 工具”。

执行 `pip install flake8` 安装 flake8 ，然后执行 `flake8 [options] path/to/dir` 或者 `flake8 [options] path/to/module.py` 可以查看报出的错误和警告。

和 Pylint 类似，Flake8 允许通过[配置文件][8]来自定义检查的内容。它有非常清晰的文档，包括一些有用的[提交钩子][9]，可以将自动检查代码纳入到开发工作流程之中。

Flake8 也可以集成到一些流行的编辑器和 IDE 当中，但在文档中并没有详细说明。要将 Flake8 集成到喜欢的编辑器或 IDE 中，可以搜索插件（例如 [Sublime Text 的 Flake8 插件][10]）。

#### 3、 Isort

[Isort][11] 这个库能将你在项目中导入的库按字母顺序排序，并将其[正确划分为不同部分][12]（例如标准库、第三方库、自建的库等）。这样提高了代码的可读性，并且可以在导入的库较多的时候轻松找到各个库。

执行 `pip install isort` 安装 isort，然后执行 `isort path/to/module.py` 就可以运行了。[文档][13]中还提供了更多的配置项，例如通过[配置][14] `.isort.cfg` 文件来决定 isort 如何处理一个库的多行导入。

和 Flake8、Pylint 一样，isort 也提供了将其与流行的[编辑器和 IDE][15] 集成的插件。

### 分享你的代码风格

每次文件发生变动之后都用命令行手动检查代码是一件痛苦的事，你可能也不太喜欢通过运行 IDE 中某个插件来实现这个功能。同样地，你的同事可能会用不同的代码检查方式，也许他们的编辑器中也没有那种插件，甚至你自己可能也不会严格检查代码和按照警告来更正代码。总之，你分享出来的代码库将会逐渐地变得混乱且难以阅读。

一个很好的解决方案是使用一个库，自动将代码按照 PEP 8 规范进行格式化。我们推荐的三个库都有不同的自定义级别来控制如何格式化代码。其中有一些设置较为特殊，例如 Pylint 和 Flake8 ，你需要先行测试，看看是否有你无法忍受但又不能修改的默认配置。

#### 4、 Autopep8

[Autopep8][16] 可以自动格式化指定的模块中的代码，包括重新缩进行、修复缩进、删除多余的空格，并重构常见的比较错误（例如布尔值和 `None` 值）。你可以查看文档中完整的[更正列表][17]。

运行 `pip install --upgrade autopep8` 安装 Autopep8。然后执行 `autopep8 --in-place --aggressive --aggressive <filename>` 就可以重新格式化你的代码。`aggressive` 选项的数量表示 Auotopep8 在代码风格控制上有多少控制权。在这里可以详细了解 [aggressive][18] 选项。

#### 5、 Yapf

[Yapf][19] 是另一种有自己的[配置项][20]列表的重新格式化代码的工具。它与 Autopep8 的不同之处在于它不仅会指出代码中违反 PEP 8 规范的地方，还会对没有违反 PEP 8 但代码风格不一致的地方重新格式化，旨在令代码的可读性更强。

执行 `pip install yapf` 安装 Yapf，然后执行 `yapf [options] path/to/dir` 或 `yapf [options] path/to/module.py` 可以对代码重新格式化。[定制选项][20]的完整列表在这里。

#### 6、 Black

[Black][21] 在代码检查工具当中算是比较新的一个。它与 Autopep8 和 Yapf 类似，但限制较多，没有太多的自定义选项。这样的好处是你不需要去决定使用怎么样的代码风格，让 Black 来给你做决定就好。你可以在这里查阅 Black [有限的自定义选项][22]以及[如何在配置文件中对其进行设置][23]。

Black 依赖于 Python 3.6+，但它可以格式化用 Python 2 编写的代码。执行 `pip install black` 安装 Black，然后执行 `black path/to/dir` 或 `black path/to/module.py` 就可以使用 Black 优化你的代码。

### 检查你的测试覆盖率

如果你正在进行编写测试，你需要确保提交到代码库的新代码都已经测试通过，并且不会降低测试覆盖率。虽然测试覆盖率不是衡量测试有效性和充分性的唯一指标，但它是确保项目遵循基本测试标准的一种方法。对于计算测试覆盖率，我们推荐使用 Coverage 这个库。

#### 7、 Coverage

[Coverage][24] 有数种显示测试覆盖率的方式，包括将结果输出到控制台或 HTML 页面，并指出哪些具体哪些地方没有被覆盖到。你可以通过[配置文件][25]自定义 Coverage 检查的内容，让你更方便使用。

执行 `pip install coverage` 安装 Converage 。然后执行 `coverage [path/to/module.py] [args]` 可以运行程序并查看输出结果。如果要查看哪些代码行没有被覆盖，执行 `coverage report -m` 即可。

### 持续集成工具

<ruby>持续集成<rt>Continuous integration</rt></ruby>（CI）是在合并和部署代码之前自动检查代码风格错误和测试覆盖率最小值的过程。很多免费或付费的工具都可以用于执行这项工作，具体的过程不在本文中赘述，但 CI 过程是令代码更易读和更易维护的重要步骤，关于这一部分可以参考 [Travis CI][26] 和  [Jenkins][27]。

以上这些只是用于检查 Python 代码的各种工具中的其中几个。如果你有其它喜爱的工具，欢迎在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/7-python-libraries-more-maintainable-code

作者：[Jeff Triplett][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/laceynwilliams
[1]:https://www.python.org/dev/peps/pep-0020/
[2]:https://en.wikipedia.org/wiki/Lint_(software)
[3]:https://www.python.org/dev/peps/pep-0008/
[4]:https://www.pylint.org/
[5]:https://pylint.readthedocs.io/en/latest/user_guide/ide-integration.html
[6]:https://pylint.readthedocs.io/en/latest/user_guide/run.html#command-line-options
[7]:http://flake8.pycqa.org/en/latest/
[8]:http://flake8.pycqa.org/en/latest/user/configuration.html#configuration-locations
[9]:http://flake8.pycqa.org/en/latest/user/using-hooks.html
[10]:https://github.com/SublimeLinter/SublimeLinter-flake8
[11]:https://github.com/timothycrosley/isort
[12]:https://github.com/timothycrosley/isort#how-does-isort-work
[13]:https://github.com/timothycrosley/isort#using-isort
[14]:https://github.com/timothycrosley/isort#configuring-isort
[15]:https://github.com/timothycrosley/isort/wiki/isort-Plugins
[16]:https://github.com/hhatto/autopep8
[17]:https://github.com/hhatto/autopep8#id4
[18]:https://github.com/hhatto/autopep8#id5
[19]:https://github.com/google/yapf
[20]:https://github.com/google/yapf#usage
[21]:https://github.com/ambv/black
[22]:https://github.com/ambv/black#command-line-options
[23]:https://github.com/ambv/black#pyprojecttoml
[24]:https://coverage.readthedocs.io/en/latest/
[25]:https://coverage.readthedocs.io/en/latest/config.html
[26]:https://travis-ci.org/
[27]:https://jenkins.io/

