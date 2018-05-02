translating---geekpi

How to use FIND in Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux31x_cc.png?itok=Pvim4U-B)

In [a recent Opensource.com article][1], Lewis Cowles introduced the `find` command.

`find` is one of the more powerful and flexible command-line programs in the daily toolbox, so it's worth spending a little more time on it.

At a minimum, `find` takes a path to find things. For example:
```
find /

```

will find (and print) every file on the system. And since everything is a file, you will get a lot of output to sort through. This probably doesn't help you find what you're looking for. You can change the path argument to narrow things down a bit, but it's still not really any more helpful than using the `ls` command. So you need to think about what you're trying to locate.

Perhaps you want to find all the JPEG files in your home directory. The `-name` argument allows you to restrict your results to files that match the given pattern.
```
find ~ -name '*jpg'

```

But wait! What if some of them have an uppercase extension? `-iname` is like `-name`, but it is case-insensitive.
```
find ~ -iname '*jpg'

```

Great! But the 8.3 name scheme is so 1985. Some of the pictures might have a .jpeg extension. Fortunately, we can combine patterns with an "or," represented by `-o`.
```
find ~ ( -iname 'jpeg' -o -iname 'jpg' )

```

We're getting closer. But what if you have some directories that end in jpg? (Why you named a directory `bucketofjpg` instead of `pictures` is beyond me.) We can modify our command with the `-type` argument to look only for files.
```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f

```

Or maybe you'd like to find those oddly named directories so you can rename them later:
```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type d

```

It turns out you've been taking a lot of pictures lately, so let's narrow this down to files that have changed in the last week.
```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f -mtime -7

```

`ctime`), modification time (`mtime`), or access time (`atime`). These are in days, so if you want finer-grained control, you can express it in minutes instead (`cmin`, `mmin`, and `amin`, respectively). Unless you know exactly the time you want, you'll probably prefix the number with `+` (more than) or `–` (less than).

You can do time filters based on file status change time (), modification time (), or access time (). These are in days, so if you want finer-grained control, you can express it in minutes instead (, and, respectively). Unless you know exactly the time you want, you'll probably prefix the number with(more than) or(less than).

But maybe you don't care about your pictures. Maybe you're running out of disk space, so you want to find all the gigantic (let's define that as "greater than 1 gigabyte") files in the `log` directory:
```
find /var/log -size +1G

```

Or maybe you want to find all the files owned by bcotton in `/data`:
```
find /data -owner bcotton

```

You can also look for files based on permissions. Perhaps you want to find all the world-readable files in your home directory to make sure you're not oversharing.
```
find ~ -perm -o=r

```

This post only scratches the surface of what `find` can do. Combining tests with Boolean logic can give you incredible flexibility to find exactly the files you're looking for. And with arguments like `-exec` or `-delete`, you can have `find` take action on what it... finds. Have any favorite `find` expressions? Share them in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/how-use-find-linux

作者：[Ben Cotton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://opensource.com/article/18/4/how-find-files-linux
