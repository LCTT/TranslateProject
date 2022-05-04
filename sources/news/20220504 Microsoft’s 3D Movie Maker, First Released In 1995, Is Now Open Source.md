[#]: subject: "Microsoft’s 3D Movie Maker, First Released In 1995, Is Now Open Source"
[#]: via: "https://www.opensourceforu.com/2022/05/microsofts-3d-movie-maker-first-released-in-1995-is-now-open-source/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Microsoft’s 3D Movie Maker, First Released In 1995, Is Now Open Source
======
![windows movie maker logo][1]

Microsoft has released a number of open source tools over the years, and today it is digging deep into its archives to make 3D Movie Maker available to everyone. 3D Movie Maker, which was first launched in 1995, allows you to create animated scenarios with 3D characters, props, backgrounds, text, sound, and special effects. This version also includes an Argonaut software build of BRender. While this is a positive step, you shouldn’t get too enthusiastic because there is a catch.

“This project is unlikely to build successfully under modern hardware/software, but you can get started with compilation and get partial completed binaries.”

It includes the following construction instructions.

– Make sure this repository is checked out to a folder with a brief name, preferably near the drive’s root (i.e. C:\3d).

– On your route, you’ll need the dev tools for Visual C++ 2.0 (found under MSVC20BIN on the installer disc). Some pre-C++98 norms are disliked by modern compilers.

– Run setvars.bat from the root of this repository. You can alter the values in this script to change the target of your build.

– Find and install font files (see FONTS.md)

– Run nmake to get started with 3D Movie Maker.

The code was recovered from the Microsoft corporate archives, third-party authorization (for products like BRender) was gained, and developer identities and aliases were deleted in order to make the software open source (with the exception of current Microsoft employees who worked on the original release and agreed to keep their names in place). It can be downloaded from [here][2].

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/microsofts-3d-movie-maker-first-released-in-1995-is-now-open-source/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/windows-movie-maker-logo-696x392.png
[2]: https://github.com/microsoft/Microsoft-3D-Movie-Maker
