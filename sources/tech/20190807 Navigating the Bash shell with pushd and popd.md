[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Navigating the Bash shell with pushd and popd)
[#]: via: (https://opensource.com/article/19/8/navigating-bash-shell-pushd-popd)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/dnearyhttps://opensource.com/users/greg-phttps://opensource.com/users/shishz)

Navigating the Bash shell with pushd and popd
======
Pushd and popd are the fastest navigational commands you've never heard
of.
![bash logo on green background][1]

The **pushd** and **popd** commands are built-in features of the Bash shell to help you "bookmark" directories for quick navigation between locations on your hard drive. You might already feel that the terminal is an impossibly fast way to navigate your computer; in just a few key presses, you can go anywhere on your hard drive, attached storage, or network share. But that speed can break down when you find yourself going back and forth between directories, or when you get "lost" within your filesystem. Those are precisely the problems **pushd** and **popd** can help you solve.

### pushd

At its most basic, **pushd** is a lot like **cd**. It takes you from one directory to another. Assume you have a directory called **one**, which contains a subdirectory called **two**, which contains a subdirectory called **three**, and so on. If your current working directory is **one**, then you can move to **two** or **three** or anywhere with the **cd** command:


```
$ pwd
one
$ cd two/three
$ pwd
three
```

You can do the same with **pushd**:


```
$ pwd
one
$ pushd two/three
~/one/two/three ~/one
$ pwd
three
```

The end result of **pushd** is the same as **cd**, but there's an additional intermediate result: **pushd** echos your destination directory and your point of origin. This is your _directory stack_, and it is what makes **pushd** unique.

### Stacks

A stack, in computer terminology, refers to a collection of elements. In the context of this command, the elements are directories you have recently visited by using the **pushd** command. You can think of it as a history or a breadcrumb trail.

You can move all over your filesystem with **pushd**; each time, your previous and new locations are added to the stack:


```
$ pushd four
~/one/two/three/four ~/one/two/three ~/one
$ pushd five
~/one/two/three/four/five ~/one/two/three/four ~/one/two/three ~/one
```

### Navigating the stack

Once you've built up a stack, you can use it as a collection of bookmarks or fast-travel waypoints. For instance, assume that during a session you're doing a lot of work within the **~/one/two/three/four/five** directory structure of this example. You know you've been to **one** recently, but you can't remember where it's located in your **pushd** stack. You can view your stack with the **+0** (that's a plus sign followed by a zero) argument, which tells **pushd** not to change to any directory in your stack, but also prompts **pushd** to echo your current stack:


```
$ pushd +0
~/one/two/three/four ~/one/two/three ~/one ~/one/two/three/four/five
```

The first entry in your stack is your current location. You can confirm that with **pwd** as usual:


```
$ pwd
~/one/two/three/four
```

Starting at 0 (your current location and the first entry of your stack), the _second_ element in your stack is **~/one**, which is your desired destination. You can move forward in your stack using the **+2** option:


```
$ pushd +2
~/one ~/one/two/three/four/five ~/one/two/three/four ~/one/two/three
$ pwd
~/one
```

This changes your working directory to **~/one** and also has shifted the stack so that your new location is at the front.

You can also move backward in your stack. For instance, to quickly get to **~/one/two/three** given the example output, you can move back by one, keeping in mind that **pushd** starts with 0:


```
$ pushd -0
~/one/two/three ~/one ~/one/two/three/four/five ~/one/two/three/four
```

### Adding to the stack

You can continue to navigate your stack in this way, and it will remain a static listing of your recently visited directories. If you want to add a directory, just provide the directory's path. If a directory is new to the stack, it's added to the list just as you'd expect:


```
$ pushd /tmp
/tmp ~/one/two/three ~/one ~/one/two/three/four/five ~/one/two/three/four
```

But if it already exists in the stack, it's added a second time:


```
$ pushd ~/one
~/one /tmp ~/one/two/three ~/one ~/one/two/three/four/five ~/one/two/three/four
```

While the stack is often used as a list of directories you want quick access to, it is really a true history of where you've been. If you don't want a directory added redundantly to the stack, you must use the **+N** and **-N** notation.

### Removing directories from the stack

Your stack is, obviously, not immutable. You can add to it with **pushd** or remove items from it with **popd**.

For instance, assume you have just used **pushd** to add **~/one** to your stack, making **~/one** your current working directory. To remove the first (or "zeroeth," if you prefer) element:


```
$ pwd
~/one
$ popd +0
/tmp ~/one/two/three ~/one ~/one/two/three/four/five ~/one/two/three/four
$ pwd
~/one
```

Of course, you can remove any element, starting your count at 0:


```
$ pwd ~/one
$ popd +2
/tmp ~/one/two/three ~/one/two/three/four/five ~/one/two/three/four
$ pwd ~/one
```

You can also use **popd** from the back of your stack, again starting with 0. For example, to remove the final directory from your stack:


```
$ popd -0
/tmp ~/one/two/three ~/one/two/three/four/five
```

When used like this, **popd** does not change your working directory. It only manipulates your stack.

### Navigating with popd

The default behavior of **popd**, given no arguments, is to remove the first (zeroeth) item from your stack and make the next item your current working directory.

This is most useful as a quick-change command, when you are, for instance, working in two different directories and just need to duck away for a moment to some other location. You don't have to think about your directory stack if you don't need an elaborate history:


```
$ pwd
~/one
$ pushd ~/one/two/three/four/five
$ popd
$ pwd
~/one
```

You're also not required to use **pushd** and **popd** in rapid succession. If you use **pushd** to visit a different location, then get distracted for three hours chasing down a bug or doing research, you'll find your directory stack patiently waiting (unless you've ended your terminal session):


```
$ pwd ~/one
$ pushd /tmp
$ cd {/etc,/var,/usr}; sleep 2001
[...]
$ popd
$ pwd
~/one
```

### Pushd and popd in the real world

The **pushd** and **popd** commands are surprisingly useful. Once you learn them, you'll find excuses to put them to good use, and you'll get familiar with the concept of the directory stack. Getting comfortable with **pushd** was what helped me understand **git stash**, which is entirely unrelated to **pushd** but similar in conceptual intangibility.

Using **pushd** and **popd** in shell scripts can be tempting, but generally, it's probably best to avoid them. They aren't portable outside of Bash and Zsh, and they can be obtuse when you're re-reading a script (**pushd +3** is less clear than **cd $HOME/$DIR/$TMP** or similar).

Aside from these warnings, if you're a regular Bash or Zsh user, then you can and should try **pushd** and **popd**.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/navigating-bash-shell-pushd-popd

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/dnearyhttps://opensource.com/users/greg-phttps://opensource.com/users/shishz
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
