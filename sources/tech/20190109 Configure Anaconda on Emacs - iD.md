[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Configure Anaconda on Emacs – iD)
[#]: via: (https://idevji.com/configure-anaconda-on-emacs/)
[#]: author: (Devji Chhanga https://idevji.com/author/admin/)

Configure Anaconda on Emacs – iD
======

Perhaps my quest for an ultimate IDE ends with [Emacs.][1] My goal was to use Emacs as full-flagged Python IDE. This post describes how to setup Anaconda on Emacs.

My Setup:

```
OS: Trisquel 8.0
Emacs: GNU Emacs 25.3.2
```

Quick Key Guide [(See full guide)][2] :

```
C-x = Ctrl + x
M-x = Alt + x
RET = ENTER
```

### 1. Downloading and installing Anaconda

**1.1 Download:**
Download Anaconda [from here.][3] You should download Python 3.x version as Python 2 will run out of support in 2020. You don’t need Python 3.x on your machine. It will be installed by this install script.

**1.2 Install:**

```
 cd ~/Downloads
bash Anaconda3-2018.12-Linux-x86.sh
```


### 2. Adding Anaconda to Emacs

**2.1 Adding MELPA to Emacs**
Emacs package named _anaconda-mode_ can be used. This package is on the MELPA repository. Emacs25 requires this repository to be added explicitly.

[Important : Follow this post on how to add MELPA to Emacs.][4]

**2.2 Installing anaconda-mode package on Emacs**

```
M-x package-install RET
anaconda-mode RET
```

**2.3 Configure anaconda-mode in Emacs**

```
echo "(add-hook 'python-mode-hook 'anaconda-mode)" > ~/.emacs.d/init.el
```


### 3\. Running your first script on Anaconda from Emacs

**3.1 Create new .py file**

```
C-x C-f
HelloWorld.py RET
```

**3.2 Add the code**

```
print ("Hello World from Emacs")
```

**3.3 Running it**

```
 C-c C-p
C-c C-c
```

Output

```
Python 3.7.1 (default, Dec 14 2018, 19:46:24)
[GCC 7.3.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> python.el: native completion setup loaded
>>> Hello World from Emacs
>>>
```

_I was encouraged for Emacs usage by[Codingquark;][5]
Errors and omissions should be reported in comments. Cheers!_

--------------------------------------------------------------------------------

via: https://idevji.com/configure-anaconda-on-emacs/

作者：[Devji Chhanga][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://idevji.com/author/admin/
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/emacs/
[2]: https://www.math.uh.edu/~bgb/emacs_keys.html
[3]: https://www.anaconda.com/download/#linux
[4]: https://melpa.org/#/getting-started
[5]: https://codingquark.com
