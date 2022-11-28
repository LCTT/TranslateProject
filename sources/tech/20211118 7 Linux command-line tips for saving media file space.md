[#]: subject: "7 Linux command-line tips for saving media file space"
[#]: via: "https://opensource.com/article/21/11/linux-commands-convert-files"
[#]: author: "Howard Fosdick https://opensource.com/users/howtech"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

7 Linux command-line tips for saving media file space
======
These commands make it simple to convert audio, image, and video files
quickly and maximize disk space.
![Command line prompt][1]

Have media files on your computer? You can likely reclaim significant disk space by storing that data in more space-efficient file formats.

This article demonstrates how to use Linux line commands to perform the most common space-saving conversions. I use line commands because they give you complete control over compression and format conversion features. Also, you'll need to use line commands if you want to write scripts. That allows you to develop programs that are custom-tailored to your own unique needs.

While this article covers terminal commands, there are many other ways to compress and convert files. You can install an open source conversion GUI application onto your computer, or you can even convert file formats using the `save as` and `export` functions of many common applications.

This article discusses only a handful of the most popular file formats and terminal commands among the hundreds that exist. The goal is to give you maximum benefit while keeping it simple.

### File deletion

Before you start your file-format conversions, it's helpful to identify and then delete any huge but unwanted files you have on your computer. Deleting just a handful of space hogs yields outsized benefits.

The [` du`][2], [`ncdu`][3], and [`dust`][4] commands list the biggest subdirectories under the current directory. They tell you which directories use the most disk space:


```
`$ du -a . | sort -n -r | head -n 50`
```

This command string identifies the 50 biggest files in its recursive directory tree. It lists those biggest files sorted by size:


```
`$ find  -type f  -exec  du -Sh {} +  |  sort -rh  |  head -n 50`
```

With this command, you can instantly recognize when you have large files stored in more than one location. Delete the duplicates, and you can reclaim some significant space. The output also helps you identify and then delete any big files you no longer need.

### Quality or storage space

Media files that hold images, audio, and video may use hundreds of different file formats. There's often a trade-off between data quality on the one hand and the storage space consumed on the other.

Some file formats are _lossless_: They preserve all the originally captured data. Lossless file formats can either be _uncompressed_ or _compressed_. They vary in size by this and other factors.

Other file formats are _lossy_. They save storage space by cleverly eliminating some of the least useful data. They're ideal if your use of the data is such that you can tolerate some minor data loss.

For example, capturing a digital image in a lossless format like RAW, PNG, or BMP creates a big file. Converting that image to a lossy alternative like JPG or WEBP saves lots of space. Is it worth it? That depends on your intended use of the image.

If you're a professional photographer who prints a photograph in a high-quality book, you probably want to keep your original lossless file. You likely require the highest quality image for your artwork. Your lossless file also means you can perform extensive image editing without losing quality.

If you're a website developer, you might make the opposite choice. Smaller lossy JPG or WEBP files download to users' computers much faster than lossless images, making your webpages load more quickly. This conversion works because few users can tell whether the image they view on their computer or cellphone screen is lossless or lossy.

Keep in mind that after you convert from a lossless format to a lossy one, you've removed some data. You can't convert back to regain that data. You can convert back to the previous format, but you do so without the data you've already sacrificed. Only delete the original file once you're satisfied that the converted file meets all your needs! You may choose not to delete the original file at all.

Sometimes, saving space is a matter of saving _convenient_ space. If original, lossless, uncompressed files are important to you for any reason, back them up to a separate storage location. You may not need that full-quality WAV file on your working computer every day, but you might be happy to have access to it later.

### Converting image files

Several popular bit-mapped file formats present great opportunities for saving space, including RAW, BMP, GIF, and TIFF. The widely-used PNG format is also a good candidate.

One possible conversion target for images is the lossy JPG format. With its quality settings, JPG allows you to specify a smaller file size with greater data loss or a larger file size with less loss. It might give you a compression ratio of up to 10:1 over some lossless formats. Yet if you display a JPG image on a computer or phone screen, the eye can rarely tell that conversion and compression have occurred.

A WEBP file looks just as good on screens as JPG files, but they save even more space. This savings is why WEBP is becoming the most popular lossy image format, supported by all modern browsers and most up-to-date apps. The WEBP format offers alpha transparency, animation, and good color radiance. It's nearly always used as a lossy format, though it supports lossless as well.

I converted most of my PNG and JPG files to WEBP format and reclaimed loads of storage space. On one disk, 500 megabytes of PNG files melted down to about 120 meg of WEBP. If you're certain that your images are only ever going to be displayed on a screen, converting to WEBP offers clear benefits.

The open source ImageMagick utility gives you Linux terminal commands to convert images. You probably need to install it first:


```
`$ sudo apt install imagemagick`
```

ImageMagick line commands help you reduce image file sizes through three techniques:

  * Changing the file format
  * Changing the degree of compression
  * Making the image smaller



Here's the syntax of the ImageMagick `convert` command that performs file format conversions:


```
`convert  [input options]  input_file   [output options]  output_file`
```

These examples all reduced file size, as you can see from the results of sample runs:


```


$ convert image.bmp  new_image.jpg   #  7.4MB down to 1.1MB
$ convert image.tiff new_image.jpg   #  7.4MB down to 1.1MB
$ convert image.png  new_image.webp  #  4.8MB down to 515KB
$ convert image.png  new_mage.webp   #  1.5MB down to 560KB
$ convert image.jpg  new_image.webp  #  769KB down to 512KB
$ convert image.gif  new_image.jpg   #  13.2MB down to 10.9MB
$ convert image.gif  new_image.webp  #  13.2MB down to 4.1MB

```

You can convert RAW images, too. When converting a RAW image, its filename must not have an extension for the `convert` command to process it correctly.


```
`$ convert image new_image.png #  RAW 67.1MB down to 45.3MB`
```

There are some significant space savings to be gained, but only if the output is acceptable for your use case.

This example saves space by resizing a JPG image to as near as 800x600 as possible while still retaining the proper aspect ratio. In this example, I convert a 285KB input file at 1277x824 pixels to a 51KB output file at 800x600 pixels.


```
`$ convert image.jpg  -resize 800x600  new_image.jpg`
```

The `convert` command can change images however you like. For example, you can specify the trade-off between image quality and size. But you'll have to wade through its many options to understand its full capabilities. For more about ImageMagick, read Greg Pittman's [Getting started with ImageMagick][5], or visit the [ImageMagick website][6].

### Converting audio files

Like image files, audio files come in _lossless uncompressed_, _lossless compressed_, and _lossy_ formats.

As with images, the trade-off between lossless and lossy is primarily data quality versus saving space. If you require the highest quality audio, stick with lossless files. That might be the case if you edit digitized music, for example. If you want listenable music that consumes far less space, most of the world has decided that lossy formats like MP3, M4A, and OPUS are the best choice.

Here are the most popular audio formats. Note that file extensions often refer to containers that can support more than one audio encoding format and that most technologies claim more than a single file extension. This chart lists the most common scenarios you'll see:

  * Lossless and uncompressed
    * WAV
    * PCM
    * AIFF
  * Lossless and compressed
    * FLAC
    * ALAC
  * Lossy
    * WEBM
    * OPUS
    * OGG (Vorbis)
    * AAC (some implementations of this are not open formats)
    * MP3
    * M4A
    * WMA (not an open format)



If your goal is to save disk space, try converting from a lossless format to a lossy one. Don’t convert from one lossy format to another unless you have to. That will likely degrade the sound quality too much.

A very flexible Linux terminal command to convert audio files is `ffmpeg`. To install it:


```
`$ sudo apt install ffmpeg`
```

Like the ImageMagick `convert` command, `ffmpeg` supports a staggering range of file formats and codecs. View them all by entering:


```
`$ ffmpeg -encoders`
```

Using `ffmpeg` is usually pretty straightforward. Here's the standard syntax. The `-i` flag identifies the input file, and the `-vn` flag tells `ffmpeg` not to invoke any video-related code that might alter the audio output:


```
`$ ffmpeg  -i  audiofile_input.ext -vn audiofile_output.new`
```

These examples all convert lossless WAV files into lossy formats to save space. The process to convert AIFF files is the same (but replace `.wav` with `.aiff`):


```


$ ffmpeg -i audio.wav -vn audio.ogg  # 38.3MB to 3.3MB
$ ffmpeg -i audio.wav -vn audio.mp3  # 38.3MB to 3.5MB
$ ffmpeg -i audio.wav -vn audio.m4a  # 38.3MB to 3.6MB
$ ffmpeg -i audio.wav -vn audio.webm # 38.3MB to 2.9MB

```

All the commands reduced the size of the lossless input files by a factor of 10. The big question: Do the outputs sound different from the originals? Well, it depends. To most people listening on most consumer devices, the difference is negligible. That's why MP3, M4A, and other compressed formats are the world's most popular music formats. Even though it's not technically the best, the audio is quite listenable, and it consumes a fraction of the storage space (or bandwidth, when streaming).

### Converting video files

Video conversion presents another chance to save lots of space. Your goal should be to find the video format that best balances playback quality and file size to meet your needs.

A _video format_ is the combination of a _container file format_ and a _codec_. A codec is software that encodes and decodes a data stream as it moves to and from the container file.

Containers can be paired with multiple codecs. In practice, there are often only one or two or three popular codecs paired with a particular container. For example, with audio files, WAV files can be encoded as either lossless or lossy, but lossless encoding predominates the format such that most people assume that any WAV file is lossless.

These are some of today's most widely used open source video formats:

  * The MP4 format, containing H.264 video and AAC audio, is used in BluRay and Internet streaming.
  * The WEBM format, containing VP9 video and Opus audio, is remarkably flexible and is used for both archival-quality files as well as smaller files for streaming.
  * The Matroska (MKV) container format can contain nearly any combination of video, audio, and even stereoscopic (3D) imagery. It's the basis for WEBM.



The main factors that determine video file size and quality are:

  * Resolution (dimension of the frame)
  * Bitrate
  * Encoding



The `ffmpeg` command can change all three parameters. Here's a simple conversion example:


```
`$ ffmpeg -i input_video.mov output.webm`
```

This conversion resulted in a 1.8 MB output file from a 39 MB input.

Because I didn't specify any parameters, `ffmpeg` copies most of the existing attributes of the input file. In this example, my input file was a MOV file containing MJPEG video with a resolution of 1280x720, a frame rate of 23.98, and a bitrate of 40,219 kilobytes per second (kbps). The resulting output file contains VP9 video with the same resolution and frame rate. However, the bitrate is only 1,893 kbps.

As with audio conversions, video compression ratios are impressive, and the potential space savings are enormous. On my PC, these conversions viewed so similarly to the original that it was difficult to tell whether there was any degradation—which, for my purposes, is as good as saying that there was no degradation.

Whether the output quality is acceptable to you depends on your intended use of the video, your viewing devices, and your expectations. Never erase your original file until you’ve reviewed the converted file and found it satisfactory.

### Archival storage

Archiving takes multiple input files—often of different file types—and collects them into a single output file. Compression is optional. A compressed archive is useful for sending files across the internet and for long-term data storage. It's a great way to save space. The downside is that you're limited in how you can process archived files until you extract them out of the archive (though some tools are now pretty sophisticated in their manipulation of files within archives).

Among the many archive file formats, the most popular compressed formats include GZ, BZ2, XZ, ZIP, and 7Z. The [`tar`][7] command handles many archive formats. It supports compression commands including `gzip`, `bzip2`, `xz`, and others.


```
`$ tar --xz --create --file myarchive.tar.xz bigfile.xcf bigfile.tiff`
```

This command reduced 56 MB down to a 28 MB compressed archive. How much compression occurs varies widely by the files involved. Some media files (especially those already in a compressed format) compress little or not at all.

To unarchive a TAR file, use the `--extract` option:


```
`$ tar --extract --file myarchive.tar.xz`
```

The `tar` command bundles many files into one container (sometimes called a _tarball_). If you're compressing only one file, however, there's no need for a container.

Instead, you can just compress the file with commands like `gzip`, `bzip2`, `xz`, `zip`, `7z`, and others.


```


$ xz bigfile.xcf
$ ls
bigfile.xcf.xz

```

To uncompress a compressed file, you can usually use an "un" version of the command you used to compress the file:


```
`$ unxz bigfile.xcf.xz`
```

Sometimes there's also a `--decompress` option:


```
`$ xz --decompress bigfile.xcf.xz`
```

Not all Linux distributions include all these commands, so you may have to install some of them.

### Scripting tips

To convert all the files in a directory, simply embed your conversion command within a [`for` loop][8]. Place double quotes around the filename variable to handle any filenames that contain embedded spaces. This script converts all PNG files in a directory to WEBP files:


```


#!/bin/bash
for file_name in *.png ; do  
  convert "$file_name"  "$file_name".webp
done

```

To process all the files in a directory and all its subdirectories, you need to recursively traverse the directory structure. Use the [`pushd` and `popd` stack commands][9] or the [find command][10] for this.

### Conclusion

Used prudently, Linux commands that compress and reformat media files can save you gigabytes of storage. I'm sure you've got some great tips of your own, so please add them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/linux-commands-convert-files

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtech
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/article/21/7/check-disk-space-linux-du
[3]: https://opensource.com/article/21/8/use-ncdu-check-free-disk-space-linux
[4]: https://opensource.com/article/21/6/dust-linux
[5]: https://opensource.com/article/17/8/imagemagick
[6]: https://imagemagick.org/
[7]: https://opensource.com/article/17/7/how-unzip-targz-file
[8]: https://opensource.com/article/19/6/how-write-loop-bash
[9]: https://opensource.com/article/19/8/navigating-bash-shell-pushd-popd
[10]: https://opensource.com/article/19/6/how-write-loop-bash#find
