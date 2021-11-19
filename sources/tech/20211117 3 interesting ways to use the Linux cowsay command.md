[#]: subject: "3 interesting ways to use the Linux cowsay command"
[#]: via: "https://opensource.com/article/21/11/linux-cowsay-command"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 interesting ways to use the Linux cowsay command
======
Want a just-for-fun application to play with? Try cowsay.
![Cow on parade.][1]

Most of the time, a terminal is a productivity powerhouse. But there's more to the terminal than commands and configurations. Among all the outstanding open source software out there, some of it has been [written just for fun][2]. I've written about [fun commands][3] before, but this article is about just one: the venerable `cowsay` command.

Cowsay is a configurable talking (or thinking) cow. It accepts a text string and outputs a graphic of a cow talking. Here's a cow saying it loves Linux:


```


&lt; I love Linux &gt;
\--------------
       \   ^__^
        \  (oo)\\_______
           (__)\       )\/\
               ||----w |
               ||     ||

```

To get that result, all I have to type is:

`$ cowsay "I love Linux"`

### Install cowsay on Linux

You can install cowsay with your package manager. On Debian, Mint, Elementary, and similar distributions:

`$ sudo apt install cowsay`

On Fedora:

`$ sudo apt install cowsay-beefymiracle`

### Cowsay command options

Cowsay is a simple and silly application. There's no actual use for it except to provide some diverting styling for your terminal. For instance, rather than just making a cow say a fun phrase, you can make a cow with wonky eyes say a fun phrase. Type:

`$ cowsay -e @@ Hello`

You'll get:


```


&lt; Hello &gt;
 -------
       \   ^__^
        \  (@@)\\_______
           (__)\       )\/\
               ||----w |
               ||     ||

```

Or you can make it stick out its tongue. Type:

`$ cowsay -T U Hello`

You'll see:


```


&lt; Hello &gt;
\-------
       \   ^__^
        \  (oo)\\_______
           (__)\       )\/\
            U ||----w |
               ||     ||

```

Better still, you can combine the `fortune` command with `cowsay`:

`$ fortune | cowsay`

Now you'll have an especially smart cow:


```


 _______________________________________
/ we:                                   \
|                                       |
| The single most important word in the |
\ world.                                /
 ---------------------------------------
       \   ^__^
        \  (oo)\\_______
           (__)\       )\/\
               ||----w |
               ||     ||

```

### Beefy miracle

On Fedora, there's an extra option for cowsay that's also an unofficial project mascot. For years, the Fedora installer has displayed slides promoting open source contributions. Because they were styled after the interludes at drive-in movie theaters, a common cartoon character in the slides is an anthropomorphic hot dog.

In keeping with that theme, you can invoke a so-called beefy miracle with the Fedora version of cowsay:

`$ cowsay -f beefymiracle Hello Fedora`

You'll end up with a perfectly silly result:


```


&lt; Hello Fedora &gt;
 --------------      .---. __
          ,    \    /     \   \    ||||
         \\\\\\\      |O___O |    | \\\||||
         \   //    | \\_/  |    |  \   /
          '--/----/|     /     |   |-'
                 // //  /     -----'
                //  \\\ /      /
               //  // /      /
              //  \\\ /      /
             //  // /      /
            /|   ' /      /
            //\\___/      /
           //   ||\     /
           \\\\_  || '---'
           /' /  \\\\_.-
          /  /    --| |
          '-'      |  |
                    '-'

```

### Graphical cowsay

If you find yourself needing to have messages delivered to you from a graphical cow, there's the `xcowsay` command. It's a graphical program similar to cowsay, and it accepts a text string that's entered by the user or piped from another application like Fortune.

![A cartoon cow has a speech bubble that reads "I love Linux"][4]

Don Watkins, [CC BY-SA 4.0][5]

### Fun Linux commands

While `cowsay` is not a useful command, it is a fun command—the equivalent of desktop widgets for your terminal. It's great for a momentary distraction and fun experiments with piping commands (try piping `ifconfig` to cowsay, or `lsblk`, or `mount`, or anything!). If you want to make your terminal more fun, try cowsay.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/linux-cowsay-command

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_CowParade_osdc.png?itok=6GD1Wnbm (Cow on parade.)
[2]: https://opensource.com/life/16/6/fun-and-semi-useless-toys-linux
[3]: https://opensource.com/article/21/11/fun-linux-commands
[4]: https://opensource.com/sites/default/files/uploads/graphical_cowsay.png (graphical cowsay)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
