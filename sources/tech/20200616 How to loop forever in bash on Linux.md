[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to loop forever in bash on Linux)
[#]: via: (https://www.networkworld.com/article/3562576/how-to-loop-forever-in-bash-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to loop forever in bash on Linux
======

[tine ivanic][1] [(CC0)][2]

There are a number of ways to loop forever (or until you decide to stop) on Linux and you can do this on the command line or within scripts.

The **for** and **while** commands make the job quite easy. There are only a few things to keep in mind with respect to syntax and tactics.

**[ Also see [Invaluable tips and tricks for troubleshooting Linux][3]. ]**

### Using while

One of the easiest forever-loops involves using the **while** command followed by the condition "true". You don’t have to bother with logic like **while [ 1 -eq 1 ]** or similar tests. The **while true** test means the loop will run until you stop it with **CTRL-C**, close the terminal window or log out. Here's an example:

```
$ while true
> do
>   echo Keep running
>   sleep 3
> done
Keep running
Keep running
Keep running
^C
```

You can also do the same thing with **while :**. The key here is that the **:** always yields success so, like **while true**, this test doesn’t ever fail and the loop just keeps running.

```
$ while :
> do
>   echo Keep running
>   sleep 3
> done
Keep running
Keep running
^C
```

If you’ve inserted an infinite loop into a script and want to remind the person who is using it how to exit the script, you can always add a hint using the **echo** command:

```
while :
do
        echo Keep running
        echo "Press CTRL+C to exit"
        sleep 1
done
```

### Using for

The **for** command also provides an easy way to loop forever. While not quite as obvious as **while true**, the syntax is reasonably straightforward. You just replace the parameters in a bounded loop that would generally look something like this "start with c equal to 1 and increment it until reaches 5" specification:

```
$ for (( c=1; c<=5; c++ ))
```

with one that doesn’t specify any parameters:

```
$ for (( ; ; ))
```

With no start value, increment or exit test, this loop will run forever or until it is forcibly stopped.

```
$ for (( ; ; ))
> do
>    echo Keep running
>   echo “Press CTRL+C to exit”
>    sleep 2
> done
Keep your spirits up
Keep your spirits up
Keep your spirits up
```

### Why loop forever?

In real life, you’re not ever going to want to loop forever, but running until it’s time to go home, the work is done or you run into a problem is not at all unusual. Any loop that is constructed as an infinite loop can also be set up to be exited depending on various circumstances.

This script would keep processing data until 5 p.m. or the first time it checks the time after 5 p.m.:

```
#!/bin/bash

while true
do
  if [ `date +%H` -ge 17 ]; then
    exit        # exit script
  fi
  echo keep running
  ~/bin/process_data     # do some work
done
```

If you want to exit the loop instead of exiting the script, use a **break** command instead of an **exit**.

```
#!/bin/bash

while true
do
  if [ `date +%H` -ge 17 ]; then
    break       # exit loop
  fi
  echo keep running
  ~/bin/process_data
done
… run other commands here …
```

#### Wrap-Up

Looping forever is easy. Specifying the conditions under which you want to stop looping takes a little extra effort.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3562576/how-to-loop-forever-in-bash-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/u2d0BPZFXOY
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
