用 Python 打造你的 Eclipse
==============================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/lightbulb_computer_person_general_.png?itok=ZY3UuQQa)

Eclipse 高级脚本环境（[EASE][1]）项目虽然还在开发中，但是必须要承认它非常强大，它让我们可以快速打造自己的Eclipse 开发环境。

依据 Eclipse 强大的框架，可以通过其内建的插件系统全方面的扩展 Eclipse。然而，编写和部署一个新的插件还是十分麻烦，即使你只是需要一个额外的小功能。不过，现在依托于 EASE，你可以不用写任何一行 Java 代码就可以方便的做到这点。EASE 是一种使用 Python 或者 Javascript 这样的脚本语言自动实现这些功能的平台。

本文中，根据我在今年北美的 EclipseCon 大会上的[演讲][2]，我将介绍如何用 Python 和 EASE 设置你的 Eclipse 环境，并告诉如何发挥 Python 的能量让你的 IDE 跑的飞起。

### 安装并运行 "Hello World"

本文中的例子使用 Python 的 Java 实现 Jython。你可以将 EASE 直接安装到你已有的 Eclipse IDE 中。本例中使用[Eclipse Mars][3]，并安装 EASE 环境本身以及它的模块和 Jython 引擎。

使用 Eclipse 安装对话框(`Help>Install New Software`...)，安装 EASE[http://download.eclipse.org/ease/update/nightly][4]，

选择下列组件：

- EASE Core feature
- EASE core UI feature
- EASE Python Developer Resources
- EASE modules (Incubation)

这会安装 EASE 及其模块。这里我们要注意一下 Resource 模块，此模块可以访问 Eclipse 工作空间、项目和文件 API。

![](https://opensource.com/sites/default/files/1_installease_nightly.png)

成功安装后，接下来安装 EASE Jython 引擎 [https://dl.bintray.com/pontesegger/ease-jython/][5] 。完成后，测试下。新建一个项目并新建一个 hello.py 文件，输入：

```
print "hello world"
```

选中这个文件，右击并选择“Run as -> EASE script”。这样就可以在控制台看到“Hello world”的输出。

现在就可以编写 Python 脚本来访问工作空间和项目了。这种方法可以用于各种定制，下面只是一些思路。

### 提升你的代码质量

管理良好的代码质量本身是一件非常烦恼的事情，尤其是当需要处理一个大型代码库或者要许多工程师参与的时候。而这些痛苦可以通过脚本来减轻，比如批量格式化一些文件，或者[去掉文件中的 unix 式的行结束符][6]来使得在 git 之类的源代码控制系统中比较差异更加容易。另外一个更好的用途是使用脚本来生成 Eclipse markers 以高亮你可以改善的代码。这里有一些示例脚本，你可以用来在 java 文件中所有找到的“printStackTrace”方法中加入task markers 。请看[源码][7]。

拷贝该文件到工作空间来运行，右击并选择“Run as -> EASE script”。

```
loadModule('/System/Resources')

from org.eclipse.core.resources import IMarker

for ifile in findFiles("*.java"):
    file_name = str(ifile.getLocation())
    print "Processing " + file_name
    with open(file_name) as f:
        for line_no, line in enumerate(f, start=1):
            if "printStackTrace" in line:
                marker = ifile.createMarker(IMarker.TASK)
                marker.setAttribute(IMarker.TRANSIENT, True)
                marker.setAttribute(IMarker.LINE_NUMBER, line_no)
                marker.setAttribute(IMarker.MESSAGE, "Fix in Sprint 2: " + line.strip())
                
```

如果你的 java 文件中包含了 printStackTraces，你就可以看见任务视图和编辑器侧边栏上自动新加的标记。

![](https://opensource.com/sites/default/files/2_codequality.png)

### 自动构建繁琐任务

当同时工作在多个项目的时候，肯定需要完成许多繁杂、重复的任务。可能你需要在所有源文件头上加入版权信息，或者采用新框架时候自动更新文件。例如，当首次切换到 Tycho 和 Maven 的时候，我们需要 giel每个项目添加 pom.xml 文件。使用几行 Python 代码可以很轻松的完成这个任务。然后当 Tycho 支持无 pom 构建后，我们需要移除不要的 pom 文件。同样，几行代码就可以搞定这个任务，例如，这里有个脚本可以在每一个打开的工作空间项目上加入 README.md。请看源代码 [add_readme.py][8]。

拷贝该文件到工作空间来运行，右击并选择“Run as -> EASE script”。

``` 
loadModule('/System/Resources')

for iproject in getWorkspace().getProjects():
    if not iproject.isOpen():
        continue
 
    ifile = iproject.getFile("README.md")
 
    if not ifile.exists():
        contents = "# " + iproject.getName() + "\n\n" 
        if iproject.hasNature("org.eclipse.jdt.core.javanature"):
            contents += "A Java Project\n"
        elif iproject.hasNature("org.python.pydev.pythonNature"):
            contents += "A Python Project\n"
        writeFile(ifile, contents)
```

脚本运行的结果会在每个打开的项目中加入 README.md，java 和 Python 的项目还会自动加上一行描述。

![](https://opensource.com/sites/default/files/3_tedioustask.png)

### 构建新功能

你可以使用 Python 脚本来快速构建一些急需的功能，或者做个原型给团队和用户演示你想要的功能。例如，一个 Eclipse 目前不支持的功能是自动保存你正在工作的文件。即使这个功能将会很快提供，但是你现在就可以马上拥有一个能每隔 30 秒或处于后台时自动保存的编辑器。以下是主要方法的片段。请看下列代码：[autosave.py][9]。

```
def save_dirty_editors():
    workbench = getService(org.eclipse.ui.IWorkbench)
    for window in workbench.getWorkbenchWindows():
        for page in window.getPages():
            for editor_ref in page.getEditorReferences():
                part = editor_ref.getPart(False)
                if part and part.isDirty():
                    print "Auto-Saving", part.getTitle()
                    part.doSave(None)
```

在运行脚本之前，你需要勾选 'Allow Scripts to run code in UI thread' 设定，这个设定在 Window > Preferences > Scripting 中。然后添加该脚本到工作空间，右击并选择“Run as > EASE Script”。每次编辑器自动保存时，控制台就会输出一个保存的信息。要关掉自动保存脚本，只需要点击控制台的红色方块的停止按钮即可。

![](https://opensource.com/sites/default/files/4_prototype.png)

### 快速扩展用户界面

EASE 最棒的事情是可以将你的脚本与 IDE 界面上元素（比如一个新的按钮或菜单）结合起来。不需要编写 java 代码或者安装新的插件，只需要在你的脚本前面增加几行代码。

下面是一个简单的脚本示例，用来创建三个新项目。

```
# name		: Create fruit projects
# toolbar	: Project Explorer
# description	: Create fruit projects
 
loadModule("/System/Resources")
 
for name in ["banana", "pineapple", "mango"]:
	createProject(name)
```

上述注释会专门告诉 EASE 增加了一个按钮到 Project Explorer 工具条。下面这个脚本是用来增加一个删除这三个项目的按钮的。请看源码 [createProjects.py][10] 和 [deleteProjects.py][11]。

```
# name            :Delete fruit projects
# toolbar        : Project Explorer
# description    : Get rid of the fruit projects
 
loadModule("/System/Resources")
 
for name in ["banana", "pineapple", "mango"]:
    project = getProject(name)
    project.delete(0, None)
```

为了使按钮显示出来，增加这两个脚本到一个新的项目，假如叫做 'ScriptsProject'。然后到 Windows > Preference > Scripting > Script Location，点击 'Add Workspace' 按钮并选择 ScriptProject 项目。这个项目现在会成为放置脚本的默认位置。你可以发现 Project Explorer 上出现了这两个按钮，这样你就可以通过这两个新加的按钮快速增加和删除项目。

![](https://opensource.com/sites/default/files/5_buttons.png)

### 整合第三方工具

不管怎么说，你可能需要除了 Eclipse 生态系统以外的工具（这是真的，虽然 Eclipse 已经很丰富了，但是不是什么都有）。这些时候你会发现将他们包装在一个脚本来调用会非常方便。这里有一个简单的例子让你整合资源管理器，并将它加入到右键菜单栏，这样点击图标就可以打开资源管理器浏览当前文件。请看源码 [explorer.py][12]。

```
# name		: Explore from here
# popup		: enableFor(org.eclipse.core.resources.IResource)
# description	: Start a file browser using current selection
loadModule("/System/Platform")
loadModule('/System/UI')
 
selection = getSelection()
if isinstance(selection, org.eclipse.jface.viewers.IStructuredSelection):
	selection = selection.getFirstElement()
 
if not isinstance(selection, org.eclipse.core.resources.IResource):
	selection = adapt(selection, org.eclipse.core.resources.IResource)
 
if isinstance(selection, org.eclipse.core.resources.IFile):
	selection = selection.getParent()
 
if isinstance(selection, org.eclipse.core.resources.IContainer):
	runProcess("explorer.exe", [selection.getLocation().toFile().toString()])
```

为了让这个菜单显示出来，像之前一样将该文件加入一个新项目，比如说 'ScriptProject'。然后到 Windows > Preference > Scripting > Script Locations，点击“Add Workspace”并选择 'ScriptProject' 项目。当你在文件上右击鼠标键，你会看到弹出菜单出现了新的菜单项。点击它就会出现资源管理器。（注意，这个功能已经出现在 Eclipse 中了，但是你可以在这个例子中换成其它第三方工具。）

![](https://opensource.com/sites/default/files/6_explorer.png)

Eclipse 高级基本环境 （EASE）提供一套很棒的扩展功能，使得 Eclipse IDE 能使用 Python 来轻松扩展。虽然这个项目还在早期，但是[关于这个项目][13]更多更棒的功能也正在加紧开发中，如果你想为它做出贡献，请到[论坛][14]讨论。

我会在 2016 年的 [Eclipsecon North America][15] 会议上发布更多 EASE 细节。我的演讲 [Scripting Eclipse with Python][16] 也会不单会介绍 Jython，也包括 C-Python 和这个功能在科学领域是如何扩展的。

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/2/how-use-python-hack-your-ide

作者：[Tracy Miranda][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tracymiranda
[1]: https://eclipse.org/ease/
[2]: https://www.eclipsecon.org/na2016/session/scripting-eclipse-python
[3]: https://www.eclipse.org/downloads/packages/eclipse-ide-eclipse-committers-451/mars1
[4]: http://download.eclipse.org/ease/update/nightly
[5]: https://dl.bintray.com/pontesegger/ease-jython/
[6]: http://code.activestate.com/recipes/66434-change-line-endings/
[7]: https://gist.github.com/tracymiranda/6556482e278c9afc421d
[8]: https://gist.github.com/tracymiranda/f20f233b40f1f79b1df2
[9]: https://gist.github.com/tracymiranda/e9588d0976c46a987463
[10]: https://gist.github.com/tracymiranda/55995daaea9a4db584dc
[11]: https://gist.github.com/tracymiranda/baa218fc2c1a8e898194
[12]: https://gist.github.com/tracymiranda/8aa3f0fc4bf44f4a5cd3
[13]: https://eclipse.org/ease/
[14]: https://dev.eclipse.org/mailman/listinfo/ease-dev
[15]: https://www.eclipsecon.org/na2016
[16]: https://www.eclipsecon.org/na2016/session/scripting-eclipse-python
