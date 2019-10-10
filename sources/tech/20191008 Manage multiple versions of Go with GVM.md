[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage multiple versions of Go with GVM)
[#]: via: (https://opensource.com/article/19/10/go-introduction-gvm)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

Manage multiple versions of Go with GVM
======
Keep multiple Go environments, including versions and modules, with Go
Version Manager for easy GOPATH management.
![Woman programming][1]

Go Version Manager ([GVM][2]) is an open source tool for managing Go environments. It supports installing multiple versions of Go and managing modules per-project using GVM "pkgsets." Developed originally by [Josh Bussdieker][3], GVM (like its Ruby counterpart, RVM) allows you to create a development environment for each project or group of projects, segregating the different Go versions and package dependencies to allow for more flexibility and prevent versioning issues.

There are several options for managing Go packages, including Go 1.11 Modules, built right into Go. I find GVM to be simple and intuitive, and even if I didn't use it to manage packages, I'd still use it to manage Go versions.

### Installing GVM

Installing GVM is straightforward. The [GVM repository][4] installation documentation instructs you to download the installer script and pipe it to Bash:


```
`bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)`
```

Despite the growing adoption of this kind of installation method, it's still good practice to take a look at what the installer is doing before you do it. In the case of GVM, the installer script:

  1. Checks some dependencies
  2. Clones the GVM repo
  3. Uses shell scripts to:
    * Install Go
    * Manage the GOPATH environment
    * Add a line to your bashrc, zshrc, or profile



If you want to double-check what it's doing, you can clone the repo and review the shell scripts, then run **./binscripts/gvm-installer** to set it up using the local scripts.

_Note:_ Since GVM can be used to download and compile new Go versions, there are some expected dependencies like Make, Git, and Curl. You can find the complete list for your distribution in [GVM's README][5].

### Installing and managing Go versions with GVM

Once GVM is installed, you can start using it to install and manage different versions of Go. The **gvm listall** command shows the available versions of Go that can be downloaded and compiled:


```
[chris@marvin ]$ gvm listall
$ gvm listall

gvm gos (available)

   go1
   go1.0.1
   go1.0.2
   go1.0.3

&lt;output truncated&gt;
```

Installing a specific Go version is as easy as **gvm install &lt;version&gt;**, where **&lt;version&gt;** is one of the ones returned by the **gvm listall** command.

Say you're working on a project that uses Go version 1.12.8. You can install it with **gvm install go1.12.8**:


```
[chris@marvin]$ gvm install go1.12.8
Installing go1.12.8...
 * Compiling...
go1.12.8 successfully installed!
```

Enter **gvm list**, and you see Go version 1.12.8 is installed along with the system Go version (the version that comes packed using your OS's package manager):


```
[chris@marvin]$ gvm list

gvm gos (installed)

   go1.12.8
=&gt; system
```

GVM is still using the system version of Go, denoted by the **=&gt;** symbol next to it. You can switch your environment to use the newly installed go1.12.8 with the **gvm use** command:


```
[chris@marvin]$ gvm use go1.12.8
Now using version go1.12.8

[chris@marvin]$ go version
go version go1.12.8 linux/amd64
```

GVM makes it extremely simple to manage installed versions of Go, but it gets even better!

### Using GVM pkgset

Out of the box, Go has a brilliant—and frustrating—way of managing packages and modules. By default, if you **go get** a package, it is downloaded into the **src** and **pkg** directories in your **$GOPATH**; then it can be included in your Go program by using **import**. This makes it easy to get packages, especially for unprivileged users, without requiring **sudo** or root privileges (much like **pip install --user** in Python). The tradeoff, however, is the difficulty in managing different versions of the same packages across different projects.

There are a number of ways to try fixing or mitigating the issue, including the experimental Go Modules (preliminary support added in Go v1.11) and [go dep][6] (an "official experiment" and ongoing alternative to Go Modules). Before I discovered GVM, I would build and test Go projects in their own Docker containers to ensure segregation.

GVM elegantly accomplishes management and segregation of packages between projects by using "pkgsets" to append a new directory for projects to the default **$GOPATH** for the version of Go installed, much like **$PATH** works on Unix/Linux systems.

It is easiest to visualize how this works in action. First, install a new version of Go, v1.12.9:


```
[chris@marvin]$ echo $GOPATH
/home/chris/.gvm/pkgsets/go1.12.8/global

[chris@marvin]$ gvm install go1.12.9
Installing go1.12.9...
 * Compiling...
go1.12.9 successfully installed

[chris@marvin]$ gvm use go1.12.9
Now using version go1.12.9
```

When GVM is told to use a new version, it changes to a new **$GOPATH**, which corresponds to a default **gloabl** pkgset for that version:


```
[chris@marvin]$ echo $GOPATH
/home/chris/.gvm/pkgsets/go1.12.9/global

[chris@marvin]$ gvm pkgset list

gvm go package sets (go1.12.9)

=&gt;  global
```

Packages in the global pkgset are available to any project using this specific version of Go, although by default there are no extra packages installed.

Now, suppose you're starting a new project, and it needs a specific package. First, use GVM to create a new pkgset called **introToGvm**:


```
[chris@marvin]$ gvm pkgset create introToGvm

[chris@marvin]$ gvm pkgset use introToGvm
Now using version go1.12.9@introToGvm

[chris@marvin]$ gvm pkgset list

gvm go package sets (go1.12.9)

    global
=&gt;  introToGvm
```

As mentioned above, a new directory for the pkgset is prepended to the **$GOPATH**:


```
[chris@marvin]$ echo $GOPATH
/home/chris/.gvm/pkgsets/go1.12.9/introToGvm:/home/chris/.gvm/pkgsets/go1.12.9/global
```

Change directories into the **introToGvm** path that was prepended and examine the directory structure—and take the opportunity to have some fun with **awk** and **bash** as you do:


```
[chris@marvin]$ cd $( awk -F':' '{print $1}' &lt;&lt;&lt; $GOPATH )
[chris@marvin]$ pwd
/home/chris/.gvm/pkgsets/go1.12.9/introToGvm

[chris@marvin]$ ls
overlay  pkg  src
```

Notice that the new directory looks a lot like a normal **$GOPATH**. New Go packages can be downloaded using the same **go get** command you'd normally use with Go, and they are added to the pkgset.

As an example, use the following to get the **gorilla/mux** package, then examine the directory structure of the pkgset:


```
[chris@marvin]$ go get github.com/gorilla/mux
[chris@marvin]$ tree
[chris@marvin introToGvm ]$ tree
.
├── overlay
│   ├── bin
│   └── lib
│       └── pkgconfig
├── pkg
│   └── linux_amd64
│       └── github.com
│           └── gorilla
│               └── mux.a
src/
└── github.com
    └── gorilla
        └── mux
            ├── AUTHORS
            ├── bench_test.go
            ├── context.go
            ├── context_test.go
            ├── doc.go
            ├── example_authentication_middleware_test.go
            ├── example_cors_method_middleware_test.go
            ├── example_route_test.go
            ├── go.mod
            ├── LICENSE
            ├── middleware.go
            ├── middleware_test.go
            ├── mux.go
            ├── mux_test.go
            ├── old_test.go
            ├── README.md
            ├── regexp.go
            ├── route.go
            └── test_helpers.go
```

As you can see, **gorilla/mux** was added to the pkgset **$GOPATH** directory as expected and can now be used with projects that use this pkgset.

### GVM makes Go management a breeze

GVM is an intuitive and non-intrusive way to manage Go versions and packages. It can be used on its own or in combination with other Go module management techniques and make use of GVM's Go version management capabilities. Segregating projects by Go version and package dependency makes development easier and leads to fewer complications with managing version conflicts, and GVM makes this a breeze.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/go-introduction-gvm

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://github.com/moovweb/gvm
[3]: https://github.com/jbussdieker
[4]: https://github.com/moovweb/gvm#installing
[5]: https://github.com/moovweb/gvm/blob/master/README.md
[6]: https://golang.github.io/dep/
