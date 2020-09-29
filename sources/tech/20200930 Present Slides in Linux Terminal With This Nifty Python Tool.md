[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Present Slides in Linux Terminal With This Nifty Python Tool)
[#]: via: (https://itsfoss.com/presentation-linux-terminal/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Present Slides in Linux Terminal With This Nifty Python Tool
======

Presentations are often boring. This is why some people add animation or comics/meme to add some humor and style to break the monotony.

If you have to add some unique style to your college or company presentation, how about using the Linux terminal? Imagine how cool it would be!

### Present: Do Your Presentation in Linux Terminal

There are so many amusing and [fun stuff you can do in the terminal][1]. Making and presenting slides is just one of them.

Python based application named [Present][2] lets you create markdown and YML based slides that you can present in your college or company and amuse people in the true geek style.

I have made a video showing what it would look like to present something in the Linux terminal with Present.

[Subscribe to our YouTube channel for more Linux videos][3]

#### Features of Present

You can do the following things with Present:

  * Use markdown syntax for adding text to the slides
  * Control the slides with arrow or PgUp/Down keys
  * Change the foreground and background colors
  * Add images to the slides
  * Add code blocks
  * Play a simulation of code and output with codio YML files



#### Installing Present on Linux

Present is a Python based tool and you can use PIP to install it. You should make sure to [install Pip on Ubuntu][4] with this command:

```
sudo apt install python3-pip
```

If you are using some other distributions, please check your package manager to install PIP3.

Once you have PIP installed, you can install Present system wide in this manner:

```
sudo pip3 install present
```

You may also install it for only the current user but then you’ll also have to add ~/.local/bin to your PATH.

#### Using Present to create and present slides in Linux terminal

![][5]

Since Present utilizes markdown syntax, you should be aware of it to create your own slides. Using a [markdown editor][6] will be helpful here.

Present needs a markdown file to read and play the slides. You may [download this sample slide][7] but you need to download the embed image separately and put it inside image folder.

  * Separate slides using — in your markdown file.
  * Use markdown syntax for adding text to the slides.
  * Add images with this syntax: ![RC] (images/name.png).
  * Change slide colors by adding syntax like &lt;!– fg=white bg=red –&gt;.
  * Add a slide with effects using syntax like &lt;!– effect=fireworks –&gt;.
  * Use [codio syntax][8] to add a code running simulation.
  * Quit the presentation using q and control the slides with left/right arrow or PgUp/Down keys.



Keep in mind that resizing the terminal window while running the presentation will mess things up and so does pressing enter key.

**Conclusion**

If you are familiar with Markdown and the terminal, using Present won’t be difficult for you.

You cannot compare it to regular presentation slides made with Impress, MS Office etc but it is a cool tool to occasionally use it. If you are a computer science/networking student or work as a developer or sysadmin, your colleagues will surely find this amusing.

--------------------------------------------------------------------------------

via: https://itsfoss.com/presentation-linux-terminal/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/funny-linux-commands/
[2]: https://github.com/vinayak-mehta/present
[3]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[4]: https://itsfoss.com/install-pip-ubuntu/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/presentation-in-linux-terminal.png?resize=800%2C494&ssl=1
[6]: https://itsfoss.com/best-markdown-editors-linux/
[7]: https://github.com/vinayak-mehta/present/blob/master/examples/sample.md
[8]: https://present.readthedocs.io/en/latest/codio.html
