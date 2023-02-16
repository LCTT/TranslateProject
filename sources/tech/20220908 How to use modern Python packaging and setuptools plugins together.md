[#]: subject: "How to use modern Python packaging and setuptools plugins together"
[#]: via: "https://opensource.com/article/22/9/modern-python-packaging-setuptools-plugins"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to use modern Python packaging and setuptools plugins together
======
Using the setuptools plugin with modern Python packaging allows for experimentation with automation.

![How to write a web service using Python Flask][1]

Image by: Yuko Honda on Flickr. CC BY-SA 2.0

Python packaging has evolved a lot. The latest ("beta") uses one file, `pyproject.toml`, to control the package.

A minimal `pyproject.toml` might look like this:

```
[build-system]
requires = ["setuptools"]
build-backend = "setuptools.build_meta"

[project]
name = "cool_project"
version = "1.0.0"
```

### The project section

The **project** section is the data about the Python project itself, including fields like **name** and **version**, which are required.

Other fields are often used, including:

* description: A one-line description.
* readme: Location of a README file.
* authors: Author names and e-mails.
* dependencies: Other packages used by this project.

### The build-system section

Though it does not have to be first, the **build-system** usually goes at the top. This is because it is the most important one.

The **build-backend** key points to a module that knows how to build source distributions and wheels from the project. The **requires** field allows specifying *build time* dependencies.

Many projects are built with **setuptools**. There are some new alternatives, like **flit** and **hatch**.

### Plugins

One benefit of the **requires** section in **build-system** is that it can be used to install *plugins*. The **setuptools** package, in particular, can use plugins to modify its behavior.

One thing that plugins can do is to set the version automatically. This is a popular need because version management can often be painful.

### Segue

Before continuing, it is worth reflecting on the nature of "parodies". A *parody of X* is an *instance of X* which exaggerates some aspects, often to the point of humor.

For example, a "parody of a spy movie" *is* a spy movie, even as it riffs on the genre.

### A parody of setuptools plugins

With this in mind, what would a parody of a **setuptools** plugin look like? By the rule above, it has to be a plugin.

The plugin, called **onedotoh**, sets the version to... 1.0.0. In order to be a plugin, it first has to be a package.

A package should have a `pyproject.toml` :

```
[build-system]
requires = ["setuptools"]
build-backend = "setuptools.build_meta"

[project]
name = "onedotoh"
version = "1.0.0"

[project.entry-points."setuptools.finalize_distribution_options"]
setuptools_scm = "onedotoh:guess_version"
```

There is a new section: **project.entry-points**. This means that the function **guess_version** will be called as **setuptools** is ready to finalize the distribution options.

The code of **guess_version** is one line:

```
def guess_version(dist):
    dist.metadata.version = "1.0.0"
```

### Version to 1.0.0

Using **onedotoh** is subtle. One problem is writing the **pyproject.toml** **project** section to look like this:

```
[project]
name = "a_pyproject"
version = "0.1.2"
```

The **version** in the **pyproject.toml** will *override* the version from the plugin.

The obvious solution is to remove the **version** field:

```
[project]
name = "a_pyproject"
```

This fails in a different way. Without the **version** in the **project** section, the file is invalid. The **name** will not be used.

The right way to do it is as follows:

```
[project]
name = "a_pyproject"
dynamic = ["version"]
```

This approach explicitly declares the **version** field as dynamic.

A full example will look like this:

```
[build-system]
requires = [
    "setuptools",
    "onedotoh",
]
build-backend = "setuptools.build_meta"

[project]
name = "a_pyproject"
dynamic = ["version"]
```

Finally, the version is automatically set to **1.0.0**.

### Wrap up

The **setuptools** plugin can still be used with modern Python packaging, as long as relevant features are explicitly declared as "dynamic." This makes a field rife for further experimentation with automation.

For example, what if, in addition to guessing the *version* from external metadata, it would guess the name as well, using the **git remote** URL?

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/modern-python-packaging-setuptools-plugins

作者：[Moshe Zadka][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_python.jpg
