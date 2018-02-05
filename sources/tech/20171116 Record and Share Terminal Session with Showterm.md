Record and Share Terminal Session with Showterm
======

![](https://www.maketecheasier.com/assets/uploads/2017/11/record-terminal-session.jpg)

You can easily record your terminal sessions with virtually all screen recording programs. However, you are very likely to end up with an oversized video file. There are several terminal recorders available in Linux, each with its own strengths and weakness. Showterm is a tool that makes it pretty easy to record terminal sessions, upload them, share, and embed them in any web page. On the plus side, you don't end up with any huge file to deal with.

Showterm is open source, and the project can be found on this [GitHub page][1].

 **Related** : [2 Simple Applications That Record Your Terminal Session as Video [Linux]][2]

### Installing Showterm for Linux

Showterm requires that you have Ruby installed on your computer. Here's how to go about installing the program.
```
gem install showterm
```

If you don't have Ruby installed on your Linux system:
```
sudo curl showterm.io/showterm > ~/bin/showterm
sudo chmod +x ~/bin/showterm
```

If you just want to run the application without installation:
```
bash <(curl record.showterm.io)
```

You can type `showterm --help` for the help screen. If a help page doesn't appear, showterm is probably not installed. Now that you have Showterm installed (or are running the standalone version), let us dive into using the tool to record.

 **Related** : [How to Record Terminal Session in Ubuntu][3]

### Recording Terminal Session

![showterm terminal][4]

Recording a terminal session is pretty simple. From the command line run `showterm`. This should start the terminal recording in the background. All commands entered in the command line from hereon are recorded by Showterm. Once you are done recording, press Ctrl + D or type `exit` in the command line to stop your recording.

Showterm should upload your video and output a link to the video that looks like http://showterm.io/<long alpha-numeric characters>. It is rather unfortunate that terminal sessions are uploaded right away without any prompting. Don't panic! You can delete any uploaded recording by entering `showterm --delete <recording URL>`. Before uploading your recordings, you'll have the chance to change the timing by adding the `-e` option to the showterm command. If by any chance a recording fails to upload, you can use `showterm --retry <script> <times>` to force a retry.

When viewing your recordings, the timing of the video can also be controlled by appending "#slow," "#fast," or "#stop" to the URL. Slow makes the video run at normal speed; fast doubles the speed; and stop, as the name suggests, stops the video.

Showterm terminal recordings can easily be embedded in web pages via iframes. This can be achieved by adding the iframe source to the showterm video URL as shown below.

![showtermio][5]

As an open source tool, Showterm allows for further customization. For instance, to run your own Showterm server, you need to run the command:
```
export SHOWTERM_SERVER=https://showterm.myorg.local/
```

so your client can communicate with it. Additional features can be added with little programming knowledge. The Showterm server project is available from this [GitHub page][1].

### Conclusion

In case you are thinking of sharing some command line tutorials with a colleague, be sure to remember Showterm. Showterm is text-based; hence, it will yield a relatively small-sized video compared to other screen recorders. The tool itself is pretty small in size - only a few kilobytes.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/record-terminal-session-showterm/

作者：[Bruno Edoh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/brunoedoh/
[1]:https://github.com/ConradIrwin/showterm
[2]:https://www.maketecheasier.com/record-terminal-session-as-video/ (2 Simple Applications That Record Your Terminal Session as Video [Linux])
[3]:https://www.maketecheasier.com/record-terminal-session-in-ubuntu/ (How to Record Terminal Session in Ubuntu)
[4]:https://www.maketecheasier.com/assets/uploads/2017/11/showterm-interface.png (showterm terminal)
[5]:https://www.maketecheasier.com/assets/uploads/2017/11/showterm-site.png (showtermio)
