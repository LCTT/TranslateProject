Get more done at the Linux command line with GNU Parallel
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR)

Do you ever get the funny feeling that your computer isn't quite as fast as it should be? I used to feel that way, and then I found GNU Parallel.

GNU Parallel is a shell utility for executing jobs in parallel. It can parse multiple inputs, thereby running your script or command against sets of data at the same time. You can use all your CPU at last!

If you've ever used `xargs`, you already know how to use Parallel. If you don't, then this article teaches you, along with many other use cases.

### Installing GNU Parallel

GNU Parallel may not come pre-installed on your Linux or BSD computer. Install it from your repository or ports collection. For example, on Fedora:
```
$ sudo dnf install parallel

```

Or on NetBSD:
```
# pkg_add parallel

```

If all else fails, refer to the [project homepage][1].

### From serial to parallel

As its name suggests, Parallel's strength is that it runs jobs in parallel rather than, as many of us still do, sequentially.

When you run one command against many objects, you're inherently creating a queue. Some number of objects can be processed by the command, and all the other objects just stand around and wait their turn. It's inefficient. Given enough data, there's always going to be a queue, but instead of having just one queue, why not have lots of small queues?

Imagine you have a folder full of images you want to convert from JPEG to PNG. There are many ways to do this. There's the manual way of opening each image in GIMP and exporting it to the new format. That's usually the worst possible way. It's not only time-intensive, it's labor-intensive.

A pretty neat variation on this theme is the shell-based solution:
```
$ convert 001.jpeg 001.png

$ convert 002.jpeg 002.png

$ convert 003.jpeg 003.png

... and so on ...

```

It's a great trick when you first learn it, and at first it's a vast improvement. No need for a GUI and constant clicking. But it's still labor-intensive.

Better still:
```
$ for i in *jpeg; do convert $i $i.png ; done

```

This, at least, sets the job(s) in motion and frees you up to do more productive things. The problem is, it's still a serial process. One image gets converted, and then the next one in the queue steps up for conversion, and so on until the queue has been emptied.

With Parallel:
```
$ find . -name "*jpeg" | parallel -I% --max-args 1 convert % %.png

```

This is a combination of two commands: the `find` command, which gathers the objects you want to operate on, and the `parallel` command, which sorts through the objects and makes sure everything gets processed as required.

  * `find . -name "*jpeg"` finds all files in the current directory that end in `jpeg`.
  * `parallel` invokes GNU Parallel.
  * `-I%` creates a placeholder, called `%`, to stand in for whatever `find` hands over to Parallel. You use this because otherwise you'd have to manually write a new command for each result of `find`, and that's exactly what you're trying to avoid.
  * `--max-args 1` limits the rate at which Parallel requests a new object from the queue. Since the command Parallel is running requires only one file, you limit the rate to 1. Were you doing a more complex command that required two files (such as `cat 001.txt 002.txt > new.txt`), you would limit the rate to 2.
  * `convert % %.png` is the command you want to run in Parallel.



The result of this command is that `find` gathers all relevant files and hands them over to `parallel`, which launches a job and immediately requests the next in line. Parallel continues to do this for as long as it is safe to launch new jobs without crippling your computer. As old jobs are completed, it replaces them with new ones, until all the data provided to it has been processed. What took 10 minutes before might take only 5 or 3 with Parallel.

### Multiple inputs

The `find` command is an excellent gateway to Parallel as long as you're familiar with `find` and `xargs` (collectively called GNU Find Utilities, or `findutils`). It provides a flexible interface that many Linux users are already comfortable with and is pretty easy to learn if you're a newcomer.

The `find` command is fairly straightforward: you provide `find` with a path to a directory you want to search and some portion of the file name you want to search for. Use wildcard characters to cast your net wider; in this example, the asterisk indicates anything, so `find` locates all files that end with the string `searchterm`:
```
$ find /path/to/directory -name "*searchterm"

```

By default, `find` returns the results of its search one item at a time, with one item per line:
```
$ find ~/graphics -name "*jpg"

/home/seth/graphics/001.jpg

/home/seth/graphics/cat.jpg

/home/seth/graphics/penguin.jpg

/home/seth/graphics/IMG_0135.jpg

```

When you pipe the results of `find` to `parallel`, each item on each line is treated as one argument to the command that `parallel` is arbitrating. If, on the other hand, you need to process more than one argument in one command, you can split up the way the data in the queue is handed over to `parallel`.

Here's a simple, unrealistic example, which I'll later turn into something more useful. You can follow along with this example, as long as you have GNU Parallel installed.

Assume you have four files. List them, one per line, to see exactly what you have:
```
$ echo ada &gt; ada ; echo lovelace &gt; lovelace

$ echo richard &gt; richard ; echo stallman &gt; stallman

$ ls -1

ada

lovelace

richard

stallman

```

You want to combine two files into a third that contains the contents of both files. This requires that Parallel has access to two files, so the `-I%` variable won't work in this case.

Parallel's default behavior is basically invisible:
```
$ ls -1 | parallel echo

ada

lovelace

richard

stallman

```

Now tell Parallel you want to get two objects per job:
```
$ ls -1 | parallel --max-args=2 echo

ada lovelace

richard stallman

```

Now the lines have been combined. Specifically, two results from `ls -1` are passed to Parallel all at once. That's the right number of arguments for this task, but they're effectively one argument right now: "ada lovelace" and "richard stallman." What you actually want is two distinct arguments per job.

Luckily, that technicality is parsed by Parallel itself. If you set `--max-args` to `2`, you get two variables, `{1}` and `{2}`, representing the first and second parts of the argument:
```
$ ls -1 | parallel --max-args=2 cat {1} {2} "&gt;" {1}_{2}.person

```

In this command, the variable `{1}` is ada or richard (depending on which job you look at) and `{2}` is either `lovelace` or `stallman`. The contents of the files are redirected with a redirect symbol in quotes (the quotes grab the redirect symbol from Bash so Parallel can use it) and placed into new files called `ada_lovelace.person` and `richard_stallman.person`.
```
$ ls -1

ada

ada_lovelace.person

lovelace

richard

richard_stallman.person

stallman



$ cat ada_*person

ada lovelace

$ cat ri*person

richard stallman

```

If you spend all day parsing log files that are hundreds of megabytes in size, you might see how parallelized text parsing could be useful to you; otherwise, this is mostly a demonstrative exercise.

However, this kind of processing is invaluable for more than just text parsing. Here's a real-life example from the film world. Consider a directory of video files and audio files that need to be joined together.
```
$ ls -1

12_LS_establishing-manor.avi

12_wildsound.flac

14_butler-dialogue-mixed.flac

14_MS_butler.avi

...and so on...

```

Using the same principles, a simple command can be created so that the files are combined in parallel:
```
$ ls -1 | parallel --max-args=2 ffmpeg -i {1} -i {2} -vcodec copy -acodec copy {1}.mkv

```

### Brute. Force.

All this fancy input and output parsing isn't to everyone's taste. If you prefer a more direct approach, you can throw commands at Parallel and walk away.

First, create a text file with one command on each line:
```
$ cat jobs2run

bzip2 oldstuff.tar

oggenc music.flac

opusenc ambiance.wav

convert bigfile.tiff small.jpeg

ffmepg -i foo.avi -v:b 12000k foo.mp4

xsltproc --output build/tmp.fo style/dm.xsl src/tmp.xml

bzip2 archive.tar

```

Then hand the file over to Parallel:
```
$ parallel --jobs 6 &lt; jobs2run

```

And now all jobs in your file are run in Parallel. If more jobs exist than jobs allowed, a queue is formed and maintained by Parallel until all jobs have run.

### Much, much more

GNU Parallel is a powerful and flexible tool, with far more use cases than can fit into this article. Its man page provides examples of really cool things you can do with it, from remote execution over SSH to incorporating Bash functions into your Parallel commands. There's even an extensive demonstration series on [YouTube][2], so you can learn from the GNU Parallel team directly. The GNU Parallel lead maintainer has also just released the command's official guide, available from [Lulu.com][3].

GNU Parallel has the power to change the way you compute, and if doesn't do that, it will at the very least change the time your computer spends computing. Try it today!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/gnu-parallel

作者：[Seth Kenlon][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[1]:https://www.gnu.org/software/parallel
[2]:https://www.youtube.com/watch?v=OpaiGYxkSuQ&list=PL284C9FF2488BC6D1
[3]:http://www.lulu.com/shop/ole-tange/gnu-parallel-2018/paperback/product-23558902.html
