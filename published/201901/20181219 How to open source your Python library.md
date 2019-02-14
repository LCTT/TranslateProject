[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10491-1.html)
[#]: subject: (How to open source your Python library)
[#]: via: (https://opensource.com/article/18/12/tips-open-sourcing-python-libraries)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

如何开源你的 Python 库
======

> 这 12 个步骤能确保成功发布。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx)

你写了一个 Python 库。自己觉着这太棒了！如果让人们能够轻松使用它不是很优雅么？这有一个需要考虑的清单，以及在开源 Python 库时要采取的具体步骤。

### 1、源码

将代码放在 [GitHub][1] 上，这里有很多开源项目，并且人们很容易提交拉取请求。

### 2、许可证

选择一个开源许可证。一般来说 [MIT 许可证][2]是一个挺好的宽容许可证。如果你有特定要求，Creative Common 的[选择许可证][3]可以指导你完成其它选择。最重要的是，在选择许可证时要记住三条规则：

  * 不要创建自己的许可证。
  * 不要创建自己的许可证。
  * 不要创建自己的许可证。

### 3、README

将一个名为 `README.rst` 的文件（使用 ReStructured Text 格式化）放在项目树的顶层。

GitHub 将像 Markdown 一样渲染 ReStructured Text，而 ReST 在 Python 的文档生态系统中的表现更好。

### 4、测试

写测试。这对你来说没有用处。但对于想要编写避免破坏相关功能的补丁的人来说，它非常有用。

测试可帮助协作者进行协作。

通常情况下，如果可以用 [pytest][4] 运行就最好了。还有其他测试工具 —— 但很少有理由去使用它们。

### 5、样式

使用 linter 制定样式：PyLint、Flake8 或者带上 `--check` 的 Black 。除非你使用 Black，否则请确保在一个文件中指定配置选项，并签入到版本控制系统中。

### 6、API 文档

使用 docstrings 来记录模块、函数、类和方法。

你可以使用几种样式。我更喜欢 [Google 风格的 docstrings][5]，但 [ReST docstrings][6] 也是一种选择。

Sphinx 可以同时处理 Google 风格和 ReST 的 docstrings，以将零散的文档集成为 API 文档。

### 7、零散文档

使用 [Sphinx][7]。（阅读[我们这篇文章][8]。）教程很有用，但同样重要的是要指明这是什么、它有什么好处、它有什么坏处、以及任何特殊的考虑因素。

### 8、构建

使用 tox 或 nox 自动运行测试和 linter，并构建文档。这些工具支持“依赖矩阵”。这些矩阵往往会快速增长，但你可以尝试针对合理的样本进行测试，例如 Python 版本、依赖项版本以及可能安装的可选依赖项。

### 9、打包

使用 [setuptools][9] 工具。写一个 `setup.py` 和一个 `setup.cfg`。如果同时支持 Python 2 和 3，请在 `setup.cfg` 中指定 universal 格式的 wheel。

tox 或 nox 应该做的一件事是构建 wheel 并对已安装的 wheel 进行测试。

避免使用 C 扩展。如果出于性能或绑定的原因一定需要它们，请将它们放在单独的包中。正确打包 C 扩展可以写一篇新的文章。这里有很多问题！

### 10、持续集成

使用公共持续工具。[TravisCI][10] 和 [CircleCI][11] 为开源项目提供免费套餐。将 GitHub 或其他仓库配置为在合并拉请求之前需要先通过检查，那么你就不必担心在代码评审中告知用户修复测试或样式。

### 11、版本

使用 [SemVer][12] 或 [CalVer][13]。有许多工具可以帮助你管理版本：[incremental][14]、[bumpversion][15] 和 [setuptools_scm][16] 等都是 PyPI 上的包，都可以帮助你管理版本。

### 12、发布

通过运行 tox 或 nox 并使用 twine 将文件上传到 PyPI 上发布。你可以通过在 [DevPI][17] 中“测试上传”。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/tips-open-sourcing-python-libraries

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://github.com/
[2]: https://en.wikipedia.org/wiki/MIT_License
[3]: https://choosealicense.com/
[4]: https://docs.pytest.org/en/latest/
[5]: https://github.com/google/styleguide/blob/gh-pages/pyguide.md
[6]: https://www.python.org/dev/peps/pep-0287/
[7]: http://www.sphinx-doc.org/en/master/
[8]: https://opensource.com/article/18/11/building-custom-workflows-sphinx
[9]: https://pypi.org/project/setuptools/
[10]: https://travis-ci.org/
[11]: https://circleci.com/
[12]: https://semver.org/
[13]: https://calver.org/
[14]: https://pypi.org/project/incremental/
[15]: https://pypi.org/project/bumpversion/
[16]: https://pypi.org/project/setuptools_scm/
[17]: https://opensource.com/article/18/7/setting-devpi
