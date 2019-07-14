8 个很棒的 pytest 插件
======

> Python 测试工具最好的一方面是其强大的生态系统。这里列出了八个最好的插件。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A)

我们是 [pytest][1] 的忠实粉丝，并将其作为工作和开源项目的默认 Python 测试工具。在本月的 Python 专栏中，我们分享了为什么我们喜欢 `pytest` 以及一些让 `pytest` 测试工作更有趣的插件。

### 什么是 pytest？

正如该工具的网站所说，“pytest 框架可以轻松地编写小型测试，也能进行扩展以支持应用和库的复杂功能测试。”

`pytest` 允许你在任何名为 `test_*.py` 的文件中定义测试，并将其定义为以 `test_*` 开头的函数。然后，pytest 将在整个项目中查找所有测试，并在控制台中运行 `pytest` 时自动运行这些测试。pytest 接受[标志和参数][2]，它们可以在测试运行器停止时更改，这些包含如何输出结果，运行哪些测试以及输出中包含哪些信息。它还包括一个 `set_trace()` 函数，它可以进入到你的测试中。它会暂停您的测试， 并允许你与变量进行交互，不然你只能在终端中“四处翻弄”来调试你的项目。

`pytest` 最好的一方面是其强大的插件生态系统。因为 `pytest` 是一个非常流行的测试库，所以多年来创建了许多插件来扩展、定制和增强其功能。这八个插件是我们的最爱。

### 8 个很棒的插件

#### 1、pytest-sugar

[pytest-sugar][3] 改变了 `pytest` 的默认外观，添加了一个进度条，并立即显示失败的测试。它不需要配置，只需 `pip install pytest-sugar`，用 `pytest` 运行测试，来享受更漂亮、更有用的输出。

#### 2、pytest-cov

[pytest-cov][4] 在 `pytest` 中增加了覆盖率支持，来显示哪些代码行已经测试过，哪些还没有。它还将包括项目的测试覆盖率。

#### 3、pytest-picked

[pytest-picked][5] 对你已经修改但尚未提交 `git` 的代码运行测试。安装库并运行 `pytest --picked` 来仅测试自上次提交后已更改的文件。

#### 4、pytest-instafail

[pytest-instafail][6] 修改 `pytest` 的默认行为来立即显示失败和错误，而不是等到 `pytest` 完成所有测试。

#### 5、pytest-tldr

一个全新的 `pytest` 插件，可以将输出限制为你需要的东西。`pytest-tldr`（`tldr` 代表 “too long, didn't read” —— 太长，不想读），就像 pytest-sugar 一样，除基本安装外不需要配置。不像 pytest 的默认输出那么详细，[pytest-tldr][7] 将默认输出限制为失败测试的回溯信息，并忽略了一些令人讨厌的颜色编码。添加 `-v` 标志会为喜欢它的人返回更详细的输出。

#### 6、pytest-xdist

[pytest-xdist][8] 允许你通过 `-n` 标志并行运行多个测试：例如，`pytest -n 2` 将在两个 CPU 上运行你的测试。这可以显著加快你的测试速度。它还包括 `--looponfail` 标志，它将自动重新运行你的失败测试。

#### 7、pytest-django

[pytest-django][9] 为 Django 应用和项目添加了 `pytest` 支持。具体来说，`pytest-django` 引入了使用 pytest fixture 测试 Django 项目的能力，而省略了导入 `unittest` 和复制/粘贴其他样板测试代码的需要，并且比标准的 Django 测试套件运行得更快。

#### 8、django-test-plus

[django-test-plus][10] 并不是专门为 `pytest` 开发，但它现在支持 `pytest`。它包含自己的 `TestCase` 类，你的测试可以继承该类，并使你能够使用较少的按键来输出频繁的测试案例，例如检查特定的 HTTP 错误代码。

我们上面提到的库绝不是你扩展 `pytest` 的唯一选择。有用的 pytest 插件的前景是广阔的。查看 [pytest 插件兼容性][11]页面来自行探索。你最喜欢哪些插件？

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/pytest-plugins

作者：[Jeff Triplett][a1], [Lacery Williams Henschel][a2]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a1]:https://opensource.com/users/jefftriplett
[a2]:https://opensource.com/users/laceynwilliams
[1]:https://docs.pytest.org/en/latest/
[2]:https://docs.pytest.org/en/latest/usage.html
[3]:https://github.com/Frozenball/pytest-sugar
[4]:https://github.com/pytest-dev/pytest-cov
[5]:https://github.com/anapaulagomes/pytest-picked
[6]:https://github.com/pytest-dev/pytest-instafail
[7]:https://github.com/freakboy3742/pytest-tldr
[8]:https://github.com/pytest-dev/pytest-xdist
[9]:https://pytest-django.readthedocs.io/en/latest/
[10]:https://django-test-plus.readthedocs.io/en/latest/
[11]:https://plugincompat.herokuapp.com/
