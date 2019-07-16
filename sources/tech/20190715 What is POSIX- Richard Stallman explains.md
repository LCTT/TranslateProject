[#]: collector: (lujun9972)
[#]: translator: (martin2011qi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is POSIX? Richard Stallman explains)
[#]: via: (https://opensource.com/article/19/7/what-posix-richard-stallman-explains)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

What is POSIX? Richard Stallman explains
======
Discover what's behind the standards for operating system compatibility
from a pioneer of computer freedom.
![Scissors cutting open access to files][1]

What is [POSIX][2], and why does it matter? It's a term you've likely seen in technical writing, but it often gets lost in a sea of techno-initialisms and jargon-that-ends-in-X. I emailed Dr. [Richard Stallman][3] (better known in hacker circles as RMS) to find out more about the term's origin and the concept behind it.

Richard Stallman says "open" and "closed" are the wrong way to classify software. Stallman classifies programs as _freedom-respecting_ ("free" or "libre") and _freedom-trampling_ ("non-free" or "proprietary"). Open source discourse typically encourages certain practices for the sake of practical advantages, not as a moral imperative.

The free software movement, which Stallman launched in 1984, says more than _advantages_ are at stake. Users of computers _deserve_ control of their computing, so programs denying users control are an injustice to be rejected and eliminated. For users to have control, the program must give them the [four essential freedoms][4]:

  * The freedom to run the program as you wish, for any purpose (freedom 0).
  * The freedom to study how the program works and change it so it does your computing as you wish (freedom 1). Access to the source code is a precondition for this.
  * The freedom to redistribute copies so you can help others (freedom 2).
  * The freedom to distribute copies of your modified versions to others (freedom 3). By doing this you can give the whole community a chance to benefit from your changes. Access to the source code is a precondition for this.



### About POSIX

**Seth:** The POSIX standard is a document released by the [IEEE][5] that describes a "portable operating system." As long as developers write programs to match this description, they have produced a POSIX-compliant program. In the tech industry, we call this a "specification" or "spec" for short. That's mostly understandable, as far as tech jargon goes, but what makes an operating system "portable"?

**RMS:** I think it was the _interface_ that was supposed to be portable (among systems), rather than any one _system_. Indeed, various systems that are different inside do support parts of the POSIX interface spec.

**Seth:** So if two systems feature POSIX-compliant programs, then they can make assumptions about one another, enabling them to know how to "talk" to one another. I read that it was you who came up with the name "POSIX." How did you come up with the term, and how was it adopted by the IEEE?

**RMS:** The IEEE had finished developing the spec but had no concise name for it. The title said something like "portable operating system interface," though I don't remember the exact words. The committee put on "IEEEIX" as the concise name. I did not think that was a good choice. It is ugly to pronounce—it would sound like a scream of terror, "Ayeee!"—so I expected people would instead call the spec "Unix."

Since [GNU's Not Unix][6], and it was intended to replace Unix, I did not want people to call GNU a "Unix system." I, therefore, proposed a concise name that people might actually use. Having no particular inspiration, I generated a name the unclever way: I took the initials of "portable operating system" and added "ix." The IEEE adopted this eagerly.

**Seth:** Does "operating system" in the POSIX acronym refer only to Unix and Unix-like systems such as GNU, or is the intent to encompass all operating systems?

**RMS:** The term "operating system," in the abstract, covers systems that are not at all like Unix, not at all close to the POSIX spec. However, the spec is meant for systems that are a lot like Unix; only such systems will fit the POSIX spec.

**Seth:** Are you involved in reviewing or updating the current POSIX standards?

**RMS:** Not now.

**Seth:** The GNU Autotools toolchain does a lot to make applications easier to port, at least in terms of when it comes time to build and install. Is Autotools an important part of building a portable infrastructure?

**RMS:** Yes, because even among systems that follow POSIX, there are lots of little differences. The Autotools make it easier for a program to adapt to those differences. By the way, if anyone wants to help in the development of the Autotools, please email me.

**Seth:** I imagine, way back when GNU was just starting to make people realize that a (not)Unix liberated from proprietary technology was possible, there must have been a void of clarity about how free software could possibly work together.

**RMS:** I don't think there was any void or any uncertainty. I was simply going to follow the interfaces of BSD.

**Seth:** Some GNU applications are POSIX-compliant, while others have GNU-specific features either not in the POSIX spec or lack features required by the spec. How important is POSIX compliance to GNU applications?

**RMS:** Following a standard is important to the extent it serves users. We do not treat a standard as an authority, but rather as a guide that may be useful to follow. Thus, we talk about following standards rather than "complying" with them. See the section [Non-GNU Standards][7] in the GNU Coding Standards.

We strive to be compatible with standards on most issues because, on most issues, that serves users best. But there are occasional exceptions.

For instance, POSIX specifies that some utilities measure disk space in units of 512 bytes. I asked the committee to change this to 1K, but it refused, saying that a bureaucratic rule compelled the choice of 512. I don't recall much attempt to argue that users would be pleased with that decision.

Since GNU's second priority, after users' freedom, is users' convenience, we made GNU programs measure disk space in blocks of 1K by default.

However, to defend against potential attacks by competitors who might claim that this deviation made GNU "noncompliant," we implemented optional modes that follow POSIX and ISO C to ridiculous extremes. For POSIX, setting the environment variable POSIXLY_CORRECT makes programs specified by POSIX list disk space in terms of 512 bytes. If anyone knows of a case of an actual use of POSIXLY_CORRECT or its GCC counterpart **\--pedantic** that provides an actual benefit to some user, please tell me about it.

**Seth:** Are POSIX-compliant free software projects easier to port to other Unix-like systems?

**RMS:** I suppose so, but I decided in the 1980s not to spend my time on porting software to systems other than GNU. I focused on advancing the GNU system towards making it unnecessary to use any non-free software and left the porting of GNU programs to non-GNU-like systems to whoever wanted to run them on those systems.

**Seth:** Is POSIX important to software freedom?

**RMS:** At the fundamental level, it makes no difference. However, standardization by POSIX and ISO C surely made the GNU system easier to migrate to, and that helped us advance more quickly towards the goal of liberating users from non-free software. That was achieved in the early 1990s, when Linux was made free software and then filled the kernel-shaped gap in GNU.

### GNU innovations adopted by POSIX

I also asked Dr. Stallman whether any GNU-specific innovations or conventions had later become adopted as a POSIX standard. He couldn't recall specific examples, but kindly emailed several developers on my behalf.

Developers Giacomo Catenazzi, James Youngman, Eric Blake, Arnold Robbins, and Joshua Judson Rosen all responded with memories of previous POSIX iterations as well as ones still in progress. POSIX is a "living" standard, so it's being updated and reviewed by industry professionals continuously, and many developers who work on GNU projects propose the inclusion of GNU features.

For the sake of historical interest, here' are some popular GNU features that have made their way into POSIX.

#### Make

Some GNU **Make** features have been adopted into POSIX's definition of **make**. The relevant [specification][8] provides detailed attribution for features borrowed from existing implementations.

#### Diff and patch

Both the **[diff][9]** and **[patch][10]** commands have gotten **-u** and **-U** options added directly from GNU versions of those tools.

#### C library

Many features of the GNU C library, **glibc**, have been adopted in POSIX. Lineage is sometimes difficult to trace, but James Youngman wrote:

> "I'm pretty sure there are a number of features of ISO C which were pioneered by GCC. For example, **_Noreturn** is new in C11, but GCC-1.35 had this feature (one used the **volatile** modifier on a function declaration). Also—though I'm not certain about this—GCC-1.35 supported Arrays of Variable Length which seem to be very similar to modern C's conformant arrays."

Giacomo Catenazzi cites the Open Group's [**strftime** article][11], pointing to this attribution: "This is based on a feature in some versions of GNU libc's **strftime()**."

Eric Blake notes that the **getline()** and various ***_l()** locale-based functions were definitely pioneered by GNU.

Joshua Judson Rosen adds to this, saying he clearly remembers being impressed by the adoption of **getline** functions after witnessing strangely familiar GNU-like behavior from code meant for a different OS entirely.

"Wait…that's GNU-specific… isn't it? Oh—not anymore, apparently."

Rosen pointed me to the [**getline** man page][12], which says:

> Both **getline()** and **getdelim()** were originally GNU extensions. They were standardized in POSIX.1-2008.

Eric Blake sent me a list of other extensions that may be added in the next POSIX revision (codenamed Issue 8, currently due around 2021):

  * [ppoll][13]
  * [pthread_cond_clockwait et al.][14]
  * [posix_spawn_file_actions_addchdir][15]
  * [getlocalename_1][16]
  * [reallocarray][17]



### Userspace extensions

POSIX doesn't just define functions and features for developers. It defines standard behavior for userspace as well.

#### ls

The **-A** option is used to exclude the **.** (representing the current location) and **..** (representing the opportunity to go back one directory) notation from the results of an **ls** command. This was adopted for POSIX 2008.

#### find

The **find** command is a useful tool for ad hoc [**for** loops][18] and as a gateway into [parallel][19] processing.

A few conveniences made their way from GNU to POSIX, including the **-path** and **-perm** options.

The **-path** option lets you filter search results matching a filesystem path pattern and was available in GNU's version of **find** since before 1996 (the earliest record in **findutil**'s Git repository). James Youngman notes that [HP-UX][20] also had this option very early on, so whether it's a GNU or an HP-UX innovation (or both) is uncertain.

The **-perm** option lets you filter search results by file permission. This was in GNU's version of **find** by 1996 and arrived later in the POSIX standard "IEEE Std 1003.1, 2004 Edition."

The **xargs** command, part of the **findutils** package, had a **-p** option to put **xargs** into an interactive mode (the user is prompted whether to continue or not) by 1996, and it arrived in POSIX in "IEEE Std 1003.1, 2004 Edition."

#### Awk

Arnold Robbins, the maintainer of GNU **awk** (the **gawk** command in your **/usr/bin** directory, probably the destination of the symlink **awk**), says that **gawk** and **mawk** (another GPL **awk** implementation) allow **RS** to be a regular expression, which is the case when **RS** has a length greater than 1. This isn't a feature in POSIX yet, but there's an [indication that it will be][21]:

> _The undefined behavior resulting from NULs in extended regular expressions allows future extensions for the GNU gawk program to process binary data._
>
> _The unspecified behavior from using multi-character RS values is to allow possible future extensions based on extended regular expressions used for record separators. Historical implementations take the first character of the string and ignore the others._

This is a significant enhancement because the **RS** notation defines a separator between records. It might be a comma or a semicolon or a dash or any such character, but if it's a _sequence_ of characters, then only the first character is used unless you're working in **gawk** or **mawk**. Imagine parsing a document of IP addresses with records separated by an ellipsis (three dots in a row), only to get back results parsed at every dot in every IP address.

**[Mawk][22]** supported the feature first, but it was without a maintainer for several years, leaving **gawk** to carry the torch. (**Mawk** has since gained a new maintainer, so arguably credit can be shared for pushing this feature into the collective expectation.)

### The POSIX spec

In general, Giacomo Catenzzi points out, "…because GNU utilities were used so much, a lot of other options and behaviors were aligned. At every change in shell, Bash is used as comparison (as a first-class citizen)." There's no requirement to cite GNU or any other influence when something is rolled into the POSIX spec, and it can safely be assumed that influences to POSIX come from many sources, with GNU being only one of many.

The significance of POSIX is consensus. A group of technologists working together toward common specifications to be shared by hundreds of uncommon developers lends strength to the greater movement toward software independence and developer and user freedom.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/what-posix-richard-stallman-explains

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2 (Scissors cutting open access to files)
[2]: https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/
[3]: https://stallman.org/
[4]: https://www.gnu.org/philosophy/free-sw.en.html
[5]: https://www.ieee.org/
[6]: http://gnu.org
[7]: https://www.gnu.org/prep/standards/html_node/Non_002dGNU-Standards.html
[8]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html
[9]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/diff.html
[10]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/patch.html
[11]: https://pubs.opengroup.org/onlinepubs/9699919799/functions/strftime.html
[12]: http://man7.org/linux/man-pages/man3/getline.3.html
[13]: http://austingroupbugs.net/view.php?id=1263
[14]: http://austingroupbugs.net/view.php?id=1216
[15]: http://austingroupbugs.net/view.php?id=1208
[16]: http://austingroupbugs.net/view.php?id=1220
[17]: http://austingroupbugs.net/view.php?id=1218
[18]: https://opensource.com/article/19/6/how-write-loop-bash
[19]: https://opensource.com/article/18/5/gnu-parallel
[20]: https://www.hpe.com/us/en/servers/hp-ux.html
[21]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/awk.html
[22]: https://invisible-island.net/mawk/
