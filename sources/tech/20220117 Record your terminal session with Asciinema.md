[#]: subject: "Record your terminal session with Asciinema"
[#]: via: "https://opensource.com/article/22/1/record-terminal-session-asciinema"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Record your terminal session with Asciinema
======
Show don't tell with Asciinema, an open source terminal session
recorder.
![4 different color terminal windows with code][1]

Support calls are important and often satisfying in the end, but the act of clear communication can be arduous for everyone involved. If you've ever been on a support call, you've probably spent several minutes spelling out even the shortest commands and explaining in detail where the spaces and returns fall. While it's often easier to just seize control of a user's computer, that's not really the best way to educate. What you might try instead is sending a user a screen recording, but one that they can copy commands from and paste into their own terminal.

Asciinema is an open source terminal session recorder. Similar to the `script` and `scriptreplay` commands, Asciinema records exactly what your terminal displays. It saves your "movie" recording to a text file and then replays it on demand. You can upload your movie to Asciinema.org and share them just as you would any other video on the internet, and you can even embed your movie into a webpage.

### Install Asciinema

On Linux, you can install Asciinema using your package manager.

On Fedora, CentOS, Mageia, or similar:


```
`$ sudo dnf install asciinema`
```

On Debian, Linux Mint, or similar:


```
`$ sudo apt install asciinema`
```

On macOS, you can install using Homebrew:


```
`$ sudo brew install asciinema`
```

On BSD and any other platform using [Pkgsrc][2]:


```


$ cd /usr/pkgsrc/misc/py-asciinema

$ sudo bmake install clean

```

### Making movies out of text

To start recording with Asciinema, you use the `rec` subcommand:


```


$ asciinema rec mymovie.cast

asciinema: recording asciicast to mymovie.cast

asciinema: press &lt;ctrl-d&gt; or type "exit" when you're done

```

Some friendly output alerts you that you're recording, and it tells you how to stop: Press **Ctrl+D** or just type `exit`.

Everything you do in your terminal while Asciinema is active gets recorded. This includes input, output, errors, awkward pauses, mistakes, or successes. If you see it in your terminal during recording, it makes the cut.

When you're finished demonstrating how the terminal works, press **Ctrl+D** or type `exit` to stop the recording.

In this example, the resulting file, `mymovie.cast` is a collection of timestamps and actions that serve as a script (in the sense of a movie script) for the playback mechanism.


```


{"version": 2, "width": 139, "height": 36, "timestamp": 1641457358, "env": {"SHELL": "/bin/bash", "TERM": "xterm-256color"}}

[0.05351, "o", "\u001b]0;seth:~\u0007"]

[0.05393, "o", "\u001b[1;31m$ \u001b[00m"]

[1.380059, "o", "e"]

[1.443823, "o", "c"]

[1.514674, "o", "h"]

[1.595238, "o", "o"]

[1.789562, "o", " "]

[2.09658, "o", "\""]

[2.19683, "o", "h"]

[2.403994, "o", "e"]

[2.466784, "o", "l"]

[2.711183, "o", "lo"]

[3.120852, "o", "\""]

[3.427886, "o", "\r\nhello\r\n"]

[...]

```

If you've made a mistake, you can cut the mistake by removing the lines recreating the error. Should you find yourself making lots of edits or belaboring long pauses during the recording, you can install and use the [asciinema-edit][3] utility, which can trim out blocks of "footage" by timestamps of your definition, or by eliminating idle time.

### Playing an Asciinema movie

You can playback your Asciinema using the `play` subcommand:


```
`$ asciinema play mymovie.cast`
```

This takes over your terminal session and makes it into the nearest equivalent of the Silver Screen as it's likely ever to be (aside from that time you watched Star Wars in ASCII over `telnet`). Your text-based movie plays—demonstrating for your users exactly how a complex task gets done. Of course, the _actual_ commands getting played don't actually execute. This isn't a shell script in action, so even though you may have created a file `hello.txt` in your movie, there won't be a new `hello.txt` after playback. This is just for show.

And yet it's more than just a show. You can pause Asciinema movies, select the text you see on the screen and paste it into an active terminal to run the command. Asciinema is useful documentation. It shows users how to do a task, and it allows them to copy and paste to ensure accuracy.

### Upload your Asciinema movie 

No Asciinema movie has yet reached a blockbuster status, but you can upload yours to Asciinema.org and share it with the world nevertheless.


```
`$ asciinema upload mymovie.cast`
```

If you're used to YouTube upload times, you'll be pleasantly surprised by how quickly Asciinema movies transfer. A `.cast` file is usually only a few kilobytes, or at the most a few megabytes, so the upload is nearly instantaneous. You don't need an account to share your movie, but all unclaimed movies get deleted after seven days. To preserve your masterpiece, you can open an account on Asciinema and then sit back and wait for the Academy to call.

### Asciinema as documentation

Asciinema is a great way to demonstrate even the most basic of concepts. Because it retains the ability to copy and paste code from the recording, provides the ability to pause and play on-demand, and is completely accurate in what it portrays, it's not just as good as a screen recording. It's much, much better. Whether you use it to show off your terminal skills to your friends or whether you use it to educate colleagues and students, Asciinema is an invaluable, social, and accessible tool.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/record-terminal-session-asciinema

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://opensource.com/article/19/11/pkgsrc-netbsd-linux
[3]: https://github.com/cirocosta/asciinema-edit
