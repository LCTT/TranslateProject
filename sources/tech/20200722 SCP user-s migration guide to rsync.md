[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SCP user’s migration guide to rsync)
[#]: via: (https://fedoramagazine.org/scp-users-migration-guide-to-rsync/)
[#]: author: (chasinglogic https://fedoramagazine.org/author/chasinglogic/)

SCP user’s migration guide to rsync
======

![][1]

As part of the [8.0 pre-release announcement,][2] the OpenSSH project stated that they consider the scp protocol outdated, inflexible, and not readily fixed. They then go on to recommend the use of sftp or rsync for file transfer instead.

Many users grew up on the _scp_ command, however, and so are not familiar with rsync. Additionally, rsync can do much more than just copy files, which can give a beginner the impression that it’s complicated and opaque. Especially when broadly the scp flags map directly to the cp flags while the rsync flags do not.

This article will provide an introduction and transition guide for anyone familiar with scp. Let’s jump into the most common scenarios: Copying Files and Copying Directories.

### Copying files

For copying a single file, the scp and rsync commands are effectively equivalent. Let’s say you need to ship _foo.txt_ to your home directory on a server named _server._

```
$ scp foo.txt me@server:/home/me/
```

The equivalent rsync command requires only that you type rsync instead of scp:

```
$ rsync foo.txt me@server:/home/me/
```

### Copying directories

For copying directories, things do diverge quite a bit and probably explains why rsync is seen as more complex than scp. If you want to copy the directory _bar_ to _server_ the corresponding scp command looks exactly like the cp command except for specifying ssh information:

```
$ scp -r bar/ me@server:/home/me/
```

With rsync, there are more considerations, as it’s a more powerful tool. First, let’s look at the simplest form:

```
$ rsync -r bar/ me@server:/home/me/
```

Looks simple right? For the simple case of a directory that contains only directories and regular files, this will work. However, rsync cares a lot about sending files exactly as they are on the host system. Let’s create a slightly more complex, but not uncommon, example.

```
# Create a multi-level directory structure
$ mkdir -p bar/baz
# Create a file at the root directory
$ touch bar/foo.txt
# Now create a symlink which points back up to this file
$ cd bar/baz
$ ln -s ../foo.txt link.txt
# Return to our original location
$ cd -
```

We now have a directory tree that looks like the following:

```
bar
├── baz
│   └── link.txt -> ../foo.txt
└── foo.txt

1 directory, 2 files
```

If we try the commands from above to copy bar, we’ll notice very different (and surprising) results. First, let’s give scp a go:

```
$ scp -r bar/ me@server:/home/me/
```

If you ssh into your server and look at the directory tree of bar you’ll notice an important and subtle difference from your host system:

```
bar
├── baz
│   └── link.txt
└── foo.txt

1 directory, 2 files
```

Note that _link.txt_ is no longer a symlink. It is now a full-blown copy of _foo.txt_. This might be surprising behavior if you’re used to _cp_. If you did try to copy the _bar_ directory using _cp -r_, you would get a new directory with the exact symlinks that _bar_ had. Now if we try the same rsync command from before we’ll get a warning:

```
$ rsync -r bar/ me@server:/home/me/
skipping non-regular file "bar/baz/link.txt"
```

Rsync has warned us that it found a non-regular file and is skipping it. Because you didn’t tell it to copy symlinks, it’s ignoring them. Rsync has an extensive manual section titled “SYMBOLIC LINKS” that explains all of the possible behavior options available to you. For our example, we need to add the –links flag.

```
$ rsync -r --links bar/ me@server:/home/me/
```

On the remote server we see that the symlink was copied over as a symlink. Note that this is different from how scp copied the symlink.

```
bar/
├── baz
│   └── link.txt -> ../foo.txt
└── foo.txt

1 directory, 2 files
```

To save some typing and take advantage of more file-preserving options, use the –archive (-a for short) flag whenever copying a directory. The archive flag will do what most people expect as it enables recursive copy, symlink copy, and many other options.

```
$ rsync -a bar/ me@server:/home/me/
```

The rsync man page has in-depth explanations of what the archive flag enables if you’re curious.

### Caveats

There is one caveat, however, to using rsync. It’s much easier to specify a non-standard ssh port with scp than with rsync. If _server_ was using port 8022 SSH connections, for instance, then those commands would look like this:

```
$ scp -P 8022 foo.txt me@server:/home/me/
```

With rsync, you have to specify the “remote shell” command to use. This defaults to _ssh_. You do so using the **-e flag.

```
$ rsync -e 'ssh -p 8022' foo.txt me@server:/home/me/
```

Rsync does use your ssh config; however, so if you are connecting to this server frequently, you can add the following snippet to your _~/.ssh/config_ file. Then you no longer need to specify the port for the rsync or ssh commands!

```
Host server
    Port 8022
```

Alternatively, if every server you connect to runs on the same non-standard port, you can configure the _RSYNC_RSH_ environment variable.

### Why else should you switch to rsync?

Now that we’ve covered the everyday use cases and caveats for switching from scp to rsync, let’s take some time to explore why you probably want to use rsync on its own merits. Many people have made the switch to rsync long before now on these merits alone.

#### In-flight compression

If you have a slow or otherwise limited network connection between you and your server, rsync can spend more CPU cycles to save network bandwidth. It does this by compressing data before sending it. Compression can be enabled with the -z flag.

#### Delta transfers

Rsync also only copies a file if the target file is different than the source file. This works recursively through directories. For instance, if you took our final bar example above and re-ran that rsync command multiple times, it would do no work after the initial transfer. Using rsync even for local copies is worth it if you know you will repeat them, such as backing up to a USB drive, for this feature alone as it can save a lot of time with large data sets.

#### Syncing

As the name implies, rsync can do more than just copy data. So far, we’ve only demonstrated how to copy files with rsync. If you instead want rsync to make the target directory look like your source directory, you can add the –delete flag to rsync. The delete flag makes it so rsync will copy files from the source directory which don’t exist on the target directory. Then it will remove files on the target directory which do not exist in the source directory. The result is the target directory is identical to the source directory. By contrast, scp will only ever add files to the target directory.

### Conclusion

For simple use cases, rsync is not significantly more complicated than the venerable scp tool. The only significant difference being the use of -a instead of -r for recursive copying of directories. However, as we saw rsync’s -a flag behaves more like cp’s -r flag than scp’s -r flag does.

Hopefully, with these new commands, you can speed up your file transfer workflow!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/scp-users-migration-guide-to-rsync/

作者：[chasinglogic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/chasinglogic/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/07/scp-rsync-816x345.png
[2]: https://lists.mindrot.org/pipermail/openssh-unix-dev/2019-March/037672.html
