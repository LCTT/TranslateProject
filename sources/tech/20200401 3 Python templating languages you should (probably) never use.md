[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 Python templating languages you should (probably) never use)
[#]: via: (https://opensource.com/article/20/4/python-templating-languages)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

3 Python templating languages you should (probably) never use
======
Python has accumulated a lot of templating languages, including these
three that are perfect for April Fools' Day.
![Hands on a keyboard with a Python book ][1]

When reaching for a templating language for writing a [Python][2] web application, there are an abundance of robust solutions. 

There are [Jinja2][3], [Genshi, and Mako][4]. There are even solutions like [Chameleon][5], which are a bit older, but still recommended by the [Pyramid][6] framework.

Python has been around for a long time. In that time, deep in the corners of its system, it has accumulated some almost forgotten templating languages that are well worth poking at.

Like cute koalas on top of a eucalyptus tree, happy in their ecological niche, and sometimes as dangerous to work with, these are the templating languages few have heard of—and even fewer should use.

### 3\. string.Template

Have you ever wondered, "How can I get a templating language with no features, but also without needing to **pip install** anything?" The Python standard library has you covered. While it does no looping or conditionals, the **string.Template** class is a minimal templating language.

Using it is simplicity itself.


```
&gt;&gt;&gt; import string
&gt;&gt;&gt; greeting = string.Template("Hello, $name, good $time!")
&gt;&gt;&gt; greeting.substitute(name="OpenSource.com", time="afternoon")
'Hello, OpenSource.com, good afternoon!'
```

### 2\. twisted.web.template

What gift do you give the library that has everything?

Not a templating language, certainly, because it already has one. Nestled in **twisted.web.template** are two templating languages. One is XML-based and has a [great tutorial][7].

But there is another one, one that is based on using Python as a domain-specific language to produce HTML documents.

It is based on two primitives: **twisted.web.template.tags**, which contains tag objects, and **twisted.web.template.flattenString**, which will render them. Because it is part of Twisted, it has built-in support for rendering async results efficiently.

This example will render a silly little page:


```
async def render(reactor):
    my_title = "A Fun page"
    things = ["one", "two", "red", "blue"]
    template = tags.html(
            tags.head(
                tags.title(my_title),
            ),
            tags.body(
                tags.h1(my_title),
                tags.ul(
                    [tags.li(thing) for thing in things],
                ),
                tags.p(
                    task.deferLater(reactor, 3, lambda: "Hello "),
                    task.deferLater(reactor, 3, lambda: "world!"),
                )
            )
    )
    res = await flattenString(None, template)
    res = res.decode('utf-8')
    with open("hello.html", 'w') as fpout:
        fpout.write(res)
```

The template is regular Python code that uses the **tags.&lt;TAGNAME&gt;** to indicate the hierarchy. It natively supports strings as renderables, so any string is fine.

To render it, the only things you need to do are to add a preamble:


```
from twisted.internet import task, defer
from twisted.web.template import tags, flattenString

def main(reactor):
    return defer.ensureDeferred(render(reactor))
```

and an epilogue to run the whole thing:


```
`task.react(main)`
```

In just _three_ seconds (and not _six_), it will render a nice HTML page. In real-life, those **deferLater**s can be, for example, calls to an HTTP API: they will be sent and processed in parallel, without having to put in any effort. I recommend you instead read about a [far better use for Twisted][8]. But still, this works.

### 1\. Quixote

You will say, "But Python is not _optimized_ for being an HTML-spouting domain-specific language." What if, instead of settling for Python-as-is, there was a language that [transpiles][9] to Python, but is better at defining templates? A "Python template language" (PTL), if you will.

Writing your own language is sometimes said to be a dreamer's project for someone who tilts at windmills. Irony was not lost on the creators of Quixote (available on [PyPI][10]) when they decided to do exactly that.

The following will render an equivalent template to the one done with Twisted above. _Warning: the following is not valid Python_:


```
import time

def render [html] ():
    my_title = "A Fun page"
    things = ["one", "two", "red", "blue"]
    "&lt;html&gt;&lt;head&gt;&lt;title&gt;"
    my_title
    "&lt;/head&gt;&lt;/title&gt;&lt;body&gt;&lt;h1&gt;"
    my_title
    "&lt;/h1&gt;"
    "&lt;ul&gt;"
    for thing in things:
        "&lt;li&gt;"
        thing
        "&lt;/li&gt;"
    "&lt;p&gt;"
    time.sleep(3)
    (lambda: "Hello ")()
    time.sleep(3)
    (lambda: "world!")()
    "&lt;/p&gt;"
    "&lt;/body&gt;&lt;/html&gt;"

def write():
    result = render()
    with open("hello.html", 'w') as fpout:
        fpout.write(str(result))
```

However, if you put it in a file called **template.ptl**, you can make it importable to Quixote and write out the rendered version of the template:


```
&gt;&gt;&gt; from quixote import enable_ptl
&gt;&gt;&gt; enable_ptl()
&gt;&gt;&gt; import template
&gt;&gt;&gt; template.write()
```

Quixote installs an import hook that will cause PTL files to transpile into Python. Note that this render takes _six_ seconds, not _three_; you no longer gain free asynchronicity.

### So many templates in Python

Python has a long and winding history of libraries, some of which can achieve the same outcomes in more or less similar ways (for example, Python [package management][11]).

On this April Fools' Day, I hope you enjoyed exploring three ways you _can_ create templates in Python. Instead, I recommend starting with [one of these libraries][4] for ways you _should_ template.

Do you have another esoteric way to template? Share it in the comments below!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/python-templating-languages

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/20/2/jinja2-cheat-sheet
[4]: https://opensource.com/resources/python/template-libraries
[5]: https://chameleon.readthedocs.io/en/latest/
[6]: https://opensource.com/article/18/5/pyramid-framework
[7]: https://twistedmatrix.com/documents/13.1.0/web/howto/twisted-templates.html
[8]: https://opensource.com/article/20/3/treq-python
[9]: https://en.wikipedia.org/wiki/Source-to-source_compiler
[10]: https://pypi.org/project/Quixote/
[11]: https://opensource.com/article/19/4/managing-python-packages
