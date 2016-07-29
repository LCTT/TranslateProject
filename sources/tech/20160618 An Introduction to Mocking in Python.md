Translating by cposture 2016-07-29
An Introduction to Mocking in Python
=====================================

This article is about mocking in python,

**How to Run Unit Tests Without Testing Your Patience**

More often than not, the software we write directly interacts with what we would label as “dirty” services. In layman’s terms: services that are crucial to our application, but whose interactions have intended but undesired side-effects—that is, undesired in the context of an autonomous test run.For example: perhaps we’re writing a social app and want to test out our new ‘Post to Facebook feature’, but don’t want to actually post to Facebook every time we run our test suite.

The Python unittest library includes a subpackage named unittest.mock—or if you declare it as a dependency, simply mock—which provides extremely powerful and useful means by which to mock and stub out these undesired side-effects.

>Source | <http://www.toptal.com/python/an-introduction-to-mocking-in-python>

Note: mock is [newly included][1] in the standard library as of Python 3.3; prior distributions will have to use the Mock library downloadable via [PyPI][2].

### Fear System Calls

To give you another example, and one that we’ll run with for the rest of the article, consider system calls. It’s not difficult to see that these are prime candidates for mocking: whether you’re writing a script to eject a CD drive, a web server which removes antiquated cache files from /tmp, or a socket server which binds to a TCP port, these calls all feature undesired side-effects in the context of your unit-tests.

>As a developer, you care more that your library successfully called the system function for ejecting a CD as opposed to experiencing your CD tray open every time a test is run.

As a developer, you care more that your library successfully called the system function for ejecting a CD (with the correct arguments, etc.) as opposed to actually experiencing your CD tray open every time a test is run. (Or worse, multiple times, as multiple tests reference the eject code during a single unit-test run!)

Likewise, keeping your unit-tests efficient and performant means keeping as much “slow code” out of the automated test runs, namely filesystem and network access.

For our first example, we’ll refactor a standard Python test case from original form to one using mock. We’ll demonstrate how writing a test case with mocks will make our tests smarter, faster, and able to reveal more about how the software works.

### A Simple Delete Function

We all need to delete files from our filesystem from time to time, so let’s write a function in Python which will make it a bit easier for our scripts to do so.

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

def rm(filename):
    os.remove(filename)
```

Obviously, our rm method at this point in time doesn’t provide much more than the underlying os.remove method, but our codebase will improve, allowing us to add more functionality here.

Let’s write a traditional test case, i.e., without mocks:

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

Our test case is pretty simple, but every time it is run, a temporary file is created and then deleted. Additionally, we have no way of testing whether our rm method properly passes the argument down to the os.remove call. We can assume that it does based on the test above, but much is left to be desired.

Refactoring with MocksLet’s refactor our test case using mock:

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

With these refactors, we have fundamentally changed the way that the test operates. Now, we have an insider, an object we can use to verify the functionality of another.

### Potential Pitfalls

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









