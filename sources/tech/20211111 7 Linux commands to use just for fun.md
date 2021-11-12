[#]: subject: "7 Linux commands to use just for fun"
[#]: via: "https://opensource.com/article/21/11/fun-linux-commands"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

7 Linux commands to use just for fun
======
These playful Linux commands are also surprisingly useful.
![Woman sitting in front of her laptop][1]

The Linux command line can be the home of power users and sysadmins. However, Linux is more than just a lot of hard work. Linux was developed by fun-loving people who created an array of comical commands. Try playing around with these yourself when you want a smile.

### Steam locomotive (sl)

For no reason whatsoever, you can cause a steam locomotive to zip across your terminal using the `sl` command. Install Steam Locomotive with your package manager. For example, on Fedora:

`$ sudo dnf install sl`

![A steam locomotive engine drawing made from symbols and characters][2]

Don Watkins, [CC BY-SA 4.0][3]

#### Real uses

As far as I know, the `sl` command is truly just for fun. Do you have an interesting use for `sl`? Let me know in the comments.

### Fireplace (aafire)

Warm your heart and your terminal with `aafire` command, which causes a fireplace animation to play. You can install aafire with your package manager. On Debian, Mint, Elementary, and similar:

`$ sudo apt install libaa-bin`

On Fedora, CentOS, and others:

`$ sudo dnf install aalib`

![A black and white image of a fire made from text symbols and characters][4]

Don Watkins, [CC BY-SA 4.0][3]

#### Real uses

This image is a subtle way to communicate to your team or boss that everything's about to go up in smoke.

### Yes

You can use the `yes` command to print out a string of text until it is forcibly stopped with **Ctrl+C**. For example, I am a Buffalo Bills fan, so I chose to print out an endless series of Buffalo Bills with the `yes` command:

`$ yes Buffalo Bills`

![A screenshot showing repeated lines of Buffalo Bills \(left edge slightly cut off\)][5]

Don Watkins, [CC BY-SA 4.0][3]

#### Real uses

You can use this command to pipe confirmation to scripts so that when a script pauses to ask for confirmation, it automatically receives `yes`. For example, imagine there's a script you run that often stops to ask you for confirmation:


```


$ foo
Are you sure you want to do this? Y/n  Y
Are you really sure? y/N  Y
But are you really? y/N

```

You can auto-accept such messages by passing `yes` to the command:

`$ yes | foo`

Alternatively, you can auto-deny messages using yes as well:

`$ yes no | foo`

### Fortune

You can have your fortune told on the command line by installing Fortune. Fortune prints a random and possibly meaningful message.

Install Fortune with your package manager:

`$ sudo apt install fortune`

On Fedora:

`$ sudo dnf install fortune-mod`

The `fortune` command has many datasets it can draw from. For instance, you can get famous quotes from literature or the science-fiction TV show _Firefly_, or choose from jokes, tips about Linux, and much more. Search your repository for "fortune" to see what options your distribution provides.


```


$ fortune
Johnson's law:
  Systems resemble the organizations that create them.

```

#### Real uses

You can use Fortune to generate a pseudo-random number. There's not enough entropy to make it cryptographically secure, but when you need an unexpected number, you can count characters or words:


```


$ fortune | wc --chars
38
$ fortune | wc --words
8
$ fortune | wc --chars
169

```

### Lolcat

Lolcat is a program that concatenates files, or standard input, to standard output (like the generic cat) and adds rainbow coloring to it. You can pipe the output of other commands to `lolcat,` which provides a rainbow hue to the result.

Here's the result of `lolcat -h` for its help output:

![onscreen text colored in a rainbow gradient][6]

Don Watkins, [CC BY-SA 4.0][3]

### Figlet and banner

The `figlet` and `banner` commands let you create simple ASCII text banners. Here's a text banner for a CentOS system:

`$ figlet centos.com`

![Text banner reading "centos.com" composed from symbols and characters][7]

Don Watkins, [CC BY-SA 4.0][3]

Pipe `figlet` to `lolcat` for a colorful banner:

`$ figlet centos.com | lolcat`

![A text banner reading "centos.com" made rainbow colored with lolcat][8]

Don Watkins, [CC BY-SA 4.0][3]

`$ banner Hello World`

![A banner reading "Hello World" spelled out with pound symbols][9]

Don Watkins, [CC BY-SA 4.0][3]

#### Real use

Both `figlet` and `banner` are easy ways to remind users what system they're logging on to, which can be helpful when you work with dozens of servers, as many sysadmins, web designers, and cloud developers do.

### Espeak

You can add speech capabilities to your command line funnies by installing `espeak`.

Once `espeak` is installed, turn up the volume on your computer and have some fun listening to your machine talk to you. Espeak is a software speech synthesizer, and there are a few different voice libraries available.

`$ espeak "Linux is the best operating system."`

### Fun commands

Be sure to consult the man pages of all these commands to explore all the possibilities and iterations. What are your favorite silly commands, and do they have real-world uses as well? Share your favorites in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/fun-linux-commands

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: https://opensource.com/sites/default/files/uploads/locomotive_0.png (Steam locomotive)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/fireside.png (fireside)
[5]: https://opensource.com/sites/default/files/uploads/bills.png (Yes command)
[6]: https://opensource.com/sites/default/files/uploads/lolcat_rainbow.png (lolcat)
[7]: https://opensource.com/sites/default/files/uploads/figlet_centos.png (figlet text banner)
[8]: https://opensource.com/sites/default/files/uploads/lolcat_figlet_centos.png (Figlet with lolcat effects)
[9]: https://opensource.com/sites/default/files/uploads/hello_world_0.png (Hello World banner)
