translating---geekpi

How To Use Instagram In Terminal
======
![](https://www.ostechnix.com/wp-content/uploads/2018/03/instagram-in-terminal-720x340.png)
Instagram doesn’t need introduction. It is one of a popular social network platform, like Facebook and Twitter, to share photos and videos either publicly or privately to pre-approved followers. It was launched in 2010 by two entrepreneurs namely **Kevin Systrom** and **Mike Krieger**. In 2012, the social network giant Facebook has acquired Instagram. Instagram is available for free on Android and iOS devices. We can also use it in desktop systems via a web browser. And, the cool thing is now you can use Instagram in Terminal on any Unix-like operating systems. Are you excited? Well, read on to know how to view your Instagram feed on your Terminal.

### Instagram In Terminal

First, install **pip3** as described in the following link.

Then, git clone the repository of “instagram-terminal-news-feed” script.
```
$ git clone https://github.com/billcccheng/instagram-terminal-news-feed.git

```

The above command will clone the contents of instagram script in a directory named “instagram-terminal-news-feed” in your current working directory. Cd to that directory:
```
$ cd instagram-terminal-news-feed/

```

Then, run the following command to install instagram terminal feed:
```
$ pip3 install -r requirements.txt

```

Now, run the following command to launch instagram in terminal in your Linux box.
```
$ python3 start.py

```

Enter your Instagram username and password and browse your Instagram feed right from the Terminal. Your instragram username and password will only be stored locally in the file called **credential.json**. So, you don’t need to worry about it. You can also just don’t save your credentials which is the default option.

Here is some screenshots of [**My Instagram page**][1].

![][3]

![][4]

![][5]

Please note that you can only view your feed. You can’t follow anyone, like or comment posts. This is just a instagram feed reader.

This project is freely available on GitHub, so you can view the source code, improve it, add more features, fix any bugs if there are any.

Have fun! Cheers!!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-use-instagram-in-terminal/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.instagram.com/ostechnix/
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/instagram-in-terminal-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/instagram-in-terminal-2.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/instagram-in-terminal-3-2.png
