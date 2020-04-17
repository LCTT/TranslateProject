[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to package Python applications for Linux)
[#]: via: (https://opensource.com/article/20/4/package-python-applications-linux)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How to package Python applications for Linux
======
Learn how to use dh_virtualenv to make your Python applications
installable as .deb packages.
![Python in a tree][1]

One way to make Python applications installable on Debian-based operating systems (such as Debian or [Elementary OS][2]) is by using the [dh_virtualenv][3] tool. It builds a **.deb** package that wraps a Python virtual environment around an application and deploys it upon installing.

In this article, I will explain how to use it with the example of building a package containing the [HTTPie][4] tool to test HTTP APIs from the command line without having to activate a virtual environment.

### Packaging with dh_virtualenv

First, you need to install the tools that dh_virtualenv needs. dh_virtualenv's [documentation][5] provides all of the installation options. On my Debian-based system, I entered:


```
`apt-get install dh-virtualenv devscripts`
```

While the [devscripts][6] package is not required, it will simplify doing the subsequent operations.

Now, create a directory to keep the sources. Since this is a local, unofficial, packaging of HTTPie, I called it **myhttp**. Next, let's create some files inside **myhttp** to provide metadata to the Debian build system.

First, create the **debian/control** file:


```
Source: myhttp
Section: python
Priority: extra
Maintainer: Jan Doe &lt;[jandoe@example.org][7]&gt;
Build-Depends: debhelper (&gt;= 9), python3.7, dh-virtualenv (&gt;= 0.8)
Standards-Version: 3.9.5

Package: myhttp
Architecture: any
Pre-Depends: dpkg (&gt;= 1.16.1), python3.7, ${misc:Pre-Depends}
Depends: ${misc:Depends}
Description: http client
 Useful for doing stuff
```

So what is all this information about? As the [Debian documentation][8] puts it:

> "Lines 1–7 are the control information for the source package. Lines 9–13 are the control information for the binary package."

Here's my take:

  * the **section** value is mostly meaningless for our case, but needs to be there. It's meaningful to provide information to the guided UI installer, which is not relevant for this package.
  * The extra **Priority** value is the right priority for 3rd party packages like this one.
  * It is highly recommended to put real contact details in the **Maintainer** field. It does not have to be your personal e-mail, though -- "Infrastructure Team &lt;[infra-team-list@company.example.com][9]&gt;", for example, if the package is maintained by the team and you would like issues to be sent to the team's mail alias.
  * The **build-depends** field indicates that you need debhelper, python, and dh-virtualenv to build the package: the package build process will make sure those dependencies are installed at package build time.
  * The **standards version** is mostly for human consumption. It indicates which guide you are following. This guide is based on the official documentation of dh-virtualenv, which is based on the 3.9.5 guide from Debian. It is almost always the best choice to name the binary package and the source package the same.
  * The **Architecture** field should be **Any** because a virtual environment might include some architecture-specific files: otherwise, the field would be better chosen as **all**.
  * Keep the **pre-depends** list as-is: pre-depends is a pretty strict form of dependencies, and it is rare that you need anything more than the minimum suggested here. The dependencies are usually calculated accurately by the build system, so there is no reason to specify them manually.
  * If your package is mostly for internal use, then the **Description** might only specify minimal information and a link to the company wiki; otherwise, more details might be useful.



Then create the **debian/compat** file, which [exists mostly for historical purposes][10]:


```
`$ echo "9" > debian/compat`
```

Next, create the changelog to tell package users what has changed since the last release. The easiest way is to use **dch --create** to create a template and then fill in the values.

Filled in, it looks like:


```
myhttp (2.0.0-1) stable; urgency=medium

  * Initial release.

 -- Jan Doe &lt;[jandoe@example.org][7]&gt;  Fri, 27 Mar 2020 01:09:22 +0000
```

Now you need to tell the tool to install HTTPie, but which version?

Create a **requirements.in** file that has loose versions:


```
`httpie`
```

In general, the loose requirements file will only contain direct dependencies of your project and will specify minimum versions if needed. It is not always necessary to specify the minimum versions: the tools are usually biased towards tightening the dependencies towards "latest version possible". In the case where your Debian package corresponds to one internal Python package, a common case in internal applications, the loose requirements file will look similar: just one line with the name of the package.

Then use **pip-compile** (which is available by installing the PyPI package **pip-tools**):


```
`$ pip-compile requirements.in > requirements.txt`
```

This will produce a strict dependency file called **requirements.txt**:


```
#
# This file is autogenerated by pip-compile
# To update, run:
#
#    pip-compile requirements.in
#
certifi==2019.11.28       # via requests
chardet==3.0.4            # via requests
httpie==2.0.0             # via -r requirements.in
idna==2.9                 # via requests
pygments==2.6.1           # via httpie
requests==2.23.0          # via httpie
urllib3==1.25.8           # via requests
```

Finally, write a **debian/rules** file for creating the package. Since dh_virtualenv does all the hard work, the rules file is simple:


```
#!/usr/bin/make -f

%:
        dh $@ --with python-virtualenv --python /usr/bin/python3.7
```

Be sure to specify the Python interpreter. By default, it will use the interpreter in **/usr/bin/python**, which is Python 2, but you should use a [supported version of Python][11].

The writing is finished; all that's left is to build the package:


```
`$ debuild -b -us -uc`
```

This will produce a file in the parent directory with a name like **myhttp_2.0.0-1_amd64.deb**. This file can be installed on any compatible operating system.

In general, it's best to build Debian packages that are intended for a specific platform, such as Debian 10.0, on the same platform.

You can store this Debian package in a repository and install it on all relevant systems with, for example, [Ansible][12].

### Conclusion

Packaging applications for Debian-based operating systems is a multi-step process. Using dh_virtualenv will make the process straightforward.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/package-python-applications-linux

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-python.jpg?itok=F2PYP2wT (Python in a tree)
[2]: https://opensource.com/article/19/12/pantheon-linux-desktop
[3]: https://dh-virtualenv.readthedocs.io/en/latest/
[4]: https://opensource.com/article/19/8/getting-started-httpie
[5]: https://dh-virtualenv.readthedocs.io/en/1.1/tutorial.html
[6]: http://man.he.net/man1/devscripts
[7]: mailto:jandoe@example.org
[8]: https://www.debian.org/doc/manuals/maint-guide/dreq.en.html#control
[9]: mailto:infra-team-list@company.example.com
[10]: https://www.debian.org/doc/manuals/maint-guide/dother.en.html#compat
[11]: https://opensource.com/article/19/11/end-of-life-python-2
[12]: https://opensource.com/resources/what-ansible
