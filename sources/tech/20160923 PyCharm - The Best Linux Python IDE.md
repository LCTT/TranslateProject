PyCharm - The Best Linux Python IDE
=========
![](https://fthmb.tqn.com/AVEbzYN3BPH_8cGYkPflIx58-XE=/768x0/filters:no_upscale()/about/pycharm2-57e2d5ee5f9b586c352c7493.png)

### Introduction

In this guide I will introduce you to the PyCharm integrated development environment which can be used to develop professional applications using the Python programming language.

Python is a great programming language because it is truly cross platform and can be used to develop a single application which will run on Windows, Linux and Mac computers without having to recompile any code.

PyCharm is an editor and debugger developed by [Jetbrains][1] who are the same people who developed Resharper which is a great tool used by Windows developers for refactoring code and to make their lives easier when writing .NET code. Many of the principles of [Resharper][2] have been added to the professional version of [PyCharm][3].

### How To Install PyCharm

I have written a guide showing how to get PyCharm, download it, extract the files and run it.

[Simply click this link][4].

### The Welcome Screen

When you first run PyCharm or when you close a project you will be presented with a screen showing a list of recent projects.

You will also see the following menu options:

*   Create New Project
*   Open A Project
*   Checkout From Version Control

There is also a configure settings option which lets you set up the default Python version and other such settings.

### Creating A New Project

When you choose to create a new project you are provided with a list of possible project types as follows:

*   Pure Python
*   Django
*   Flask
*   Google App Engine
*   Pyramid
*   Web2Py
*   Angular CLI
*   AngularJS
*   Foundation
*   HTML5 Bolierplate
*   React Starter Kit
*   Twitter Bootstrap
*   Web Starter Kit

This isn't a programming tutorial so I won't be listing what all of those project types are. If you want to create a base desktop application which will run on Windows, Linux and Mac then you can choose a Pure Python project and use QT libraries to develop graphical applications which look native to the operating system they are running on regardless as to where they were developed.

As well as choosing the project type you can also enter the name for your project and also choose the version of Python to develop against.

### Open A Project

You can open a project by clicking on the name within the recently opened projects list or you can click the open button and navigate to the folder where the project you wish to open is located.

### Checking Out From Source Control

PyCharm provides the option to check out project code from various online resources including [GitHub][5], [CVS][6], Git, [Mercurial][7] and [Subversion][8].

### The PyCharm IDE

The PyCharm IDE starts with a menu at the top and underneath this you have tabs for each open project.

On the right side of the screen are debugging options for stepping through code.

The left pane has a list of project files and external libraries.

To add a file you right-click on the project name and choose "new". You then get the option to add one of the following file types:

*   File
*   Directory
*   Python Package
*   Python File
*   Jupyter Notebook
*   HTML File
*   Stylesheet
*   JavaScript
*   TypeScript
*   CoffeeScript
*   Gherkin
*   Data Source

When you add a file, such as a python file you can start typing into the editor in the right panel.

The text is all colour coded and has bold text . A vertical line shows the indentation so you can be sure that you are tabbing correctly.

The editor also includes full intellisense which means as you start typing the names of libraries or recognised commands you can complete the commands by pressing tab.

### Debugging The Application

You can debug your application at any point by using the debugging options in the top right corner.

If you are developing a graphical application then you can simply press the green button to run the application. You can also press shift and F10.

To debug the application you can either click the button next to the green arrow or press shift and F9.You can place breakpoints in the code so that the program stops on a given line by clicking in the grey margin on the line you wish to break at.

To make a single step forward you can press F8 which steps over the code. This means it will run the code but it won't step into a function. To step into the function you would press F7\. If you are in a function and want to step out to the calling function press shift and F8.

At the bottom of the screen whilst you are debugging you will see various windows such as a list of processes and threads, and variables that you are watching the values for. 

As you are stepping through code you can add a watch on a variable so that you can see when the value changes. 

Another great option is to run the code with coverage checker. The programming world has changed a lot during the years and now it is common for developers to perform test-driven development so that every change they make they can check to make sure they haven't broken another part of the system. 

The coverage checker actually helps you to run the program, perform some tests and then when you have finished it will tell you how much of the code was covered as a percentage during your test run.

There is also a tool for showing the name of a method or class, how many times the items were called, and how long was spent in that particular piece of code.

### Code Refactoring

A really powerful feature of PyCharm is the code refactoring option.

When you start to develop code little marks will appear in the right margin. If you type something which is likely to cause an error or just isn't written well then PyCharm will place a coloured marker.

Clicking on the coloured marker will tell you the issue and will offer a solution.

For example, if you have an import statement which imports a library and then don't use anything from that library not only will the code turn grey the marker will state that the library is unused.

Other errors that will appear are for good coding such as only having one blank line between an import statement and the start of a function. You will also be told when you have created a function that isn't in lowercase.

You don't have to abide by all of the PyCharm rules. Many of them are just good coding guidelines and are nothing to do with whether the code will run or not.

The code menu has other refactoring options. For example,​ you can perform code cleanup and you can inspect a file or project for issues.

### Summary

PyCharm is a great editor for developing Python code in Linux and there are two versions available. The community version is for the casual developer whereas the professional environment provides all the tools a developer could need for creating professional software.

--------------------------------------------------------------------------------

via: https://www.lifewire.com/how-to-install-the-pycharm-python-ide-in-linux-4091033

作者：[Gary Newell ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.lifewire.com/gary-newell-2180098
[1]:https://www.jetbrains.com/
[2]:https://www.jetbrains.com/resharper/
[3]:https://www.jetbrains.com/pycharm/specials/pycharm/pycharm.html?&gclid=CjwKEAjw34i_BRDH9fbylbDJw1gSJAAvIFqU238G56Bd2sKU9EljVHs1bKKJ8f3nV--Q9knXaifD8xoCRyjw_wcB&gclsrc=aw.ds.ds&dclid=CNOy3qGQoc8CFUJ62wodEywCDg
[4]:https://www.lifewire.com/how-to-install-the-pycharm-python-ide-in-linux-4091033
[5]:https://github.com/
[6]:http://www.linuxhowtos.org/System/cvs_tutorial.htm
[7]:https://www.mercurial-scm.org/
[8]:https://subversion.apache.org/
