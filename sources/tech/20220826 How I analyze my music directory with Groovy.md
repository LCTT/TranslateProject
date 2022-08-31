[#]: subject: "How I analyze my music directory with Groovy"
[#]: via: "https://opensource.com/article/22/8/groovy-script-java-music"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I analyze my music directory with Groovy
======
To simplify Java's clunkiness, I made a Groovy tool to analyze my music directory.

Lately, I’ve been looking at how Groovy streamlines the slight clunkiness of Java. In this article, I begin a short series to demonstrate Groovy scripting by creating a tool to analyze my music directory.

In this article, I demonstrate how the `groovy.File` class extends and streamlines `java.File` and simplifies its use. This provides a framework for looking at the contents of a music folder to ensure that expected content (for example, a `cover.jpg` file) is in place. I use the [JAudiotagger library][2] to analyze the tags of any music files.

### Install Java and Groovy

Groovy is based on Java and requires a Java installation. Both a recent and decent version of Java and Groovy might be in your Linux distribution's repositories. Groovy can also be installed directly from the [Apache Foundation website][3]. A nice alternative for Linux users is [SDKMan][4], which can be used to get multiple versions of Java, Groovy, and many other related tools. For this article, I use SDK's releases of:

* Java: version 11.0.12-open of OpenJDK 11
* Groovy: version 3.0.8

### Music metadata

Lately, I've consolidated my music consumption options. I've settled on using the excellent open source [Cantata][5] music player, which is a front end for the open source [MPD music player daemon][6]. All my computers have their music stored in the `/var/lib/mpd/music` directory. In that music directory are artist subdirectories, and in each artist subdirectory are album sub-subdirectories containing the music files, a `cover.jpg`, and occasionally PDFs of the liner notes.

Almost all of my music files are in FLAC format, with a few in MP3 and maybe a small handful in OGG. One reason I chose the JAudiotagger library is because it handles the different tag formats transparently. Of course, JAudiotagger is open source!

So what's the point of looking at audio tags? In my experience, audio tags are extremely poorly managed. The word "careless" comes to mind. But that may be as much a recognition of my own pedantic tendencies as real problems in the tags themselves. In any case, this is a non-trivial problem that can be solved with the use of Groovy and JAudiotagger. It's not only applicable to music collections, though. Many other real-world problems include the need to descend a directory tree in a filesystem to do something with the contents found there.

### Using the Groovy script

Here's the basic code required for this task. I've incorporated comments in the script that reflect the (relatively abbreviated) "comment notes" I typically leave for myself:

```
1        // Define the music libary directory
2        def musicLibraryDirName = '/var/lib/mpd/music'
3        // Print the CSV file header
4        println "artistDir|albumDir|contentFile"
5        // Iterate over each directory in the music libary directory
6        // These are assumed to be artist directories
7        new File(musicLibraryDirName).eachDir { artistDir ->
8            // Iterate over each directory in the artist directory
9            // These are assumed to be album directories
10            artistDir.eachDir { albumDir ->
11                // Iterate over each file in the album directory
12                // These are assumed to be content or related
13                // (cover.jpg, PDFs with liner notes etc)
14                albumDir.eachFile { contentFile ->
15                    println "$artistDir.name|$albumDir.name|$contentFile.name"
16                }
17            }
18        }
```

As noted above, I'm using `groovy.File` to move around the directory tree. Specifically:

Line 7 creates a new `groovy.File` object and calls `groovy.File.eachDir()` on it, with the code between the `{` on line 7 and the closing `}` on line 18 being a `groovy.Closure` argument to `eachDir()`.

What this means is that `eachDir()` executes that code for each subdirectory found in the directory. This is similar to a Java *lambda* (also called an "anonymous function"). The Groovy closure doesn't restrict access to the calling environment in the way lambda does (in recent versions of Groovy, you can use Java lambdas if you want to). As noted above, subdirectories within the music library directory are expected to be artist directories (for example, "Iron Butterfly" or "Giacomo Puccini") so the `artistDir` is the argument passed by `eachDir()` to the closure.

Line 10 calls `eachDir()` on each `artistDir`, with the code between the `{` on line 10 and the `}` on line 17 forming another closure which processes the `albumDir`.

Line 14, calls `eachFile()` on each `albumDir`, with the code between the `{` on line 14 and the `}` on line 16 forming the third-level closure that processes the contents of the album.

For the scope of this article, the only thing I need to do with each file is begin to build the table of information, which I'm creating as a bar-delimited CSV file that can be imported into [LibreOffice][7] or [OnlyOffice][8], or any other spreadsheet. Right now, the code writes out the first three columns: artist directory name, album directory name, and content file name (also, line 2 writes out the CSV header line).

Running this on my Linux laptop produces the following output:

```
$ groovy TagAnalyzer.groovy | head
artistDir|albumDir|contentFile
Habib Koite & Bamada|Afriki|02 - Ntesse.flac
Habib Koite & Bamada|Afriki|08 - NTeri.flac
Habib Koite & Bamada|Afriki|01 - Namania.flac
Habib Koite & Bamada|Afriki|07 - Barra.flac
Habib Koite & Bamada|Afriki|playlist.m3u
Habib Koite & Bamada|Afriki|04 - Fimani.flac
Habib Koite & Bamada|Afriki|10 - Massake.flac
Habib Koite & Bamada|Afriki|11 - Titati.flac
Habib Koite & Bamada|Afriki|03 – Africa.flac
[...]
Richard Crandell|Spring Steel|04-Japanese Lullaby [Richard Crandell].flac
Richard Crandell|Spring Steel|Spring Steel.pdf
Richard Crandell|Spring Steel|03-Zen Dagger [Richard Crandell].flac
Richard Crandell|Spring Steel|cover.jpg
$
```

In terms of performance:

```
$ time groovy TagAnalyzer.groovy | wc -l
9870

real        0m1.482s
user        0m4.392s
sys        0m0.230s
$
```

Nice and quick. It processes nearly 10,000 files in a second and a half! Plenty fast enough for me. Respectable performance, compact and readable code—what's not to like?

In my next article, I crack open the JAudiotagger interface and look at the tags in each file.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/groovy-script-java-music

作者：[Chris Hermansen][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/programming-code-keyboard-laptop-music-headphones.png
[2]: http://www.jthink.net/jaudiotagger/examples_read.jsp
[3]: https://groovy.apache.org/download.html
[4]: https://opensource.com/article/22/3/manage-java-versions-sdkman
[5]: https://opensource.com/article/17/8/cantata-music-linux
[6]: https://www.musicpd.org/
[7]: https://opensource.com/tags/libreoffice
[8]: https://opensource.com/article/20/7/nextcloud
