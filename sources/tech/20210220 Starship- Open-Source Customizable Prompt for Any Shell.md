[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Starship: Open-Source Customizable Prompt for Any Shell)
[#]: via: (https://itsfoss.com/starship/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Starship: Open-Source Customizable Prompt for Any Shell
======

_**Brief: A cross-shell prompt that makes it easy to customize and configure the Linux terminal prompt, if you care too much about the looks of your terminal.**_

While I’ve already covered a few tips to help you [customize the looks of your terminal][1], I also came across suggestions for an interesting cross-shell prompt.

### Starship: Tweak your Linux Shell Prompt Easily

![][2]

[Starship][3] is an open-source project that’s written in [Rust][4] to help you set up a minimal, fast, and customizable shell prompt.

No matter whether you’re using bash, fish, PowerShell on Windows or any other shell, you can utilize Starship to customize the appearance.

Do note that you do have to go through its [official documentation][5] to be able to perform advanced configuration for everything you like but here I will include a simple sample configuration to get a head start along with some key information about Startship.

Starship focuses on giving you a minimal, fast, and useful shell prompt by default. It even records and shows the time taken to perform a command as well. For instance, here’s a screenshot:

![][6]

Not just limited to that, it is also fairly easy to customize the prompt to your liking. Here’s an official GIF that shows it in action:

![][7]

Let me help you set it up. I am using bash shell on Ubuntu to test this out. You can refer to the steps I mention, or you can take a look at the [official installation instructions][8] for more options to install it on your system.

### Key Highlights of Starship

  * Cross-platform
  * Cross-shell support
  * Ability to add custom commands
  * Customize git experience
  * Customize the experience while using specific programming languages
  * Easily customize every aspect of the prompt without taking a hit on performance in a meaningful way



### Installing Starship on Linux

Note

Installing Starship requires downloading a bash script from the internet and then run the script with root access.|
If you are not comfortable with that, you may use snap here:
`sudo snap install starship`

**Note**: _You need to have [Nerd Font][9] installed to get the complete experience._

To get started, ensure that you have [curl][10] installed. You can install it easily by typing in:

```
sudo apt install curl
```

Once you do that, type in the following to install Starship:

```
curl -fsSL https://starship.rs/install.sh | bash
```

This should install Starship to **usr/local/bin** as root. You might be prompted for the password. Here’s how it would look:

![][11]

### Add startship to bash

As the screenshot suggests, you will get the instruction to set it up in the terminal itself. But, in this case, we need to add the following line at the end of our **bashrc** user file:

```
eval "$(starship init bash)"
```

To add it easily, simply type in:

```
nano .bashrc
```

Now, navigate to the end of the file by scrolling down and add the line at the end of the file as shown in the image below:

![][12]

Once done, simply restart the terminal or restart your session to see the minimal prompt. It might look a bit different for your shell, but more or less it should be the same by default.

![][13]

Once you set it up, you can proceed customizing and configuring the prompt. Let me show you an example configuration that I did:

### Configure Starship Shell Prompt: The Basics

To get started, you just need to make a configuration file ([TOML file][14]) inside a .config directory. If you already have one, you should simply navigate to the directory and just create the configuration file.

Here’s what you have to type to create the directory and the config file:

```
mkdir -p ~/.config && touch ~/.config/starship.toml
```

Do note that this is a hidden directory. So, when you try to access it from your home directory using the file manager, make sure to [enable viewing hidden files][15] before proceeding.

From this point onwards, you should refer to the configuration documentation if you want to explore something you like.

For an example, I configured a simple custom prompt that looks like:

![][16]

To achieve this, my configuration file looks like this:

![][17]

It is a basic custom format as per their official documentation. But, if you do not want a custom format and simply want to customize the default prompt with a color or a different symbol, that would look like:

![][18]

And, the configuration file for the above customization looks like:

![][19]

Of course, that’s not the best-looking prompt one can make but I hope you get the idea.

You can customize how the directory looks by including icons/emojis, you can tweak the variables, format strings git commits, or while using specific programming languages.

Not just limited to that, you can also create custom commands to use in your shell to make things easier or comfortable for yourself.

You should explore more about in their [official website][3] and its [GitHub page][20].

[Starship.rs][3]

### Concluding Thoughts

If you just want some minor tweaks, the documentation might prove to be too overwhelming. But, even then, it lets you achieve a custom prompt or a minimal prompt with little effort that you can apply on any common shell and any system you’re working on.

Perosnally, I don’t think it’s very useful but several readers suggested it and it seems people do love it. I am eager to see how you [customize the Linux terminal][1] for different kinds of usage.

Feel free to share what you think about it and if you like it, in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/starship/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/customize-linux-terminal/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-screenshot.png?resize=800%2C577&ssl=1
[3]: https://starship.rs/
[4]: https://www.rust-lang.org/
[5]: https://starship.rs/config/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-time.jpg?resize=800%2C281&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-demo.gif?resize=800%2C501&ssl=1
[8]: https://starship.rs/guide/#%F0%9F%9A%80-installation
[9]: https://www.nerdfonts.com
[10]: https://curl.se/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/install-starship.png?resize=800%2C534&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/startship-bashrc-file.png?resize=800%2C545&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-prompt.png?resize=800%2C552&ssl=1
[14]: https://en.wikipedia.org/wiki/TOML
[15]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-custom.png?resize=800%2C289&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-custom-config.png?resize=800%2C320&ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-different-symbol.png?resize=800%2C224&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/starship-symbol-change.jpg?resize=800%2C167&ssl=1
[20]: https://github.com/starship/starship
