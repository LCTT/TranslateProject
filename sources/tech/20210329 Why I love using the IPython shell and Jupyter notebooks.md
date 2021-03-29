[#]: subject: (Why I love using the IPython shell and Jupyter notebooks)
[#]: via: (https://opensource.com/article/21/3/ipython-shell-jupyter-notebooks)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Why I love using the IPython shell and Jupyter notebooks
======
Jupyter notebooks take the IPython shell to the next level.
![Computer laptop in space][1]

The Jupyter project started out as IPython and the IPython Notebook. It was originally a Python-specific interactive shell and notebook environment, which later branched out to become language-agnostic, supporting Julia, Python, and R—and potentially anything else.

![Jupyter][2]

(Ben Nuttall, [CC BY-SA 4.0][3])

IPython is a Python shell—similar to what you get when you type `python` or `python3` at the command line—but it's more clever and more helpful. If you've ever typed a multi-line command into the Python shell and wanted to repeat it, you'll understand the frustration of having to scroll through your history one line at a time. With IPython, you can scroll back through whole blocks at a time while still being able to navigate line-by-line and edit parts of those blocks.

![iPython][4]

(Ben Nuttall, [CC BY-SA 4.0][3])

It has autocompletion and provides context-aware suggestions:

![iPython offers suggestions][5]

(Ben Nuttall, [CC BY-SA 4.0][3])

It pretty-prints by default:

![iPython pretty prints][6]

(Ben Nuttall, [CC BY-SA 4.0][3])

It even allows you to run shell commands:

![IPython shell commands][7]

(Ben Nuttall, [CC BY-SA 4.0][3])

It also provides helpful features like adding `?` to an object as a shortcut for running `help()` without breaking your flow:

![IPython help][8]

(Ben Nuttall, [CC BY-SA 4.0][3])

If you're using a virtual environment (see my post on [virtualenvwrapper][9], install it with pip in the environment):


```
`pip install ipython`
```

To install it system-wide, you can use apt on Debian, Ubuntu, or Raspberry Pi:


```
`sudo apt install ipython3`
```

or with pip:


```
`sudo pip3 install ipython`
```

### Jupyter notebooks

Jupyter notebooks take the IPython shell to the next level. First of all, they're browser-based, not terminal-based. To get started, install `jupyter`.

If you're using a virtual environment, install it with pip in the environment:


```
`pip install jupyter`
```

To install it system-wide, you can use apt on Debian, Ubuntu, or Raspberry Pi:


```
`sudo apt install jupyter-notebook`
```

or with pip:


```
`sudo pip3 install jupyter`
```

Launch the notebook with:


```
`jupyter notebook`
```

This will open in your browser:

![Jupyter Notebook][10]

(Ben Nuttall, [CC BY-SA 4.0][3])

You can create a new Python 3 notebook using the **New** dropdown:

![Python 3 in Jupyter Notebook][11]

(Ben Nuttall, [CC BY-SA 4.0][3])

Now you can write and execute commands in the `In[ ]` fields. Use **Enter** for a newline within the block and **Shift+Enter** to execute:

![Executing commands in Jupyter][12]

(Ben Nuttall, [CC BY-SA 4.0][3])

You can edit and rerun blocks. You can reorder them, delete them, copy/paste, and so on. You can run blocks in any order—but be aware that any variables created will be in scope according to the time of execution, rather than the order they appear within the notebook. You can restart and clear output or restart and run all blocks from within the **Kernel** menu.

Using the `print` function will output every time. But if you only have a single statement that's not assigned or your last statement is unassigned, it will be output anyway:

![Jupyter output][13]

(Ben Nuttall, [CC BY-SA 4.0][3])

You can even refer to `In` and `Out` as indexable objects:

![Jupyter output][14]

(Ben Nuttall, [CC BY-SA 4.0][3])

All the IPython features are available and are often presented a little nicer, too:

![Jupyter supports IPython features][15]

(Ben Nuttall, [CC BY-SA 4.0][3])

You can even do inline plots using [Matplotlib][16]:

![Graphing in Jupyter Notebook][17]

(Ben Nuttall, [CC BY-SA 4.0][3])

Finally, you can save your notebooks and include them in Git repositories, and if you push to GitHub, they will render as completed notebooks—outputs, graphs, and all (as in [this example][18]):

![Saving Notebook to GitHub][19]

(Ben Nuttall, [CC BY-SA 4.0][3])

* * *

_This article originally appeared on Ben Nuttall's [Tooling Tuesday blog][20] and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/ipython-shell-jupyter-notebooks

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://opensource.com/sites/default/files/uploads/jupyterpreview.png (Jupyter)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/ipython-loop.png (iPython)
[5]: https://opensource.com/sites/default/files/uploads/ipython-suggest.png (iPython offers suggestions)
[6]: https://opensource.com/sites/default/files/uploads/ipython-pprint.png (iPython pretty prints)
[7]: https://opensource.com/sites/default/files/uploads/ipython-ls.png (IPython shell commands)
[8]: https://opensource.com/sites/default/files/uploads/ipython-help.png (IPython help)
[9]: https://opensource.com/article/21/2/python-virtualenvwrapper
[10]: https://opensource.com/sites/default/files/uploads/jupyter-notebook-1.png (Jupyter Notebook)
[11]: https://opensource.com/sites/default/files/uploads/jupyter-python-notebook.png (Python 3 in Jupyter Notebook)
[12]: https://opensource.com/sites/default/files/uploads/jupyter-loop.png (Executing commands in Jupyter)
[13]: https://opensource.com/sites/default/files/uploads/jupyter-cells.png (Jupyter output)
[14]: https://opensource.com/sites/default/files/uploads/jupyter-cells-2.png (Jupyter output)
[15]: https://opensource.com/sites/default/files/uploads/jupyter-help.png (Jupyter supports IPython features)
[16]: https://matplotlib.org/
[17]: https://opensource.com/sites/default/files/uploads/jupyter-graph.png (Graphing in Jupyter Notebook)
[18]: https://github.com/piwheels/stats/blob/master/2020.ipynb
[19]: https://opensource.com/sites/default/files/uploads/savenotebooks.png (Saving Notebook to GitHub)
[20]: https://tooling.bennuttall.com/the-ipython-shell-and-jupyter-notebooks/
