Enhance your Python with an interactive shell
======
![](https://fedoramagazine.org/wp-content/uploads/2018/03/python-shells-816x345.jpg)
The Python programming language has become one of the most popular languages used in IT. One reason for this success is it can be used to solve a variety of problems. From web development to data science, machine learning to task automation, the Python ecosystem is rich in popular frameworks and libraries. This article presents some useful Python shells available in the Fedora packages collection to make development easier.

### Python Shell

The Python Shell lets you use the interpreter in an interactive mode. It’s very useful to test code or try a new library. In Fedora you can invoke the default shell by typing python3 in a terminal session. Some more advanced and enhanced shells are available to Fedora, though.

### IPython

IPython provides many useful enhancements to the Python shell. Examples include tab completion, object introspection, system shell access and command history retrieval. Many of these features are also used by the [Jupyter Notebook][1] , since it uses IPython underneath.

#### Install and run IPython
```
dnf install ipython3
ipython3

```

Using tab completion prompts you with possible choices. This features comes in handy when you use an unfamiliar library.

![][2]

If you need more information, use the documentation by typing the ? command. For more details, you can use the ?? command.

![][3]

Another cool feature is the ability to execute a system shell command using the ! character. The result of the command can then be referenced in the IPython shell.

![][4]

A comprehensive list of IPython features is available in the [official documentation][5].

### bpython

bpython doesn’t do as much as IPython, but nonetheless it provides a useful set of features in a simple and lightweight package. Among other features, bpython provides:

  * In-line syntax highlighting
  * Autocomplete with suggestions as you type
  * Expected parameter list
  * Ability to send or save code to a pastebin service or file



#### Install and run bpython
```
dnf install bpython3
bpython3

```

As you type, bpython offers you choices to autocomplete your code.

![][6]

When you call a function or method, the expected parameters and the docstring are automatically displayed.

![][7]

Another neat feature is the ability to open the current bpython session in an external editor (Vim by default) using the function key F7. This is very useful when testing more complex programs.

For more details about configuration and features, consult the bpython [documentation][8].

### Conclusion

Using an enhanced Python shell is a good way to increase productivity. It gives you enhanced features to write a quick prototype or try out a new library. Are you using an enhanced Python shell? Feel free to mention it in the comment section below.

Photo by [David Clode][9] on [Unsplash][10]


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/enhance-python-interactive-shell/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/cverna/
[1]:https://ipython.org/notebook.html
[2]:https://fedoramagazine.org/wp-content/uploads/2018/03/ipython-tabcompletion.png
[3]:https://fedoramagazine.org/wp-content/uploads/2018/03/ipyhton_doc1.png
[4]:https://fedoramagazine.org/wp-content/uploads/2018/03/ipython_shell.png
[5]:https://ipython.readthedocs.io/en/stable/overview.html#main-features-of-the-interactive-shell
[6]:https://fedoramagazine.org/wp-content/uploads/2018/03/bpython1.png
[7]:https://fedoramagazine.org/wp-content/uploads/2018/03/bpython2.png
[8]:https://docs.bpython-interpreter.org/
[9]:https://unsplash.com/photos/d0CasEMHDQs?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[10]:https://unsplash.com/search/photos/python?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
