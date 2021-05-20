[#]: subject: (Make your API better with this positional trick from Python 3.8)
[#]: via: (https://opensource.com/article/21/5/python-38-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Make your API better with this positional trick from Python 3.8
======
Explore positional-only parameters and two other underutilized but still
useful Python features.
![Women in computing and open source v5][1]

This is the ninth in a series of articles about features that first appeared in a version of Python 3.x. Python 3.8 was first released in 2019, and two years later, many of its cool new features remain underused. Here are three of them.

### importlib.metadata

[Entry points][2] are used for various things in Python packages. The most familiar are [console_scripts][3] entrypoints, but many plugin systems in Python use them.

Until Python 3.8, the best way to read entry points from Python was to use `pkg_resources`, a somewhat clunky module that is part of `setuptools`.

The new `importlib.metadata` is a built-in module that allows access to the same thing:


```
from importlib import metadata as importlib_metadata

distribution = importlib_metadata.distribution("numpy")
distribution.entry_points

[/code] [code]

    [EntryPoint(name='f2py', value='numpy.f2py.f2py2e:main', group='console_scripts'),
     EntryPoint(name='f2py3', value='numpy.f2py.f2py2e:main', group='console_scripts'),
     EntryPoint(name='f2py3.9', value='numpy.f2py.f2py2e:main', group='console_scripts')]
```

Entry points are not the only thing `importlib.metadata` permits access to. For debugging, reporting, or (in extreme circumstances) triggering compatibility modes, you can also check the version of dependencies—at runtime!


```
`f"{distribution.metadata['name']}=={distribution.version}"`[/code] [code]`    'numpy==1.20.1'`
```

### Positional-only parameters

After the wild success of keywords-only arguments at communicating API authors' intentions, another gap was filled: positional-only arguments.

Especially for functions that allow arbitrary keywords (for example, to generate data structures), this means there are fewer constraints on allowed argument names:


```
def some_func(prefix, /, **kwargs):
    print(prefix, kwargs)

[/code] [code]`some_func("a_prefix", prefix="prefix keyword value")`[/code] [code]`    a_prefix {'prefix': 'prefix keyword value'}`
```

Note that, confusingly, the value of the _variable_ `prefix` is distinct from the value of `kwargs["prefix"]`. As in many places, take care to use this feature carefully.

### Self-debugging expressions

The `print()` statement (and its equivalent in other languages) has been a favorite for quickly debugging output for over 50 years.

But we have made much progress in print statements like:


```
special_number = 5
print("special_number = %s" % special_number)

[/code] [code]`    special_number = 5`
```

Yet self-documenting f-strings make it even easier to be clear:


```
`print(f"{special_number=}")`[/code] [code]`    special_number=5`
```

Adding an `=` to the end of an f-string interpolated section keeps the literal part while adding the value.

This is even more useful when more complicated expressions are inside the section:


```
values = {}
print(f"{values.get('something', 'default')=}")

[/code] [code]`    values.get('something', 'default')='default'`
```

### Welcome to 2019

Python 3.8 was released about two years ago, and some of its new features are cool—and underused. Add them to your toolkit if you haven't already.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-38-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_5.png?itok=YHpNs_ss (Women in computing and open source v5)
[2]: https://packaging.python.org/specifications/entry-points/
[3]: https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html
