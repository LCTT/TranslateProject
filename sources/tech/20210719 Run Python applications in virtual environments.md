[#]: subject: (Run Python applications in virtual environments)
[#]: via: (https://opensource.com/article/21/7/python-pipx)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Run Python applications in virtual environments
======
Avoid versioning conflicts and improve security by running Python
applications in isolation with pipx.
![Digital creative of a browser on the internet][1]

If you use Python, you probably install a lot of Python applications. Some are tools you just want to try out. Others are tried and true applications you use every day, so you install them on every computer you use. In either situation, it can be useful to run your Python applications in virtual environments to keep them and their dependencies separate from one another to avoid versioning conflicts and to keep them from the rest of your system to improve security.

This is where [pipx][2] comes into the picture.

Most Python apps can be installed using [pip][3], which just installs the Python package. Pipx, however, creates and manages a virtual environment for your Python applications and helps you run them.

### Installing pipx

Pipx is primarily an RPM package, and you can install it on any Fedora, RHEL, or CentOS machine with:


```
`$ sudo dnf install pipx`
```

### Using pipx

I'll demonstrate how to use pipx with the Cowsay package and the [Concentration][4] tool.

#### Installing packages

After pipx is installed, you can install Python packages with:


```
`$ pipx install <python_package>`
```

To install the Cowsay package:


```
$ pipx install cowsay                                                 ✔ │ 20:13:41  
  installed package cowsay 4.0, Python 3.9.5
  These apps are now globally available
        - cowsay
done! ✨ 🌟 ✨
```

Now you can run Cowsay anywhere in your system to talk to you through your terminal!


```
$  cowsay "I &lt;3 OSDC"                                                                                                                                      
  _________
| I &lt;3 OSDC |
  =========
        \
        \
                ^__^
                (oo)\\_______
                (__)\           )\/\
                ||----w |
                ||      ||
```

![Cowsay][5]

(Sumantro Mukherjee, [CC BY-SA 4.0][6])

#### Installing with special permissions

Not all applications are as simple as Cowsay. For instance, the Concentration application interacts with many other components on your system, so it requires special permissions. Install it with:


```
$ pipx install concentration                                                                           ✔ │ 10s  │  │ 20:26:12  
  installed package concentration 1.1.5, Python 3.9.5
  These apps are now globally available
        - concentration
done! ✨ 🌟 ✨
```

Concentration is designed to help you focus by blocking specific websites listed in a "distractors" file. To do that, it needs to run with sudo or root privileges. You can do this with [OpenDoas][7], a version of the `doas` command that runs any command with specific user privileges. To use `doas` to run Concentration with sudo privileges:


```
$ doas concentration improve                                                                  ✔ │  │ 20:26:54  
doas (sumantrom) password:  
Concentration is now improved :D!
```

As you can see, the isolated application was able to change something in the system.

#### Listing installed apps

The `pipx list` command displays all apps installed with pipx and their executable paths:


```
$ pipx list                                                                                                                                              
venvs are in /home/sumantrom/.local/pipx/venvs
apps are exposed on your $PATH at /home/sumantrom/.local/bin
   package concentration 1.1.5, Python 3.9.5
        - concentration
   package cowsay 4.0, Python 3.9.5
        - cowsay
```

#### Uninstalling apps

It's important to know how to uninstall things when you're finished with them. Pipx has a very simple uninstall command:


```
`$ pipx uninstall <package name>`
```

Or you can remove every package:


```
$ pipx uninstall-all

pipx uninstall-all                                                     2 ✘ │ 20:13:35  
uninstalled cowsay! ✨ 🌟 ✨
uninstalled concentration! ✨ 🌟 ✨
```

### Try pipx

Pipx is a package manager for popular Python applications. It has access to everything on [PyPi][8], but it can also install applications from a local directory containing a valid Python package, a Python wheel, or a network location.

If you install a lot of Python apps, try pipx.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/python-pipx

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://pypi.org/project/pipx/
[3]: https://pypi.org/project/pip/
[4]: https://opensource.com/article/20/8/python-concentration
[5]: https://opensource.com/sites/default/files/uploads/cowsay.png (Cowsay)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://github.com/Duncaen/OpenDoas
[8]: https://pypi.org/
