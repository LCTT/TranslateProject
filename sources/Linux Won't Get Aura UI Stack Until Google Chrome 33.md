Linux Won't Get Aura UI Stack Until Google Chrome 33
================================================================================
While Google's Chrome 32 web-browser will feature the Aura UI stack from Chrome OS, the Chrome desktop web-browser on Linux won't get the GPU-accelerated interface until one version later.

Aura is the UI stack used by Google Chrome OS that can fully take advantage of graphics processors where supported. The only native element/widget is the top-level window while everything else is handled by Chrome and composited by the program itself. Google's goal is to use the same UI stack across Windows, Linux, and Chrome OS (albeit not on OS X or other platforms). While Aura is designed to take advantage of modern GPUs, there is a pure software fallback mode too.

With Chrome 32, Aura will now be used as the UI stack. Windows 7 and Windows 8 systems will support the GPU acceleration code-path while Windows XP and Vista users will be limited to software-accelerated support. The Aura code-path also determines whether WebGL and Pepper-based Flash is using GPU support too.

As shared via the [Chromium Google Group][1] last week, the Linux version of Chromium now won't see Aura with GPU acceleration until version 33. In other words, the UI stack should arrive on Linux right around the end of the calendar year.

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=news_item&px=MTQ4NzE

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/UMwGGgP0P9c