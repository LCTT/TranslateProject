pinewall translating

How To Record Terminal Sessions As SVG Animations In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/termtosvg-720x340.png)

Recording Terminal sessions may help in several cases. You can use those recording sessions to document everything that you did in Terminal and save them for future reference. You can use them to demonstrate different Linux commands and its use cases to your juniors, students and anyone who are willing to Learn Linux. Luckily, we have many tools to record Terminal sessions in Unix-like operating systems. We already have featured some of the tools/commands which helps you to record the Terminal sessions in the past. You can go through them in the links given below.


+ [How To Record Everything You Do In Terminal][3]
+ [Asciinema – Record Terminal Sessions And Share Them On The Web][4]


Today, we are going to see yet another tool to record the Terminal activities. Say hello to **“Termtosvg”**. As the name implies, Termtosvg records your Terminal sessions as standalone SVG animations. It is a simple command line utility written in **Python** programming language. It generates lightweight and clean looking animations embeddable on a project page. It supports custom color themes, terminal UI and animation controls via [SVG templates][1]. It is also compatible with asciinema recording format. Termtosvg supports GNU/Linux, Mac OS and BSD OSes.


### Installing Termtosvg

Termtosvg can be installed using PIP, a python package manager to install applications written using Python language. If you haven’t installed PIP already, refer the following guide.

After installing PIP, run the following command to install Termtosvg tool:
```
$ pip3 install --user termtosvg

```

And, install the following prerequisites to render the Terminal screen.
```
$ pip3 install pyte python-xlib svgwrite

```

Done. Let us go ahead and generate Terminal sessions in SVG format.

### Record Terminal Sessions As SVG Animations In Linux

Recording Terminal sessions using Termtosvg is very simple. Just open your Terminal window and run the following command to start recording it.
```
$ termtosvg

```

**Note:** If you termtosvg command is not available, restart your system once.

You will see the following output after running ‘termtosvg’ command:
```
Recording started, enter "exit" command or Control-D to end

```

You will now be in a sub-shell where you can execute the Linux commands as usual. Everything you do in the Terminal will be recorded.

Let me run a random commands.
```
$ mkdir mydirectory

$ cd mydirectory/

$ touch file.txt

$ cd ..

$ uname -a

```

Once you’re done, press **CTRL+D** or type **exit** to stop recording. The resulting recording will be saved in **/tmp** folder with a unique name.

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Termtosvg-in-action-1-1.png)

You can then open the SVG file in any web browser of your choice from Terminal like below.
```
$ firefox /tmp/termtosvg_ddkehjpu.svg

```

You can also directly open the SVG file from browser ( **File - > <path-to-svg>**).

Here is the output of the above recording in my Firefox browser.

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Termtosvg-in-browser.gif)

Here is some more examples on how to use Termtosvg to record Terminal sessions.

Like I mentioned already, Termtosvg will record a terminal session and save it as an SVG animation file in **/tmp** directory by default.

However, you can generate an SVG animation with a custom name, for example **animation.svg** , and save it in a custom location, for example **/home/sk/ostechnix/**.
```
$ termtosvg /home/sk/ostechnix/animation.svg

```

Record a terminal session and render it using a specific template:
```
$ termtosvg -t ~/templates/my_template.svg

```

Record a terminal session with a specific screen geometry:
```
$ termtosvg -g 80x24 animation.svg

```

Record a terminal session in asciicast v2 format:
```
$ termtosvg record recording.cast

```

Render an SVG animation from a recording in asciicast format:
```
$ termtosvg render recording.cast animation.svg

```

For more details, refer [**Termtosvg manual**][2].

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-record-terminal-sessions-as-svg-animations-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://nbedos.github.io/termtosvg/pages/templates.html
[2]:https://github.com/nbedos/termtosvg/blob/develop/man/termtosvg.md
[3]: https://www.ostechnix.com/record-everything-terminal/
[4]: https://www.ostechnix.com/asciinema-record-terminal-sessions-share-web/
