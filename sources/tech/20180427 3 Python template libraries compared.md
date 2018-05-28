Translating by MjSeven


3 Python template libraries compared
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/library-libraries-search.png?itok=xH8xSU_G)
In my day job, I spend a lot of time wrangling data from various sources into human-readable information. While a lot of the time this just takes the form of a spreadsheet or some type of chart or other data visualization, there are other times when it makes sense to present the data instead in a written format.

But a pet peeve of mine is copying and pasting. If you’re moving data from its source to a standardized template, you shouldn’t be copying and pasting either. It’s error-prone, and honestly, it’s not a good use of your time.

So for any piece of information I send out regularly which follows a common pattern, I tend to find some way to automate at least a chunk of it. Maybe that involves creating a few formulas in a spreadsheet, a quick shell script, or some other solution to autofill a template with information pulled from an outside source.

But lately, I’ve been exploring Python templating to do much of the work of creating reports and graphs from other datasets.

Python templating engines are hugely powerful. My use case of simplifying report creation only scratches the surface of what they can be put to work for. Many developers are making use of these tools to build full-fledged web applications and content management systems. But you don’t have to have a grand vision of a complicated web app to make use of Python templating tools.

### Why templating?

Each templating tool is a little different, and you should read the documentation to understand the exact usage. But let’s create a hypothetical example. Let’s say I’d like to create a short page listing all of the Python topics I've written about recently. Something like this:
```
html>

  head>

    title>/title>

  /head>

  body>

    p>/p>

    ul>

      li>/li>

      li>/li>

      li>/li>

    /ul>

  /body>

/html>My Python articlesThese are some of the things I have written about Python:Python GUIsPython IDEsPython web scrapers

```

Simple enough to maintain when it’s just these three items. But what happens when I want to add a fourth, or fifth, or sixty-seventh? Rather than hand-coding this page, could I generate it from a CSV or other data file containing a list of all of my pages? Could I easily create duplicates of this for every topic I've written on? Could I programmatically change the text or title or heading on each one of those pages? That's where a templating engine can come into play.

There are many different options to choose from, and today I'll share with you three, in no particular order: [Mako][6], [Jinja2][7], and [Genshi][8].

### Mako

[Mako][6] is a Python templating tool released under the MIT license that is designed for fast performance (not unlike Jinja2). Mako has been used by Reddit to power their web pages, as well as being the default templating language for web frameworks like Pyramid and Pylons. It's also fairly simple and straightforward to use; you can design templates with just a couple of lines of code. Supporting both Python 2.x and 3.x, it's a powerful and feature-rich tool with [good documentation][9], which I consider a must. Features include filters, inheritance, callable blocks, and a built-in caching system, which could be import for large or complex web projects.

### Jinja2

Jinja2 is another speedy and full-featured option, available for both Python 2.x and 3.x under a BSD license. Jinja2 has a lot of overlap from a feature perspective with Mako, so for a newcomer, your choice between the two may come down to which formatting style you prefer. Jinja2 also compiles your templates to bytecode, and has features like HTML escaping, sandboxing, template inheritance, and the ability to sandbox portions of templates. Its users include Mozilla, SourceForge, NPR, Instagram, and others, and also features [strong documentation][10]. Unlike Mako, which uses Python inline for logic inside your templates, Jinja2 uses its own syntax.

### Genshi

[Genshi][8] is the third option I'll mention. It's really an XML tool which has a strong templating component, so if the data you are working with is already in XML format, or you need to work with formatting beyond a web page, Genshi might be a good solution for you. HTML is basically a type of XML (well, not precisely, but that's beyond the scope of this article and a bit pedantic), so formatting them is quite similar. Since a lot of the data I work with commonly is in one flavor of XML or another, I appreciated working with a tool I could use for multiple things.

The release version currently only supports Python 2.x, although Python 3 support exists in trunk, I would caution you that it does not appear to be receiving active development. Genshi is made available under a BSD license.

### Example

So in our hypothetical example above, rather than update the HTML file every time I write about a new topic, I can update it programmatically. I can create a template, which might look like this:
```
html>

  head>

    title>/title>

  /head>

  body>

    p>/p>

    ul>

      %for topic in topics:

      li>/li>

      %endfor

    /ul>

  /body>

/html>My Python articlesThese are some of the things I have written about Python:%for topic in topics:${topic}%endfor

```

And then I can iterate across each topic with my templating library, in this case, Mako, like this:
```
from mako.template import Template



mytemplate = Template(filename='template.txt')

print(mytemplate.render(topics=("Python GUIs","Python IDEs","Python web scrapers")))

```

Of course, in a real-world usage, rather than listing the contents manually in a variable, I would likely pull them from an outside data source, like a database or an API.

These are not the only Python templating engines out there. If you’re starting down the path of creating a new project which will make heavy use of templates, you’ll want to consider more than just these three. Check out this much more comprehensive list on the [Python wiki][11] for more projects that are worth considering.

--------------------------------------------------------------------------------

via: https://opensource.com/resources/python/template-libraries

作者：[Jason Baker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://opensource.com/resources/python?intcmp=7016000000127cYAAQ
[2]:https://opensource.com/resources/python/ides?intcmp=7016000000127cYAAQ
[3]:https://opensource.com/resources/python/gui-frameworks?intcmp=7016000000127cYAAQ
[4]:https://opensource.com/tags/python?intcmp=7016000000127cYAAQ
[5]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ
[6]:http://www.makotemplates.org/
[7]:http://jinja.pocoo.org/
[8]:https://genshi.edgewall.org/
[9]:http://docs.makotemplates.org/en/latest/
[10]:http://jinja.pocoo.org/docs/2.10/
[11]:https://wiki.python.org/moin/Templating
