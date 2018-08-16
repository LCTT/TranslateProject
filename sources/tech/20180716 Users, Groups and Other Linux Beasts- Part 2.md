Users, Groups and Other Linux Beasts: Part 2
======
![](https://www.linux.com/blog/learn/intro-to-linux/2018/7/users-groups-and-other-linux-beasts-part-2)
In this ongoing tour of Linux, we’ve looked at [how to manipulate folders/directories][1], and now we’re continuing our discussion of _permissions_ , _users_ and _groups_ , which are necessary to establish who can manipulate which files and directories. [Last time,][2] we showed how to create new users, and now we’re going to dive right back in:

You can create new groups and then add users to them at will with the `groupadd` command. For example, using:
```
sudo groupadd photos

```

will create the _photos_ group.

You’ll need to [create a directory][1] hanging off the root directory:
```
sudo mkdir /photos

```

If you run `ls -l /`, one of the lines will be:
```
drwxr-xr-x 1 root root 0 jun 26 21:14 photos

```

The first _root_ in the output is the user owner and the second _root_ is the group owner.

To transfer the ownership of the _/photos_ directory to the _photos_ group, use
```
chgrp photos /photos

```

The `chgrp` command typically takes two parameters, the first parameter is the group that will take ownership of the file or directory and the second is the file or directory you want to give over to the the group.

Next, run `ls -l /` and you'll see the line has changed to:
```
drwxr-xr-x 1 root photos 0 jun 26 21:14 photos

```

You have successfully transferred the ownership of your new directory over to the _photos_ group.

Then, add your own user and the _guest_ user to the _photos_ group:
```
sudo usermod <your username here> -a -G photos
sudo usermod guest -a -G photos

```

You may have to log out and log back in to see the changes, but, when you do, running `groups` will show _photos_ as one of the groups you belong to.

A couple of things to point out about the `usermod` command shown above. First: Be careful not to use the `-g` option instead of `-G`. The `-g` option changes your primary group and could lock you out of your stuff if you use it by accident. `-G`, on the other hand, _adds_ you to the groups listed and doesn't mess with the primary group. If you want to add your user to more groups than one, list them one after another, separated by commas, no spaces, after `-G`:
```
sudo usermod <your username> -a -G photos,pizza,spaceforce

```

Second: Be careful not to forget the `-a` parameter. The `-a` parameter stands for _append_ and attaches the list of groups you pass to `-G` to the ones you already belong to. This means that, if you don't include `-a`, the list of groups you already belong to, will be overwritten, again locking you out from stuff you need.

Neither of these are catastrophic problems, but it will mean you will have to add your user back manually to all the groups you belonged to, which can be a pain, especially if you have lost access to the _sudo_ and _wheel_ group.

### Permits, Please!

There is still one more thing to do before you can copy images to the _/photos_ directory. Notice how, when you did `ls -l /` above, permissions for that folder came back as _drwxr-xr-x_.

If you read [the article I recommended at the beginning of this post][3], you'll know that the first _d_ indicates that the entry in the file system is a directory, and then you have three sets of three characters ( _rwx_ , _r-x_ , _r-x_ ) that indicate the permissions for the user owner ( _rwx_ ) of the directory, then the group owner ( _r-x_ ), and finally the rest of the users ( _r-x_ ). This means that the only person who has write permissions so far, that is, the only person who can copy or create files in the _/photos_ directory, is the _root_ user.

But [that article I mentioned also tells you how to change the permissions for a directory or file][3]:
```
sudo chmod g+w /photos

```

Running `ls -l /` after that will give you _/photos_ permissions as _drwxrwxr-x_ which is what you want: group members can now write into the directory.

Now you can try and copy an image or, indeed, any other file to the directory and it should go through without a problem:
```
cp image.jpg /photos

```

The _guest_ user will also be able to read and write from the directory. They will also be able to read and write to it, and even move or delete files created by other users within the shared directory.

### Conclusion

The permissions and privileges system in Linux has been honed over decades. inherited as it is from the old Unix systems of yore. As such, it works very well and is well thought out. Becoming familiar with it is essential for any Linux sysadmin. In fact, you can't do much admining at all unless you understand it. But, it's not that hard.

Next time, we'll be dive into files and see the different ways of creating, manipulating, and destroying them in creative ways. Always fun, that last one.

See you then!

Learn more about Linux through the free ["Introduction to Linux" ][4]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/7/users-groups-and-other-linux-beasts-part-2

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.linux.com/blog/learn/2018/5/manipulating-directories-linux
[2]:https://www.linux.com/learn/intro-to-linux/2018/7/users-groups-and-other-linux-beasts
[3]:https://www.linux.com/learn/understanding-linux-file-permissions
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
