[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manage music tags using metaflac)
[#]: via: (https://opensource.com/article/19/11/metaflac-fix-music-tags)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

How to manage music tags using metaflac
======
Correct music tagging errors from the command line with this powerful
open source utility.
![website design image][1]

I've been ripping CDs to my computer for a long time now. Over that time, I've used several different tools for ripping, and I have observed that each tool seems to have a different take on tagging, specifically, what metadata to save with the music data. By "observed," I mean that music players seem to sort albums in a funny order, they split tracks in one physical directory into two albums, or they create other sorts of frustrating irritations.

I've also learned that some of the tags are pretty obscure, and many music players and tag editors don't show them. Even so, they may use them for sorting or displaying music in some edge cases, like where the player separates all the music files containing tag XYZ into a different album from all the files not containing that tag.

So if the tagging applications and music players don't show the "weirdo" tags—but are somehow affected by them—what can you do?

### Metaflac to the rescue!

I have been meaning to get familiar with **[metaflac][2]**, the open source command-line metadata editor for [FLAC files][3], which is my open source music file format of choice. Not that there is anything wrong with great tag-editing software like [EasyTAG][4], but the old saying "if all you have is a hammer…" comes to mind. Also, from a practical perspective, my home and office stereo music needs are met by small, dedicated servers running [Armbian][5] and [MPD][6], with the music files stored locally, running a very stripped-down, music-only headless environment, so a command-line metadata management tool would be quite useful.

The screenshot below shows the typical problem created by my long-term ripping program: Putumayo's wonderful compilation of Colombian music appears as two separate albums, one containing a single track, the other containing the remaining 11:

![Album with incorrect tags][7]

I used metaflac to generate a list of all the tags for all of the FLAC files in the directory containing those tracks:


```
rm -f tags.txt
for f in *.flac; do
        echo $f &gt;&gt; tags.txt
        metaflac --export-tags-to=tags.tmp "$f"
        cat tags.tmp &gt;&gt; tags.txt
        rm tags.tmp
done
```

I saved this as an executable shell script (see my colleague [David Both][8]'s wonderful series of columns on Bash shell scripting, [particularly the one on loops][9]). Basically, what I'm doing here is creating a file, _tags.txt_, containing the filename (the **echo** command) followed by all its flags, followed by the next filename, and so forth. Here are the first few lines of the result:


```
A Guapi.flac
TITLE=A Guapi
ARTIST=Grupo Bahia
ALBUMARTIST=Various Artists
ALBUM=Putumayo Presents: Colombia
DATE=2001
TRACKTOTAL=12
GENRE=Latin Salsa
MUSICBRAINZ_ALBUMARTISTID=89ad4ac3-39f7-470e-963a-56509c546377
MUSICBRAINZ_ALBUMID=6e096386-1655-4781-967d-f4e32defb0a3
MUSICBRAINZ_ARTISTID=2993268d-feb6-4759-b497-a3ef76936671
DISCID=900a920c
ARTISTSORT=Grupo Bahia
MUSICBRAINZ_DISCID=RwEPU0UpVVR9iMP_nJexZjc_JCc-
COMPILATION=1
MUSICBRAINZ_TRACKID=8a067685-8707-48ff-9040-6a4df4d5b0ff
ALBUMARTISTSORT=50 de Joselito, Los
Cumbia Del Caribe.flac
```

After a bit of investigation, it turns out I ripped a number of my Putumayo CDs at the same time, and whatever software I was using at the time seems to have put the MUSICBRAINZ_ tags on all but one of the files. (A bug? Probably; I see this on a half-dozen albums.) Also, with respect to the sometimes unusual sorting, note the ALBUMARTISTSORT tag moved the Spanish article "Los" to the end of the artist name, after a comma.

I used a simple **awk** script to list all the tags reported in the _tags.txt_ file:


```
`awk -F= 'index($0,"=") > 0 {print $1}' tags.txt | sort -u`
```

This split all lines into fields using **=** as the field separator and prints the first field of lines containing an equals sign. The results are passed through sort with the **-u** flag, which eliminates all duplication in the output (see my colleague Seth Kenlon's great [article on the **sort** utility][10]). For this specific _tags.txt_ file, the output is:


```
ALBUM
ALBUMARTIST
ALBUMARTISTSORT
ARTIST
ARTISTSORT
COMPILATION
DATE
DISCID
GENRE
MUSICBRAINZ_ALBUMARTISTID
MUSICBRAINZ_ALBUMID
MUSICBRAINZ_ARTISTID
MUSICBRAINZ_DISCID
MUSICBRAINZ_TRACKID
TITLE
TRACKTOTAL
```

Sleuthing around a bit, I found that the MUSICBRAINZ_ flags appear on all but one FLAC file, so I used the metaflac command to delete those flags:


```
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_ALBUMARTISTID "$f"; done
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_ALBUMID "$f"; done
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_ARTISTID "$f"; done
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_DISCID "$f"; done
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_TRACKID "$f"; done
```

Once that's done, I can rebuild the MPD database with my music player. Here are the results:

![Album with correct tags][11]

And, there we are—all 12 tracks together in one album.

So, yeah, I'm lovin' metaflac a whole bunch. I expect I'll be using it more often as I try to wrangle the last bits of weirdness in my music collection's music tags. It's highly recommended!

### And the music

I've been spending a few evenings listening to Odario Williams' program _After Dark_ on CBC Music. (CBC is Canada's public broadcasting corporation.) Thanks to Odario, one of the albums I've really come to enjoy is [_Songs for Cello and Voice_ by Kevin Fox][12]. Here he is, covering the Eurythmics tune "[Sweet Dreams (Are Made of This)][13]."

I bought this on CD, and now it's on my music server with its tags properly organized!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/metaflac-fix-music-tags

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-design-monitor-website.png?itok=yUK7_qR0 (website design image)
[2]: https://xiph.org/flac/documentation_tools_metaflac.html
[3]: https://xiph.org/flac/index.html
[4]: https://wiki.gnome.org/Apps/EasyTAG
[5]: https://www.armbian.com/
[6]: https://www.musicpd.org/
[7]: https://opensource.com/sites/default/files/uploads/music-tags1_before.png (Album with incorrect tags)
[8]: https://opensource.com/users/dboth
[9]: https://opensource.com/article/19/10/programming-bash-loops
[10]: https://opensource.com/article/19/10/get-sorted-sort
[11]: https://opensource.com/sites/default/files/uploads/music-tags2_after.png (Album with correct tags)
[12]: https://burlingtonpac.ca/events/kevin-fox/
[13]: https://www.youtube.com/watch?v=uyN66XI1zp4
