translating---geekpi

Simulating the Altair
======
The [Altair 8800][1] was a build-it-yourself home computer kit released in 1975. The Altair was basically the first personal computer, though it predated the advent of that term by several years. It is Adam (or Eve) to every Dell, HP, or Macbook out there.

Some people thought it’d be awesome to write an emulator for the Z80—a processor closely related to the Altair’s Intel 8080—and then thought it needed a simulation of the Altair’s control panel on top of it. So if you’ve ever wondered what it was like to use a computer in 1975, you can run the Altair on your Macbook:

![Altair 8800][2]

### Installing it

You can download Z80 pack from the FTP server available [here][3]. You’re looking for the latest Z80 pack release, something like `z80pack-1.26.tgz`.

First unpack the file:

```
$ tar -xvf z80pack-1.26.tgz
```

Move into the unpacked directory:

```
$ cd z80pack-1.26
```

The control panel simulation is based on a library called `frontpanel`. You’ll have to compile that library first. If you move into the `frontpanel` directory, you will find a `README` file listing the libraries own dependencies. Your experience here will almost certainly differ from mine, but perhaps my travails will be illustrative. I had the dependencies installed, but via [Homebrew][4]. To get the library to compile I just had to make sure that `/usr/local/include` was added to Clang’s include path in `Makefile.osx`.

If you’ve satisfied the dependencies, you should be able to compile the library (we’re now in `z80pack-1.26/frontpanel`:

```
$ make -f Makefile.osx ...
$ make -f Makefile.osx clean
```

You should end up with `libfrontpanel.so`. I copied this to `/usr/local/lib`.

The Altair simulator is under `z80pack-1.26/altairsim`. You now need to compile the simulator itself. Move into `z80pack-1.26/altairsim/srcsim` and run `make` once more:

```
$ make -f Makefile.osx ...
$ make -f Makefile.osx clean
```

That process will create an executable called `altairsim` one level up in `z80pack-1.26/altairsim`. Run that executable and you should see that iconic Altair control panel!

And if you really want to nerd out, read through the original [Altair manual][5].

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][6] on Twitter or subscribe to the [RSS feed][7] to make sure you know when a new post is out.

--------------------------------------------------------------------------------

via: https://twobithistory.org/2017/12/02/simulating-the-altair.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Altair_8800
[2]: https://www.autometer.de/unix4fun/z80pack/altair.png
[3]: http://www.autometer.de/unix4fun/z80pack/ftp/
[4]: http://brew.sh/
[5]: http://www.classiccmp.org/dunfield/altair/d/88opman.pdf
[6]: https://twitter.com/TwoBitHistory
[7]: https://twobithistory.org/feed.xml
