translating----geekpi

Getting started with Mu, a Python editor for beginners
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy)

Mu is a Python editor for beginning programmers, designed to make the learning experience more pleasant. It gives students the ability to experience success early on, which is important anytime you're learning something new.

If you have ever tried to teach young people how to program, you will immediately grasp the importance of [Mu][1]. Most programming tools are written by developers for developers and aren't well-suited for beginning programmers, regardless of their age. Mu, however, was written by a teacher for students.

### Mu's origins

Mu is the brainchild of [Nicholas Tollervey][2] (who I heard speak at PyCon2018 in May). Nicholas is a classically trained musician who became interested in Python and development early in his career while working as a music teacher. He also wrote [Python in Education][3], a free book you can download from O'Reilly.

Nicholas was looking for a simpler interface for Python programming. He wanted something without the complexity of other editors—even the IDLE3 editor that comes with Python—so he worked with [Carrie Ann Philbin][4] , director of education at the Raspberry Pi Foundation (which sponsored his work), to develop Mu.

Mu is an open source application (licensed under [GNU GPLv3][5]) written in Python. It was originally developed to work with the [Micro:bit][6] mini-computer, but feedback and requests from other teachers spurred him to rewrite Mu into a generic Python editor.

### Inspired by music

Nicholas' inspiration for Mu came from his approach to teaching music. He wondered what would happen if we taught programming the way we teach music and immediately saw the disconnect. Unlike with programming, we don't have music boot camps and we don't learn to play an instrument from a book on, say, how to play the flute.

Nicholas says, Mu "aims to be the real thing," because no one can learn Python in 30 minutes. As he developed Mu, he worked with teachers, observed coding clubs, and watched secondary school students as they worked with Python. He found that less is more and keeping things simple improves the finished product's functionality. Mu is only about 3,000 lines of code, Nicholas says.

### Using Mu

To try it out, [download][7] Mu and follow the easy installation instructions for [Linux, Windows, and Mac OS][8]. If, like me, you want to [install it on Raspberry Pi][9], enter the following in the terminal:
```
$ sudo apt-get update

$ sudo apt-get install mu

```

Launch Mu from the Programming menu. Then you'll have a choice about how you will use Mu.

![](https://opensource.com/sites/default/files/uploads/mu_selectmode.png)

I chose Python 3, which launches an environment to write code; the Python shell is directly below, which allows you to see the code execution.

![](https://opensource.com/sites/default/files/uploads/mu_writecode.png)

The menu is very simple to use and understand, which achieves Mu's purpose—making coding easy for beginning programmers.

[Tutorials][10] and other resources are available on the Mu users' website. On the site, you can also see names of some of the [volunteers][11] who helped develop Mu. If you would like to become one of them and [contribute to Mu's development][12], you are most welcome.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/getting-started-mu-python-editor-beginners

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://codewith.mu
[2]:https://us.pycon.org/2018/speaker/profile/194/
[3]:https://www.oreilly.com/programming/free/python-in-education.csp
[4]:https://uk.linkedin.com/in/carrie-anne-philbin-a20649b7
[5]:https://mu.readthedocs.io/en/latest/license.html
[6]:http://microbit.org/
[7]:https://codewith.mu/en/download
[8]:https://codewith.mu/en/howto/install_with_python
[9]:https://codewith.mu/en/howto/install_raspberry_pi
[10]:https://codewith.mu/en/tutorials/
[11]:https://codewith.mu/en/thanks
[12]:https://mu.readthedocs.io/en/latest/contributing.html
