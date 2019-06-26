[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IPython is still the heart of Jupyter Notebooks for Python developers)
[#]: via: (https://opensource.com/article/19/6/ipython-still-heart-jupyterlab)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg/users/marcobravo)

IPython is still the heart of Jupyter Notebooks for Python developers
======
Project Jupyter's origin in IPython remains significant for the magical
development experience it provides.
![I love Free Software FSFE celebration][1]

I recently wrote about how I find Jupyter projects, especially JupyterLab, to be a [magical Python development experience][2]. In researching how the various projects are related to each other, I recapped how Jupyter began as a fork from IPython. As Project Jupyter's [The Big Split™ announcement][3] explained:

> "If anyone has been confused by what Jupyter is[1], it's the exact same code that lived in IPython, developed by the same people, just in a new home under a new name."

That [1] links to a footnote that further clarifies:

> "I saw 'Jupyter is like IPython, but language agnostic' immediately after the announcement, which is a great illustration of why the project needs to not have Python in the name anymore, since it was already language agnostic at the time."

The fact that Jupyter Notebook and IPython forked from the same source code made sense to me, but I got lost in the current state of the IPython project. Was it no longer needed after The Big Split™ or is it living on in a different way?

I was surprised to learn that IPython's significance continues to add value to Pythonistas, and that it is an essential part of the Jupyter experience. Here's a portion of the Jupyter FAQ:

> **Are any languages pre-installed?**
>
> Yes, installing the Jupyter Notebook will also install the IPython kernel. This allows working on notebooks using the Python programming language.

I now understand that writing Python in JupyterLab (and Jupyter Notebook) relies on the continued development of IPython as its kernel. Not only that, IPython is the powerhouse default kernel, and it can act as a communication bus for other language kernels according to [the documentation][4], saving a lot of time and development effort.

The question remains, what can I do with just IPython?

### What IPython does today

IPython provides both a powerful, interactive Python shell and a Jupyter kernel. After installing it, I can run **ipython** from any command line on its own and use it as a (much prettier than the default) Python shell:


```
$ ipython
Python 3.7.3 (default, Mar 27 2019, 09:23:15)
Type 'copyright', 'credits' or 'license' for more information
IPython 7.4.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]: import numpy as np
In [2]: example = np.array([5, 20, 3, 4, 0, 2, 12])
In [3]: average = np.average(example)
In [4]: print(average)
6.571428571428571
```

That brings us to the more significant issue: IPython's functionality gives JupyterLab the ability to execute the code in every project, and it also provides support for a whole bunch of functionality that's playfully called _magic_ (thank you, Nicholas Reith, for mentioning this in a comment on my previous article).

### Getting magical, thanks to IPython

JupyterLab and other frontends using the IPython kernel can feel like your favorite IDE or terminal emulator environment. I'm a huge fan of how [dotfiles][5] give me the power to use shortcuts, and magic has some dotfile-like behavior as well. For example, check out **[%bookmark][6]**. I've mapped my default development folder, **~/Develop** , to a shortcut I can run at any time and hop right into it.

![Screenshot of commands from JupyterLab][7]

The use of **%bookmark** and **%cd** , alongside the **!** operator (which I introduced in the previous article), are powered by IPython. As the [documentation][8] states:

> To Jupyter users: Magics are specific to and provided by the IPython kernel. Whether Magics are available on a kernel is a decision that is made by the kernel developer on a per-kernel basis.

### Wrapping up

I, as a curious novice, was not quite sure if IPython remained relevant to the Jupyter ecosystem. I now have a new appreciation for the continuing development of IPython now that I realize it's the source of JupyterLab's powerful user experience. It's also a collection of talented contributors who are part of cutting edge research, so be sure to site them if you use Jupyter projects in your academic papers. They make it easy with this [ready-made citation entry][9].

Be sure to keep it in mind when you're thinking about open source projects to contribute to, and check out the [latest release notes][10] for a full list of magical features.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/ipython-still-heart-jupyterlab

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ilovefs_free_sticker_fsfe_heart.jpg?itok=gLJtaieq (I love Free Software FSFE celebration)
[2]: https://opensource.com/article/19/5/jupyterlab-python-developers-magic
[3]: https://blog.jupyter.org/the-big-split-9d7b88a031a7
[4]: https://jupyter-client.readthedocs.io/en/latest/kernels.html
[5]: https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments
[6]: https://ipython.readthedocs.io/en/stable/interactive/magics.html?highlight=magic#magic-bookmark
[7]: https://opensource.com/sites/default/files/uploads/jupyterlab-commands-ipython.png (Screenshot of commands from JupyterLab)
[8]: https://ipython.readthedocs.io/en/stable/interactive/magics.html
[9]: https://ipython.org/citing.html
[10]: https://ipython.readthedocs.io/en/stable/whatsnew/index.html
