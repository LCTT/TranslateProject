How to create a snap for timg with snapcraft on Ubuntu
============================================================

In this post we are going to see how to create a snap for a utility called [timg][14]. If this is the very first time you heard about snap installation packages, see [How to create your first snap][15].

Today we learn the following items about creating snaps with snapcraft,

*   the source of [timg][9] comes with a handmade Makefile, and requires to tinker a bit the [make plugin parameters.][10]

*   the program is written in C and requires a couple of external libraries. We make sure their relevant code has been added to the snap.

*   should we select [strict confinement][11] or [classic confinement][12]? We discuss how to choose between these two.

So, what does this [timg][16] do?

### Background

The Linux terminal emulators have become quite cool and they have colors!

 [![](https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/linux-terminal-standard-colors.png?resize=732%2C438&ssl=1)][17] 

Apart from the standard colors, most terminal emulators (like the GNOME Terminal depicted above) support true color (16 million colors!).

 [![](https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/gnome-terminal-true-color.png?resize=732%2C285&ssl=1)][18] 

Yes! True color in the terminal emulators! Get the AWK code from the page [True Colour (16 million colours) support in various terminal applications and terminals][19]
and test it yourself. You may notice in the code that it uses some [escape sequences][20] to specify the RGB value (256*256*256 ~= 16 million colors).

### What is timg?

Alright, back to the point of the post. What does [timg][21] do? Well, it takes an image as input and resizes it down to the character dimensions of your terminal window (for example, 80×25). And shows the image in color, just by using characters in color, in whatever resolution the terminal window is in!

 [![](https://i0.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-ubuntu-logo.png?resize=732%2C608&ssl=1)][22] 

This one is [the Ubuntu logo][23], a PNG image file, shown as colored block characters.

 [![](https://i0.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-flower.png?resize=732%2C608&ssl=1)][24] 

And here is [a flower, by @Doug8888][25].

[timg][26] would be especially helpful if you are connecting remotely to your server, minding your own business, and want to see what an image file looks like. Bam!

Apart from static images, [timg][27] can also display animated gifs! Let’s start snapping!

### Getting familiar with the timg source

The source of [timg][28] can be found at [https://github.com/hzeller/timg][29] Let’s try to compile it manually in order to get an idea what requirements it may have.

 [![](https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-install-from-source.png?resize=741%2C591&ssl=1)][30] 

The  _**Makefile**_  is in the  _**src/**_  subdirectory and not in the root directory of the project. At the github page they say to install these two development packages (GraphicsMagic++, WebP) and then  _**make**_  would simply work and generate the executable. In the screenshot I show for brevity that I have them already installed (after I read the Readme.md file about this).

Therefore, four mental notes when authoring the snapcraft.yaml file:

1.  The Makefile is in a subdirectory, src/, and not in the root directory of the project.

2.  The program requires two development libraries in order to compile.

3.  In order for timg to run as a snap, we need to somehow bundle these two libraries inside the snap (or link them statically).

4.  [timg][13] is written in C++ and requires g++. Let’s instruct the snapcraft.yaml file to check that the  _**build-essential**_  metapackage is installed before compiling.

### Starting off with snapcraft

Let’s create a directory  _**timg-snap/**_ , and run  _**snapcraft init**_  in there in order to create a skeleton  _**snapcraft.yaml**_  to work on.

```
ubuntu@snaps:~$ mkdir timg-snap
ubuntu@snaps:~$ cd timg-snap/
ubuntu@snaps:~/timg-snap$ snapcraft init
Created snap/snapcraft.yaml.
Edit the file to your liking or run `snapcraft` to get started
ubuntu@snaps:~/timg-snap$ cat snap/snapcraft.yaml 
name: my-snap-name # you probably want to 'snapcraft register <name>'
version: '0.1' # just for humans, typically '1.2+git' or '1.3.2'
summary: Single-line elevator pitch for your amazing snap # 79 char long summary
description: |
  This is my-snap's description. You have a paragraph or two to tell the
  most important story about your snap. Keep it under 100 words though,
  we live in tweetspace and your description wants to look good in the snap
  store.

grade: devel # must be 'stable' to release into candidate/stable channels
confinement: devmode # use 'strict' once you have the right plugs and slots

parts:
  my-part:
    # See 'snapcraft plugins'
    plugin: nil
```

### Filling in the metadata

The upper part of a snapcraft.yaml configuration file is the metadata. We fill them in in one go, and they are the easy part. The metadata consist of the following fields

1.  _**name**_ , the name of the snap as it will be known publicly at the Ubuntu Store.

2.  _**version**_ , the version of the snap. Can be an appropriate branch or tag in the source code repository, or the current date if no branch or tag exist.

3.  _**summary**_ , a short description under 80 characters.

4.  _**description**_ , a bit longer description, under 100 words.

5.  _**grade**_ , either  _**stable**_  or  _**devel**_ . We want to release the snap in the stable channel of the Ubuntu Store. We make sure the snap works, and write  _**stable**_  here.

6.  _**confinement**_ , initially we put  _**devmode**_  so as not to restrict the snap in any way. Once it works as  _**devmode**_ , we later consider whether to select  _**strict**_  or  _**classic**_ confinement.

For the name, we are going to use  _**timg,**_ 

```
ubuntu@snaps:~/timg-snap$ snapcraft register timg
Registering timg.
You already own the name 'timg'.
```

Yeah, I registered the name the other day :-).

Next, which version of timg?

 [![](https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-tag-095.png?resize=1005%2C480&ssl=1)][31] 

When we look for a branch or a tag in the repository, we find that there is a v0.9.5 tag, with the latest commit in 27th Jun 2016.

 [![](https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-master-commits.png?resize=992%2C466&ssl=1)][32] 

However, in the main branch ( _**master**_ ) there are two commits that look significant. Therefore, instead of using  _**tag v0.9.5**_ , we are snapping the  _**master**_  branch. We are using today’s date as the version,  _**20170226**_ .

We glean the summary and description from the repository. Therefore, the summary is  _A terminal image viewer_ , and the description is  _A viewer that uses 24-Bit color capabilities and unicode character blocks to display images in the terminal_ .

Finally, the  _**grade**_  will be  _**stable**_  and the  _**confinement**_  will be  _**devmode**_  (initially, until the snap actually works).

Here is the updated snapcraft.yaml with the completed metadata section:

```
ubuntu@snaps:~/timg-snap$ cat snap/snapcraft.yaml 
name: timg
version: '20170226'
summary: A terminal image viewer
description: |
  A viewer that uses 24-Bit color capabilities and unicode character blocks 
  to display images in the terminal.

grade: stable 
confinement: devmode

parts:
  my-part:
    # See 'snapcraft plugins'
    plugin: nil
```

### Figuring out the “parts:”

This is the moment where we want to replace the stub  _**parts:**_  section shown above with a real  _**parts:**_ .

<dl class="gallery-item" style="margin-right: 10px; margin-bottom: 15px; float: left; text-align: center; position: relative; outline: rgb(221, 221, 221) solid 1px; border: 4px solid rgb(255, 255, 255); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: hidden;">

<dt class="gallery-icon landscape" style="line-height: 20px;"> [![](https://i0.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-git-url.png?fit=420%2C284&ssl=1)][7] </dt>

<dd class="wp-caption-text gallery-caption" id="gallery-1-1732" style="font-size: 12px; line-height: 1.5; font-family: Oxygen, Verdana, Geneva, sans-serif; word-wrap: break-word; color: rgb(255, 255, 255); background-color: rgba(0, 0, 0, 0.7); max-height: 50%; padding-top: 6px; padding-bottom: 6px; bottom: 0px; position: absolute; width: 420px; opacity: 0; transition: all 0.3s ease;">The URL for the git repository.</dd>

</dl>

<dl class="gallery-item" style="margin-right: 10px; margin-bottom: 15px; float: left; text-align: center; position: relative; outline: rgb(221, 221, 221) solid 1px; border: 4px solid rgb(255, 255, 255); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: hidden;">

<dt class="gallery-icon landscape" style="line-height: 20px;"> [![](https://i0.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-makefile.png?fit=374%2C353&ssl=1)][8] </dt>

<dd class="wp-caption-text gallery-caption" id="gallery-1-1731" style="font-size: 12px; line-height: 1.5; font-family: Oxygen, Verdana, Geneva, sans-serif; word-wrap: break-word; color: rgb(255, 255, 255); background-color: rgba(0, 0, 0, 0.7); max-height: 50%; padding-top: 6px; padding-bottom: 6px; bottom: 0px; position: absolute; width: 374px; opacity: 0; transition: all 0.3s ease;">There is an existing Makefile, therefore the make plugin.</dd>

</dl>

We know the URL to the git repository and we have seen that there is an existing Makefile. The existing Makefile commands for [the make Snapcraft plugin][33]. As the documentation says,  _This plugin always runs ‘make’ followed by ‘make install’_ . In order to identify the  _**make**_  plugin, we went through [the list of available Snapcraft plugins][34].

Therefore, we initially change from the stub

```
parts:
  my-part:
    # See 'snapcraft plugins'
    plugin: nil
```

to

```
parts:
  timg:
    source: https://github.com/hzeller/timg.git
    plugin: make
```

Here is the current snapcraft.yaml,

```
name: timg
version: '20170226'
summary: A terminal image viewer
description: |
  A viewer that uses 24-Bit color capabilities and unicode character blocks 
  to display images in the terminal.

grade: stable 
confinement: devmode

parts:
  timg:
    source: https://github.com/hzeller/timg.git
    plugin: make
```

Let’s run the  _**snapcraft prime**_  command and see what happens!

```
ubuntu@snaps:~/timg-snap$ snapcraft prime
Preparing to pull timg 
Pulling timg 
Cloning into '/home/ubuntu/timg-snap/parts/timg/src'...
remote: Counting objects: 144, done.
remote: Total 144 (delta 0), reused 0 (delta 0), pack-reused 144
Receiving objects: 100% (144/144), 116.00 KiB | 0 bytes/s, done.
Resolving deltas: 100% (89/89), done.
Checking connectivity... done.
Preparing to build timg 
Building timg 
make -j4
make: *** No targets specified and no makefile found.  Stop.
Command '['/bin/sh', '/tmp/tmpem97fh9d', 'make', '-j4']' returned non-zero exit status 2
ubuntu@snaps:~/timg-snap$
```

 _**snapcraft**_  could not find a  _**Makefile**_  in the source and as we hinted earlier, the  _**Makefile**_  is only located inside the  _**src/**_  subdirectory. Can we instruct  _**snapcraft**_  to look into  _**src/**_  of the source for the  _**Makefile**_ ?

Each snapcraft plugin has its own options, and there are general shared options that relate to all plugins. In this case, we want to look into [the snapcraft options relating to the source code][35]. Here we go,

*   _`source-subdir`: pathSnapcraft will checkout the repository or unpack the archive referred to by the`source`keyword into`parts/<part-name>/src/`but it will only copy the specified subdirectory into`parts/<part-name>/build/`_ 

We have the appropriate option, let’s update the  _**parts:**_ 

```
parts:
  timg:
    source: https://github.com/hzeller/timg.git
    source-subdir: src
    plugin: make
```

And run  _**snapcraft**_  again!

```
ubuntu@snaps:~/timg-snap$ snapcraft prime 
The 'pull' step of 'timg' is out of date:

The 'source-subdir' part property appears to have changed.

Please clean that part's 'pull' step in order to continue
ubuntu@snaps:~/timg-snap$ snapcraft clean
Cleaning up priming area
Cleaning up staging area
Cleaning up parts directory
ubuntu@snaps:~/timg-snap$ snapcraft prime 
Skipping pull timg (already ran)
Preparing to build timg 
Building timg 
make -j4
g++ `GraphicsMagick++-config --cppflags --cxxflags` -Wall -O3 -fPIC -c -o timg.o timg.cc
g++ -Wall -O3 -fPIC   -c -o terminal-canvas.o terminal-canvas.cc
/bin/sh: 1: GraphicsMagick++-config: not found
timg.cc:33:22: fatal error: Magick++.h: No such file or directory
compilation terminated.
Makefile:10: recipe for target 'timg.o' failed
make: *** [timg.o] Error 1
make: *** Waiting for unfinished jobs....
Command '['/bin/sh', '/tmp/tmpeeyxj5kw', 'make', '-j4']' returned non-zero exit status 2
ubuntu@snaps:~/timg-snap$
```

Here it tells us that it cannot find the development library GraphicsMagick++. According to [the Snapcraft common keywords][36], we need to specify this development library so that Snapcraft can install it:

*   `build-packages`: [deb, deb, deb…]A  _**list**_  of Ubuntu packages to install on the build host before building the part. The files from these packages typically will not go into the final snap unless they contain libraries that are direct dependencies of binaries within the snap (in which case they’ll be discovered via`ldd`), or they are explicitly described in stage-packages.

Therefore, let’s find the name of the development package,

```
ubuntu@snaps:~/timg-snap$ apt-cache search graphicsmagick++ | grep dev
graphicsmagick-libmagick-dev-compat/xenial 1.3.23-1build1 all
libgraphicsmagick++1-dev/xenial 1.3.23-1build1 amd64
  format-independent image processing - C++ development files
libgraphicsmagick1-dev/xenial 1.3.23-1build1 amd64
  format-independent image processing - C development files
ubuntu@snaps:~/timg-snap$
```

The package name is a  _**lib**_  +  _**graphicsmagick++**_  and ends with  _**-dev**_ . We got it! Here is the updated  _**parts:**_ 

```
parts:
  timg:
    source: https://github.com/hzeller/timg.git
    source-subdir: src
    plugin: make
    build-packages: 
      - libgraphicsmagick++1-dev
```

Let’s run  _**snapcraft prime**_  again!

```
ubuntu@snaps:~/timg-snap$ snapcraft 
Installing build dependencies: libgraphicsmagick++1-dev
[...]
The following NEW packages will be installed:
  libgraphicsmagick++-q16-12 libgraphicsmagick++1-dev libgraphicsmagick-q16-3
  libgraphicsmagick1-dev libwebp5
[...]
Building timg 
make -j4
g++ `GraphicsMagick++-config --cppflags --cxxflags` -Wall -O3 -fPIC -c -o timg.o timg.cc
g++ -Wall -O3 -fPIC   -c -o terminal-canvas.o terminal-canvas.cc
g++ -o timg timg.o terminal-canvas.o `GraphicsMagick++-config --ldflags --libs`
/usr/bin/ld: cannot find -lwebp
collect2: error: ld returned 1 exit status
Makefile:7: recipe for target 'timg' failed
make: *** [timg] Error 1
Command '['/bin/sh', '/tmp/tmptma45jzl', 'make', '-j4']' returned non-zero exit status 2
ubuntu@snaps:~/timg-snap$
```

Simply by specifying the development library  _**libgraphicsmagick++1-dev**_ , Ubuntu also installs the code libraries, including  _**libgraphicsmagick++-q16-12**_ , along with the (dynamic) code library  _**libwebp.**_  

We still got an error, and the error is related to the  _**webp**_  library. The development version of the  _**webp**_  library (a static library) is missing. Let’s find it!

```
ubuntu@snaps:~/timg-snap$ apt-cache search libwebp | grep dev
libwebp-dev - Lossy compression of digital photographic images.
ubuntu@snaps:~/timg-snap$
```

Bingo! The  _**libwebp5 package**_  that was installed further up, provides only a dynamic (.so) library. By requiring the  _**libwebp-dev**_  package, we get the static (.a) library as well. Let’s update the **parts:** section!

```
parts:
  timg:
    source: https://github.com/hzeller/timg.git
    source-subdir: src
    plugin: make
    build-packages:
      - libgraphicsmagick++1-dev
      - libwebp-dev
```

Here is the updated snapcraft.yaml file,

```
name: timg
version: '20170226'
summary: A terminal image viewer
description: |
  A viewer that uses 24-Bit color capabilities and unicode character blocks 
  to display images in the terminal.

grade: stable 
confinement: devmode

parts:
  timg:
    source: https://github.com/hzeller/timg.git
    source-subdir: src
    plugin: make
    build-packages: 
      - libgraphicsmagick++1-dev
      - libwebp-dev
```

Let’s run  _**snapcraft**_ !

```
ubuntu@snaps:~/timg-snap$ snapcraft prime
Skipping pull timg (already ran)
Preparing to build timg 
Building timg 
make -j4
g++ `GraphicsMagick++-config --cppflags --cxxflags` -Wall -O3 -fPIC -c -o timg.o timg.cc
g++ -Wall -O3 -fPIC   -c -o terminal-canvas.o terminal-canvas.cc
g++ -o timg timg.o terminal-canvas.o `GraphicsMagick++-config --ldflags --libs`
make install DESTDIR=/home/ubuntu/timg-snap/parts/timg/install
install timg /usr/local/bin
install: cannot create regular file '/usr/local/bin/timg': Permission denied
Makefile:13: recipe for target 'install' failed
make: *** [install] Error 1
Command '['/bin/sh', '/tmp/tmptq_s1itc', 'make', 'install', 'DESTDIR=/home/ubuntu/timg-snap/parts/timg/install']' returned non-zero exit status 2
ubuntu@snaps:~/timg-snap$
```

We have a new problem. The  _**Makefile**_  was hand-crafted and does not obey the parameters of [the Snapcraft make plugin][37] to install into the  _**prime/**_  directory. The  _**Makefile**_ tries to install in  _**/usr/local/bin/ **_ !

We need to instruct [the Snapcraft make plugin][38] not to run  _**make install**_  but instead pick the generated executable  _**timg**_  and place it into the  _**prime/**_  directory. According to the documentation,

```
- artifacts:
 (list)
 Link/copy the given files from the make output to the snap
 installation directory. If specified, the 'make install'
 step will be skipped.
```

So, we need to put something in  _**artifacts:**_ . But what?

```
ubuntu@snaps:~/timg-snap/parts/timg$ ls build/src/
Makefile            terminal-canvas.h  timg*     timg.o
terminal-canvas.cc  terminal-canvas.o  timg.cc
ubuntu@snaps:~/timg-snap/parts/timg$
```

In the  _**build/**_  subdirectory we can find the  _**make**_  output. Since we specified  _**source-subdir: src**_ , our base directory for  _**artifacts:**_  is  _**build/src/**_ . And in there we can find the executable  _**timg**_ , which will be the parameter for  _**artifacts:**_ . With  _**artifacts:**_  we specify the files from the  _**make**_  output that will be copied to the snap installation directory (in  _**prime/**_ ).

Here is the updated  _**parts:**_  of snapcraft.yaml,

```
parts:
  timg:
    source: https://github.com/hzeller/timg.git
    source-subdir: src
    plugin: make
    build-packages: 
      - libgraphicsmagick++1-dev
      - libwebp-dev
    artifacts: [timg]
```

Let’s run  _**snapcraft prime**_ !

```
ubuntu@snaps:~/timg-snap$ snapcraft prime
Preparing to pull timg 
Pulling timg 
Cloning into '/home/ubuntu/timg-snap/parts/timg/src'...
remote: Counting objects: 144, done.
remote: Total 144 (delta 0), reused 0 (delta 0), pack-reused 144
Receiving objects: 100% (144/144), 116.00 KiB | 207.00 KiB/s, done.
Resolving deltas: 100% (89/89), done.
Checking connectivity... done.
Preparing to build timg 
Building timg 
make -j4
g++ `GraphicsMagick++-config --cppflags --cxxflags` -Wall -O3 -fPIC -c -o timg.o timg.cc
g++ -Wall -O3 -fPIC   -c -o terminal-canvas.o terminal-canvas.cc
g++ -o timg timg.o terminal-canvas.o `GraphicsMagick++-config --ldflags --libs`
Staging timg 
Priming timg 
ubuntu@snaps:~/timg-snap$
```

We are rolling!

### Exposing the command

Up to now, snapcraft generated the executable but did not expose a command for the users to run. We need to expose a command and this is done in the  _**apps:**_  section.

First of all, where is the command located in the  _**prime/**_  subdirectory?

```
ubuntu@snaps:~/timg-snap$ ls prime/
meta/  snap/  timg*  usr/
ubuntu@snaps:~/timg-snap$
```

It is in the root of the  _**prime/**_  subdirectory. We are ready to add the  _**apps:**_  section in snapcraft.yaml,

```
ubuntu@snaps:~/timg-snap$ cat snap/snapcraft.yaml 
name: timg
version: '20170226'
summary: A terminal image viewer
description: |
  A viewer that uses 24-Bit color capabilities and unicode character blocks 
  to display images in the terminal.

grade: stable 
confinement: devmode

apps:
  timg: 
    command: timg

parts:
  timg:
    source: https://github.com/hzeller/timg.git
    source-subdir: src
    plugin: make
    build-packages: 
      - libgraphicsmagick++1-dev
      - libwebp-dev
    artifacts: [timg]
```

Let’s run  _**snapcraft prime**_  again and then try the snap!

```
ubuntu@snaps:~/timg-snap$ snapcraft prime 
Skipping pull timg (already ran)
Skipping build timg (already ran)
Skipping stage timg (already ran)
Skipping prime timg (already ran)
ubuntu@snaps:~/timg-snap$ snap try --devmode prime/
timg 20170226 mounted from /home/ubuntu/timg-snap/prime
ubuntu@snaps:~/timg-snap$
```
 [![](https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-car.png?resize=741%2C455&ssl=1)][39] 

Image source: https://www.flickr.com/photos/mustangjoe/6091603784/

We used  _**snap try –devmode prime/**_  as a way to enable the snap and try the command. It is an efficient way for testing and avoids the alternative of generating .snap files, installing them, then uninstalling them. With  _**snap try prime/**_ , it uses directly the directory (in this case,  _**prime/**_ ) which has the snap content.

### Restricting the snap

Up to now, the snap has been running in  _**devmode**_  (developer mode), which is unrestricted. Let’s see how it runs in a confinement,

```
ubuntu@snaps:~/timg-snap$ snap list
Name           Version   Rev   Developer  Notes
core           16-2      1337  canonical  -
timg           20170226  x1               devmode,try
ubuntu@snaps:~/timg-snap$ snap try --jailmode prime
timg 20170226 mounted from /home/ubuntu/timg-snap/prime
ubuntu@snaps:~/timg-snap$ snap list
Name           Version   Rev   Developer  Notes
core           16-2      1337  canonical  -
timg           20170226  x2               jailmode,try
ubuntu@snaps:~/timg-snap$ timg pexels-photo-149813.jpeg 
Trouble loading pexels-photo-149813.jpeg (Magick: Unable to open file (pexels-photo-149813.jpeg) reported by magick/blob.c:2828 (OpenBlob))
ubuntu@snaps:~/timg-snap$
```

Here we quickly switch from  _**devmode**_  to  _**jailmode**_  ( _**confinement: strict**_ ) without having to touch the snapcraft.yaml file. As expected,  _**timg**_  could not read the image because we did not permit any access to the filesystem.

At this stage we need to make a decision. With  _**jailmode**_ , we can easily specify that a command has access to the files of the user’s $HOME directory, and only there. If an image file is located elsewhere, we can always copy of the $HOME directory and run  _**timg**_  on the copy in $HOME. If we are happy with this, we can set up snapcraft.yaml as follows:

```
name: timg
version: '20170226'
summary: A terminal image viewer
description: |
  A viewer that uses 24-Bit color capabilities and unicode character blocks 
  to display images in the terminal.

grade: stable 
confinement: strict

apps:
  timg: 
    command: timg
    plugs: [home]

parts:
  timg:
    source: https://github.com/hzeller/timg.git
    source-subdir: src
    plugin: make
    build-packages: 
      - libgraphicsmagick++1-dev
      - libwebp-dev
    artifacts: [timg]
```

On the other hand, if we want the  _**timg**_  snap to have read-access to all the filesystem, we can use  _**confinement: classic**_  and be done with it. Here is how snapcraft.yaml would look in that case,

```
name: timg
version: '20170226'
summary: A terminal image viewer
description: |
  A viewer that uses 24-Bit color capabilities and unicode character blocks 
  to display images in the terminal.

grade: stable 
confinement: classic

apps:
  timg: 
    command: timg

parts:
  timg:
    source: https://github.com/hzeller/timg.git
    source-subdir: src
    plugin: make
    build-packages: 
      - libgraphicsmagick++1-dev
      - libwebp-dev
    artifacts: [timg]
```

In the following we are selecting the option of the  _**strict**_  confinement. Therefore, images should be in the $HOME only.

### Packaging and testing

Let’s package the snap, that is, create the .snap file and try it out on a brand-new installation of Ubuntu!

```
ubuntu@snaps:~/timg-snap$ snapcraft 
Skipping pull timg (already ran)
Skipping build timg (already ran)
Skipping stage timg (already ran)
Skipping prime timg (already ran)
Snapping 'timg' \                                                 
Snapped timg_20170226_amd64.snap
ubuntu@snaps:~/timg-snap$
```

How do we get a brand new installation of Ubuntu in seconds so that we can test the snap?

See [Trying out LXD containers on our Ubuntu][40] and set up LXD on your system. Then, come back here and try the following commands,

```
$ lxc launch ubuntu:x snaptesting
Creating snaptesting
Starting snaptesting
$ lxc file push timg_20170226_amd64.snap snaptesting/home/ubuntu/
$ lxc exec snaptesting -- sudo su - ubuntu
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@snaptesting:~$ ls
timg_20170226_amd64.snap
ubuntu@snaptesting:~$ snap install timg_20170226_amd64.snap 
error: access denied (try with sudo)
ubuntu@snaptesting:~$ sudo snap install timg_20170226_amd64.snap
error: cannot find signatures with metadata for snap "timg_20170226_amd64.snap"
ubuntu@snaptesting:~$ sudo snap install timg_20170226_amd64.snap --dangerous
error: cannot perform the following tasks:
- Mount snap "core" (1337) ([start snap-core-1337.mount] failed with exit status 1: Job for snap-core-1337.mount failed. See "systemctl status snap-core-1337.mount" and "journalctl -xe" for details.
)
ubuntu@snaptesting:~$ sudo apt install squashfuse
[...]
Setting up squashfuse (0.1.100-0ubuntu1~ubuntu16.04.1) ...
ubuntu@snaptesting:~$ sudo snap install timg_20170226_amd64.snap --dangerous
timg 20170226 installed
ubuntu@snaptesting:~$ wget https://farm7.staticflickr.com/6187/6091603784_d6960c8be2_z_d.jpg
[...]
2017-02-26 22:12:18 (636 KB/s) - ‘6091603784_d6960c8be2_z_d.jpg’ saved [240886/240886]
ubuntu@snaptesting:~$ timg 6091603784_d6960c8be2_z_d.jpg 
[it worked!]
ubuntu@snaptesting:~$
```

So, we launched an LXD container called  _**snaptesting**_ , then copied in there the .snap file. Then, we connected to the container as a normal user and tried to install the snap. Initially, the installation failed because we need  _**sudo**_  when we install snaps in unprivileged LXD containers. It again failed because the .snap was unsigned (we need the  _**–dangerous**_  parameter). Then, it further failed because we need to install the  _**squashfuse**_  package (not preinstalled in the Ubuntu 16.04 images). Eventually, the snap was installed and we managed to view the image.

It is important to test a snap in a brand new installation of Linux in order to make sure whether we need to  _**stage**_  any code library inside the snap. In this case, static libraries were used and all went well!

### Publishing to the Ubuntu Store

Here are [the instructions to publish a snap to the Ubuntu Store][41]. We have already published a few snaps in the previous tutorials. For  _**timg**_ , we got  _**confinement: strict**_ , and  _**grade: stable**_ . We are therefore publishing in the stable channel.

```
$ snapcraft push timg_20170226_amd64.snap 
Pushing 'timg_20170226_amd64.snap' to the store.
Uploading timg_20170226_amd64.snap [                                       ]   0%
Uploading timg_20170226_amd64.snap [=======================================] 100%
Ready to release!|                                                               
Revision 6 of 'timg' created.
$ snapcraft release timg 6 stable
Track    Arch    Series    Channel    Version    Revision
latest   amd64   16        stable     20170226   6
                           candidate  ^          ^
                           beta       0.9.5      5
                           edge       0.9.5      5
The 'stable' channel is now open.
```

We pushed the .snap file to the Ubuntu Store and we got a  _**revision number 6**_ . Then, we released the  _**timg revision 6**_  to the  _**stable**_  channel of the Ubuntu Store.

There was no released snap in the  _**candidate**_  channel, therefore, it inherits the package from the  _**stable**_  channel. Hence, the  _**^**_  characters.

In previous tests I uploaded some older versions of the snap to the  _**beta**_  and  _**edge**_  channels. These older versions refer to the old  _**tag 0.9.****5**_  of the  _**timg**_  source code.

Let’s knock down the old 0.9.5 by releasing the stable version to the  _**beta**_  and  _**edge**_  channels as well.

```
$ snapcraft release timg 6 beta
Track    Arch    Series    Channel    Version    Revision
latest   amd64   16        stable     20170226   6
                           candidate  ^          ^
                           beta       20170226   6
                           edge       0.9.5      5
$ snapcraft release timg 6 edge
Track    Arch    Series    Channel    Version    Revision
latest   amd64   16        stable     20170226   6
                           candidate  ^          ^
                           beta       20170226   6
                           edge       20170226   6
```

### Playing with timg

Let’s run timg without parameters,

```
ubuntu@snaptesting:~$ timg
Expected image filename.
usage: /snap/timg/x1/timg [options] <image> [<image>...]
Options:
    -g<w>x<h>  : Output pixel geometry. Default from terminal 80x48
    -s[<ms>]   : Scroll horizontally (optionally: delay ms (60)).
    -d<dx:dy>  : delta x and delta y when scrolling (default: 1:0).
    -w<seconds>: If multiple images given: Wait time between (default: 0.0).
    -t<seconds>: Only animation or scrolling: stop after this time.
    -c<num>    : Only Animation or scrolling: number of runs through a full cycle.
    -C         : Clear screen before showing image.
    -F         : Print filename before showing picture.
    -v         : Print version and exit.
If both -c and -t are given, whatever comes first stops.
If both -w and -t are given for some animation/scroll, -t takes precedence
ubuntu@snaptesting:~$
```

Here it says that for the current zoom level of our terminal emulator, our resolution is a mere 80×48.

Let’s zoom out a bit and maximize the GNOME Terminal window.

```
    -g<w>x<h>  : Output pixel geometry. Default from terminal 635x428
```

It is a better resolution but I can hardly see the characters because they are too small. Let’s invoke the old command to show this car again.

 [![](https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-zoomout-max.png?resize=449%2C304&ssl=1)][42] 

What you are seeing is the resized image (from 1080p). Looks great, even if it is made of colored text characters!

What next?  _**timg**_  can play animated gifs as well!

```
$ wget https://m.popkey.co/9b7141/QbAV_f-maxage-0.gif -O JonahHillAmazed.gif$ timg JonahHillAmazed.gif
```

Try to install the  _**timg**_  snap yourself in order to experience the animated gif! Failing that, watch the asciinema recording (if the video looks choppy, run it a second time), [https://asciinema.org/a/dezbe2gpye84e0pjndp8t0pvh][43]

Thanks for reading!

--------------------------------------------------------------------------------

via: https://blog.simos.info/how-to-create-a-snap-for-timg-with-snapcraft-on-ubuntu/

作者：[Mi blog lah ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.simos.info/
[1]:https://blog.simos.info/category/general/
[2]:https://blog.simos.info/category/open-source/linux/
[3]:https://blog.simos.info/category/open-source/
[4]:https://blog.simos.info/category/planet-ubuntu/
[5]:https://blog.simos.info/category/ubuntu/
[6]:https://blog.simos.info/category/ubuntu-gr-2/
[7]:https://blog.simos.info/how-to-create-a-snap-for-timg-with-snapcraft-on-ubuntu/timg-git-url/
[8]:https://blog.simos.info/how-to-create-a-snap-for-timg-with-snapcraft-on-ubuntu/timg-makefile/
[9]:https://github.com/hzeller/timg
[10]:https://snapcraft.io/docs/reference/plugins/make
[11]:https://snapcraft.io/docs/reference/confinement
[12]:https://snapcraft.io/docs/reference/confinement
[13]:https://github.com/hzeller/timg
[14]:https://github.com/hzeller/timg
[15]:https://tutorials.ubuntu.com/tutorial/create-first-snap
[16]:https://github.com/hzeller/timg
[17]:https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/linux-terminal-standard-colors.png?ssl=1
[18]:https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/gnome-terminal-true-color.png?ssl=1
[19]:https://gist.github.com/XVilka/8346728
[20]:https://en.wikipedia.org/wiki/Escape_sequence
[21]:https://github.com/hzeller/timg
[22]:https://i0.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-ubuntu-logo.png?ssl=1
[23]:http://design.ubuntu.com/wp-content/uploads/ubuntu-logo112.png
[24]:https://i0.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-flower.png?ssl=1
[25]:https://www.flickr.com/photos/doug88888/5776072628/in/photolist-9WCiNQ-7U3Trc-7YUZBL-5DwkEQ-6e1iT8-a372aS-5F75aL-a1gbow-6eNayj-8gWK2H-5CtH7P-6jVqZv-86RpwN-a2nEnB-aiRmsc-6aKvwK-8hmXrN-5CWDNP-62hWM8-a9smn1-ahQqHw-a22p3w-a36csK-ahN4Pv-7VEmnt-ahMSiT-9NpTa7-5A3Pon-ai7DL7-9TKCqV-ahr7gN-a1boqP-83ZzpH-9Sqjmq-5xujdi-7UmDVb-6J2zQR-5wAGNR-5eERar-5KVDym-5dL8SZ-5S2Uut-7RVyHg-9Z6MAt-aiRiT4-5tLesw-aGLSv6-5ftp6j-5wAVBq-5T2KAP
[26]:https://github.com/hzeller/timg
[27]:https://github.com/hzeller/timg
[28]:https://github.com/hzeller/timg
[29]:https://github.com/hzeller/timg
[30]:https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-install-from-source.png?ssl=1
[31]:https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-tag-095.png?ssl=1
[32]:https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-master-commits.png?ssl=1
[33]:https://snapcraft.io/docs/reference/plugins/make
[34]:https://snapcraft.io/docs/reference/plugins/
[35]:https://snapcraft.io/docs/reference/plugins/source
[36]:https://snapcraft.io/docs/reference/plugins/common
[37]:https://snapcraft.io/docs/reference/plugins/make
[38]:https://snapcraft.io/docs/reference/plugins/make
[39]:https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-car.png?ssl=1
[40]:https://blog.simos.info/trying-out-lxd-containers-on-our-ubuntu/
[41]:https://snapcraft.io/docs/build-snaps/publish
[42]:https://i1.wp.com/blog.simos.info/wp-content/uploads/2017/02/timg-zoomout-max.png?ssl=1
[43]:https://asciinema.org/a/dezbe2gpye84e0pjndp8t0pvh
