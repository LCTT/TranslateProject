Mock 在 Python 中的使用介绍
=====================================
http://www.oschina.net/translate/an-introduction-to-mocking-in-python?cmp
本文讲述的是 Python 中 Mock 的使用

**如何在避免测试你的耐心的情景下执行单元测试**

通常，我们编写的软件会直接与我们称之为肮脏无比的服务交互。用外行人的话说：交互已设计好的服务对我们的应用程序很重要，但是这会带来我们不希望的副作用，也就是那些在我们自己测试的时候不希望的功能。例如：我们正在写一个社交 app，并且想要测试一下我们 "发布到 Facebook" 的新功能，但是不想每次运行测试集的时候真的发布到 Facebook。


Python 的单元测试库包含了一个名为 unittest.mock 或者可以称之为依赖的子包，简言之为 mock——其提供了极其强大和有用的方法，通过它们可以模拟和打桩我们不希望的副作用。


>Source | <http://www.toptal.com/python/an-introduction-to-mocking-in-python>

注意：mock [最近收录][1]到了 Python 3.3 的标准库中；先前发布的版本必须通过 [PyPI][2] 下载 Mock 库。

###
### Fear System Calls

再举另一个例子，思考一个我们会在余文讨论的系统调用。不难发现，这些系统调用都是主要的模拟对象：无论你是正在写一个可以弹出 CD 驱动的脚本，还是一个用来删除 /tmp 下过期的缓存文件的 Web 服务，这些调用都是在你的单元测试上下文中不希望的副作用。

> 作为一个开发者，你需要更关心你的库是否成功地调用了一个可以弹出 CD 的系统函数，而不是切身经历 CD 托盘每次在测试执行的时候都打开了。

作为一个开发者，你需要更关心你的库是否成功地调用了一个可以弹出 CD 的系统函数（使用了正确的参数等等），而不是切身经历 CD 托盘每次在测试执行的时候都打开了。（或者更糟糕的是，很多次，在一个单元测试运行期间多个测试都引用了弹出代码！）

同样，保持你的单元测试的效率和性能意味着需要让如此多的 "缓慢代码" 远离自动测试，比如文件系统和网络访问。

对于我们首个例子，我们要从原始形式到使用 mock 地重构一个标准 Python 测试用例。我们会演示如何使用 mock 写一个测试用例使我们的测试更加智能、快速，并且能展示更多关于我们软件的工作原理。

### 一个简单的删除函数

有时，我们都需要从文件系统中删除文件，因此，让我们在 Python 中写一个可以使我们的脚本更加轻易完成此功能的函数。

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

def rm(filename):
    os.remove(filename)
```

很明显，我们的 rm 方法此时无法提供比相关 os.remove 方法更多的功能，但我们的基础代码会逐步改善，允许我们在这里添加更多的功能。

让我们写一个传统的测试用例，即，没有使用 mock：

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

我们的测试用例相当简单，但是当它每次运行的时候，它都会创建一个临时文件并且随后删除。此外，我们没有办法测试我们的 rm 方法是否正确地将我们的参数向下传递给 os.remove 调用。我们可以基于以上的测试认为它做到了，但还有很多需要改进的地方。

### 使用 Mock 重构

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

使用这些重构，我们从根本上改变了该测试用例的运行方式。现在，我们有一个可以用于验证其他功能的内部对象。

### 潜在陷阱

第一件需要注意的事情就是，我们使用了用于模拟 mock.patch 方法的装饰器位于mymodule.os
One of the first things that should stick out is that we’re using the mock.patch method decorator to mock an object located at mymodule.os, and injecting that mock into our test case method. Wouldn’t it make more sense to just mock os itself, rather than the reference to it at mymodule.os?

Well, Python is somewhat of a sneaky snake when it comes to imports and managing modules. At runtime, the mymodule module has its own os which is imported into its own local scope in the module. Thus, if we mock os, we won’t see the effects of the mock in the mymodule module.

The mantra to keep repeating is this:

> Mock an item where it is used, not where it came from.

If you need to mock the tempfile module for myproject.app.MyElaborateClass, you probably need to apply the mock to myproject.app.tempfile, as each module keeps its own imports.

With that pitfall out of the way, let’s keep mocking.

### Adding Validation to ‘rm’

The rm method defined earlier is quite oversimplified. We’d like to have it validate that a path exists and is a file before just blindly attempting to remove it. Let’s refactor rm to be a bit smarter:

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import os.path

def rm(filename):
    if os.path.isfile(filename):
        os.remove(filename)
```

Great. Now, let’s adjust our test case to keep coverage up.

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

Our testing paradigm has completely changed. We now can verify and validate internal functionality of methods without any side-effects.

### File-Removal as a Service

So far, we’ve only been working with supplying mocks for functions, but not for methods on objects or cases where mocking is necessary for sending parameters. Let’s cover object methods first.

We’ll begin with a refactor of the rm method into a service class. There really isn’t a justifiable need, per se, to encapsulate such a simple function into an object, but it will at the very least help us demonstrate key concepts in mock. Let’s refactor:

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

### You’ll notice that not much has changed in our test case:

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

Great, so we now know that the RemovalService works as planned. Let’s create another service which declares it as a dependency:

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

Since we already have test coverage on the RemovalService, we’re not going to validate internal functionality of the rm method in our tests of UploadService. Rather, we’ll simply test (without side-effects, of course) that UploadService calls the RemovalService.rm method, which we know “just works™” from our previous test case.

There are two ways to go about this:

1. Mock out the RemovalService.rm method itself.
2. Supply a mocked instance in the constructor of UploadService.

As both methods are often important in unit-testing, we’ll review both.

### Option 1: Mocking Instance Methods

The mock library has a special method decorator for mocking object instance methods and properties, the @mock.patch.object decorator:

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

Great! We’ve validated that the UploadService successfully calls our instance’s rm method. Notice anything interesting in there? The patching mechanism actually replaced the rm method of all RemovalService instances in our test method. That means that we can actually inspect the instances themselves. If you want to see more, try dropping in a breakpoint in your mocking code to get a good feel for how the patching mechanism works.

### Pitfall: Decorator Order

When using multiple decorators on your test methods, order is important, and it’s kind of confusing. Basically, when mapping decorators to method parameters, [work backwards][3]. Consider this example:

```
@mock.patch('mymodule.sys')
    @mock.patch('mymodule.os')
    @mock.patch('mymodule.os.path')
    def test_something(self, mock_os_path, mock_os, mock_sys):
        pass
```

Notice how our parameters are matched to the reverse order of the decorators? That’s partly because of [the way that Python works][4]. With multiple method decorators, here’s the order of execution in pseudocode:

```
patch_sys(patch_os(patch_os_path(test_something)))
```

Since the patch to sys is the outermost patch, it will be executed last, making it the last parameter in the actual test method arguments. Take note of this well and use a debugger when running your tests to make sure that the right parameters are being injected in the right order.

### Option 2: Creating Mock Instances

Instead of mocking the specific instance method, we could instead just supply a mocked instance to UploadService with its constructor. I prefer option 1 above, as it’s a lot more precise, but there are many cases where option 2 might be efficient or necessary. Let’s refactor our test again:

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

In this example, we haven’t even had to patch any functionality, we simply create an auto-spec for the RemovalService class, and then inject this instance into our UploadService to validate the functionality.

The [mock.create_autospec][5] method creates a functionally equivalent instance to the provided class. What this means, practically speaking, is that when the returned instance is interacted with, it will raise exceptions if used in illegal ways. More specifically, if a method is called with the wrong number of arguments, an exception will be raised. This is extremely important as refactors happen. As a library changes, tests break and that is expected. Without using an auto-spec, our tests will still pass even though the underlying implementation is broken.

### Pitfall: The mock.Mock and mock.MagicMock Classes

The mock library also includes two important classes upon which most of the internal functionality is built upon: [mock.Mock][6] and mock.MagicMock. When given a choice to use a mock.Mock instance, a mock.MagicMock instance, or an auto-spec, always favor using an auto-spec, as it helps keep your tests sane for future changes. This is because mock.Mock and mock.MagicMock accept all method calls and property assignments regardless of the underlying API. Consider the following use case:

```
class Target(object):
    def apply(value):
        return value

def method(target, value):
    return target.apply(value)
```

We can test this with a mock.Mock instance like this:

```
class MethodTestCase(unittest.TestCase):

    def test_method(self):
        target = mock.Mock()

        method(target, "value")

        target.apply.assert_called_with("value")
```

This logic seems sane, but let’s modify the Target.apply method to take more parameters:

```
class Target(object):
    def apply(value, are_you_sure):
        if are_you_sure:
            return value
        else:
            return None
```

Re-run your test, and you’ll find that it still passes. That’s because it isn’t built against your actual API. This is why you should always use the create_autospec method and the autospec parameter with the @patch and @patch.object decorators.

### Real-World Example: Mocking a Facebook API Call

To finish up, let’s write a more applicable real-world example, one which we mentioned in the introduction: posting a message to Facebook. We’ll write a nice wrapper class and a corresponding test case.

```
import facebook

class SimpleFacebook(object):

    def __init__(self, oauth_token):
        self.graph = facebook.GraphAPI(oauth_token)

    def post_message(self, message):
        """Posts a message to the Facebook wall."""
        self.graph.put_object("me", "feed", message=message)
```

Here’s our test case, which checks that we post the message without actually posting the message:

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

As we’ve seen so far, it’s really simple to start writing smarter tests with mock in Python.

### Mocking in python Conclusion

Python’s mock library, if a little confusing to work with, is a game-changer for [unit-testing][7]. We’ve demonstrated common use-cases for getting started using mock in unit-testing, and hopefully this article will help [Python developers][8] overcome the initial hurdles and write excellent, tested code.

--------------------------------------------------------------------------------

via: http://slviki.com/index.php/2016/06/18/introduction-to-mocking-in-python/

作者：[Dasun Sucharith][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
