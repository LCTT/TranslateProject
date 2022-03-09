[#]: subject: "Changing Linux System Language (Locales) From Command Line on Ubuntu and Debian Based Distros"
[#]: via: "https://itsfoss.com/change-locales-linux/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Changing Linux System Language (Locales) From Command Line on Ubuntu and Debian Based Distros
======

_**Brief: Here’s a quick tutorial that shows the steps for changing the locales on Ubuntu and other Linux distributions from the command line.**_

It’s been some time since I wrote something on It’s FOSS. The truth is that I’ve been writing for a Spanish version of It’s FOSS. If you’ve not visited it and/or you’re a Spanish speaker, please visit [It’s FOSS en Español][1] and check all the Linux content in Spanish.

You may be wondering why I’m sharing this fact with you. It’s because this post includes this new page as an example.

At the time of doing a clean installation of [your favorite Linux distro][2], the system asks you to choose a main language. Even though it’s not frequent, some people consider changing that language to a new one later on, like me for example.

See, I have to take screenshots in both Spanish (for It’s FOSS en Español) and in English (for It’s FOSS). This becomes a problem, because I have only one computer, and changing the user is not a fast solution for me.

That’s why I’d like to share with you this quick tip, where I’ll show you how to change your main system language with two simple lines in the terminal.

Let’s begin!

### Changing Linux system language from the terminal

Let’s suppose you want to change your main language from English to Spanish.

Verify which language you have set as default (main language). For this, let’s use the locale command.

```

    locale

```

You should see something like this.

```

    [email protected]:~$ locale
    LANG=en_US.UTF-8
    LANGUAGE=
    LC_CTYPE="en_US.UTF-8"
    LC_NUMERIC="en_US.UTF-8"
    LC_TIME="en_US.UTF-8"
    LC_COLLATE="en_US.UTF-8"
    LC_MONETARY="en_US.UTF-8"
    LC_MESSAGES="en_US.UTF-8"
    LC_PAPER="en_US.UTF-8"
    LC_NAME="en_US.UTF-8"
    LC_ADDRESS="en_US.UTF-8"
    LC_TELEPHONE="en_US.UTF-8"
    LC_MEASUREMENT="en_US.UTF-8"
    LC_IDENTIFICATION="en_US.UTF-8"
    LC_ALL=

```

Here you can see that the main language is English. Now to change it, use the dpkg command in this fashion:

```

    sudo dpkg-reconfigure locales

```

Once you run the command before, you should see the next screen in your terminal.

![sudo dpkg reconfigure locales][3]

Here, you should **move using the up and down arrow** until you reach the desired language. In my case, I desire Spanish, and more specific, Mexican Spanish because I’m Mexican.

Not all languages may have the options, but if yours have, opt for [UTF-8][4].

Once your language has been found, **press the SPACE KEY to mark** it and then **ENTER**.

![Selecting your language][5]

Finally, select this new language as your default by moving to it using the arrow key and pushing the **ENTER KEY**, in the last windows.

![Setting new language as default][6]

Once done, you should see a message like this in your terminal:

```

    Generating locales (this might take a while)...
      en_US.UTF-8... done
      es_MX.UTF-8... done
    Generation complete.

```

_**And that’s all!**_ Now you’re able to change your default language as many times you want directly from the terminal.

Please let us know if you have any doubt about this topic in the comments section. _**Good look!**_

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-locales-linux/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://es.itsfoss.com/
[2]: https://itsfoss.com/best-linux-beginners/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/sudo_dpkg-reconfigure_locales.png?resize=1090%2C690&ssl=1
[4]: https://en.wikipedia.org/wiki/UTF-8
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/Selecting_your_language.png?resize=800%2C506&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/Setting_new_language_as_default-1.png?resize=800%2C506&ssl=1
