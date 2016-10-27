7-Zip vs WinRAR vs WinZIP: The Best Tool for File Compression
==================

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/best-file-compression.jpg)

In boxing there were Ali, Frazier and Foreman. In games consoles there are Nintendo, Sony and Microsoft, and in PC compression software there are 7-Zip, WinRAR and WinZIP. Am I overselling this software showdown? Maybe, but it’s still an important one.

All three of these programs perform the same function, allowing you to grab a bunch of files on your computer and pack them tightly into an archive, shrinking their file size until someone decides to unpack them. They’re all easy to use, but which one does the best job? I put them to the test to find out.

Note: while there are plenty of other compression formats, Winzip, 7Zip and WinRAR are the three most popular compression tools for Windows. That is why we are only comparing these three.

Note: for the test, I compressed a bunch of uncompressed video files amounting to 1.3GB of space. I also tested them using their best compression settings rather than the default ones. For each program, I describe how to enable these settings.

### 7-Zip lands the first big punch by being FREE

It’s worth prefacing this piece by saying the open-source 7-Zip already holds an edge by being free with no strings attached. WinRAR is essentially free, except you have to tolerate an annoying prompt telling you your trial’s expired each time you open it. (You basically pay to get rid of this prompt.) WinZip, on the other hand, locks you out after your evaluation period.

### WinZip

In today’s world where we inexplicably expect everything software-related to be free, WinZip boldly stands in the face of our expectations by charging £25.95 after the trial period. But maybe that’s because it does a better job than its rivals, justifying its audacious price tag? Let’s see.

WinZip has an option to compress files into the .zipx format where it claims to have a higher compression rate than .zip and the rest of the competition. To do this, select and right-click the files you want to compress, then click to “WinZip -> Add to Zip” the files. When WinZip opens, select “.Zipx” under “Compression Type” then start unzipping.

Here are my results using both of WinZip’s compression methods:

*   .Zip: 855MB (34% compression)
*   .Zipx: 744MB (43% compression)

![compression-software-compared-winzip](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/compression-software-compared-winzip.png)

### WinRAR

WinRAR compresses files in the RAR format (it’s all in the name), and there are also a few tricks you can do to get the most compression out of it.

Once you’ve selected the files you want to compress, right-click them, click “Add to archive,” then tick the “Create solid archive” box. Next, click the drop-down under “Compression method” and change it to “Best.” WinRAR also has an apparently enhanced compression method called RAR5, so I tested that out as well as the standard compression method. Here’s what we got:

*   .rar: 780MB (40% compression)
*   .rar5: 778MB (40% compression)

![compression-software-compared-winrar](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/compression-software-compared-winrar.png)

### 7-Zip

There are no evaluation versions or prices to pay here, but does that come at a cost of compression quality? To test it properly, select the files you want to compress, right-click them, select 7-Zip then “Add to archive.”

In the new window change the Compression method to LZMA2 (if you have a 4-core or stronger CPU), set the Compression level to Ultra, and compress away! Here’s the outcome:

*   .7z: 758MB (42% compression)

![compression-software-compared-7zip](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/compression-software-compared-7zip.png)

### Conclusion

Based on these results, I’m going to be sticking with 7-Zip. The 1% difference in compression levels between it and the technical “winner” WinZip aren’t nearly enough to warrant forking out money for it.

![compression-software-compared-windows](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/compression-software-compared-windows.png)

Or maybe you don’t want to download any third-party software at all, in which case you can use Windows’ built-in compression tool. To use it, just right-click whatever you want to compress, select “Send to,” then “Compressed folder.” It only compressed the files down to 892MB (31%), but it’s quick, free and built-in so who are we to complain?

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/7-zip-vs-winrar-vs-winzip/?utm_medium=feed&utm_source=feedpress.me&utm_campaign=Feed%3A+maketecheasier

作者：[Robert Zak][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.maketecheasier.com/author/robzak/
