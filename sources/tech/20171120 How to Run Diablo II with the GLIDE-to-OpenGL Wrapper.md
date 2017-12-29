How to Run Diablo II with the GLIDE-to-OpenGL Wrapper
======
![](http://www.thelinuxrain.com/content/01-articles/198-how-to-run-diablo-2-glide-opengl-wrapper/headimage.jpg)

**[Diablo II][1] is usually a breeze to run on Linux, thanks to WINE and so often times you need no special tricks. However, if you're like me and experience a few glitches and washed out colours in the standard fullscreen mode, you have two options: run the game in windowed mode and go without cinematics, or install a GLIDE-OpenGL wrapper and get the game running properly in its fullscreen glory again, without the glitches and colour problems. I detail how to do that in this article.**

Yes, that's right, unless you run Diablo II in fullscreen, the cinematics won't work for some reason! I'm fairly sure this happens even on Windows if the game is in windowed mode, so while it's a curious side effect, it is what it is. And this is a game from 2001 we're talking about!

Old or not though, Diablo II is undoubtedly one of my favourite games of all time. While not exactly Linux related (the game itself has never had a Linux port), I've sunk countless hours into the game in years past. So it's very pleasing to me that the game is very easily playable in Linux using WINE and generally from what I've known the game has needed little to no modification to run properly in WINE. However, it seems since the patches released in the last couple of years that Blizzard removed DirectDraw as a video rendering option from the game for some reason, leaving the game with just one option - Direct3D. Which seems to be the culprit of the fullscreen issues, which apparently even happens on modern Windows machines, so we're not even necessarily talking about a WINE issue here.

For any users running into the fullscreen glitches and washed out colour palette, as long as you don't care about in-game cinematics and playing the game in a small 800x600 (the game's maximum resolution) window, you could just run the game in windowed mode (with the `-w` switch) and it will work fine.

Example:
```
wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Diablo\ II/Game.exe -w
```

However, again, no cinematics here. Which may not bother you, but for mine the movies are one of the great and memorable aspects of Diablo II. Thankfully, there is a way to get the game running fullscreen correctly, with working movies, and plus the technique also gets the game running in it's original 4:3 aspect ratio, instead of the weird stretched out 16:9 state it does by default. Again, this may not be your preference, but personally I like it! Let's get to it.

### The GLIDE to OpenGL wrapper

Okay, so we said that the game only has one video mode now, that being Direct3D. Well, that's not completely true - the game still has the ancient GLIDE/3DFX mode available and gamers for years have known that for whatever reason, Diablo II actually runs better with GLIDE than Direct3D for hardware that supports it.

Problem is... no modern video cards actually support the now defunct GLIDE anymore and 3DFX (the company) was taken over long ago by NVIDIA, so the whole thing kind of went the way of the dodo. Running the game with the `-3dfx` switch by default will only net you a crash to desktop (sad face).

Thankfully, there is a wrapper available, seemingly made specifically for Diablo II, that actually translates the GLIDE interface to OpenGL. And being Linux users, OpenGL certainly suits us.

So, assuming you have the game installed and fully patched (seriously, it's pretty much just click and install with WINE, exactly as you would in Windows. It's easy), you'll want to download the [GLIDE3-to-OpenGL-Wrapper by Sven Labusch][2].

Extract the files from the downloaded archive to your Diablo II game folder (eg. `~/.wine/drive_c/Program Files (x86)/Diablo II/`)

The following is [from a forum guide][3] originally for Windows users, but it worked fine for me on Linux as well. The first two steps you should have already done, but then follow the instructions to configure the wrapper. You'll obviously have to make sure that glide-init.exe is executed with WINE.

>  1) download GLIDE WRAPPER ( <http://www.svenswrapper.de/english/> ).
>  2) extract file in the Diablo 2 folder, where the 'Diablo II.exe' is.
>  3) launch glide-init.exe.
>  4) Click on 'English/Deutsch' to change the language to english.
>  5) Click on 'OpenGL Info', then 'Query OpenGL info', wait for the query to finish.
>  6) Click on 'Setting':
>  -uncheck 'windows-mode'.
>  -check 'captured mouse'.
>  -uncheck 'keep aspect ratio'.
>  -uncheck 'vertical synchronization'.
>  -select 'no' for 'fps-limit'.
>  -select '1600x1200' for 'static size.
>  -uncheck 'window extra'.
>  -select 'auto' for 'refreshrate'.
>  -check 'desktopresolution'.
>  7) Click on 'renderer':
>  -select '64 mb' for 'texture-memory'.
>  -select '2048x2048' for 'buffer texture size'.
>  -uncheck ALL box EXCEPT 'shader-gama'.
>  8) Click on 'Extension':
>  -check ALL box.
>  9) Click on 'Quit'.

Make sure to follow that procedure exactly.

Now, you should be able to launch the game with the `-3dfx` switch and be all good!
```
wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Diablo\ II/Game.exe -3dfx
```

![][4]

Yes, the black bars will be unavoidable with the 4:3 aspect ratio (I'm playing on a 27 inch monitor with 1080p resolution), but at least the game looks as it was originally intended. Actually playing the game I don't even notice the black borders.

### Making the switch persistent

If you want the game to always launch with the `-3dfx` switch, even from the applications menu shortcut, then simply open the .desktop file with your favourite text editor.

Example (with the Lord of Destruction expansion installed):
```
gedit .local/share/applications/wine/Programs/Diablo\ II/Diablo\ II\ -\ Lord\ of\ Destruction.desktop
```

And simply add the `-3dfx` switch to the end of the line beginning with " **Exec=** ". Make sure it's at the very end! And then save and exit.

And that's it! Running the game as standard from your applications menu should start the game up in its GLIDE/OpenGL magical glory.

Happy demon slaying!

### About the author

Andrew Powell is the editor and owner of The Linux Rain who loves all things Linux, gaming and everything in between.

--------------------------------------------------------------------------------

via: http://www.thelinuxrain.com/articles/how-to-run-diablo-2-glide-opengl-wrapper

作者：[Andrew Powell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.thelinuxrain.com
[1]:http://us.blizzard.com/en-us/games/d2/
[2]:http://www.svenswrapper.de/english/downloads.html
[3]:https://us.battle.net/forums/en/bnet/topic/20752595513
[4]:http://www.thelinuxrain.com/content/01-articles/198-how-to-run-diablo-2-glide-opengl-wrapper/diablo2-linux.jpg
