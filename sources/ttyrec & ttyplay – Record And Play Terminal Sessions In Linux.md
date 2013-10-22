ttyrec & ttyplay – Record And Play Terminal Sessions In Linux
================================================================================
Sometimes you might want to record a terminal session in order to save a complex command line operation for your future reference or for knowledge sharing purpose. Then you might also want the recorded file size to be as small as possible and finally a player that would play the recorded file at a playback speed of your desire. In this article we will discuss two command line utilities (**ttyrec and ttyplay**) that let you record, save and play terminal sessions.

### ttyrec & ttyplay ###

As the names suggest, the ttyrec command is used for recording terminal sessions while the ttyplay command is used for playing the sessions recorded by ttyrec.

Here are the snapshots of the man pages of these utilities :

**> ttyrec**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ttyrec-main.png)

** > ttyplay **

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ttyplay-main.png)

### Testing Environment ###

- OS – Ubuntu 13.04
- Shell – Bash 4.2.45
- Application – ttyrec 1.0.8-5 & ttyplay 1.0.8-5

### A Brief Tutorial ###

Here is how you can use these commands to record and play terminal sessions.

**Step-1**

To start recording the terminal session, just run the following command :

    $ ttyrec [File-name]

The argument [**File-name**] (in the command shown above) is optional but if used, should be replaced by the a name of your choice. The recorded file will be saved with this name. If you do not specify any file name, ttyrec will use **ttyrecord** as the default file name.

**Step-2**

The session is now being recorded, yo can run the commands that you want to be recorded. The ttyrec command can even record sessions related to command line utilities like vi, nano, emacs, lynx etc.

**Step-3**

Once you are done with the terminal session, just execute the **exit** command and the recording session will end. The recorded file will be saved in the current directory.

You can play this file by running the following command :

    $ ttyplay [File-name]

The argument [**File-name**] is the name of the recorded file which is the same name that was passed as argument to **ttyrec** command. If no file name was used with ttyrec command then the default file name is **ttyrecord**.

Once you run ttyplay command, the playback of recorded session will start. Here are some of the hot-keys that you can use while the playback session is ON :

- Press ‘+’ or ‘f’ key to speed up the playback session to twice the normal playback speed.
- Press ‘-’ or ‘s’ key to slow down the playback session to half the normal playback speed.
- Press ’0′ to pause the playback.
- Press ’1′ to bring back the playback to normal speed.

Here are some of the other options supported by the ttyrec and ttyplay commands :

**> ttyrec**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ttyrec-1.png)

> ttyplay

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ttyplay-1.png)

There is another small utility **ttytime** that can be used to display the time of the session recorded by the ttyrec utility. It’s easy to use and requires only the recorded file name as the command line argument.

Here is an example :

    $ ttytime record_file 
         29    record_file

So you can see that the ttytime command displayed the time of session recorded in the file record_file.

Here is a useful video that describes the usage of ttyrec and ttyplay commands :

- [youtube video][1]

### Download/Install/Configure ###

Here are some of the important links related to these utilities :

- [Home Page][2]
- [Download Link][3]

You can download ttyrec, ttyplay and ttytime in one go by just installing ttyrec with any command line download manager like apt-get or yum. Ubuntu users can download and install these utilities through Ubuntu Software Centre also.

### Pros ###

- Lightweight and easy to use
- Can record sessions of various popular command line utilities like vi, nano, lynx etc.
- Almost no learning curve.

### Cons ###

- Doesn’t work on IRIX 6.4
- Depends on terminal size
- Doesn’t come pre-installed in most of the Linux distributions.

### Conclusion ###

If you are looking for some lightweight command line tools for recording and playing terminal sessions on Linux then ttyrec and ttyplay are ideal tools to get started. I really liked the ease with which they can be used. Try these utilities, you’ll not be disappointed.

**Have you ever used ttyrec, ttyplay or any other terminal recording/playing utility? Share your experience with us.**

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/ttyrec-ttyplay-record-and-play-terminal-sessions-in-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.youtube.com/embed/7znzFsc0P8M?version=3&rel=1&fs=1&showsearch=0&showinfo=1&iv_load_policy=1&wmode=transparent
[2]:http://0xcc.net/ttyrec/
[3]:http://0xcc.net/ttyrec/