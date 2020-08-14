[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Come test a new release of pipenv, the Python development tool)
[#]: via: (https://fedoramagazine.org/come-test-a-new-release-of-pipenv-the-python-development-tool/)
[#]: author: (torsava https://fedoramagazine.org/author/torsava/)

Come test a new release of pipenv, the Python development tool
======

![][1]

**[Pipenv][2]** is a tool that helps Python developers maintain isolated virtual environments with specifacally defined set of dependencies to achieve reproducible development and deployment environments. It is similar to tools for different programming languages, such as bundler, composer, npm, cargo, yarn, etc.

A new version of pipenv, 2020.6.2, has been recently released. It is now available in Fedora 33 and rawhide. For older Fedoras, the maintainers decided to package it in [COPR][3] to be tested first. So come try it out, before they push it into stable Fedora versions. The new version doesn’t bring any fancy new features, but after two years of development it fixes a lot of problems and does many things differently under the hood. What worked for you previously should continue to work, but might behave slightly differently.

### How to get it

If you are already running Fedora 33 or rawhide, run _$ sudo dnf upgrade pipenv_ or _$ sudo dnf install pipenv_ and you’ll get the new version.

On Fedora 31 or Fedora 32, you’ll need to use a [copr repository][3] until such time comes that the tested package will be updated in the official place. To enable the repository, run:

```
$ sudo dnf copr enable @python/pipenv
```

Then to upgrade pipenv to the new version, run:

```
$ sudo dnf upgrade pipenv
```

Or, if you haven’t installed it yet, install it via:

```
$ sudo dnf install pipenv
```

In case you ever need to roll back to the officially maintained version, you can run:

```
$ sudo dnf copr disable @python/pipenv
$ sudo dnf distro-sync pipenv
```

_COPR is not officially supported by Fedora infrastructure. Use packages at your own risk._

### How to use it

If you already have projects managed by the older version of pipenv, you should be able to use the new version in its place without issues. Let us know if something breaks.

If you are not yet familiar with pipenv or want to start a new project, here is a quick guide:

Create a working directory:

```
$ mkdir new-project && cd new-project
```

Initialize pipenv with Python 3:

```
$ pipenv --three
```

Install the packages you want, e.g.:

```
$ pipenv install six
```

Generate a Pipfile.lock file:

```
$ pipenv lock
```

Now you can commit the created Pipfile and Pipfile.lock files into your version control system (e.g. git) and others can use this command in the cloned repository to get the same environment:

```
$ pipenv install
```

See [pipenv’s documentation][4] for more examples.

### How to report problems

If you encounter any problems with the new pipenv version, please [report any issues in Fedora’s Bugzilla][5]. The maintainers of the pipenv package in official Fedora repositories and in the copr repository are the same. Please indicate in the text that the report is regarding this new version.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/come-test-a-new-release-of-pipenv-the-python-development-tool/

作者：[torsava][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/torsava/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/06/pipenv-install-816x345.jpg
[2]: https://github.com/pypa/pipenv
[3]: https://copr.fedorainfracloud.org/coprs/g/python/pipenv/
[4]: https://pipenv.pypa.io/en/latest/install/
[5]: https://bugzilla.redhat.com/enter_bug.cgi?product=Fedora&component=pipenv
