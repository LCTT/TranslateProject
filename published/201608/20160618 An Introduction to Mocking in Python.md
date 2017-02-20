Mock 在 Python 单元测试中的使用
=====================================

本文讲述的是 Python 中 Mock 的使用。

### 如何执行单元测试而不用考验你的耐心

很多时候，我们编写的软件会直接与那些被标记为“垃圾”的服务交互。用外行人的话说：服务对我们的应用程序很重要，但是我们想要的是交互，而不是那些不想要的副作用，这里的“不想要”是在自动化测试运行的语境中说的。例如：我们正在写一个社交 app，并且想要测试一下 "发布到 Facebook" 的新功能，但是不想每次运行测试集的时候真的发布到 Facebook。

Python 的 `unittest` 库包含了一个名为 `unittest.mock` 或者可以称之为依赖的子包，简称为
`mock` —— 其提供了极其强大和有用的方法，通过它们可以模拟（mock）并去除那些我们不希望的副作用。

![](https://assets.toptal.io/uploads/blog/image/252/toptal-blog-image-1389090346415.png)

*注意：`mock` [最近被收录][1]到了 Python 3.3 的标准库中；先前发布的版本必须通过 [PyPI][2] 下载 Mock 库。*

### 恐惧系统调用

再举另一个例子，我们在接下来的部分都会用到它，这是就是**系统调用**。不难发现，这些系统调用都是主要的模拟对象：无论你是正在写一个可以弹出 CD 驱动器的脚本，还是一个用来删除 /tmp 下过期的缓存文件的 Web 服务，或者一个绑定到 TCP 端口的 socket 服务器，这些调用都是在你的单元测试上下文中不希望产生的副作用。

作为一个开发者，你需要更关心你的库是否成功地调用了一个可以弹出 CD 的系统函数（使用了正确的参数等等），而不是切身经历 CD 托盘每次在测试执行的时候都打开了。（或者更糟糕的是，弹出了很多次，在一个单元测试运行期间多个测试都引用了弹出代码！）

同样，保持单元测试的效率和性能意味着需要让如此多的“缓慢代码”远离自动测试，比如文件系统和网络访问。

对于第一个例子来说，我们要从原始形式换成使用 `mock` 重构一个标准 Python 测试用例。我们会演示如何使用 mock 写一个测试用例，使我们的测试更加智能、快速，并展示更多关于我们软件的工作原理。

### 一个简单的删除函数

我们都有过需要从文件系统中一遍又一遍的删除文件的时候，因此，让我们在 Python 中写一个可以使我们的脚本更加轻易完成此功能的函数。

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

def rm(filename):
    os.remove(filename)
```

很明显，我们的 `rm` 方法此时无法提供比 `os.remove` 方法更多的相关功能，但我们可以在这里添加更多的功能，使我们的基础代码逐步改善。

让我们写一个传统的测试用例，即，没有使用 `mock`：

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mymodule import rm

import os.path
import tempfile
import unittest

class RmTestCase(unittest.TestCase):

    tmpfilepath = os.path.join(tempfile.gettempdir(), "tmp-testfile")

    def setUp(self):
        with open(self.tmpfilepath, "wb") as f:
            f.write("Delete me!")

    def test_rm(self):
        # remove the file
        rm(self.tmpfilepath)
        # test that it was actually removed
        self.assertFalse(os.path.isfile(self.tmpfilepath), "Failed to remove the file.")
```

我们的测试用例相当简单，但是在它每次运行的时候，它都会创建一个临时文件并且随后删除。此外，我们没有办法测试我们的 `rm` 方法是否正确地将我们的参数向下传递给 `os.remove` 调用。我们可以基于以上的测试*认为*它做到了，但还有很多需要改进的地方。

#### 使用 Mock 重构

让我们使用 mock 重构我们的测试用例：

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mymodule import rm

import mock
import unittest

class RmTestCase(unittest.TestCase):

    @mock.patch('mymodule.os')
    def test_rm(self, mock_os):
        rm("any path")
        # test that rm called os.remove with the right parameters
        mock_os.remove.assert_called_with("any path")
```

使用这些重构，我们从根本上改变了测试用例的操作方式。现在，我们有一个可以用于验证其他功能的内部对象。

##### 潜在陷阱

第一件需要注意的事情就是，我们使用了 `mock.patch` 方法装饰器，用于模拟位于 `mymodule.os` 的对象，并且将 mock 注入到我们的测试用例方法。那么只是模拟 `os` 本身，而不是 `mymodule.os` 下 `os` 的引用（LCTT 译注：注意 `@mock.patch('mymodule.os')` 便是模拟 `mymodule.os` 下的 `os`），会不会更有意义呢？

当然，当涉及到导入和管理模块，Python 的用法就像蛇一样灵活。在运行时，`mymodule` 模块有它自己的被导入到本模块局部作用域的 `os`。因此，如果我们模拟 `os`，我们是看不到 mock 在 `mymodule` 模块中的模仿作用的。

这句话需要深刻地记住：

> 模拟一个东西要看它用在何处，而不是来自哪里。

如果你需要为 `myproject.app.MyElaborateClass` 模拟 `tempfile` 模块，你可能需要将 mock 用于 `myproject.app.tempfile`，而其他模块保持自己的导入。

先将那个陷阱放一边，让我们继续模拟。

#### 向 ‘rm’ 中加入验证

之前定义的 rm 方法相当的简单。在盲目地删除之前，我们倾向于验证一个路径是否存在，并验证其是否是一个文件。让我们重构 rm 使其变得更加智能：

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import os.path

def rm(filename):
    if os.path.isfile(filename):
        os.remove(filename)
```

很好。现在，让我们调整测试用例来保持测试的覆盖率。

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mymodule import rm

import mock
import unittest

class RmTestCase(unittest.TestCase):

    @mock.patch('mymodule.os.path')
    @mock.patch('mymodule.os')
    def test_rm(self, mock_os, mock_path):
        # set up the mock
        mock_path.isfile.return_value = False

        rm("any path")

        # test that the remove call was NOT called.
        self.assertFalse(mock_os.remove.called, "Failed to not remove the file if not present.")

        # make the file 'exist'
        mock_path.isfile.return_value = True

        rm("any path")

        mock_os.remove.assert_called_with("any path")
```

我们的测试用例完全改变了。现在我们可以在没有任何副作用的情况下核实并验证方法的内部功能。

#### 将文件删除作为服务

到目前为止，我们只是将 mock 应用在函数上，并没应用在需要传递参数的对象和实例的方法上。我们现在开始涵盖对象的方法。

首先，我们将 `rm` 方法重构成一个服务类。实际上将这样一个简单的函数转换成一个对象，在本质上这不是一个合理的需求，但它能够帮助我们了解 `mock` 的关键概念。让我们开始重构：

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import os.path

class RemovalService(object):
    """A service for removing objects from the filesystem."""

    def rm(filename):
        if os.path.isfile(filename):
            os.remove(filename)
```

你会注意到我们的测试用例没有太大变化：

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mymodule import RemovalService

import mock
import unittest

class RemovalServiceTestCase(unittest.TestCase):

    @mock.patch('mymodule.os.path')
    @mock.patch('mymodule.os')
    def test_rm(self, mock_os, mock_path):
        # instantiate our service
        reference = RemovalService()

        # set up the mock
        mock_path.isfile.return_value = False

        reference.rm("any path")

        # test that the remove call was NOT called.
        self.assertFalse(mock_os.remove.called, "Failed to not remove the file if not present.")

        # make the file 'exist'
        mock_path.isfile.return_value = True

        reference.rm("any path")

        mock_os.remove.assert_called_with("any path")
```

很好，我们知道 `RemovalService` 会如预期般的工作。接下来让我们创建另一个服务，将 `RemovalService` 声明为它的一个依赖：

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import os.path

class RemovalService(object):
    """A service for removing objects from the filesystem."""

    def rm(self, filename):
        if os.path.isfile(filename):
            os.remove(filename)


class UploadService(object):

    def __init__(self, removal_service):
        self.removal_service = removal_service

    def upload_complete(self, filename):
        self.removal_service.rm(filename)
```

因为我们的测试覆盖了 `RemovalService`，因此我们不会对我们测试用例中 `UploadService` 的内部函数 `rm` 进行验证。相反，我们将调用 `UploadService` 的 `RemovalService.rm` 方法来进行简单测试（当然没有其他副作用），我们通过之前的测试用例便能知道它可以正确地工作。

这里有两种方法来实现测试：

1. 模拟 RemovalService.rm 方法本身。
2. 在 UploadService 的构造函数中提供一个模拟实例。

因为这两种方法都是单元测试中非常重要的方法，所以我们将同时对这两种方法进行回顾。

##### 方法 1：模拟实例的方法

`mock` 库有一个特殊的方法装饰器，可以模拟对象实例的方法和属性，即 `@mock.patch.object decorator` 装饰器：

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mymodule import RemovalService, UploadService

import mock
import unittest

class RemovalServiceTestCase(unittest.TestCase):

    @mock.patch('mymodule.os.path')
    @mock.patch('mymodule.os')
    def test_rm(self, mock_os, mock_path):
        # instantiate our service
        reference = RemovalService()

        # set up the mock
        mock_path.isfile.return_value = False

        reference.rm("any path")

        # test that the remove call was NOT called.
        self.assertFalse(mock_os.remove.called, "Failed to not remove the file if not present.")

        # make the file 'exist'
        mock_path.isfile.return_value = True

        reference.rm("any path")

        mock_os.remove.assert_called_with("any path")


class UploadServiceTestCase(unittest.TestCase):

    @mock.patch.object(RemovalService, 'rm')
    def test_upload_complete(self, mock_rm):
        # build our dependencies
        removal_service = RemovalService()
        reference = UploadService(removal_service)

        # call upload_complete, which should, in turn, call `rm`:
        reference.upload_complete("my uploaded file")

        # check that it called the rm method of any RemovalService
        mock_rm.assert_called_with("my uploaded file")

        # check that it called the rm method of _our_ removal_service
        removal_service.rm.assert_called_with("my uploaded file")
```

非常棒！我们验证了 `UploadService` 成功调用了我们实例的 `rm` 方法。你是否注意到一些有趣的地方？这种修补机制（patching mechanism）实际上替换了我们测试用例中的所有 `RemovalService` 实例的 `rm` 方法。这意味着我们可以检查实例本身。如果你想要了解更多，可以试着在你模拟的代码下断点，以对这种修补机制的原理获得更好的认识。

##### 陷阱：装饰顺序

当我们在测试方法中使用多个装饰器，其顺序是很重要的，并且很容易混乱。基本上，当装饰器被映射到方法参数时，[装饰器的工作顺序是反向的][3]。思考这个例子：


```
    @mock.patch('mymodule.sys')
    @mock.patch('mymodule.os')
    @mock.patch('mymodule.os.path')
    def test_something(self, mock_os_path, mock_os, mock_sys):
        pass
```

注意到我们的参数和装饰器的顺序是反向匹配了吗？这部分是由 [Python 的工作方式][4]所导致的。这里是使用多个装饰器的情况下它们执行顺序的伪代码：

```
patch_sys(patch_os(patch_os_path(test_something)))
```

因为 `sys` 补丁位于最外层，所以它最晚执行，使得它成为实际测试方法参数的最后一个参数。请特别注意这一点，并且在运行你的测试用例时，使用调试器来保证正确的参数以正确的顺序注入。

##### 方法 2：创建 Mock 实例

我们可以使用构造函数为 `UploadService` 提供一个 Mock 实例，而不是模拟特定的实例方法。我更推荐方法 1，因为它更加精确，但在多数情况，方法 2 或许更加有效和必要。让我们再次重构测试用例：

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mymodule import RemovalService, UploadService

import mock
import unittest

class RemovalServiceTestCase(unittest.TestCase):

    @mock.patch('mymodule.os.path')
    @mock.patch('mymodule.os')
    def test_rm(self, mock_os, mock_path):
        # instantiate our service
        reference = RemovalService()

        # set up the mock
        mock_path.isfile.return_value = False

        reference.rm("any path")

        # test that the remove call was NOT called.
        self.assertFalse(mock_os.remove.called, "Failed to not remove the file if not present.")

        # make the file 'exist'
        mock_path.isfile.return_value = True

        reference.rm("any path")

        mock_os.remove.assert_called_with("any path")


class UploadServiceTestCase(unittest.TestCase):

    def test_upload_complete(self, mock_rm):
        # build our dependencies
        mock_removal_service = mock.create_autospec(RemovalService)
        reference = UploadService(mock_removal_service)

        # call upload_complete, which should, in turn, call `rm`:
        reference.upload_complete("my uploaded file")

        # test that it called the rm method
        mock_removal_service.rm.assert_called_with("my uploaded file")
```

在这个例子中，我们甚至不需要修补任何功能，只需为 `RemovalService` 类创建一个 auto-spec，然后将实例注入到我们的 `UploadService` 以验证功能。

`mock.create_autospec` 方法为类提供了一个同等功能实例。实际上来说，这意味着在使用返回的实例进行交互的时候，如果使用了非法的方式将会引发异常。更具体地说，如果一个方法被调用时的参数数目不正确，将引发一个异常。这对于重构来说是非常重要。当一个库发生变化的时候，中断测试正是所期望的。如果不使用 auto-spec，尽管底层的实现已经被破坏，我们的测试仍然会通过。

##### 陷阱：mock.Mock 和 mock.MagicMock 类

`mock` 库包含了两个重要的类 [mock.Mock](http://www.voidspace.org.uk/python/mock/mock.html) 和 [mock.MagicMock](http://www.voidspace.org.uk/python/mock/magicmock.html#magic-mock)，大多数内部函数都是建立在这两个类之上的。当在选择使用 `mock.Mock` 实例、`mock.MagicMock` 实例还是 auto-spec 的时候，通常倾向于选择使用 auto-spec，因为对于未来的变化，它更能保持测试的健全。这是因为 `mock.Mock` 和 `mock.MagicMock` 会无视底层的 API，接受所有的方法调用和属性赋值。比如下面这个用例：

```
class Target(object):
    def apply(value):
        return value

def method(target, value):
    return target.apply(value)
```

我们可以像下面这样使用 mock.Mock 实例进行测试：

```
class MethodTestCase(unittest.TestCase):

    def test_method(self):
        target = mock.Mock()

        method(target, "value")

        target.apply.assert_called_with("value")
```

这个逻辑看似合理，但如果我们修改 `Target.apply` 方法接受更多参数：

```
class Target(object):
    def apply(value, are_you_sure):
        if are_you_sure:
            return value
        else:
            return None
```

重新运行你的测试，你会发现它仍能通过。这是因为它不是针对你的 API 创建的。这就是为什么你总是应该使用 `create_autospec` 方法，并且在使用 `@patch`和 `@patch.object` 装饰方法时使用 `autospec` 参数。

### 现实例子：模拟 Facebook API 调用

作为这篇文章的结束，我们写一个更加适用的现实例子，一个在介绍中提及的功能：发布消息到 Facebook。我将写一个不错的包装类及其对应的测试用例。

```
import facebook

class SimpleFacebook(object):

    def __init__(self, oauth_token):
        self.graph = facebook.GraphAPI(oauth_token)

    def post_message(self, message):
        """Posts a message to the Facebook wall."""
        self.graph.put_object("me", "feed", message=message)
```

这是我们的测试用例，它可以检查我们发布的消息,而不是真正地发布消息：

```
import facebook
import simple_facebook
import mock
import unittest

class SimpleFacebookTestCase(unittest.TestCase):

    @mock.patch.object(facebook.GraphAPI, 'put_object', autospec=True)
    def test_post_message(self, mock_put_object):
        sf = simple_facebook.SimpleFacebook("fake oauth token")
        sf.post_message("Hello World!")

        # verify
        mock_put_object.assert_called_with(message="Hello World!")
```

正如我们所看到的，在 Python 中，通过 mock，我们可以非常容易地动手写一个更加智能的测试用例。

### Python Mock 总结

即使对它的使用还有点不太熟悉，对[单元测试][7]来说，Python 的 `mock` 库可以说是一个规则改变者。我们已经演示了常见的用例来了解了 `mock` 在单元测试中的使用，希望这篇文章能够帮助 [Python 开发者][8]克服初期的障碍，写出优秀、经受过考验的代码。

--------------------------------------------------------------------------------

via: https://www.toptal.com/python/an-introduction-to-mocking-in-python

作者：[NAFTULI TZVI KAY][a]
译者：[cposture](https://github.com/cposture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.slviki.com/
[1]: http://www.python.org/dev/peps/pep-0417/
[2]: https://pypi.python.org/pypi/mock
[3]: http://www.voidspace.org.uk/python/mock/patch.html#nesting-patch-decorators
[4]: http://docs.python.org/2/reference/compound_stmts.html#function-definitions
[5]: http://www.voidspace.org.uk/python/mock/helpers.html#autospeccing
[6]: http://www.voidspace.org.uk/python/mock/mock.html
[7]: http://www.toptal.com/qa/how-to-write-testable-code-and-why-it-matters
[8]: http://www.toptal.com/python
