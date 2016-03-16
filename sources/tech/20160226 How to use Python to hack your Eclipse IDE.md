	Vic020

How to use Python to hack your Eclipse IDE
==============================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/lightbulb_computer_person_general_.png?itok=ZY3UuQQa)

The Eclipse Advanced Scripting Environment ([EASE][1]) project is a new but powerful set of plugins that enables you to quickly hack your Eclipse IDE.

Eclipse is a powerful framework that can be extended in many different ways by using its built-in plugin mechanism. However, writing and deploying a new plugin can be cumbersome if all you want is a bit of additional functionality. Now, using EASE, there's a better way to do that, without having to write a single line of Java code. EASE provides a way to easily automate workbench functionality using scripting languages such as Python or Javascript.

In this article, based on my [talk][2] at EclipseCon North America this year, I'll cover the basics of how to set up your Eclipse environment with Python and EASE and look at a few ideas to supercharge your IDE with the power of Python.

### Setup and run "Hello World"

The examples in this article are based on the Java-implementation of Python, Jython. You can install EASE directly into your existing Eclipse IDE. In this example we use Eclipse [Mars][3] and install EASE itself, its modules and the Jython engine.

From within the Eclipse Install Dialog (`Help>Install New Software`...), install EASE: [http://download.eclipse.org/ease/update/nightly][4]

And, select the following components:

- EASE Core feature

- EASE core UI feature

- EASE Python Developer Resources

- EASE modules (Incubation)

This will give you EASE and its modules. The main one we are interested in is the Resource module that gives you access to the Eclipse workspace, projects, and files API.

![](https://opensource.com/sites/default/files/1_installease_nightly.png)


After those have been successfully installed, next install the EASE Jython engine: [https://dl.bintray.com/pontesegger/ease-jython/][5]. Once the plugins are installed, test EASE out. Create a new project and add in a new file called hello.py with this content:

```
print "hello world"
```

Select the file, right click, and select 'Run as -> EASE script'. You should see "Hello World" appear in the console.

Now you can start writing Python scripts that can access the workspace and projects. This power can be used for all sorts of hacks, below are just a few ideas.

### Improve your code quality

Maintaining good code quality can be a tiresome job especially when dealing with a large codebase or when lots of developers are involved. Some of this pain can be made easier with a script, such as for batch formatting for a set of files, or even fixing certain files to [remove unix line endings][6] for easy comparison in source control like git. Another nice thing to do is use a script to generate Eclipse markers to highlight code that could do with improving. Here's an example script that you could use to add task markers for all "printStackTrace" methods it detects in Java files. See the source code: [markers.py][7]

To run, copy the file to your workspace, then right click and select 'Run as -> EASE script'.

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

If you have any java files with printStackTraces you will be able to see the newly created markers in the Tasks view and in the editor margin.

![](https://opensource.com/sites/default/files/2_codequality.png)

### Automate tedious tasks

When you are working with several projects you may want to automate some tedious, repetitive tasks. Perhaps you need to add in a copyright header to the beginning of each source file, or update source files when adopting a new framework. For instance, when we first switched to using Tycho and Maven, we had to add a pom.xml to each project. This is easily done using a few lines of Python. Then when Tycho provided support for pom-less builds, we wanted to remove unnecessary pom files. Again, a few lines of Python script enabled this. As an example, here is a script which adds a README.md file to every open project in your workspace, noting if they are Java or Python projects. See the source code: [add_readme.py][8].

To run, copy the file to your workspace, then right click and select 'Run as -> EASE script'.

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
  
The result should be that every open project will have a README.md file, with Java and Python projects having an additional descriptive line.

![](https://opensource.com/sites/default/files/3_tedioustask.png)

### Prototype new features

You can also use a Python script to hack a quick-fix for some much wanted functionality, or as a prototype to help demonstrate to your team or users how you envision a feature. For instance, one feature Eclipse IDE doesn't currently support is auto-save on the current file you are working on. Although this feature is in the works for future releases, you can have a quick and dirty version that autosaves every 30 seconds or when the editor is deactivated. Below is a snippet of the main method. See the full source: [autosave.py][9]

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

Before running this script you will need to turn on the 'Allow Scripts to run code in UI thread' setting by checking the box under Window > Preferences > Scripting. Then you can add the file to your workspace, right click on it and select 'Run As>EASE Script'. A save message is printed out in the Console view every time an editor is saved. To turn off the autosave just stop the script by pressing the 'Terminate' red square button in the Console view.

![](https://opensource.com/sites/default/files/4_prototype.png)

### Quickly extend the user interface with custom buttons, menus, etc

One of the best things about EASE is that it allows you to take your scripts and quickly hook them into UI elements of the IDE, for example, as a new button or new menu item. No need to write Java or have a new plugin, just add a couple of lines to your script header—it's that simple.

Here's an example for a simplistic script that creates us three new projects.

```
# name		: Create fruit projects
# toolbar	: Project Explorer
# description	: Create fruit projects
 
loadModule("/System/Resources")
 
for name in ["banana", "pineapple", "mango"]:
	createProject(name)
```

The comment lines specify to EASE to add a button to the Project Explorer toolbar. Here's another script that adds a button to the same toolbar to delete those three projects. See the source files: [createProjects.py][10] and [deleteProjects.py][11]

```
# name            :Delete fruit projects
# toolbar        : Project Explorer
# description    : Get rid of the fruit projects
 
loadModule("/System/Resources")
 
for name in ["banana", "pineapple", "mango"]:
    project = getProject(name)
    project.delete(0, None)
```

To get the buttons to appear, add the two script files to a new project—let's call it 'ScriptsProject'. Then go to Windows > Preference > Scripting > Script Locations. Click on the 'Add Workspace' button and select the ScriptsProject. This project now becomes a default location for locating script files. You should see the buttons show up in the Project Explorer without needing to restart your IDE. You should be able to quickly create and delete the projects using your newly added buttons.

![](https://opensource.com/sites/default/files/5_buttons.png)

### Integrate with third-party tools

Every now and then you may need to use a tool outside the Eclipse ecosystem (sad but true, it has a lot but it does not do everything). For those occasions it might be quite handy to wrap calling that call to the tool in a script. Here's an example that allows you to integrate with explorer.exe, and add it to the content menu so you could instantly open a file browser using the current selection. See the source code: [explorer.py][12]

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

To get the menu to appear, add the script to a new project—let's call it 'ScriptsProject'. Then go to Windows > Preference > Scripting > Script Locations. Click on the 'Add Workspace' button and select the ScriptsProject. You should see the new menu item show up in the context menu when you right-click on a file. Select this action to bring up a file browser. (Note this functionality already exists in Eclipse but this example is one you could adapt to other third-party tools).

![](https://opensource.com/sites/default/files/6_explorer.png)

The Eclipse Advanced Scripting Environment provides a great way to get more out of your Eclipse IDE by leveraging the power of Python. It is a project in its infancy so there is so much more to come. Learn more [about the project][13] and get involved by signing up for the [forum][14].

I'll be talking more about EASE at [Eclipsecon North America][15] 2016. My talk [Scripting Eclipse with Python][16] will go into how you can use not just Jython, but C-Python and how this functionality can be extended specifically for scientific use-cases.

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/2/how-use-python-hack-your-ide

作者：[Tracy Miranda][a]
译者：[译者ID](https://github.com/译者ID)
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
