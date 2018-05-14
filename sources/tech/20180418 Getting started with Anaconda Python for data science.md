pinewall translating

Getting started with Anaconda Python for data science
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_data.png?itok=RH6NA32X)
Like many others, I've been trying to get involved in the rapidly expanding field of data science. When I took Udemy courses on the [R][1] and [Python][2] programming languages, I downloaded and installed the applications independently. As I was trying to work through the challenges of installing data science packages like [NumPy][3] and [Matplotlib][4] and solving the various dependencies, I learned about the [Anaconda Python distribution][5].

Anaconda is a complete, [open source][6] data science package with a community of over 6 million users. It is easy to [download][7] and install, and it is supported on Linux, MacOS, and Windows.

I appreciate that Anaconda eases the frustration of getting started for new users. The distribution comes with more than 1,000 data packages as well as the [Conda][8] package and virtual environment manager, so it eliminates the need to learn to install each library independently. As Anaconda's website says, "The Python and R conda packages in the Anaconda Repository are curated and compiled in our secure environment so you get optimized binaries that 'just work' on your system."

I recommend using [Anaconda Navigator][9], a desktop graphical user interface (GUI) system that includes links to all the applications included with the distribution including [RStudio][10], [iPython][11], [Jupyter Notebook][12], [JupyterLab][13], [Spyder][14], [Glue][15], and [Orange][16]. The default environment is Python 3.6, but you can also easily install Python 3.5, Python 2.7, or R. The [documentation][9] is incredibly detailed and there is an excellent community of users for additional support.

### Installing Anaconda

To install Anaconda on my Linux laptop (an I3 with 4GB of RAM), I downloaded the Anaconda 5.1 Linux installer and ran `md5sum` to verify the file:
```
$ md5sum Anaconda3-5.1.0-Linux-x86_64.sh

```

Then I followed the directions in the [documentation][17], which instructed me to issue the following Bash command whether I was in the Bash shell or not:
```
$ bash Anaconda3-5.1.0-Linux-x86_64.sh

```

I followed the installation directions exactly, and the well-scripted install took about five minutes to complete. When the installation prompted: "Do you wish the installer to prepend the Anaconda install location to PATH in your `/home/<user>/.bashrc`?" I allowed it and restarted the shell, which I found was necessary for the `.bashrc` environment to work correctly.

After completing the install, I launched Anaconda Navigator by entering the following at the command prompt in the shell:
```
$ anaconda-navigator

```

Every time Anaconda Navigator launches, it checks to see if new software is available and prompts you to update if necessary.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-update.png?itok=wMk78pGQ)

Anaconda updated successfully without needing to return to the command line. Anaconda's initial launch was a little slow; that plus the update meant it took a few additional minutes to get started.

You can also update manually by entering the following:
```
$ conda update anaconda-navigator

```

### Exploring and installing applications

Once Navigator launched, I was free to explore the range of applications included with Anaconda Distribution. According to the documentation, the 64-bit Python 3.6 version of Anaconda [supports 499 packages][18]. The first application I explored was [Jupyter QtConsole][19]. The easy-to-use GUI supports inline figures and syntax highlighting.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-jupyterqtconsole.png?itok=fQQoErIO)

Jupyter Notebook is included with the distribution, so (unlike other Python environments I have used) there is no need for a separate install.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-jupyternotebook.png?itok=VqvbyOcI)

I was already familiar with RStudio. It's not installed by default, but it's easy to add with the click of a mouse. Other applications, including JupyterLab, Orange, Glue, and Spyder, can be launched or installed with just a mouse click.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-otherapps.png?itok=9QmSUdel)

One of the Anaconda distribution's strengths is the ability to create multiple environments. For example, if I wanted to create a Python 2.7 environment instead of the default Python 3.6, I would enter the following in the shell:
```
$ conda create -n py27 python=2.7 anaconda

```

Conda takes care of the entire install; to launch it, just open the shell and enter:
```
$ anaconda-navigator

```

Select the **py27** environment from the  "Applications on" drop-down in the Anaconda GUI.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/anaconda-navigator.png?itok=2i5qYAyG)

### Learn more

There's a wealth of information available about Anaconda if you'd like to know more. You can start by searching the [Anaconda Community][20] and its [mailing list][21].

Are you using Anaconda Distribution and Navigator? Let us know your impressions in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/getting-started-anaconda-python

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://www.r-project.org/
[2]:https://www.python.org/
[3]:http://www.numpy.org/
[4]:https://matplotlib.org/
[5]:https://www.anaconda.com/distribution/
[6]:https://docs.anaconda.com/anaconda/eula
[7]:https://www.anaconda.com/download/#linux
[8]:https://conda.io/
[9]:https://docs.anaconda.com/anaconda/navigator/
[10]:https://www.rstudio.com/
[11]:https://ipython.org/
[12]:http://jupyter.org/
[13]:https://blog.jupyter.org/jupyterlab-is-ready-for-users-5a6f039b8906
[14]:https://spyder-ide.github.io/
[15]:http://glueviz.org/
[16]:https://orange.biolab.si/
[17]:https://docs.anaconda.com/anaconda/install/linux
[18]:https://docs.anaconda.com/anaconda/packages/py3.6_linux-64
[19]:http://qtconsole.readthedocs.io/en/stable/
[20]:https://www.anaconda.com/community/
[21]:https://groups.google.com/a/continuum.io/forum/#!forum/anaconda
