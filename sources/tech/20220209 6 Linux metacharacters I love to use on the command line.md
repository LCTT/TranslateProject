[#]: subject: "6 Linux metacharacters I love to use on the command line"
[#]: via: "https://opensource.com/article/22/2/metacharacters-linux"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

6 Linux metacharacters I love to use on the command line
======
Using metacharacters on the Linux command line is a great way to enhance
productivity.
![Terminal command prompt on orange background][1]

Early in my Linux journey, I learned how to use the command line. It's what sets Linux apart. I could lose the graphical user interface (GUI), but it was unnecessary to rebuild the machine completely. Many Linux computers run headless, and you can accomplish all the administrative tasks on the command line. It uses many basic commands that all are familiar with—like `ls`, `ls-l`, `ls-l`, `cd`, `pwd`, `top`, and many more.

### Shell metacharacters on Linux

You can extend each of those commands through the use of metacharacters. I didn't know what you called them, but metacharacters have made my life easier.

### Pipe |

Say that I want to know all the instances of Firefox running on my system. I can use the `ps` command with an `-ef` to list all instances of the programs running on my system. Now I'd like to see just those instances where Firefox is involved. I use one of my favorite metacharacters, the pipe `|` the result to `grep`, which searches for patterns. 


```
`$ ps -ef | grep firefox `
```

### Output redirection &gt;

Another favorite metacharacter is the output redirection `>`. I use it to print the results of all the instances that Intel mentioned as a result of a `dmesg` command. You may find this helpful in hardware troubleshooting. 


```


$ dmesg | grep amd &gt; amd.txt
$ cat amd.txt
[ 0.897] amd_uncore: 4 amd_df counters detected
[ 0.897] amd_uncore: 6 amd_l3 counters detected
[ 0.898] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).

```

### Asterisk *

The asterisk `*` or wildcard is a favorite when looking for files with the same extension—like `.jpg` or `.png`. I first change into the `Picture` directory on my system and use a command like the following: 


```


$ ls *.png
BlountScreenPicture.png
DisplaySettings.png
EbookStats.png
StrategicPlanMenu.png
Screenshot from 01-24 19-35-05.png

```

### Tilde ~

The tilde `~` is a quick way to get back to your home directory on a Linux system by entering the following command: 


```


$ cd ~
$ pwd
/home/don

```

### Dollar symbol $

The `$` symbol as a metacharacter has different meanings. When used to match patterns, it means any string that ends with a given string. For example, when using both metacharacters `|` and `$`: 


```


$ ls | grep png$
BlountScreenPicture.png
DisplaySettings.png
EbookStats.png
StrategicPlanMenu.png
Screenshot from 01-24 19-35-05.png

```

### Carat ^

The `^` symbol restricts results to items that start with a given string. For example, when using both metacharacters `|` and `^`: 


```


$ ls | grep ^Screen
Screenshot from 01-24 19-35-05.png

```

Many of these metacharacters are a gateway to [regular expressions][2], so there's a lot more to explore. What are your favorite Linux metacharacters, and how are they saving your work?

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/metacharacters-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://opensource.com/article/18/5/getting-started-regular-expressions
