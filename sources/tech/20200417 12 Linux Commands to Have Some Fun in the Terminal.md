[#]: collector: (lujun9972)
[#]: translator: (Zioyi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (12 Linux Commands to Have Some Fun in the Terminal)
[#]: via: (https://itsfoss.com/funny-linux-commands/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

12 Linux Commands to Have Some Fun in the Terminal
======

_**So, you think Linux terminal is all work and no fun? These funny Linux commands will prove you wrong.**_

The Linux terminal is the place to get serious work done. We have plenty of useful [linux command tips and tricks][1] to help you with that.

But, did you know that you can have a lot of fun using the terminal? Well, if you did not, then you are not alone. Most Linux users see the terminal as an interface that is designed and built for system management and development tasks.

However, you will be surprised to know that there are tons of [terminal based games][2] and [ASCII games][3] that you can play in the terminal.

And, in this article, I’m going to explore some interesting, some funny and some ridiculous commands that you can type into the terminal on Linux and have fun!

### Have some fun in Linux terminal with these commands

![][4]

You’ll find a lot of these commands ridiculous or useless but some of them could actually be put to some good use.

I have added installation instructions for Ubuntu/Debian. If you are using Ubuntu-based distribution, please make sure to [enable universe repository][5] as most of these commands are not in the main repository.

If you are using Arch, Fedora, SUSE, Solus or any other non-Ubuntu distributions, please use your distribution’s package manager to install these funny Linux commands.

#### 1\. Run a train in the terminal

Let’s take a ride in the locomotive and begin our auspicious journey. And I mean it literally!

The sl command allows you to run a train in your terminal.

![][6]

Here’s how to install the command:

```
sudo apt install sl
```

Once done, you can simply type in the following in the terminal to get started:

```
sl
```

Impressive, isn’t it? But, hold on. We are not done yet! Apparently, you can fly your locomotive. Just add the option -F, Mr. Potter:

```
sl -F
```

****This should make the locomotive get wings to fly off from the terminal window!

#### 2\. Add the Matrix effect to your Linux terminal

Remember the iconic sci-fi movie [The Matrix][7]? The green text falling down on the terminal became an identity of Matrix.

You can have this Matrix digital rain on your Linux box as well! You just need to install **cmatrix** and type it in the terminal.

![][8]

Installing cmatrix on Debian/Ubuntu Linux:

```
sudo apt install cmatrix
```

Now, all you have to do is type the following to get the matrix screen on terminal:

```
cmatrix
```

Press Ctrl+C to stop it, Mr. Anderson.

**Recommended Read:**

![][9]

#### [Watch Star Wars In Linux Terminal via Telnet][10]

Watch Star Wars in ASCII art Linux terminal.

#### 3\. Let there be fire

Keep your fire extinguisher handy because now you are going to start a fire in your terminal!

![][11]

To get it installed, here’s what you have to type:

```
sudo apt install libaa-bin
```

Once done start a fire in your terminal by entering:

```
aafire
```

Press Ctrl+C to stop it.

#### 4\. Fortune ~~Cookie~~ Command

Want to know your fortune but there are no fortune cookies around you?

Not to worry, you just need to type “fortune” on your terminal and press enter. The terminal will display a random sentence just like you usually get in fortune cookies.

![][12]

Install it with:

```
sudo apt install fortune
```

Once done, simply type in the command below to know your fortune:

```
fortune
```

Now this is one of the commands here that you could actually use. You can use it as message of the day so that in a multi-user environment, all the users will see a random fortune cookie when they login.

You may also add it to your bashrc file so that it shows you a random message as soon as you log in to the terminal.

#### 5\. Pet lover? This is for you

Oneko is a little fun command that will change your regular cursor into a mouse and creates a curious little cat who will chase your cursor once you move it. It’s not limited to just the terminal. You can keep on working while the cat chases the cursor.

Now, that’s something fun to do specially if you have kids at home.

![][13]

Install Oneko with this command:

```
sudo apt install oneko
```

Run it with this command:

```
oneko
```

In case you want a dog instead of a cat, type:

```
oneko -dog
```

There are a few more types of cats available. You can get that information by using oneko –help. To stop it, use Ctrl+C.

#### 6\. Little brother is watching you

Xeyes is a tiny gui program that let the user draws a pair of ever watching eyes! It will follow your mouse cursor constantly. Run the command and see it yourself!

![][14]

You can install it using this command:

```
sudo apt install xeyes
```

And then use it with this:

```
xeyes
```

Press Ctrl+C to stop it.

#### Let the terminal speak for you

To try out this command, make sure you have turned on your speakers. [eSpeak][15] is a fun command that gives your terminal a voice. Yes, you heard that right.

Install the package first:

```
sudo apt install espeak
```

Next, you need to simply type in the command along with a text that you want to listen as audio:

```
espeak "Type what your computer says"
```

Whatever you place in the double quotes, your computer is obligated to say! It’s like [echo command in Linux][16]. But instead of printing, it speaks.

#### Toilet (but it has nothing to do with a washroom)

This sounds weird, yes. But, it’s just a command that transforms a text into large ASCII characters.

![][17]

Install toilet with this command:

```
sudo apt install toilet
```

Once done, you just need to type in:

```
toilet sample text you want
```

I don’t know why this little program is called toilet.

#### What does the ~~fox~~ cow say?

Cowsay is a command that displays a cow using ASCII characters in the terminal. And by using this command you can instruct the cow to say anything you want.

Not to be confused with any audio – it will just display a text (like you usually see in a comic book).

![Cowsay Cowthink][18]

Install ****cowsay:

```
sudo apt install cowsay
```

Once you have it installed, you just need to type in:

```
cowsay "your text"
```

Whatever you place in the double quotes, your cow is obligated to say! I have seen a few sysadmins using it to display the message of the day. Maybe you can do the same. You may even combine it with fortune command.

#### Banner Command

The banner command works just like the toilet command but it is limited to print only 10 characters at most.

![][19]

You can install banner command like this:

```
sudo apt install sysvbanner
```

Then use it in the following way:

```
banner "Welcome"
```

Replace content in the double quotes and you shall have your desired text displayed.

#### Yes command

![][20]

The “yes” command helps you to loop an automated response until you terminate the command. This command will print the exact same thing indefinitely. If you want to produce huge amounts of junk text fast, then this command will work like a charm.

You may also use it to provide a yes to a command (if it prompts for it). For example, the apt upgrade command asks for your confirmation, you can use it like this:

```
yes | sudo apt upgrade
```

You don’t need to install any package for it. Yes command is already available.

Terminate the yes command loop, simply press **CTRL + C**.

#### Get a new identity, well, sort of

Want to generate a random fake identity? I give you the command “rig”. Once you place this in the terminal, it will generate a fake identity.

![][21]

Install rig with this command:

```
sudo apt install rig
```

Then simply type this:

```
rig
```

It may be used in scripts or web-apps that displays random information but I haven’t done anything of that sort on my own.

**Wrapping Up**

I hope you liked this list of fun Linux commands. Which command do you like the most here? Do you know some other such amusing commands? Do share it with us in the comment section.

![][22]

### Srimanta Koley

A passionate writer, a distrohopper and an open source enthusiast, Srimanta is extremely fond of everything related to technology. He loves to read books and has an unhealthy addiction to the 90s!

--------------------------------------------------------------------------------

via: https://itsfoss.com/funny-linux-commands/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-command-tricks/
[2]: https://itsfoss.com/best-command-line-games-linux/
[3]: https://itsfoss.com/best-ascii-games/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/fun-linux-commands.png?ssl=1
[5]: https://itsfoss.com/ubuntu-repositories/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/sl-command.jpg?ssl=1
[7]: https://en.wikipedia.org/wiki/The_Matrix
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/matrix-screen-command.png?ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2015/12/Star-Wars-Linux-Terminal-2.png?fit=732%2C462&ssl=1
[10]: https://itsfoss.com/star-wars-linux/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/fire-command.png?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/fortune-command.jpg?ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/oneko-command.jpg?ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/xeyes-command.jpg?ssl=1
[15]: https://itsfoss.com/espeak-text-speech-linux/
[16]: https://linuxhandbook.com/echo-command/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/toilet-command.jpg?ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/cowsay-cowthink.jpg?ssl=1
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/banner-command.jpg?ssl=1
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/yes-yourtext.jpg?ssl=1
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/rig-command.jpg?ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/srimanta.jpg?ssl=1
