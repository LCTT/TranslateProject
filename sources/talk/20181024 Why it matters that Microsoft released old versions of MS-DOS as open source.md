Why it matters that Microsoft released old versions of MS-DOS as open source
======

Microsoft's release of MS-DOS 1.25 and 2.0 on GitHub adopts an open source license that's compatible with GNU GPL.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_business_sign_store.jpg?itok=g4QibRqg)

One open source software project I work on is the FreeDOS Project. It's a complete, free, DOS-compatible operating system that you can use to play classic DOS games, run legacy business software, or develop embedded systems. Any program that works on MS-DOS should also run on FreeDOS.

So I took notice when Microsoft recently released the source code to MS-DOS 1.25 and 2.0 via a [GitHub repository][1]. This is a huge step for Microsoft, and I’d like to briefly explain why it is significant.

### MS-DOS as open source software

Some open source fans may recall that this is not the first time Microsoft has officially released the MS-DOS source code. On March 25, 2014, Microsoft posted the source code to MS-DOS 1.1 and 2.0 via the [Computer History Museum][2]. Unfortunately, this source code was released under a “look but do not touch” license that limited what you could do with it. According to the license from the 2014 source code release, users were barred from re-using it in other projects and could use it “[solely for non-commercial research, experimentation, and educational purposes.][3]”

The museum license wasn’t friendly to open source software, and as a result, the MS-DOS source code was ignored. On the FreeDOS Project, we interpreted the “look but do not touch” license as a potential risk to FreeDOS, so we decided developers who had viewed the MS-DOS source code could not contribute to FreeDOS.

But Microsoft’s recent MS-DOS source code release represents a significant change. This MS-DOS source code uses the MIT License (also called the Expat License). Quoting Microsoft’s [LICENSE.md][4] file on GitHub:

> ## MS-DOS v1.25 and v2.0 Source Code
>
> Copyright © Microsoft Corporation.
>
> All rights reserved.
>
> MIT License.
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the Software), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,TORT OR OTHERWISE, ARISING FROM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

If that text looks familiar to you, it is because that’s the same text as the MIT License recognized by the [Open Source Initiative][5]. It’s also the same as the Expat License recognized by the [Free Software Foundation][6].

The Free Software Foundation (via GNU) says the Expat License is compatible with the [GNU General Public License][7]. Specifically, GNU describes the Expat License as “a lax, permissive non-copyleft free software license, compatible with the GNU GPL. It is sometimes ambiguously referred to as the MIT License.” Also according to GNU, when they say a license is [compatible with the GNU GPL][8], “you can combine code released under the other license [MIT/Expat License] with code released under the GNU GPL in one larger program.”

Microsoft’s use of the MIT/Expat License for the original MS-DOS source code is significant because the license is not only open source software but free software.

### What does it mean?

This is great, but there’s a practical side to the source code release. You might think, “If Microsoft has released the MS-DOS source code under a license compatible with the GNU GPL, will that help FreeDOS?”

Not really. Here's why: FreeDOS started from an original source code base, independent from MS-DOS. Certain functions and behaviors of MS-DOS were identified and documented in the comprehensive [Interrupt List by Ralf Brown][9], and we provided MS-DOS compatibility in FreeDOS by referencing the Interrupt List. But many significant fundamental technical differences remain between FreeDOS and MS-DOS. For example, FreeDOS uses a completely different memory structure and memory layout. You can’t simply forklift MS-DOS source code into FreeDOS and expect it to work. The code assumptions are quite different.

There’s also the simple matter that these are very old versions of MS-DOS. For example, MS-DOS 2.0 was the first version to support directories and redirection. But these versions of MS-DOS did not yet include more advanced features, including networking, CDROM support, and ’386 support such as EMM386. These features have been standard in FreeDOS for a long time.

So the MS-DOS source code release is interesting, but FreeDOS would not be able to reuse this code for any modern features anyway. FreeDOS has already surpassed these versions of MS-DOS in functionality and features.

### Congratulations

Still, it’s important to recognize the big step that Microsoft has taken in releasing these versions of MS-DOS as open source software. The new MS-DOS source code release on GitHub does away with the restrictive license from 2014 and adopts a recognized open source software license that is compatible with the GNU GPL. Congratulations to Microsoft for releasing MS-DOS 1.25 and 2.0 under an open source license!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/microsoft-open-source-old-versions-ms-dos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://github.com/Microsoft/MS-DOS
[2]: http://www.computerhistory.org/press/ms-source-code.html
[3]: http://www.computerhistory.org/atchm/microsoft-research-license-agreement-msdos-v1-1-v2-0/
[4]: https://github.com/Microsoft/MS-DOS/blob/master/LICENSE.md
[5]: https://opensource.org/licenses/MIT
[6]: https://directory.fsf.org/wiki/License:Expat
[7]: https://www.gnu.org/licenses/license-list.en.html#Expat
[8]: https://www.gnu.org/licenses/gpl-faq.html#WhatDoesCompatMean
[9]: http://www.cs.cmu.edu/~ralf/files.html
