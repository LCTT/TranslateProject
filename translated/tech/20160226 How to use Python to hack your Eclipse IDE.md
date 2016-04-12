用Python打造你的Eclipse
==============================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/lightbulb_computer_person_general_.png?itok=ZY3UuQQa)

Eclipse高级脚本环境([EASE][1])项目虽然还在开发中,但是不是不得承认它非常强大,让我们可以快速打造自己的Eclipse开发环境.

依据Eclipse强大的框架,可以通过其内建的插件系统全方面的扩展Eclipse.然而,编写和部署一个新的插件还是十分笨重,即使只是需要一个额外的小功能。但是，现在依托EASE，可以方便实用Python或者Javascript脚本语言来扩展。

本文中，根据我在今年北美的EclipseCon大会上的[演讲][2]，我介绍包括安装Eclipse的Python和EASE环境，并包括使用强力Python来增压你的IDE。

### 安装并运行 "Hello World"

本文中的例子使用Java实现的Python解释，Jython。Eclipse可以直接安装EASE环境。本例中使用Eclipse[Mars][3]，它已经自带了EASE环境，包和Jython引擎。

使用Eclipse安装对话框(`Help>Install New Software`...),安装EASE[http://download.eclipse.org/ease/update/nightly][4]

选择下列组件：

- EASE Core feature

- EASE core UI feature

- EASE Python Developer Resources

- EASE modules (Incubation)

包括了EASE和模组。但是我们比较关心Resource包，此包可以访问Eclipse工作空间，项目和文件API。

![](https://opensource.com/sites/default/files/1_installease_nightly.png)


成功安装后，接下来安装Jython引擎[https://dl.bintray.com/pontesegger/ease-jython/][5].完成后，测试下。新建一个项目并新建一个hello.py文件，输入：

```
print "hello world"
```

选中这个文件,右击,选中'Run as -> EASE script'.这样就可以在控制台看到"Hello world"的输出.

配置完成,现在就可以轻松使用Python来控制工作空间和项目了.

### 提升你的代码质量

管理良好的代码质量本身是一件非常烦恼的事情,尤其是当需要处理一个大量代码库和要许多工程师参与的时候.而这些痛苦可以通过脚本来减轻,比如大量文字排版,或者[去掉文件中的unix行结束符][6]来使更容易比较.其他很棒的事情包括使用脚本让Eclipse markers高亮代码.这里有一些例子,你可以加入到task markers ,用"printStackTrace"方法在java文件中探测.请看[源码][7]

运行,拷贝文件到工作空间,右击运行.

```
loadModule('/System/Resources')
```

from org.eclipse.core.resources import IMarker

``` 
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

如果你的任何java文件中包含了printStackTraces,你就可以看见编辑器的侧边栏上自动加上的标记.

![](https://opensource.com/sites/default/files/2_codequality.png)

### 自动构建繁琐任务

当同时工作在多个项目的时候,肯定需要需要完成许多繁杂,重复的任务.可能你需要在所有源文件头上加入CopyRight, 或者采用新框架时候自动更新文件.例如,当从Tycho迁移到Maven时候,我们给每一个项目必须添加pom.xml文件.使用Python可以很轻松的完成这个任务.只从Tycho提供无pom构建后,我们也需要移除不要的pom文件.同样,只需要几行代码就可以完成这个任务.例如,这里有个脚本可以在每一个打开的工作空间项目上加入README.md.请看源代码[add_readme.py][8].

拷贝文件到工作空间,右击并选择"Run as -> EASE script"

loadModule('/System/Resources')

``` 
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

脚本结果会在打开的项目中加入README.md,java和Python项目还会自动加上一行描述.

![](https://opensource.com/sites/default/files/3_tedioustask.png)

### 构建新功能

Python脚本可以快速构建一些需要的附加功能,或者给团队和用户快速构建demo.例如,一个现在Eclipse目前不支持的功能,自动保存工作的文件.即使这个功能将会很快提供,但是你现在就可以马上拥有一个能30秒自动保存的编辑器.以下是主方法的片段.请看下列代码:[autosave.py][9]

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

在运行脚本之前,你需要勾选'Allow Scripts to run code in UI thread'设定,这个设定在Window > Preferences > Scripting中.然后添加脚本到工作空间,右击和选择"Run as > EASE Script".每10秒自动保存的信息就会在控制台输出.关掉自动保存脚本,只需要在点击控制台的红色方框.

![](https://opensource.com/sites/default/files/4_prototype.png)

### 快速扩展用户界面

EASE最棒的事情是可以通过脚本与UI元素挂钩,可以调整你的IDE,例如,在菜单中新建一个按钮.不需要编写java代码或者新的插件,只需要增加几行代码.

下面是一个简单的基脚本示例,用来产生三个新项目.

```
# name		: Create fruit projects
# toolbar	: Project Explorer
# description	: Create fruit projects
 
loadModule("/System/Resources")
 
for name in ["banana", "pineapple", "mango"]:
	createProject(name)
```

上述特别的EASE增加了一个按钮到项目浏览工具条.下面这个脚本是用来删除这三个项目.请看源码[createProjects.py][10]和[deleteProjects.py][11].

```
# name            :Delete fruit projects
# toolbar        : Project Explorer
# description    : Get rid of the fruit projects
 
loadModule("/System/Resources")
 
for name in ["banana", "pineapple", "mango"]:
    project = getProject(name)
    project.delete(0, None)
```

为了使脚本启动生效按钮,增加脚本到'ScriptsProject'文件夹.然后选择Windows > Preference > Scripting > Script 中定位到文件夹.点击'Add Workspace'按钮和选择ScriptProject项目.这个项目现在将会在启动时默认加载.你可以发现Project Explorer上出现了这两个按钮,这样你就可以通过这两个按钮快速增加删除项目.

![](https://opensource.com/sites/default/files/5_buttons.png)

### 整合三方工具

无论何时，你可能需要除了Eclipse生态系统以外的工具.这些时候你会发将他们包装在一个脚本来调用会非常方便.这里有一个简单的例子让你整合explorer.exe,并加入它到右键菜单栏,这样点击图标就可以打开浏览器浏览当前文件.请看源码[explorer.py][12]

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

为了让菜单显示增加,像之前一样加入'ScriptProject'.在文件上右击,你看弹出菜单是不是出现了图标.选择Explore from here.

![](https://opensource.com/sites/default/files/6_explorer.png)

Eclipse高级基本环境提供一套很棒的扩展功能,使得Eclipse IDE能使用Python来轻易扩展.虽然这个项目还在婴儿期,但是[关于这个项目][13]更多更棒的功能也正在加紧开发中,如果你想为这个贡献,请到[论坛][14]讨论.

2016年[Eclipsecon North America][15]会议将会发布更多EASE细节.我的演讲[Scripting Eclipse with Python][16]也会不单介绍Jython,也包括C-Python和其他功能性扩展的实战例子.

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/2/how-use-python-hack-your-ide

作者：[Tracy Miranda][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

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
