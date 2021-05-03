[#]: subject: "Access Python package index JSON APIs with requests"
[#]: via: "https://opensource.com/article/21/3/python-package-index-json-apis-requests"
[#]: author: "Ben Nuttall https://opensource.com/users/bennuttall"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13356-1.html"

使用 requests 访问 Python 包索引（PyPI）的 JSON API
======

> PyPI 的 JSON API 是一种机器可直接使用的数据源，你可以访问和你浏览网站时相同类型的数据。

![](https://img.linux.net.cn/data/attachment/album/202105/03/111943du0lgbjj6br6sruu.jpg)

PyPI（Python 软件包索引）提供了有关其软件包信息的 JSON API。本质上，它是机器可以直接使用的数据源，与你在网站上直接访问是一样的的。例如，作为人类，我可以在浏览器中打开 [Numpy][2] 项目页面，点击左侧相关链接，查看有哪些版本，哪些文件可用以及发行日期和支持的 Python 版本等内容：

![NumPy project page][3]

但是，如果我想编写一个程序来访问此数据，则可以使用 JSON API，而不必在这些页面上抓取和解析 HTML。

顺便说一句：在旧的 PyPI 网站上，还托管在 `pypi.python.org` 时，NumPy 的项目页面位于 `pypi.python.org/pypi/numpy`，访问其 JSON API 也很简单，只需要在最后面添加一个 `/json` ，即  `https://pypi.org/pypi/numpy/json`。现在，PyPI 网站托管在 `pypi.org`，NumPy 的项目页面是 `pypi.org/project/numpy`。新站点不会有单独的 JSON API URL，但它仍像以前一样工作。因此，你不必在 URL 后添加 `/json`，只要记住 URL 就够了。

你可以在浏览器中打开 NumPy 的 JSON API URL，Firefox 很好地渲染了数据：

![JSON rendered in Firefox][5]

你可以查看 `info`，`release` 和 `urls` 其中的内容。或者，你可以将其加载到 Python Shell 中，以下是几行入门教程：

```
import requests
url = "https://pypi.org/pypi/numpy/json"
r = requests.get(url)
data = r.json()
```

获得数据后（调用 `.json()` 提供了该数据的 [字典][6]），你可以对其进行查看：

![Inspecting data][7]

查看 `release` 中的键：

![Inspecting keys in releases][8]

这表明 `release` 是一个以版本号为键的字典。选择一个并查看以下内容：

![Inspecting version][9]

每个版本都包含一个列表，`release` 包含 24 项。但是每个项目是什么？由于它是一个列表，因此你可以索引第一项并进行查看：

![Indexing an item][10]

这是一个字典，其中包含有关特定文件的详细信息。因此，列表中的 24 个项目中的每一个都与此特定版本号关联的文件相关，即在  <https://pypi.org/project/numpy/1.20.1/#files> 列出的 24 个文件。

你可以编写一个脚本在可用数据中查找内容。例如，以下的循环查找带有 sdist（源代码包）的版本，它们指定了 `requires_python` 属性并进行打印：

```
for version, files in data['releases'].items():
    for f in files:
        if f.get('packagetype') == 'sdist' and f.get('requires_python'):
            print(version, f['requires_python'])
```

![sdist files with requires_python attribute][11]

### piwheels

去年，我在 piwheels 网站上[实现了类似的 API][12]。[piwheels.org][13] 是一个 Python 软件包索引，为树莓派架构提供了 wheel（预编译的二进制软件包）。它本质上是 PyPI 软件包的镜像，但带有 Arm wheel，而不是软件包维护者上传到 PyPI 的文件。

由于 piwheels 模仿了 PyPI 的 URL 结构，因此你可以将项目页面 URL 的 `pypi.org` 部分更改为 `piwheels.org`。它将向你显示类似的项目页面，其中详细说明了构建的版本和可用的文件。由于我喜欢旧站点允许你在 URL 末尾添加 `/json` 的方式，所以我也支持这种方式。NumPy 在 PyPI 上的项目页面为 [pypi.org/project/numpy][14]，在 piwheels 上，它是 [piwheels.org/project/numpy][15]，而 JSON API 是 [piwheels.org/project/numpy/json][16] 页面。

没有必要重复 PyPI API 的内容，所以我们提供了 piwheels 上可用内容的信息，包括所有已知发行版的列表，一些基本信息以及我们拥有的文件列表：

![JSON files available in piwheels][17]

与之前的 PyPI 例子类似，你可以创建一个脚本来分析 API 内容。例如，对于每个 NumPy 版本，其中有多少 piwheels 文件：

```
import requests

url = "https://www.piwheels.org/project/numpy/json"
package = requests.get(url).json()

for version, info in package['releases'].items():
    if info['files']:
        print('{}: {} files'.format(version, len(info['files'])))
    else:
        print('{}: No files'.format(version))
```

此外，每个文件都包含一些元数据：

![Metadata in JSON files in piwheels][18]

方便的是 `apt_dependencies` 字段，它列出了使用该库所需的 Apt 软件包。本例中的 NumPy 文件，或者通过 `pip` 安装 Numpy，你还需要使用 Debian 的 `apt` 包管理器安装 `libatlas3-base` 和 `libgfortran`。

以下是一个示例脚本，显示了程序包的 Apt 依赖关系：


```
import requests

def get_install(package, abi):
    url = 'https://piwheels.org/project/{}/json'.format(package)
    r = requests.get(url)
    data = r.json()
    for version, release in sorted(data['releases'].items(), reverse=True):
        for filename, file in release['files'].items():
            if abi in filename:
                deps = ' '.join(file['apt_dependencies'])
                print("sudo apt install {}".format(deps))
                print("sudo pip3 install {}=={}".format(package, version))
                return

get_install('opencv-python', 'cp37m')
get_install('opencv-python', 'cp35m')
get_install('opencv-python-headless', 'cp37m')
get_install('opencv-python-headless', 'cp35m')
```

我们还为软件包列表提供了一个通用的 API 入口，其中包括每个软件包的下载统计：

```python
import requests

url = "https://www.piwheels.org/packages.json"
packages = requests.get(url).json()
packages = {
    pkg: (d_month, d_all)
    for pkg, d_month, d_all, *_ in packages
}

package = 'numpy'
d_month, d_all = packages[package]

print(package, "has had", d_month, "downloads in the last month")
print(package, "has had", d_all, "downloads in total")
```

### pip search

`pip search` 因为其 XMLRPC 接口过载而被禁用，因此人们一直在寻找替代方法。你可以使用 piwheels 的 JSON API 来搜索软件包名称，因为软件包的集合是相同的：

```
#!/usr/bin/python3
import sys

import requests

PIWHEELS_URL = 'https://www.piwheels.org/packages.json'

r = requests.get(PIWHEELS_URL)
packages = {p[0] for p in r.json()}

def search(term):
    for pkg in packages:
        if term in pkg:
            yield pkg

if __name__ == '__main__':
    if len(sys.argv) == 2:
        results = search(sys.argv[1].lower())
        for res in results:
            print(res)
    else:
        print("Usage: pip_search TERM")
```

有关更多信息，参考 piwheels 的 [JSON API 文档][19].

* * *

_本文最初发表在 Ben Nuttall 的 [Tooling Tuesday 博客上][20]，经许可转载使用。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/python-package-index-json-apis-requests

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r "Python programming language logo with question marks"
[2]: https://pypi.org/project/numpy/
[3]: https://opensource.com/sites/default/files/uploads/numpy-project-page.png "NumPy project page"
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/pypi-json-firefox.png "JSON rendered in Firefox"
[6]: https://docs.python.org/3/tutorial/datastructures.html#dictionaries
[7]: https://opensource.com/sites/default/files/uploads/pypi-json-notebook.png "Inspecting data"
[8]: https://opensource.com/sites/default/files/uploads/pypi-json-releases.png "Inspecting keys in releases"
[9]: https://opensource.com/sites/default/files/uploads/pypi-json-inspect.png "Inspecting version"
[10]: https://opensource.com/sites/default/files/uploads/pypi-json-release.png "Indexing an item"
[11]: https://opensource.com/sites/default/files/uploads/pypi-json-requires-python.png "sdist files with requires_python attribute "
[12]: https://blog.piwheels.org/requires-python-support-new-project-page-layout-and-a-new-json-api/
[13]: https://www.piwheels.org/
[14]: https://pypi.org/project/numpy
[15]: https://www.piwheels.org/project/numpy
[16]: https://www.piwheels.org/project/numpy/json
[17]: https://opensource.com/sites/default/files/uploads/piwheels-json.png "JSON files available in piwheels"
[18]: https://opensource.com/sites/default/files/uploads/piwheels-json-numpy.png "Metadata in JSON files in piwheels"
[19]: https://www.piwheels.org/json.html
[20]: https://tooling.bennuttall.com/accessing-python-package-index-json-apis-with-requests/
