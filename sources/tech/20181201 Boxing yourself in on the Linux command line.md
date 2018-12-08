[#]: collector: (lujun9972)
[#]: translator: (jrg)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Boxing yourself in on the Linux command line)
[#]: via: (https://opensource.com/article/18/12/linux-toy-boxes)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: ( )

Boxing yourself in on the Linux command line
======
Learn how to use the boxes utility to draw shapes with characters at the Linux terminal and make your words stand out.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-boxes.png?itok=Rii6nT5P)

It's the holiday season, and every Linux terminal user deserves a little gift. It doesn't matter whether you celebrate Christmas, another holiday, or nothing at all. So I'm gathering together a collection of 24 Linux command-line toys over the next few weeks for you to enjoy and share with your friends. Let's have a little fun and add a little joy to a month that, at least here in the northern hemisphere, can be a little bit cold and dreary.

Chances are, there will be a few that you've heard of before. But, hopefully, we'll all have a chance to learn something new. (I know I did when doing some research to make sure I could make it to 24.)

The first of our 24 Linux terminal toys is a program called boxes. Why start with boxes? Because it's going to be hard to wrap up all of our other command-line presents to you without it!

On my Fedora machine, boxes wasn't installed by default, but it was in my normal repositories, so installing it was as simple as

```
$ sudo dnf install boxes -y
```

If you're on a different distribution, there's a good chance you'll find it in your default repositories as well.

Boxes a utility I really wish I had in my high school and college computer science courses, where well-intentioned teachers insisted I provide very specific looking comment at the beginning of every source file, function, code block, etc.

```
/***************/
/* Hello World */
/***************/
```

It turns out, once you add a few lines of text inside, formatting them can get, well, tedious. Enter boxes. Boxes is a simple utility for surrounding a block of text with an ASCII art-style box. It comes with defaults for source code commenting, as well as other options.

It's really easy to use. Using pipes, I can push a short greeting into a box.

```
$ cat greeting.txt | boxes -d diamonds -a c
```

Which will give us the output as follows:

```
       /\          /\          /\
    /\//\\/\    /\//\\/\    /\//\\/\
 /\//\\\///\\/\//\\\///\\/\//\\\///\\/\
//\\\//\/\\///\\\//\/\\///\\\//\/\\///\\
\\//\/                            \/\\//
 \/                                  \/
 /\      I'm wishing you all a       /\
//\\     joyous holiday season      //\\
\\//     and a Happy Gnu Year!      \\//
 \/                                  \/
 /\                                  /\
//\\/\                            /\//\\
\\///\\/\//\\\///\\/\//\\\///\\/\//\\\//
 \/\\///\\\//\/\\///\\\//\/\\///\\\//\/
    \/\\//\/    \/\\//\/    \/\\//\/
       \/          \/          \/
```

Or perhaps something more fun, like:

```
echo "I am a dog" | boxes -d dog -a c
```

Which will, unsurprisingly, give you the following:

```
          __   _,--="=--,_   __
         /  \."    .-.    "./  \
        /  ,/  _   : :   _  \/` \
        \  `| /o\  :_:  /o\ |\__/
         `-'| :="~` _ `~"=: |
            \`     (_)     `/
     .-"-.   \      |      /   .-"-.
.---{     }--|  /,.-'-.,\  |--{     }---.
 )  (_)_)_)  \_/`~-===-~`\_/  (_(_(_)  (
(              I am a dog               )
 )                                     (
'---------------------------------------'
```

Boxes comes with [lots of options][1] for padding, position, and even processing regular expressions. You can learn more about boxes on the [project's homepage][2], or head over to [GitHub][3] to download the source code or contribute your own box. In fact, if you're looking for an idea to submit, I've got an idea for you: why not a holiday present?

```
         _  _
        /_\/_\
 _______\_\/_/_______
|       ///\\\       |
|      ///  \\\      |
|                    |
|     "Happy pull    |
|       request!"    |
|____________________|
```

Boxes is open source under a GPLv2 license.

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Or check out tomorrow's command-line toy, [Drive a locomotive through your Linux terminal][4].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-boxes

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: http://boxes.thomasjensen.com/examples.html
[2]: https://boxes.thomasjensen.com/
[3]: https://github.com/ascii-boxes/boxes
[4]: https://opensource.com/article/18/12/linux-toy-sl
