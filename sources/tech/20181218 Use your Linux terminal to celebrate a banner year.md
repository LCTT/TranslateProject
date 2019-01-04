[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use your Linux terminal to celebrate a banner year)
[#]: via: (https://opensource.com/article/18/12/linux-toy-figlet)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Use your Linux terminal to celebrate a banner year
======
Need make sure your command is heard? Pipe it to a banner and it won't be missed.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-figlet.png?itok=o4XmTL-b)


Hello again for another installment in our 24-day-long Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself what a command-line toy even is. We’re figuring that out as we go, but generally, it could be a game, or any simple diversion that helps you have fun at the terminal.

Some of you will have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone.

Today's toy if **figlet** , a utility for printing text in banner form across your Linux terminal.

You'll likely find **figlet** packaged in your standard repositories. For me on Fedora, this meant installation was as simple as:

```
$ sudo dnf install figlet
```

After that, simply use the program's name to invoke it. You can either use it interactively, or, pipe some text to it, as below:

```
echo "Hello world" | figlet
 _   _      _ _                            _     _
| | | | ___| | | ___   __      _____  _ __| | __| |
| |_| |/ _ \ | |/ _ \  \ \ /\ / / _ \| '__| |/ _` |
|  _  |  __/ | | (_) |  \ V  V / (_) | |  | | (_| |
|_| |_|\___|_|_|\___/    \_/\_/ \___/|_|  |_|\__,_|
```

There are a number of different font options available for **figlet**. To see the options available to you, try the command **showfigfonts**. For me, this displayed over a dozen. I've copied out a few of my favorites below.

```
block :
                                           
_|        _|                      _|        
_|_|_|    _|    _|_|      _|_|_|  _|  _|    
_|    _|  _|  _|    _|  _|        _|_|      
_|    _|  _|  _|    _|  _|        _|  _|    
_|_|_|    _|    _|_|      _|_|_|  _|    _|  


bubble :
  _   _   _   _   _   _  
 / \ / \ / \ / \ / \ / \
( b | u | b | b | l | e )
 \_/ \_/ \_/ \_/ \_/ \_/


lean :
                                     
    _/                              
   _/    _/_/      _/_/_/  _/_/_/    
  _/  _/_/_/_/  _/    _/  _/    _/  
 _/  _/        _/    _/  _/    _/    
_/    _/_/_/    _/_/_/  _/    _/  


script :
                         
               o          
 ,   __   ,_        _ _|_
/ \_/    /  |  |  |/ \_|  
 \/ \___/   |_/|_/|__/ |_/
                 /|      
                 \|      
```

You can find out more about **figlet** on the project's [homepage][1]. The version I downloaded was made available as open source under an MIT license.

You'll find that **figlet** isn't the only banner-printer available for the Linux terminal. Another option that you may choose to check out is [toilet][2], which comes with its own set of ASCII-art style printing options.

Do you have a favorite command-line toy that you we should have included? Our calendar is basically set for the remainder of the series, but we'd still love to feature some cool command-line toys in the new year. Let me know in the comments below, and I'll check it out. And let me know what you thought of today's amusement.

Be sure to check out yesterday's toy, [Take a swim at your Linux terminal with asciiquarium][3], and come back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-figlet

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: http://www.figlet.org/
[2]: http://caca.zoy.org/wiki/toilet
[3]: https://opensource.com/article/18/12/linux-toy-asciiquarium
