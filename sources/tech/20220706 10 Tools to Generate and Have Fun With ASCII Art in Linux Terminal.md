[#]: subject: "10 Tools to Generate and Have Fun With ASCII Art in Linux Terminal"
[#]: via: "https://itsfoss.com/ascii-art-linux-terminal/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "泠知落汐"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

10 Tools to Generate and Have Fun With ASCII Art in Linux Terminal
======
Linux terminal is not as scary as you think.

Of course, it could be intimidating in the beginning but once you [know the terminal better][1], you start loving it.

You are likely to use the terminal for serious work. But there are many fun stuff you can do in the terminal as well.

One of them is experimenting with ASCII art. You can display predefined or random messages, play games, or run some animation in ASCII format in the Linux terminal using various command line tools.

My teammate Sreenath likes to explore such unusual CLI tools and share his findings with me. I am sharing those findings with you.

![ascii art tools linux][2]

Most of these programs should be available in the repositories of your Linux distribution. You can use your system’s package manager to install them. To keep the article concise, I have only included the installation instructions for Ubuntu.

### 1. lolcat: Add colors to your terminal

Alright! lolcat doesn’t have anything to do with ASCII art. At least not directly.

Still, I included it at the beginning of this article because you can combine other ASCII tools with lolcat.

So, what does it do? It is similar to the cat command but it adds random gradient colors to its output.

![lolcat][3]

It may not look useful at the moment but you’ll see its impact when the outputs of other ASCII tools are piped through lolcat.

Install lolcat with the apt command:

```
sudo apt install lolcat
```

### 2. Aewan: Display ASCII text beautifully

Aewan is a multi-layered ASCII graphics/animation editor. It produces stand-alone cat-able ASCII art files and an easy-to-parse format for integration into terminal applications.

It has two tools: `aewan`, an ASCII editor and `aecat`, for viewing the created file.

I am not going to discuss the editor part here.

![aewan initial layout][4]

To display any text in pretty ASCII format, you need the aecat command. Notice the use of letters in the screenshot below.

![aewan output][5]

To install aewan use the following command:

```
sudo apt install aewan
```

And then use it like this:

```
aecat hello
```

### 3. Cowsay: Make an ASCII cow say whatever you want

What does the cow say? Whatever you want it to say.

The cowsay is already a popular tool among seasoned Linux users. It shows an ASCII cow that repeats the text you provide it.

![cowsay][6]

But you are not restricted to cows only. You can change it to several other characters as well. Like a dragon (burning King’s landing):

![cowsay][7]

Did you notice the colored output in the above screenshot? That’s the magic of the lolcat command I mentioned earlier.

To install cowsay, use:

```
sudo apt install cowsay
```

Once installed, you can use it like this:

```
cowsay hello
```

You can refer to its [man page][8] for additional configuration and options.

### 4. jp2a: Convert images into ASCII art

jp2a is a command-line tool that [converts images to ASCII art in the Linux terminal][9]. It works with JPEG and PNG files. It also allows colored output and your selection of character set to appear as ASCII image.

![jp2a][10]

You can install it using the following command:

```
sudo apt install jp2a
```

You can get the colorful output and save the ASCII text like this:

```
jp2a --output=ascii.txt --colors input.png
```

It’s not the only program of this kind. There is ascii-image-converter and several other tools that could be used for the same purpose. I won’t discuss all of them in this list.

### 5. linuxlogo: Display the ASCII logo your Linux distro

The name says it all. It displays the [Linux logo in ASCII format][11].

No, not our [beloved Linux logo, Tux][12] but the logo of your Linux distribution. It also shows a few additional information like [Linux kernel version][13], CPU, RAM, hostname, etc.

![linux logo][14]

You can install it using the apt command:

```
sudo apt install linuxlogo
```

Just enter linuxlogo to use the command.

### 6. Neoftech: Display the Linux logo along with system info

The above linuxlogo command is too simplistic. You can amp it up by using Neofetch.

It displays the distribution in a more pretty way along with several system information like kernel, uptime, desktop environment, theme, icons, etc.

![neofetch][15]

You can also parse it through lolcat to get rainbow-colored output.

Install Neoftech using this command:

```
sudo apt install neofetch
```

And then just enter neoftech to run the command.

There is also screenfetch, a similar tool to Neofetch. You can use either of them.

### 7. fortune: Get your fortune told

Just kidding! There’s no such thing.

However, fortune cookies are still fashionable and apparently, people like to read random predictions or teachings.

You can get a similar feature in the Linux terminal with the fortune command:

![fortune cookie linux][16]

You can install it using the following command:

```
sudo apt install fortune
```

Once installed, just enter fortune in the terminal to get a random message.

### 8. pv: Make things animated

This is a classic example of the unintended use of a Linux command. The pv command is used to monitor the progress of data through pipe.

But you can use it to animate the output of any command. Combine it with some of the above-mentioned commands and you can see the ASCII art appearing on your screen as if it is being typed.

Don’t get it? Watch this video:

![A Video from YouTube][17]

Install it using the following command:

```
sudo apt install pv
```

And then use it in the following manner:

```
neofetch | pv -qL 200 | lolcat
```

The higher the number, the higher will be the speed.

### 9. cmatrix: Matrix like animation in ASCII

Remember the cult geek move Matrix? The green falling code is synonymous with Matrix and hacking.

You can run an ASCII simulation of the falling code in the Linux terminal with cmatrix command.

I am sharing a screenshot instead of animation here.

![cmatrix][18]

You can install it with apt command:

```
sudo apt install cmatrix
```

Once installed, you can run it with:

```
cmatrix
```

It starts the animation immediately and it keeps on generating random green text falling and disappearing from the screen. The command keeps on running. To [stop the running application][19], use the Ctrl+C keys.

### 10. cbonsai: Grow a bonsai in your terminal

Got a green thumb? How about growing an ASCII bonsai tree in the terminal?

cbonsai is a [fun Linux command][20] that lets you run bonsai tree growing animation in ASCII format.

I shared a YouTube Shorts of cbonsai command a few days ago.

![Have fun with the Linux terminal 😍 🐧][21]

[Subscribe to our YouTube channel for more Linux videos][22]

You can install cbonsai using:

```
sudo apt install cbonsai
```

And then to run the animation, use this command:

```
cbonsai -l
```

### Try some more

There are many more such fun CLI tools. Heck, there are [ASCII games][23] as well. It’s fun to use them at times to amuse people around you.

Can you put these commands to some good use? Not certain about the usability, but you can add some of them in your .bashrc file so that the command is run as soon as you open a terminal session.

Many sys-admins do that on shared Linux systems. A program like cowsay or figlet can be used to display a message or system info in a pretty way.

You may also use some of these programs in your bash scripts, especially if you have to highlight something.

There could be other usages of ASCII art in Linux. I let you share them with the rest of us here.

#### Read More Articles

--------------------------------------------------------------------------------

via: https://itsfoss.com/ascii-art-linux-terminal/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[泠知落汐](https://github.com/CoWave-Fall)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/basic-terminal-tips-ubuntu/
[2]: https://itsfoss.com/wp-content/uploads/2022/07/ascii-art-tools-linux.png
[3]: https://itsfoss.com/wp-content/uploads/2022/07/lolcat.png
[4]: https://itsfoss.com/wp-content/uploads/2022/07/Aewan-initial-layout.png
[5]: https://itsfoss.com/wp-content/uploads/2022/07/aewan-output.png
[6]: https://itsfoss.com/wp-content/uploads/2022/07/cowsay-1.png
[7]: https://itsfoss.com/wp-content/uploads/2022/07/cowsay.png
[8]: https://itsfoss.com/linux-man-page-guide/
[9]: https://itsfoss.com/ascii-image-converter/
[10]: https://itsfoss.com/wp-content/uploads/2022/07/jp2a.png
[11]: https://itsfoss.com/display-linux-logo-in-ascii/
[12]: https://itsfoss.com/tux-trivia/
[13]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[14]: https://itsfoss.com/wp-content/uploads/2022/07/linux-logo.png
[15]: https://itsfoss.com/wp-content/uploads/2022/07/neofetch.png
[16]: https://itsfoss.com/wp-content/uploads/2022/07/fortune-cookie-Linux.png
[17]: https://player.vimeo.com/video/727286686
[18]: https://itsfoss.com/wp-content/uploads/2022/07/cmatrix.png
[19]: https://itsfoss.com/stop-program-linux-terminal/
[20]: https://itsfoss.com/funny-linux-commands/
[21]: https://youtu.be/KqhqgdezPp8
[22]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[23]: https://itsfoss.com/best-ascii-games/
