[#]: subject: (Avoid this common open source scanning error)
[#]: via: (https://opensource.com/article/21/7/open-source-scanning-error)
[#]: author: (Jeffrey Robert Kaufman https://opensource.com/users/jkaufman)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Avoid this common open source scanning error
======
Why do source-code scanners sometimes report incorrect license
information?
![Target practice][1]

[Pete Townshend][2], legendary guitar player for British rock band The Who, is well-known for playing suspended chords. Suspended chords add musical tension to a song. For those piano players reading this who (like me) love to play in the key of C, simply play a C major chord (the notes C, E, and G) and replace the E note with either an F or a D. You are now on your way to becoming a British rock star![1][3]

Music is often filled with combinations of chords, like suspended chords, that provide tension, then release. Although adding tension to a musical composition is desirable, adding tension to scanning software with open source tools is certainly unwelcome.

An issue at Red Hat involving scanning software led me to write this article.

Recently, an important customer raised a concern after scanning some of our software's source code. As you may know, Red Hat provides the source code of its software. The customer's scanning tool reported that a certain software file was licensed under the GPLv3, which was not expected. In fact, the software file was explicitly and solely marked as being licensed under the Apache 2.0 license. The customer requested that we look into this issue, and we were happy to do so.

After our in-depth research, we concluded that their scanning software is clearly incorrect. We developed a hypothesis that explains the anomaly, which I will now explain.

A popular type of open source software scanning tool compares the software being scanned to vast repositories of preexisting open source software and reports any matches. For example, assume there is an open source file named MIT.c that returns an integer one higher than the integer passed to it. In other words, it is a simple adder. It could look like this:


```
Copyright 2021 Jeffrey R. Kaufman

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

int foo(int x) {
        x+=1;
        return x;
}
```

For this hypothetical example, assume that MIT.c was placed in a GitHub repository named The Simple Maths Project as an open source community-based project for solving simple arithmetic problems. This project contains many other similar C language files, all under the same MIT License.

Since this hypothetical example function is so useful (of course it isn't, but stay with me here), it was included to provide simple arithmetic utility in many other open source projects on GitHub. Also, assume that one of these other projects, named The Sustained Chord Calculator, uses this MIT.c source file from The Simple Maths Project to help calculate the musical formulation for suspended chords.

The hypothetical Suspended Chord Calculator project, in addition to using MIT.c, also includes several source files licensed under GPLv2. When The Suspended Chord Calculator project is compiled, you can assume the resulting executable will contain both GPLv2-licensed software and the MIT-licensed MIT.c as one combined work in such a way that MIT.c cannot be reasonably considered independent and a separate work in itself. That resulting executable would rightly be considered licensed under the GPLv2, and the obligations of the GPLv2 must be complied with. Compliance means providing (or offering to provide for three years) all of the sources used to create the binary or executable, including all the software files licensed under GPLv2 and MIT.c.

Moving back to our problem…

Suppose one of your software products uses MIT.c, in addition to your own authored software. Since MIT.c is solely under the MIT License, this would obligate you to comply with only the MIT License terms, which is easy to do. Typically, people comply by providing a copy of the MIT License along with the copyright notice with their software distribution. Or, if you are a company like Red Hat, providing the source code that contains the license text is also a method of compliance—and my recommended approach. (See [_An economically efficient model for open source software license compliance_][4].)

If you decide to scan the source code of your software product using a source-code scanner of the type that references repositories of open source projects, your scanner may likely report that MIT.c is licensed under the GPLv2! Why? Because it will see MIT.c, in source-code form, associated with The Suspended Chord Calculator project licensed under the GPLv2 and assume, naively, that MIT.c also must be subject to GPLv2 terms. This is notwithstanding that the MIT.c source file is clearly marked with an MIT License, and you copied it only from the original MIT-licensed The Simple Maths Project.

This is an unfortunate consequence of using these types of scanning systems. In this example, such systems will erroneously report generally every single open source project in its repository that uses MIT.c. There could be tens, hundreds, or even thousands of programs that use MIT.c, all under different licenses, and you will be provided with a giant stack of projects to review indicating that MIT.c could be MIT licensed, BSD licensed, GPLv2 licensed, or, frankly, carry any other open source license under the sun from a project that just happens to use MIT.c. And in the end, you will discover that the file was solely under MIT.c. In my experience, there are very few situations where this type of scanning is warranted and, even when it is justifiable, that the file license results are something other than you expected. It happens, but it is rare.

There is another type of software scanning system that reports on licensing by looking only for matches to known license texts in the source files of the project. This type of scanner would detect the MIT License text in the source code and correctly report that the software is subject to the terms of the MIT License, notwithstanding the fact that MIT.c may be used in many other open source projects under varying license terms. Although this type of source-code scanner can also have false positives, in my experience, source-code scanners of the type that reference repositories of open source projects have significantly higher rates of misreporting for the reasons discussed previously.

Frankly, source-code scanners that reference repositories of open source software to ascertain license data can be useful in certain situations, such as when you may be hyper concerned that an engineer has inadvertently copied and pasted source code from an unacceptable license without also copying over the applicable license text. In that situation, a source-code scanner of the type that looks only for matches to license texts would not detect that inclusion. However, as I stated before, this situation is exceptionally rare, making repository-matching source-code scanners prone to errors and a waste of resources for tracking down the truth. This is time and resources that could be devoted to more issues of substance. You can also address this situation by training your developers to never copy software from another source without also copying over any applicable license.

A scanner that reports the incorrect license is doing a tremendous disservice to your organization by requiring you to resolve a false positive. Countless hours of wasted resources are devoted to these wild-goose chases…as our customer experienced.

We won't be fooled again!

* * *

_I want to thank my colleague Richard Fontana for suggesting the title of this article. Read some of his great articles on Opensource.com under the [Law section][5]._

1\. If you want to learn more about music theory and suspended chords, check out Rick Beato's analysis of another great track from The Who at [What Makes This Song Great?™ Ep. 96 The Who][6].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/open-source-scanning-error

作者：[Jeffrey Robert Kaufman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jkaufman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/target-security.png?itok=Ca5-F6GW (Target practice)
[2]: https://en.wikipedia.org/wiki/Pete_Townshend
[3]: tmp.K7c2OyIB7H#1
[4]: https://opensource.com/article/17/9/economically-efficient-model
[5]: https://opensource.com/tags/law
[6]: https://www.bing.com/videos/search?q=rick+biato+what+makes+this+song+great+who&view=detail&mid=BBF5E938C3E5AD6D73BCBBF5E938C3E5AD6D73BC&FORM=VIRE
