translating by lujun9972
Saving window position in Xfce session
======

TLDR: If you're having problems saving window position in your Xfce session, enable save on logout and then log out and back in. This will probably fix the problem (permanently, if you like keeping the same session and turn saving back off again). See below for the details.

I've been using Xfce for my desktop for some years now, and have had a recurring problem with saved sessions after a reboot. After logging in, all the applications from my saved session would be started, but all the workspace and window positioning data would be lost, so they'd just pile onto the default workspace like a train wreck.

Various other people on-line have reported this over the years (there are open bugs in Ubuntu, Xfce, and Red Hat bug trackers), and there was apparently a related bug fixed in Xfce 4.10, but I'm using 4.12. I would have given up (and have several times in the past), except that on one of my systems this works correctly. All the windows go back to their proper positions.

Today, I dug into the difference and finally solved it. Here it is, in case someone else stumbles across it.

Some up-front caveats that are or may be related:

  1. I rarely log out of my Xfce session, since this is a single-user laptop. I hibernate and keep restoring until I decide to do a reboot for kernel patches, or (and this is somewhat more likely) some change to the system invalidates the hibernate image and the system hangs on restore from hibernate and I force-reboot it. I also only sometimes use the Xfce toolbar to do a reboot; often, I just run `reboot`.

  2. I use xterm and Emacs, which are not horribly sophisticated X applications and which don't remember their own window positioning.




Xfce stores sessions in `.cache/sessions` in your home directory. The key discovery on close inspection is that there were two types of files in that directory on the working system, and only one on the non-working system.

The typical file will have a name like `xfce4-session-hostname:0` and contains things like:
```
Client9_ClientId=2a654109b-e4d0-40e4-a910-e58717faa80b
Client9_Hostname=local/hostname
Client9_CloneCommand=xterm
Client9_RestartCommand=xterm,-xtsessionID,2a654109b-e4d0-40e4-a910-e58717faa80b
Client9_Program=xterm
Client9_UserId=user

```

This is the file that remembers all of the running applications. If you go into Settings -> Session and Startup and clear the session cache, files like this will be deleted. If you save your current session, a file like this will be created. This is how Xfce knows to start all of the same applications. But notice that nothing in the above preserves the positioning of the window. (I went down a rabbit hole thinking the session ID was somehow linking to that information elsewhere, but it's not.)

The working system had a second type of file in that directory named `xfwm4-2d4c9d4cb-5f6b-41b4-b9d7-5cf7ac3d7e49.state`. Looking in that file reveals entries like:
```
[CLIENT] 0x200000f
 [CLIENT_ID] 2a9e5b8ed-1851-4c11-82cf-e51710dcf733
 [CLIENT_LEADER] 0x200000f
 [RES_NAME] xterm
 [RES_CLASS] XTerm
 [WM_NAME] xterm
 [WM_COMMAND] (1) "xterm"
 [GEOMETRY] (860,35,817,1042)
 [GEOMETRY-MAXIMIZED] (860,35,817,1042)
 [SCREEN] 0
 [DESK] 2
 [FLAGS] 0x0

```

Notice the geometry and desk, which are exactly what we're looking for: the window location and the workspace it should be on. So the problem with window position not being saved was the absence of this file.

After some more digging, I discovered that while the first file is saved when you explicitly save your session, the second is not. However, it is saved on logout. So, I went to Settings -> Session and Startup and enabled automatically save session on logout in the General tab, logged out and back in again, and tada, the second file appeared. I then turned saving off again (since I set up my screens and then save them and don't want any subsequent changes saved unless I do so explicitly), and now my window position is reliably restored.

This also explains why some people see this and others don't: some people probably regularly use the Log Out button, and others ignore it and manually reboot (or just have their system crash).

Incidentally, this sort of problem, and the amount of digging that I had to do to solve it, is the reason why I'm in favor of writing man pages or some other documentation for every state file your software stores. Not only does it help people digging into weird problems, it helps you as the software author notice surprising oddities, like splitting session state across two separate state files, when you go to document them for the user.


--------------------------------------------------------------------------------

via: https://www.eyrie.org/~eagle/journal/2017-12/001.html

作者：[J. R. R. Tolkien][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.eyrie.org
