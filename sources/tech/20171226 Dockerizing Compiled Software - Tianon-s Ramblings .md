Dockerizing Compiled Software ┈ Tianon's Ramblings ✿
======
I recently went through a stint of closing a huge number of issues in the [docker-library/php][1] repository, and one of the oldest (and longest) discussions was related to installing depedencies for a compiling extensions, and I wrote a [semi-long comment][2] explaining how I do this in a general way for any software I wish to Dockerize.

I'm going to copy most of that comment here and perhaps expand a little bit more in order to have a better/cleaner place to link to!

The first step I take is to write the naive version of the `Dockerfile`: download the source, run `./configure && make` etc, clean up. I then try building my naive creation, and in doing so hope for an error message. (yes, really!)

The error message will usually take the form of something like `error: could not find "xyz.h"` or `error: libxyz development headers not found`.

If I'm building in Debian, I'll hit `https://packages.debian.org/file:xyz.h` (replacing "xyz.h" with the name of the header file from the error message), or even just Google something like "xyz.h debian", to figure out the name of the package I require.

If I'm building in Alpine, I'll use <https://pkgs.alpinelinux.org/contents> to perform a similar search.

The same works to some extent for "libxyz development headers", but in my experience Google works better for those since different distributions and projects will call these development packages by different names, so sometimes it's a little harder to figure out exactly which one is the "right" one to install.

Once I've got a package name, I add that package name to my `Dockerfile`, rinse, and repeat. Eventually, this usually leads to a successful build. Occationally I find that some library either isn't in Debian or Alpine, or isn't new enough, and I've also got to build it from source, but those instances are rare in my own experience - YMMV.

I'll also often check the source for the Debian (via <https://sources.debian.org>) or Alpine (via <https://git.alpinelinux.org/cgit/aports/tree>) package of the software I'm looking to compile, especially paying attention to `Build-Depends` (ala [`php7.0=7.0.26-1`'s `debian/control` file][3]) and/or `makedepends` (ala [`php7`'s `APKBUILD` file][4]) for package name clues.

Personally, I find this sort of detective work interesting and rewarding, but I realize I'm probably a bit of a unique creature. Another good technique I use occationally is to determine whether anyone else has already Dockerized the thing I'm trying to, so I can simply learn directly from their `Dockerfile` which packages I'll need to install.

For the specific case of PHP extensions, there's almost always someone who's already figured out what's necessary for this or that module, and all I have to do is some light detective work to find them.

Anyways, that's my method! Hope it's helpful, and happy hunting!

--------------------------------------------------------------------------------

via: https://tianon.github.io/post/2017/12/26/dockerize-compiled-software.html

作者：[Tianon Gravi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://tianon.github.io
[1]:https://github.com/docker-library/php
[2]:https://github.com/docker-library/php/issues/75#issuecomment-353673374
[3]:https://sources.debian.org/src/php7.0/7.0.26-1/debian/control/
[4]:https://git.alpinelinux.org/cgit/aports/tree/community/php7/APKBUILD?id=d0ca197f031f96d4664cafaa618aeccf94640a1e
