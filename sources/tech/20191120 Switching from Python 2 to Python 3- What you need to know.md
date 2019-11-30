[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Switching from Python 2 to Python 3: What you need to know)
[#]: via: (https://opensource.com/article/19/11/end-of-life-python-2)
[#]: author: (Katie McLaughlin https://opensource.com/users/glasnt)

Switching from Python 2 to Python 3: What you need to know
======
Python 2 will reach its end of life in mere weeks. Here's what to know
before you migrate to Python 3.
![A sunrise][1]

Python 2.7 will officially become unsupported beginning January 1, 2020. There is one [final bugfix][2] planned after this date, but then that's it.

What does this end of life (EOL) mean for you? If you run Python 2, you need to migrate.

### Who decided to EOL Python 2?

In [2012][3], the team maintaining the Python programming language reviewed its options. There were two increasingly different codebases, Python 2 and Python 3. Both were popular, but the newer version was not as widely adopted.

In addition to Python 3's disruption of changing the underlying way data is handled by completely reworking Unicode support, a major version change allowed non-backward-compatible changes to happen all at once. This decision was documented [in 2006][4]. To ease the disruption, Python 2 continued to be maintained, with some features backported. To further help the community transition, the EOL date was extended [from 2015 to 2020][5], another five years.

Maintaining divergent codebases was a hassle the team knew it had to resolve. Ultimately, a decision was [announced][6]:

> "We are volunteers who make and take care of the Python programming language. We have decided that January 1, 2020, will be the day that we sunset Python 2. That means that we will not improve it anymore after that day, even if someone finds a security problem in it. You should upgrade to Python 3 as soon as you can."

[Nick Coghlan][7], a core CPython developer and current member of the Python steering council, [adds more information in his blog][8]. And [PEP 404][9], written by [Barry Warsaw][10] (also a member of the Python steering council), details why Python 2.8 will never be a thing.

### Is anyone still supporting Python 2?

Support for Python 2 from providers and vendors will vary. [Google Cloud has announced][11] how it plans to support Python 2 going forward. Red Hat has also [announced plans for Red Hat Enterprise Linux (RHEL)][12], and AWS has announced [minor version update requirements][13] for the AWS command-line interface and [SDK][14].

You can also read the Stack Overflow blog post "[Why is the Migration to Python 3 Taking So Long?][15]" by [Vicki Boykis][16], in which she identifies three reasons why Python 3 adoption is slow. 

### Reasons to use Python 3

Regardless of ongoing support, it's a really good idea to migrate to Python 3 as soon as you can. Python 3 will continue to be supported, and it has some really neat things that Python 2 just doesn't have.

The recently released [Python 3.8][17] includes such [features][18] as the [walrus operator][19], [positional-only parameters][20], and [self-documenting f-strings][21]. Earlier releases of Python 3 introduced [features][22] such as [asyncio][23], [f-strings][24], [type hints][25], and [pathlib][26], just to name a few.

The top 360 most-downloaded packages [have already migrated to Python 3][27]. You can check your requirements.txt file using the [caniusepython3][28] package to see if any packages you depend on haven't yet been migrated.

### Resources for porting Python 2 to Python 3

There are many resources available to ease your migration to Python 3. For example, the [Porting Python 2 to Python 3 guide][29] lists a bunch of tools and tricks to help you achieve single-source Python 2/3 compatibility. There are also some useful tips on [Python3statement.org][30].

[Dustin Ingram][31] and [Chris Wilcox][32] gave a [presentation at Cloud Next '19][33] detailing some of the motivations and migration patterns for the transition into Python 3. [Trey Hunner][34] gave a [presentation at PyCon 2018][35] about Python 3's most useful features to encourage you to migrate so you can take advantage of them.

### Join us!

January 1, 2020, is now just weeks away. If you need daily reminders of just how soon that is (and you use Twitter), follow the [Countdown to Python 2 sunset][36] Twitter bot.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/end-of-life-python-2

作者：[Katie McLaughlin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/glasnt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/govt_a%20new%20dawn.png?itok=b4zU-VAY (A sunrise)
[2]: https://www.python.org/dev/peps/pep-0373/#maintenance-releases
[3]: https://github.com/python/peps/commit/a733bc927acbca16bfa3de486fb2c7d3f767a748
[4]: https://www.python.org/dev/peps/pep-3000/#compatibility-and-transition
[5]: https://github.com/python/peps/commit/f82462002b86feff36215b4230be28967039b0cc
[6]: https://www.python.org/doc/sunset-python-2/
[7]: https://twitter.com/ncoghlan_dev
[8]: http://python-notes.curiousefficiency.org/en/latest/python3/questions_and_answers.html
[9]: https://www.python.org/dev/peps/pep-0404/
[10]: https://twitter.com/pumpichank
[11]: https://cloud.google.com/python/docs/python2-sunset/?utm_source=osdc&utm_medium=blog&utm_campaign=pysunset
[12]: https://access.redhat.com/solutions/4455511
[13]: https://aws.amazon.com/blogs/developer/deprecation-of-python-2-6-and-python-3-3-in-botocore-boto3-and-the-aws-cli/
[14]: https://aws.amazon.com/sdk-for-python/
[15]: https://stackoverflow.blog/2019/11/14/why-is-the-migration-to-python-3-taking-so-long/
[16]: https://twitter.com/vboykis
[17]: https://www.python.org/downloads/
[18]: https://docs.python.org/3.8/whatsnew/3.8.html
[19]: https://docs.python.org/3.8/whatsnew/3.8.html#assignment-expressions
[20]: https://docs.python.org/3.8/whatsnew/3.8.html#positional-only-parameters
[21]: https://docs.python.org/3.8/whatsnew/3.8.html#f-strings-support-for-self-documenting-expressions-and-debugging
[22]: https://docs.python.org/3.8/whatsnew/index.html
[23]: https://docs.python.org/3.8/library/asyncio.html#module-asyncio
[24]: https://docs.python.org/3.7/whatsnew/3.6.html#pep-498-formatted-string-literals
[25]: https://docs.python.org/3.7/whatsnew/3.5.html#pep-484-type-hints
[26]: https://docs.python.org/3.8/library/pathlib.html#module-pathlib
[27]: http://py3readiness.org/
[28]: https://pypi.org/project/caniusepython3/
[29]: https://docs.python.org/3/howto/pyporting.html
[30]: https://python3statement.org/practicalities/
[31]: https://twitter.com/di_codes
[32]: https://twitter.com/chriswilcox47
[33]: https://www.youtube.com/watch?v=Bye7Rms0Vgw&utm_source=osdc&utm_medium=blog&utm_campaign=pysunset
[34]: https://twitter.com/treyhunner
[35]: https://www.youtube.com/watch?v=klaGx9Q_SOA
[36]: https://twitter.com/python2sunset
