[#]: subject: "Use the Linux cowsay command for a colorful holiday greeting"
[#]: via: "https://opensource.com/article/21/11/linux-cowsay"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use the Linux cowsay command for a colorful holiday greeting
======
Celebrate the Day of the Dead using this fun Linux command-line tool.
![Pumpkins painted for Day of the Dead][1]

You may have heard of a small program that takes input, such as a message that you type, and outputs a picture of a cow quoting your message. It is called **cowsay**. It has been written about before here on [Opensource.com][2].

So, to have a little fun with it, I thought I'd use it to celebrate Día de los Muertos (Day of the Dead).

In addition to a cow, there are other images available. When you install `cowsay` it includes several other images, which the install stores in `/user/share/cowsay`. You can use the `-l` argument to get a list.


```
$ sudo dnf install cowsay
$ cowsay -l
```

There's actually quite a bit of development activity related to `cowsay` and similar programs. It is possible to create your own image files or download images others have made. For instance, [Charc0al's cowsay file converter][3] is located on GitHub. You can use this tool to convert your own pictures to the special ASCII format file required by `cowsay`. Depending on your Linux or FreeBSD terminal settings, you may have color support enabled. The `cowsay` utility can display color images, as well. Charc0al's converter provides many ready-to-go color files.

I chose to use the Beetlejuice file for my celebration. First, I saved the [beetlejuice.cow][4] file to `/usr/share/cowsay`. This directory is owned by root, so you may have to save the file to your home directory first and then copy it. I also needed to give all users read access.


```
$ sudo cp beetlejuice.cow /usr/share/cowsay
$ sudo chmod o+r /usr/share/cowsay/beetlejuice.cow
```

It is interesting to notice how the image is generated. The top sets various ASCII color control codes to variables. These variables are then used to draw the image in the traditional ASCII art style. The image is almost full-body and did not fit my terminal height without scrolling off the screen, so I edited the file and removed the last 15 lines to shorten it.

The image is also detected by the `cowsay` program and appears in the list.


```
$ cowsay -l
Cow files in /usr/share/cowsay:
beavis.zen beetlejuice blowfish bud-frogs bunny cheese cower default dragon
...
```

Now, simply run the program and specify the image using the `-f` option. Don't forget to provide a message.


```
`$ cowsay -f beetlejuice "Happy Day of the Dead!"`
```

![ASCII display of Beetlejuice via cowsay][5]

Beetlejuice says Happy Day of the Dead  (CC BY-SA 4.0)

The `cowsay` command is just another way to have some command-line fun with your Linux computer. Experiment with `cowsay` and ASCII art—get creative.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/linux-cowsay

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/drew-hays-unsplash.jpg?itok=uBrvJkTW (Pumpkins painted for Day of the Dead)
[2]: https://opensource.com/article/18/12/linux-toy-cowsay
[3]: https://charc0al.github.io/cowsay-files/converter/
[4]: https://raw.githubusercontent.com/charc0al/cowsay-files/master/cows/beetlejuice.cow
[5]: https://opensource.com/sites/default/files/cowsay_beetlejuice.png
